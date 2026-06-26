-- ex3 방명록 -------------------

-- 1. 데이터베이스 생성 (이미 있으면 생략)
--CREATE DATABASE hrd;

-- 2. 테이블 생성
CREATE TABLE guestbook (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(50)  NOT NULL,
    message TEXT         NOT NULL,
    reg_date TIMESTAMP   DEFAULT NOW()
);

-- 3. 테스트 데이터 (선택)
INSERT INTO guestbook (name, message)
VALUES ('선생님', '방명록 테스트입니다!');

select * from guestbook;

-- ex4 로그인(세션) -------------------

-- 2. 테이블 생성
CREATE TABLE users (
    id       SERIAL PRIMARY KEY,
    userid   VARCHAR(50)  UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(50)  NOT NULL
);

-- 3. 테스트 데이터(관리자iD 추가)
INSERT INTO users (userid, password, username)
VALUES ('admin', '1234', '관리자');

select * from users;

-- ex5 미니게시판 -------------------

CREATE TABLE board (
    id       SERIAL PRIMARY KEY,
    title    VARCHAR(200) NOT NULL,
    content  TEXT         NOT NULL,
    author   VARCHAR(50)  NOT NULL,
    reg_date TIMESTAMP    DEFAULT NOW()
);
select * from board;


-- ex6 회원관리 CRUD (Model2 패턴) -------------------

CREATE TABLE member (
    id       SERIAL PRIMARY KEY,
    userid   VARCHAR(50)  UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(50)  NOT NULL,
    email    VARCHAR(100),
    reg_date TIMESTAMP    DEFAULT NOW()
);

-- 테스트 데이터
INSERT INTO member (userid, password, username, email)
VALUES ('hong', '1234', '홍길동', 'hong@test.com'),
       ('kim',  '1234', '김철수', 'kim@test.com');

select * from member;