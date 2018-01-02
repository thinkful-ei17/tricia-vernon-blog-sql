

CREATE TABLE grades (
    id serial PRIMARY KEY,
    "date" timestamptz NOT NULL,
    grade text NOT NULL,
    score integer NOT NULL,
    restaurant_id integer REFERENCES restaurants
);


CREATE TABLE users (
  id serial PRIMARY KEY,
  firstName text,
  lastName text,
  email text NOT NULL,
  screenName text NOT NULL
);


CREATE TABLE posts (
  id serial PRIMARY KEY,
  user_id text REFERENCES users,
  title text,
  content text,
  modified timestamp DEFAULT current_timestamp,
);


CREATE TABLE comment (
  id serial PRIMARY KEY,
  user_id text REFERENCES users,
  post_id text REFERENCES users,
  content text
);

CREATE TABLE tag (
  id serial PRIMARY KEY,
  post_id integer REFERENCES posts,
  content text
);


//add items to each table [users,comments, tags, posts]
