-- .devcontainer/setup.sql

-- 1. Create the database if it doesn't exist
SELECT 'CREATE DATABASE embdb';

-- 2. Connect to the new database
\c embdb

-- 3. Create the extension inside embdb
CREATE EXTENSION IF NOT EXISTS vector;

-- Add any other tables for embdb below
-- CREATE TABLE IF NOT EXISTS items (id bigserial PRIMARY KEY, embedding vector(3));