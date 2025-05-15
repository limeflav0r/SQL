-- 다음과 같이 테이블과 데이터를 준비하세요.
USE sqldb;
CREATE TABLE stdtbl (
                        stdName VARCHAR(10) NOT NULL PRIMARY KEY,
                        addr CHAR(4) NOT NULL
);

CREATE TABLE clubtbl (
                         clubName VARCHAR(10) NOT NULL PRIMARY KEY,
                         roomNo CHAR(4) NOT NULL
);

CREATE TABLE stdclubtbl(
                           num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
                           stdName VARCHAR(10) NOT NULL,
                           clubName VARCHAR(10) NOT NULL,
                           FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
                           FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);
INSERT INTO stdtbl VALUES ('김범수','경남'), ('성시경','서울'), ('조용필','경기'), ('은지원','경북'),('바비킴','서울');
INSERT INTO clubtbl VALUES ('수영','101호'), ('바둑','102호'), ('축구','103호'), ('봉사','104호');
INSERT INTO stdclubtbl
VALUES (NULL, '김범수','바둑'), (NULL,'김범수','축구'), (NULL,'조용필','축구'),
       (NULL,'은지원','축구'), (NULL,'은지원','봉사'), (NULL,'바비킴','봉사');


# 앞에서 정의한 3개의 테이블을 이용해서 다음을 처리하세요.
# ○ 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/동아리방을 출력하세요.

select
    s.stdname as 학생이름,
    sc.clubName as 동아리명,
    c.roomNo as 동아리위치
from stdtbl s
    join stdclubtbl sc
        on s.stdName = sc.stdName
    join clubtbl c
                on sc.clubName = c.clubName
    order by sc.stdName;

# 작동 순서
# 1. 첫번째 테이블과 두번째 테이블 먼저 조인
# 2. 1번의 결과 테이블과 세번째 테이블이 조인
# -- 각 조인마다 on으로 조건을 지정해야함

# ○ 동아리를 기준으로 가입한 학생의 목록을 출력하세요.
#  출력정보: clubName, roomNo, stdName, addr

select
    c.clubName as 동아리명 ,
    c.roomNo as 동아리위치 ,
    s.stdName as 학생이름 ,
    s2.addr as 주소
    from clubtbl c
    join stdclubtbl s on c.clubName = s.clubName
    join stdtbl s2 on s.stdName = s2.stdName;


CREATE TABLE empTbl (
                        emp CHAR(3),
                        manager CHAR(3),
                        empTel VARCHAR(8)
);

INSERT INTO empTbl VALUES('나사장', NULL, '0000');
INSERT INTO empTbl VALUES('김재무', '나사장', '2222');
INSERT INTO empTbl VALUES('김부장', '김재무', '2222-1');
INSERT INTO empTbl VALUES('이부장', '김재무', '2222-2');
INSERT INTO empTbl VALUES('우대리', '이부장', '2222-2-1');
INSERT INTO empTbl VALUES('지사원', '이부장', '2222-2-2');
INSERT INTO empTbl VALUES('이영업', '나사장', '1111');
INSERT INTO empTbl VALUES('한과장', '이영업', '1111-1');
INSERT INTO empTbl VALUES('최정보', '나사장', '3333');
INSERT INTO empTbl VALUES('윤차장', '최정보', '3333-1');
INSERT INTO empTbl VALUES('이주임', '윤차장', '3333-1-1');

-- 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요.
-- 출력할 정보
-- -부하직원 , 직속상관 , 직속상관연락처
SELECT
    e.emp AS 부하직원,
    e.manager AS 직속상관,
    m.empTel AS 직속상관연락처
FROM empTbl e
JOIN empTbl m
    ON e.manager = m.emp
WHERE e.emp = '우대리';

use employees;
-- 현재 재직 중인 직원 정보를 출력하세요
-- 출력항목: 직원의 기본 정보 모두, title, salary

SELECT
    e.*,
    t.title,
    s.salary
FROM employees e
         JOIN titles t
              ON e.emp_no = t.emp_no
                  AND t.to_date = '9999-01-01'
         JOIN salaries s
              ON e.emp_no = s.emp_no
                  AND s.to_date = '9999-01-01';

-- 현재 재직중인 직원의 정보를 출력하세요
-- 출력항목: emp_no, first_name, last_name, department
-- 정렬: emp_no 오름차순

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees e
         JOIN dept_emp de
              ON e.emp_no = de.emp_no
                  AND de.to_date = '9999-01-01'
         JOIN departments d
              ON de.dept_no = d.dept_no
        order by emp_no ;

-- 부서별 재직중인 직원의 수를 출력하세요
-- 출력 항목: 부서 번호, 부서명, 인원수
-- 정렬: 부서 번호 오름차순

select de.dept_no ,
       d.dept_name ,
       count(*)
           from employees e
        Join dept_emp de
            on e.emp_no =  de.emp_no
        join departments d
                on d.dept_no = de.dept_no
        group by de.dept_no
order by de.dept_no ;



-- 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요
-- 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date

select
    e.emp_no ,
    e.first_name ,
    e.last_name ,
    d.dept_name ,
    de.from_date,
    de.to_date
from employees e
         Join dept_emp de
              on e.emp_no =  de.emp_no
         join departments d
              on d.dept_no = de.dept_no
where e.emp_no = 10209;