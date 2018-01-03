/* reset */
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
  post_id int REFERENCES posts,
  content text
);

CREATE TABLE post_tags (
    post_id int REFERENCES posts(id) ON DELETE CASCADE,
    tag_id int REFERENCES tags(id) ON DELETE RESTRICT,
    PRIMARY KEY (post_id, tag_id)
);

INSERT INTO users (id, firstName, lastName,email, screenName) VALUES
    (1, 'foo', 'bar','foo@bar.com', 'MsFoo'),
    (2, 'bar', 'bar','bar@bar.com', 'MrBar'),
    (3, 'bizz', 'bar','bizz@bar.com', 'DrBizz');

INSERT INTO tags (id, tag) VALUES
    (6,'you'), (7,'me'), (8,'things');

INSERT INTO posts (id, author_id, title, content, published) VALUES
    (6, 10,'5 things about you', 'lorem etc etc', 1),
    (7, 11,'10 things about me', 'lorem etc etc', 1);

INSERT INTO post_tags (post_id, tag_id) VALUES
    (6, 1),
    (6, 3),
    (8, 2),
    (8, 3);

INSERT INTO comments (id, author_id, post_id, content) VALUES
    (12, 1, 6, 1,'this is a comment to a post'),
    (13, 2, 8, 2, 'this is another comment');

INSERT INTO comments (author_id, post_id, referring_comment_id) VALUES
    (3, 6, 1),
    (2, 7, 2);
    
