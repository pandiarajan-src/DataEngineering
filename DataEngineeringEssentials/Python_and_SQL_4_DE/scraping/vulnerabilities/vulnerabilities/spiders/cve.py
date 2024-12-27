import scrapy
import os
import csv
import json
import sqlite3



class CveSpider(scrapy.Spider):
    name = "cve"
    allowed_domains = ["cve.mitre.org"]
    # Directly access the data from cloud.
    # But better is to download the html file locally and process them.
    # start_urls = ["https://cve.mitre.org/data/refs/refmap/source-EXPLOIT-DB.html"]

    # use wget to download the file locally and process them.
    url = os.path.join(os.path.dirname(__file__), "source-EXPLOIT-DB.html")
    start_urls = [f"file://{url}"]

    def parse(self, response):
        # Make output folder to store the output csv,json and db
        out_dir = os.path.join(os.path.dirname(__file__), "ouput")
        csv_file = os.path.join(out_dir, "vulnerabilities.csv")
        if os.path.exists(csv_file):
            os.remove(csv_file)

        json_file = os.path.join(out_dir, "vulnerabilities.json")
        if os.path.exists(json_file):
            os.remove(json_file)

        sql_db = os.path.join(out_dir, "vulnerabilities.db")
        if os.path.exists(sql_db):
            os.remove(sql_db)

        if os.path.exists(out_dir):
            os.rmdir(out_dir)

        os.mkdir(out_dir)

        # Create CSV writer to dump the data
        csv_out = open(csv_file, 'w')
        csv_writer = csv.writer(csv_out)
        csv_writer.writerow(['exploit_id', 'cve_id'])

        # Create JSON to dump the data
        json_out = open(json_file, 'w')
        json_data = {}
        json_data['exploit_id'] = 'cve_id'

        # Create SQL DB
        connection = sqlite3.connect(sql_db)
        cursor = connection.cursor()
        cursor.execute('CREATE TABLE vulnerabilities (id INTEGER PRIMARY KEY, exploit_id TEXT, cve_id TEXT)')
        connection.commit()

        table = None
        for tbl in response.xpath('//table'):
            if len(tbl.xpath('tr')) > 100:
                table = tbl
                break
        for row in table.xpath('//tr'):
            try:
                exploit_id = str(row.xpath('td//text()')[0].extract()).strip()
                cve_id = str(row.xpath('td//text()')[2].extract()).strip()
                if exploit_id.startswith('EXPLOIT-DB') and cve_id.startswith('CVE-'):
                    csv_writer.writerow([exploit_id, cve_id])
                    json_data[exploit_id] = cve_id
                    cursor.execute('INSERT INTO vulnerabilities(exploit_id, cve_id) VALUES(?, ?)', (exploit_id, cve_id))
                    connection.commit()
            except IndexError:
                pass
        json.dump(json_data, json_out)

        csv_out.close()
        json_out.close()
        cursor.close()
        connection.close()
