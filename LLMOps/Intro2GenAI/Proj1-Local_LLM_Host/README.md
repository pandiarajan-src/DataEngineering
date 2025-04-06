# Local LLM Hosting with RAG

This project demonstrates how to host a local Large Language Model (LLM) and integrate it with a Retrieval-Augmented Generation (RAG) pipeline.

## Features

- **Local LLM Hosting**: Run an LLM on your local machine without relying on external APIs. (I use either llmafile or lmstudio)
- **RAG Integration**: Enhance the LLM's responses by retrieving relevant context from a document store.
- **Customizable Pipelines**: Easily adapt the pipeline to your specific use case.

## Requirements

- Python 3.10 or higher
- Required libraries (see `requirements.txt`)
- Sufficient hardware resources for running the LLM

## How to run
- Create the .env file with the below three values
    - OPENAI_API_BASE=http://host.docker.internal:1234/v1/
    - OPENAI_API_KEY=sk-no-key-required
    - OPENAI_API_MODEL=llama-3.2-3b-instruct
- Docker command run
    - docker build -t fastapi-app .  
    - docker run --env-file .env -p 8000:8000 fastapi-app

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See `LICENSE` for details.