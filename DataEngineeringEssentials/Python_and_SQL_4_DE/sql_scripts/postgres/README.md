# How to run the psql scripts

psql -h <<server>> -U <<username>> -p <<port>> -f <<wkspacepath>>/populate.sql

Examples:
* port may be like __5432__<br>
* username may be like __postgres__<br>
* server may be like __localhost__<br>
* wkspacepath may be like __\users\abc\source\sql_scripts__<br>

# Postgres Dump

__pg_dump__ s used to back up a PostgreSQL database or specific tables and their data. Below is an overview of how to use pg_dump effectively.

Syntax:
    pg_dump -U username -d database_name -f output_file.sql

Backup entire db:
pg_dump -U postgres -d my_database -f my_database_dump.sql

Backup specific table in a db:
pg_dump -U postgres -d my_database -t my_table -f my_table_dump.sql


