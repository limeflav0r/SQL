use tabledb;

-- 다음 컬럼을 가지는 userTBL과 buyTBL을 정의하세요.
-- ○ 기존에 테이블이 존재하면 삭제함
-- ○ userTBL

DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
    userID CHAR(8) NOT NULL,
    name VARCHAR(10) NOT NULL,
    birthyear INT NOT NULL,
    CONSTRAINT PRIMARY KEY (userID)
);

-- ○ buyTBL

CREATE TABLE buyTBL (
    num INT NOT NULL AUTO_INCREMENT,
    userID CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    CONSTRAINT PRIMARY KEY (num)
);

-- • ALTER를 이용해 userID를 외래키로 수정하세요.

ALTER TABLE buyTBL
ADD CONSTRAINT fk_userID
FOREIGN KEY (userID)
REFERENCES userTBL(userID);

-- 다음 조건을 만족하는 userTBL 테이블을 정의하세요.
-- ○ 기존 buyTBL, userTBL을 삭제하세요.
DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
    userID CHAR(8) NOT NULL ,
    name VARCHAR(10) NOT NULL ,
    birthyear INT NOT NULL ,
    email CHAR(30) UNIQUE ,
    CONSTRAINT PRIMARY KEY (userID)
);

-- 다음 조건을 만족하는 userTBL 테이블을 정의하세요.
-- ○ 기존 userTBL을 삭제하세요.

DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10),
    birthYear INT CHECK (birthYear >= 1900 AND birthYear <= 2023),
    mobile CHAR(3) NOT NULL
);

-- 다음 조건을 만족하는 userTBL 테이블을 정의하세요.
-- ○ 기존 userTBL을 삭제하세요.

DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL (
    userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL DEFAULT -1,
    addr CHAR(2) NOT NULL DEFAULT '서울',
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT DEFAULT 170,
    mDate DATE
);

-- 기본값 추가를 확인할 수 있는 데이터를 추가하세요.

INSERT INTO userTBL (userID, name)
VALUES ('user1', '홍길동');

SELECT * FROM usertbl;

-- 앞에서 만든 userTBL에 대해서 다음 조건을 처리하도록 수정하세요.
-- ○ mobile1 컬럼을 삭제함
ALTER TABLE userTBL
DROP COLUMN mobile1 ;

ALTER TABLE userTBL
CHANGE name uName VARCHAR(10) NOT NULL ;

ALTER TABLE userTBL
DROP PRIMARY KEY ;

-- ○ name 컬럼명을 uName으로 변경함


-- ○ 기본키를 제거함