//reset
DROP TABLE users, posts, comments, tags, post_tags;

CREATE TABLE users (
  id serial PRIMARY KEY,
  firstName text,
  lastName text,
  email text NOT NULL,
  screenName text NOT NULL
);


CREATE TABLE posts (
  id serial PRIMARY KEY,
  user_id int REFERENCES users,
  title text,
  content text,
  published timestamp DEFAULT now()
);


CREATE TABLE comments (
  id serial PRIMARY KEY,
  user_id int REFERENCES users ON DELETE CASCADE NOT NULL,
  post_id int REFERENCES posts ON DELETE CASCADE NOT NULL,
  content text
);

CREATE TABLE tags (
  id serial PRIMARY KEY,
  post_id int REFERENCES posts,
  content text
);

CREATE TABLE post_tags (
    post_id int REFERENCES posts(id) ON DELETE CASCADE,
    tag_id int REFERENCES tags(id) ON DELETE RESTRICT,
    PRIMARY KEY (post_id, tag_id)
);
