-- PREREQUISTIE: 
--      Before running dblink_exec create the extension first.
--      CREATE EXTENSION IF NOT EXISTS dblink;

-- Check if the "ratings" database exists and drop it if it does
-- pg_terminate_backend() to close any active connections 
--      before dropping the database (required to avoid connection conflicts).

-- Step 1: Terminate connections to the database "ratings" if it exists
DO $$
BEGIN
   IF EXISTS (
      SELECT FROM pg_database WHERE datname = 'ratings'
   ) THEN
      PERFORM pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE pg_stat_activity.datname = 'ratings'
        AND pid <> pg_backend_pid();
   END IF;
END
$$ LANGUAGE plpgsql;

-- Step 2: Drop the database if it exists
DROP DATABASE IF EXISTS ratings;

-- Step 3: Create the database
CREATE DATABASE ratings;

-- Step 4: Connect to the newly created database
\c ratings

-- Step 5: Create the "tbl_ratings" table
CREATE TABLE tbl_ratings (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    rating DOUBLE PRECISION DEFAULT 0.0 NOT NULL,
    region TEXT
);

-- Sample backup
-- DO $$
-- BEGIN
--    IF NOT EXISTS (
--       SELECT 1 FROM pg_database WHERE datname = 'ratings'
--    ) THEN
--       PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE ratings');
--    END IF;
-- END
-- $$ LANGUAGE plpgsql;

-- Option #2
-- If you don’t want to use dblink, you can manually check and create the database:
--
-- SELECT 'CREATE DATABASE ratings'
-- WHERE NOT EXISTS (
--     SELECT FROM pg_database WHERE datname = 'ratings'
-- )\gexec
--