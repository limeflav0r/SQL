/*
JOIN
- 두개 이상의 테이블을 관련있는 컬럼을 통해서 결합하는데 사용
- 반드시 연관있는 컬럼이 존재해야함
*/

/*
sqldb 데이터베이스에서 다음 조건을 처리하세요.
- 사용자별로 구매 이력을 출력함
- 모든 컬럼을 출력함
- 구매 이력이 없는 정보는 출력하지 않음
앞의 결과에서 userID가 'JYP'인 데이터만 출력하세요.
*/

select
    *
from buytbl b
    inner join usertbl u
    on b.userID = u.userID
    -- using (userID)
    -- USING : 컬럼명이 같을 경우 컬럼에 대한 조건을 작성해서 join 가능
where b.userID = 'JYP'

# sqldb 데이터베이스에서 다음 조건을 처리하세요.
# ○ 각 사용자별로 구매 이력을 출력하세요.
# ○ 연결 컬럼은 userID로 함
# ○ 결과를 userID를 기준으로 오름차순으로 정렬함
# ○ 구매이력이 없는 사용자도 출력하세요.
# ○ userID, name, prodName, addr, 연락처를 다음과 같이 출력함

select u.userID , u.name , b.prodName , u.addr ,concat(mobile1, mobile2)
from usertbl u
  left outer join buytbl b
  on u.userID = b.userID
order by u.userID;

-- sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력하세요.
