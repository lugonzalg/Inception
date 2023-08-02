#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$NEXTJS_USER" --dbname "$NEXTJS_DB" <<-EOSQL
	CREATE TABLE users (
		id SERIAL PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
		job VARCHAR(255) NOT NULL
	);

	CREATE TABLE skills (
		id SERIAL PRIMARY KEY,
		skill VARCHAR(255) NOT NULL,
		level INTEGER NOT NULL
	);

	CREATE TABLE experiences (
		id SERIAL PRIMARY KEY,
		business VARCHAR(255) NOT NULL,
		start_date DATE NOT NULL,
		end_date DATE,
		user_id INTEGER REFERENCES users (id) ON DELETE CASCADE
	);

	CREATE TABLE projects (
		id SERIAL PRIMARY KEY,
		project VARCHAR(255) NOT NULL,
		user_id INTEGER REFERENCES users (id) ON DELETE CASCADE
	);

	CREATE TABLE experiences_skills (
		id SERIAL PRIMARY KEY,
		project_id INTEGER REFERENCES experiences (id) ON DELETE CASCADE,
		skills_id INTEGER REFERENCES skills (id) ON DELETE CASCADE
	);

	CREATE TABLE projects_skills (
		id SERIAL PRIMARY KEY,
		project_id INTEGER REFERENCES projects (id) ON DELETE CASCADE,
		skills_id INTEGER REFERENCES skills (id) ON DELETE CASCADE
	);
EOSQL
