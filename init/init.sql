-- run on local db only.  DBA user in RDS is created as part of db create
CREATE ROLE medialib_app PASSWORD 'medialib' INHERIT LOGIN;
CREATE SCHEMA medialib;
GRANT USAGE ON SCHEMA medialib TO medialib_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA medialib GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO medialib_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA medialib GRANT USAGE, SELECT ON SEQUENCES TO medialib_app;
