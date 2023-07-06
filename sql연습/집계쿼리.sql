-- 뭘 하실려고요
-- 1)집계(통계) 쿼리
-- select 절에 그룹(통계, 집계) 함수가 projetion 된 쿼리
-- 그룹함수: avg, max, min, count, sum, stddev, variance
-- 


-- 2) select 절에 그룹함수가 있는 경우, 어떤 칼럼도 select 절에 올 수 없다!!!!
-- 오류
select sum(salary), emp_no from salaries;
-- 예제 salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총 합계를 출력


-- 3) query 순서

-- 예제: 사번이 10060인 사원이 받은 평균 연봉?
select salary
  from salaries
  where emp_no = 10060;


-- 5) having
-- 집계결과(결과 테이블)에서 row를 선택해야 하는 경우
-- 이미ㄴ미아ㅣㄴ


-- 6) order by
-- order by는 항상 맨 마지막 출력 전에 한다.

select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary) > 60000
order by avg(salary);



select * from salaries;
-- 주의)
-- 예제) 사번이 10060인 직원의 급여 평균, 급여 총합
-- 문법적인 오류
-- 의미적으로 맞다: where 절 조건 때문에, 사번이 10060이 칼럼이 졸라 많다
select emp_no, avg(salary), sum(salary)
from salaries
group by emp_no
having emp_no = 10060;






