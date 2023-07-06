--
-- 문자열 함수
--

-- upper
-- ucase : 
select upper('seoul'), ucase('Seoul'), 
from dual;

-- lower
select lower('seoul'), lcase('Seoul')
from dual;

-- db는 1부터 시작
-- 
-- substring(문자열, 인덱스, 길이)
select substring('hello world', 3, 2)
from dual;

-- 예제 : employees 테이블에서 last_name이 acton인 사원의 이름, 성별, 입사일 출력
-- 에제대체 : 1989년 입사한 사원들의 이름, 입사일을 출력하세요.
select first_name, hire_date
from employees
where substring(hire_date, 1, 4) = '1989';
-- 결과만 같으면된다
-- where hire_date like '1989-__-__';
-- where hire_date between '1989-01-01' and '1989-12-31'
-- where hire_date >= 


-- lpad(오른쪽 정렬), rpad(왼쪽 정렬) 
select lpad('1234', 10, '*'); -- 오
select rpad('1234', 10, '*'); -- 돈같은 경우, 아랍어

-- 예제 2번: 직원들의 월급을 오른쪽 정렬(빈공간은 *로)
select lpad(salary, 10, '*') from salaries;


-- 특정문자열을 빼는법 trim ltrim rtrim / leading '   hell   '
select concat('---', trim(leading 'x' from 'hello');
select concat('---', trim(trailing 'x' from 'xxxxxxxxhelloxxxxxx'), '----')
select concat('---', trim(both 'x' from 'xxxxxxxxhelloxxxxxx'), '----')
from dual;


-- length
select length('hello world') from dual;
 -- 대한민국 cafe24, daum 
