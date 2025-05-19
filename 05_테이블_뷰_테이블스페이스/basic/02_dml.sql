use tabledb;

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
