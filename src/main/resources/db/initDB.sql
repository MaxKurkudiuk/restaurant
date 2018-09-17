DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS menu;

DROP SEQUENCE IF EXISTS global_seq_user;
DROP SEQUENCE IF EXISTS global_seq_menu;

CREATE SEQUENCE global_seq_user START 100000;
CREATE SEQUENCE global_seq_menu START 100000;

CREATE TABLE users
(
  id               INTEGER PRIMARY KEY DEFAULT nextval('global_seq_user'),
  name             VARCHAR                 NOT NULL,
  email            VARCHAR                 NOT NULL,
  password         VARCHAR                 NOT NULL,
  registered       TIMESTAMP DEFAULT now() NOT NULL,
  enabled          BOOL DEFAULT TRUE       NOT NULL,
  calories_per_day INTEGER DEFAULT 2000    NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_roles
(
  user_id          INTEGER                 NOT NULL,
  role             VARCHAR                 NOT NULL,
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE meals
(
  id                INTEGER PRIMARY KEY DEFAULT nextval('global_seq_menu'),
  menu_id           INTEGER                 NOT NULL,
  date_time         TIMESTAMP               NOT NULL,
  description       VARCHAR                 NOT NULL,
  calories          INTEGER                 NOT NULL
);
CREATE UNIQUE INDEX meals_unique_menu_datetime_idx
  ON meals (menu_id, date_time);

CREATE TABLE menu
(
  id                INTEGER PRIMARY KEY DEFAULT nextval('global_seq_menu'),
  name              VARCHAR                 NOT NULL,
  date_time         TIMESTAMP DEFAULT now() NOT NULL,
  restaurant_id     INTEGER                 NOT NULL
);