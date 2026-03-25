-- .devcontainer/setup.sql

-- 0. Refresh collation version for the postgres database
ALTER DATABASE postgres REFRESH COLLATION VERSION;

-- 1. Create the database if it doesn't exist
SELECT 'CREATE DATABASE embdb'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'embdb') \gexec

-- 1b. Refresh collation version for embdb
SELECT 'ALTER DATABASE embdb REFRESH COLLATION VERSION'
WHERE EXISTS (SELECT FROM pg_database WHERE datname = 'embdb') \gexec

-- 2. Connect to the new database
\c embdb

-- 3. Create the extensions inside embdb (CASCADE pulls in plpython3u for ai)
CREATE EXTENSION IF NOT EXISTS vector;
CREATE EXTENSION IF NOT EXISTS plpython3u;
CREATE EXTENSION IF NOT EXISTS ai CASCADE;
CREATE EXTENSION IF NOT EXISTS vectorscale;

-- Add any other tables for embdb below
-- CREATE TABLE IF NOT EXISTS items (id bigserial PRIMARY KEY, embedding vector(3));

