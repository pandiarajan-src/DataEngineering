\c ratings

--COPY tbl_ratings
-- COPY (SELECT '"' || name || '","' || rating || '","' || region || '"' FROM tbl_ratings) 
-- COPY (SELECT '' || name || ',' || rating || ',' || region || '' FROM tbl_ratings)
COPY tbl_ratings
TO '/Users/pandi/source/DataEngineering/DataEngineeringEssentials/Python_and_SQL_4_DE/sql_scripts/postgres/ratings_export_data.csv' 
WITH CSV 
     DELIMITER ','
     QUOTE '"';