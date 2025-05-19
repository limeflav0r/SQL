use tabledb;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl (
                         userID CHAR(8) NOT NULL ,
                         name VARCHAR(10) NOT NULL,
                         birthyear INT NOT NULL,
    -- constraint : 제약조건을 명시적으로 이름븉여 정의
    -- primary key [기본키제약조건이름](기본키로 지정할 칼럼)
                         constraint primary key PK_userTBL_userID (userID)

);

DROP TABLE IF EXISTS prodTbl;

CREATE TABLE prodTbl (
                         prodCode CHAR(3) NOT NULL  ,
                         prodID CHAR(4) NOT NULL  ,
                         prodDate DATETIME NOT NULL,
                         proCur CHAR(10),
                         CONSTRAINT PRIMARY KEY (prodCode, prodID)

);