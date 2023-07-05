select count(*) from employees;
select count(*) from salaries;
desc table;


--
-- select 기본
--
-- 예제 : departments 테이블의 모든 데이터를 출력

select count(*) from departments;


-- 프로젝션(projection)
-- 예제2 : departments 테이블에서 부서의 이름, 부서 번호를 출력하세요.
select dept_name, dept_no
from departments;
-- as(alias, 생략이 가능하다 -> 안쓰고 이름 변경가능. 컬럼 이름을 바꿀 수있는 것. 아 알죠)
-- 예제3 : employees 테이블에서 직우너의 이름, 성별, 입사일을 출력하세요

select first_name as '성',
	last_name as '이름',
    hire_date '입사일'
from employees
limit 0, 1000;
-- limit 0, 1000 0부터 1000개만 출력해라 edit-oreferebces-limit 체크

-- 함수 데이터값을 둘이 이어주는 것. 새로운 칼럼으로 보일것
select concat(first_name, ' ', last_name) as '이름',
	last_name as '이름',
    hire_date '입사일'
from employees;

-- distinct 출력할때 중복되는 것을 뺀다.
-- 예제4-1  : titles 테이블에서 모든 직급의 이름 출력
select title from titles;
-- 예제 4-2 : titles 테이블에서 직급은 어떤 것들이 있는지 직급이름을 한 번씩만 출력
select distinct(title) from titles;
-- 여러 칼럼을 대비해서 가로를 놓는다. 
-- distinct여도 다 가져온 다음에 잘라서 보여주기 때문에 메모리는 distinct쓰나 안쓰나 같다.

-- 
-- where 절 
--

 -- 비교연산자
 -- 예제 1번 : employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
 -- 프로젝션, 
 select fist_name, hire_date
 from employees
 where hire_date < '1999-01-01';
 
 
 -- 예제 2번: 논리연산자 employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력. 젠더가 여자인 ~ 무슨 이렇게 애기 안하니
 -- 그냥 월급이 ~보다 큰애 뽑아와바 이렇게 말한걸 나는 sql방식인 젠더가 ~이고 나이가 ~이고 이렇게 사고해야한다,
 -- 상사가 뭘알아
 select fist_name, hire_date
 from employees
 where hire_date < '1991-01-01'
 and gender = 'f';
 
 -- in 연산자
 -- 예제 3번 : dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
 -- 조인 문제였던거 d005가 마케팅 팀인지 어떻게 알어
 select emp_no, dept_no
 from dept_emp
 where dept_no in( d005, d009);


-- like 연산자
-- 예제 4번 : employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력

select fist_name, hire_date
from employees
where hire_date >= '1989-01-01' and hire_date <= '1989-12-31';

-- 다른 답안
select first_name, hire_date
from employees
where hire_date between '1989-01-01' and '1989-12-21';

select first_name, hire_date
from employees 
where hire_date like '1989%';

--
-- order by
-- 예제 5번 employees 테이블에서 직원의 전체이름,  성별, 입사일을  입사일 순으로 출력
select first_name, gender, hire_date
from employees
order by hire_date asc;


-- 예제 6번 salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력  (사번에 대한 월급순)
-- 조인
select emp_no, salary
from salaries
where from_date like '20001%'
order by salary desc, emp_no asc; 




-- employees 테이블에서 last_name이 acton인 사원의 이름, 성별, 입사일 출력




 



