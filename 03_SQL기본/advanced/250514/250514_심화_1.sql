--  다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.
use sqldb;

select userID as '사용자 아이디' , sum(amount) as '총 구매 개수' ,  sum(price * amount) as '총 구매액' from buytbl group by userID ;

-- 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.

select userID ,  avg(amount) as '평균 구매 개수' from buytbl group by userID ;

-- 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요.
-- ○ 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
UNION
SELECT name, height
FROM usertbl
WHERE height = (SELECT MIN(height) FROM usertbl);

-- 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요

select count(*) as '휴대폰이 있는 사용자' from usertbl where mobile1 != 'null';

-- buytbl 테이블로 다음을 처리하세요.
-- ○ 사용자별 총 구매액을 출력하세요

select userID as 사용자 , sum(amount * price) as 총구매액 from buytbl group by userID

-- 총 구매액이 1,000이상인 사용자만 출력하세요
select userID as 사용자, sum(amount * price) as 총구매액 from buytbl group by userID having 총구매액 >= 1000;


-- world 데이터베이스에서 다음 질문을 처리하세요.

use world;

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오.

select sum(Population) from city where CountryCode = 'KOR';

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오. 단 결과를 나타내는 테이블의 필드는 "최소값"으로 표시하시오.

select min(Population) as 최솟값 from city where CountryCode = 'KOR';

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오.

select avg(Population) from city where CountryCode = 'KOR';

-- ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오. 단 결과를 나타내는 테이블의 필드는 "최대값"으로 표시하시오.

select max(Population) as 최댓값 from city where CountryCode = 'KOR';

-- ○ country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오.

SELECT Name, CHAR_LENGTH(Name) AS 글자수 FROM country;

-- ○ country테이블의 나라명(Name 칼럼)을 앞 세글자만 대문자로 표시하시오.

SELECT UPPER(LEFT(Name, 3)) FROM country;

-- ○ country테이블의 기대수명(LifeExpectancy)을 소수점 첫째자리에서 반올림해서 표시하시오.

select name , round(LifeExpectancy,1) as 기대수명 from country;
