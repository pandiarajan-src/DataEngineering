"""
Purpose: Simple server to expose CSV file
"""
import csv
from http.server import HTTPServer, BaseHTTPRequestHandler
import pandas as pd

class HTTPHandler(BaseHTTPRequestHandler):
    """
    Override HTTP Handler
    """
    def do_GET(self):
        """
        HTTP Get response
        """
        self.send_response(200)
        self.end_headers()
        # df = pd.read_csv(
        #     '/Users/pandi/source/DataEngineering/DataEngineeringEssentials/Python_and_SQL_4_DE/sample_data/ratings_data.csv'
        # )
        # df_dict = df.to_json()
        # self.wfile.write(df_dict.encode())
        with open(
            '/Users/pandi/source/DataEngineering/DataEngineeringEssentials/Python_and_SQL_4_DE/sample_data/ratings_data.csv',
            encoding='UTF-8'
        ) as f:
            reader = csv.reader(f)
            self.wfile.write(b"\n".join([','.join(row).encode() for row in reader]))

httpd = HTTPServer(('localhost', 8080), HTTPHandler)
httpd.serve_forever()
