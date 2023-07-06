--
-- inner join
---
-- 예제1) 현재, 근무하고 있는 직원의 이름과 직책을 출력하세요.
select a.first_name, b.title, a.emp_no, b.emp_no
from employees a, titles b
where a.emp_no = b.emp_no									-- join 조건(n-1)
	and b.to_date = '9999-01-01';							-- row 선택조건
-- employees 테이블과 titles 테이블를 join하여 직원의 이름과 직책을 모두출력 하세요.


-- 현재, 근무하고 있는 직원의 이름과 직책을 출력하되, 여성엔지니어만 
select * from employees;
select * from titles;
select *
from employees, titles
where employees.emp_no = titles.emp_no
and gender = 'F'
and title = 'Engineer'
and to_date = '9999-01-01';


-- ANSI / ISO SQL1999 JOIN 표준 문법

--  1) natural join
select a.first_name, b.title
from employees a join titles b on a.emp_no = b.emp_no
 where b.to_date = '9999-01-01';


-- natural join의 문제점

-- join ~ ~on
-- 예제) 현재, 직책별 평균 연봉을 큰 순서대로 출력하세요.
 select b.title, avg(a.salary)
	from salaries a 
    join titles b
    on a.emp_no = b.emp_no
    where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by b.title
    order by avg(a.salary) desc;
    

-- 십습문제1)
-- 현재, 직원별 근무 부서를 출력해 보세요
-- 사번, 직원 이름, 부서명 순으로 출력(employees, departments, dept_emp)
-- equi join
select a.emp_no, a.first_name, c.dept_name
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
and b.to_date = '9999-01-01'; 

-- 실습 문제 2
-- 현재, 지급되고 있는 급여를 출력해보세요
-- 사번, 이름, 급여 순으로 출력

-- 실습 문제3
-- 현재, 직책별 평균 연봉과 직원 수를 구하되,
-- 직원수가 100명 이상인 직책만 출력하세요
select b.title, avg(a.salary), count(*)
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date = '9999-01.01'
and b.to_date = '9999-01-01'
group by b.title
having count(*) > 100;

-- 실습문제4
-- 현재, 부서별로 직책이 엔지니어인 직원들에 대해서만 평균 급여를 구하세요.
-- 부서 이름, 평균급여 순으로 출력 평균 급여가 높은 순으로
select a.dept_name, avg(c.salary)
from departments a, dept_emp b, salaries c, titles d
where a.dept_no = b.dept_no
and b.emp_no = c.emp_no
and b.emp_no = d.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and d.title = 'Engineer'
group by a.dept_name
order by avg(c.salary) desc;