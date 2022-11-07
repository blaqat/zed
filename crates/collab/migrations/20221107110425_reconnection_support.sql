CREATE TABLE IF NOT EXISTS "worktrees" (
    "id" INTEGER NOT NULL,
    "project_id" INTEGER NOT NULL REFERENCES projects (id),
    "root_name" VARCHAR NOT NULL,
    PRIMARY KEY(project_id, id)
);
CREATE INDEX "index_worktrees_on_project_id" ON "worktrees" ("project_id");

CREATE TABLE IF NOT EXISTS "rooms" (
    "id" SERIAL PRIMARY KEY,
    "live_kit_room" VARCHAR
);

CREATE TABLE IF NOT EXISTS "room_participants" (
    "id" SERIAL PRIMARY KEY,
    "room_id" INTEGER NOT NULL REFERENCES rooms (id),
    "user_id" INTEGER NOT NULL REFERENCES users (id),
    "location_kind" INTEGER,
    "location_project_id" INTEGER REFERENCES projects (id), 
    "peer_id" INTEGER,
    "server_epoch" UUID NOT NULL
);
CREATE UNIQUE INDEX "index_room_participants_on_user_id_and_room_id" ON "room_participants" ("user_id", "room_id");

CREATE TABLE IF NOT EXISTS "room_participant_projects" (
    "id" SERIAL PRIMARY KEY,
    "participant_id" INTEGER NOT NULL REFERENCES room_participants (id),
    "project_id" INTEGER NOT NULL REFERENCES projects (id)
);
CREATE INDEX "index_room_participant_projects_on_participant_id" ON "room_participant_projects" ("participant_id");

CREATE TABLE IF NOT EXISTS "calls" (
    "id" SERIAL PRIMARY KEY,
    "caller_user_id" INTEGER NOT NULL REFERENCES users (id),
    "callee_user_id" INTEGER NOT NULL REFERENCES users (id),
    "room_id" INTEGER NOT NULL REFERENCES rooms (id),
    "initial_project_id" INTEGER REFERENCES projects (id),
    "peer_id" INTEGER,
    "server_epoch" UUID NOT NULL
);
CREATE UNIQUE INDEX "index_calls_on_callee_user_id" ON "calls" ("callee_user_id");
