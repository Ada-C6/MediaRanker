CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "media" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "media_type" varchar, "name" varchar, "creator" varchar, "description" text, "votes" integer DEFAULT 0 NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20161012214953');

INSERT INTO schema_migrations (version) VALUES ('20161013011410');

INSERT INTO schema_migrations (version) VALUES ('20161013231055');

INSERT INTO schema_migrations (version) VALUES ('20161013234145');

INSERT INTO schema_migrations (version) VALUES ('20161014192228');

INSERT INTO schema_migrations (version) VALUES ('20161014215706');

