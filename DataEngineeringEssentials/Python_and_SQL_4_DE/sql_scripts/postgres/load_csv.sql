\c ratings

COPY tbl_ratings FROM '/Users/pandi/source/ratings_export_data.csv'
WITH CSV 
    HEADER
    DELIMITER ',' 
    QUOTE '"';
