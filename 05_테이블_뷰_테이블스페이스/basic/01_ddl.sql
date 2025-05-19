-- 존재하면 삭제
drop database if exists tabledb;

-- 생성
create database  tabledb;
use tabledb;


drop table if exists usertbl;

create table usertbl (
    -- 컬럼 타입 제약조건
    userID char(8) not null primary key,
    name varchar(10) not null ,
    birthyear int not null ,
    addr char(2) not null ,
    mobile1 char(3) ,
    mobile2 char(8)  ,
    height smallint,
    mDate date
);

drop table if exists buytbl;

CREATE TABLE buytbl (
    num INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    userID CHAR(8) NOT NULL,
    prodName CHAR(6) NOT NULL,
    groupName CHAR(4),
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY (userID) REFERENCES usertbl (userID)
);

