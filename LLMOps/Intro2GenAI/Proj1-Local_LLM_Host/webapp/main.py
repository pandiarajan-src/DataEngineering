import os
import json
from openai import OpenAI
from fastapi import FastAPI
from fastapi.responses import RedirectResponse
from pydantic import BaseModel
import pandas as pd
from qdrant_client import models, QdrantClient
from sentence_transformers import SentenceTransformer
from dotenv import load_dotenv
load_dotenv('.env')

# Disable parallelism in tokenizers to prevent deadlocks
os.environ["TOKENIZERS_PARALLELISM"] = "false"

app = FastAPI()

API_BASE = os.getenv("OPENAI_API_BASE")
API_KEY = os.getenv("OPENAI_API_KEY")
API_MODEL = os.getenv("OPENAI_API_MODEL")

data = []
encoder = SentenceTransformer("all-MiniLM-L6-v2")  # Model to create embeddings
qdrant = QdrantClient(":memory:")  # Create in-memory Qdrant instance
print(f"API_BASE: {API_BASE}")
print(f"API_KEY: {API_KEY}")
print(f"API_MODEL: {API_MODEL}")
client = OpenAI(
    base_url=API_BASE,
    api_key=API_KEY
)

def init() -> None:
    """
    app initialization
    """
    # Load data
    df = pd.read_csv("wine-ratings.csv")
    global data
    df = df.drop(columns=['grape'])  # remove the 'grape' column
    df = df[df['variety'].notna()]  # remove any NaN values as it blows up serialization
    data = df.sample(700, random_state=42).to_dict(
        "records"
    )  # Get only 700 records. More records will make it slower to index
    print(f"Loaded data with size: {len(data)}")

    # Create collection to store wines
    if not qdrant.collection_exists(collection_name="top_wines"):
        qdrant.create_collection(
            collection_name="top_wines",
            vectors_config=models.VectorParams(
                size=encoder.get_sentence_embedding_dimension(),  # Vector size is defined by used model
                distance=models.Distance.COSINE,
            ),
        )
        print("top_wines collection doesn't exists hence creating new one")
    else:
        print("top_wines collection already exists, hence don't do anything.")

    # vectorize!
    qdrant.upload_points(
        collection_name="top_wines",
        points=[
            models.PointStruct(
                id=idx,
                vector=encoder.encode(doc["notes"]).tolist(),
                payload=doc,
            )
            for idx, doc in enumerate(
                data
            )  # data is the variable holding all the wines
        ],
    )

init()

class Body(BaseModel):
    query: str


@app.get("/")
def root():
    return RedirectResponse(url="/docs", status_code=301)


@app.post("/ask")
def ask(body: Body):
    """
    Use the query parameter to interact with the Azure OpenAI Service
    using the Azure Cognitive Search API for Retrieval Augmented Generation.
    """
    search_result = search("Suggest me an amazing Malbec wine from Argentina")
    chat_bot_response = assistant(body.query, search_result)
    return {"response": chat_bot_response}


def search(query):
    """
    Do local search
    """
    hits = qdrant.search(
        collection_name="top_wines",
        query_vector=encoder.encode(query).tolist(),
        limit=3
    )
    for hit in hits:
        print(hit.payload, "score:", hit.score)

    search_results = " ".join([json.dumps(hit.payload) for hit in hits])
    print(f"Search results: {search_results}")
    return search_results


def assistant(query, context):
    print(f"Context: {context}")
    messages = [
        {
            "role": "system",
            "content": "Asisstant is a chatbot that helps you find the best wine for your taste.",
        },
        {"role": "user", "content": query},
        {"role": "assistant", "content": context}
    ]
    # For debugging purpose, I kept the simple message
    # messages = [{"role": "user", "content": "How can you help me?"}]
    print(f"Pandi MESSSAGE: {messages}")
    response = client.chat.completions.create(
        model=API_MODEL,
        messages=messages
    )
    print("I am about to access the response")
    response_content = response.choices[0].message.content
    print(response_content)
    return response_content

