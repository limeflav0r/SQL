-- 모든 문제는 employees 데이터베이스에서 수행한다.
-- employees db의 ERD

use employees;

-- 다음 정보를 가지는 직원 정보를 출력하는 EMPLOYEES_INFO 뷰를 작성하세요.
create view EMPLOYESS_INFO as
    select
        e.emp_no,
        e.birth_date,
        e.first_name,
        e.last_name,
        e.gender,
        e.hire_date,
        t.title,
        t.from_date as t_from,
        t.to_date as t_to,
        s.salary,
        s.from_date as s_from,
        s.to_date as s_to
        from employees e
            join titles t
                on e.emp_no = t.emp_no
            join salaries s
                      on e.emp_no = s.emp_no
    order by emp_no;

select * from EMPLOYESS_INFO;

-- EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력하세요.

select * from EMPLOYESS_INFO where s_to = '9999-01-01';

-- 다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성하세요.

create view EMP_DEPT_INFO as
    select
        de.emp_no,
        de.dept_no,
        d.dept_name,
        de.from_date,
        de.to_date
        from dept_emp de
            join departments d
                on de.dept_no = d.dept_no;

select * from EMP_DEPT_INFO order by emp_no;

-- EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요.

select * from EMP_DEPT_INFO where to_date='9999-01-01' order by emp_no;