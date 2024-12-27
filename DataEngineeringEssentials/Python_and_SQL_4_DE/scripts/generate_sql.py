import pandas as pd
import os

CURR_SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
INPUT_FILE = os.path.join(CURR_SCRIPT_DIR, "wine-ratings-small.csv")
OUTPUT_FILE = os.path.join(CURR_SCRIPT_DIR, "populate.sql")
SQL_TEMPLATE = """INSERT INTO ratings(name, rating, region) VALUES("%s", "%s", "%s");\n"""

df = pd.read_csv(INPUT_FILE, index_col=0)
with open(OUTPUT_FILE, "a", encoding="utf-8") as sql_file:
    for _, row in df.iterrows():
        sql_file.write(SQL_TEMPLATE % (row['name'], row['rating'], row['region']))
        print(row)
