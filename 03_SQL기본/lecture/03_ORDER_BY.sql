-- ORDER BY
-- SELECT 문과 함께

SELECT
    emp_no,
    first_name,
    last_name
from
    employees
order by
    -- emp_no asc;
    -- emp_no desc;
    emp_no; -- 오름차순  (Default)

SELECT
    emp_no,
    first_name,
    last_name
from
    employees
order by
    first_name desc,
    last_name;

-- 컬럼에 따라 정렬을 여러번 할 수 있다.
-- first_name 기준으로 정렬 , 만약 같은 순위의 데이터가 있다면 last_name에 따라 정렬 가능하다.