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



INSERT INTO usertbl (userID, name, birthyear, addr, mobile1, mobile2, height, mDate)
VALUES
    ('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-08-08'),
    ('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-04-04'),
    ('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-07-07');

INSERT INTO buytbl (userID, prodName, groupName, price, amount)
VALUES
    ('KBS', '운동화', NULL, 30, 2),
    ('KBS', '노트북', '전자', 1000, 1);


#     ('JYP', '모니터', '전자', 200, 1);
Drop view if exists  user_buy_view;
CREATE VIEW user_buy_view AS
SELECT
    u.userID,
    u.name,
    b.prodName,
    u.addr,
    CONCAT(u.mobile1, u.mobile2) AS 연락처
FROM
    usertbl u
        JOIN
    buytbl b
        ON u.userID = b.userID;

SELECT *
FROM user_buy_view
WHERE name = '김범수';