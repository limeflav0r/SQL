-- employees db에서 각 부서별 관리자를 출력하세요.
-- ○ 단, 현 재직자만 출력한다

use employees;
select emp_no as '부서별 관리자' from dept_manager where to_date = '9999-01-01';

-- 부서번호 d005 부서의 핸재 관리자 정보를 출력하세요.

select * from dept_manager where to_date = '9999-01-01' and dept_no = 'd005';

-- employees db에서 재직자의 총 수를 구하시오

select count(*) from dept_manager where to_date = '9999-01-01';