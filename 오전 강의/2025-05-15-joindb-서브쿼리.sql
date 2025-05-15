-- self join
CREATE TABLE emptbl(emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO empTbl (emp, manager, empTel) VALUES
                                              ('나사장', NULL, '0000'),
                                              ('김재무', '나사장', '2222'),
                                              ('김부장', '김재무', '2222-1'),
                                              ('이부장', '김재무', '2222-2'),
                                              ('우대리', '이부장', '2222-2-1'),
                                              ('지사원', '이부장', '2222-2-2'),
                                              ('이영업', '나사장', '1111'),
                                              ('한과장', '이영업', '1111-1'),
                                              ('최정보', '나사장', '5355'),
                                              ('윤차장', '최정보', '3355-1'),
                                              ('이주임', '윤자장', '5335-1-1');

select * from empTbl;

-- 우대리 상관의 연락처 검색
SELECT
    A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
FROM empTbl A
         INNER JOIN empTbl B
                    ON A.manager = B.emp
WHERE A.emp = '우대리';

