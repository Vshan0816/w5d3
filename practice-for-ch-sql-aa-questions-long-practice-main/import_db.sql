PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS questions_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL

);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users(id)

);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    children_reply_id INTEGER,
    body TEXT NOT NULL,
    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (children_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Sean', 'Jeun'),
    ('Vincent', 'Shan'),
    ('Dennis', 'Lee'),
    ('Kin', 'Tse');

INSERT INTO
    questions (title, body)
VALUES
    ('Is 1 + 1 ACTUALLY equals to 2?', 'In the binary system, we have 2 digits only: 0 and 1, where 1+1=10. In the decimal system, the one that we mostly use, we have 10 digits (0-9), and 1+1 is always 2. We all made an agreement about a set of rules. Based on these rules, 1+1=2 for the decimal system.'),
    ('Does my mom actually love me?', 'I know that my mom is my biological mother, but it feels like she is my step-mom. Help.');
