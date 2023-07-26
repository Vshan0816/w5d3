CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL

    -- FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY
    title TEXT NOT NULL,
    body TEXT NOT NULL,

);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY
    user_id INTEGER NOT NULL
    question_id INTEGER NOT NULL
    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY 
    body TEXT NOT NULL,
    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (users_id) REFERENCES users(id)
    FOREIGN KEY (children_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY
    user_id INTEGER NOT NULL
    question_id INTEGER NOT NULL
    likes INTEGER DEFAULT 0
    FOREIGN KEY (questions_id) REFERENCES questions(id)
    FOREIGN KEY (users_id) REFERENCES users(id)
);