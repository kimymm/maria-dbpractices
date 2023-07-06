-- 날짜 함수

-- curdate() : 함수, current_data : 상수 (oracle의 sysdate같은것? xx)
select curdate(), current_date, sysdate() from dual;

-- curtime(), current_time
-- 내가 
select curtime(), current_time from dual;

-- now() vs sysdate() 똑같은 것은 아니다
select now(), sysdate() from dual;
select now(), sleep(2.2323), now() from dual;
select now(), sleep(2), sysdate() from dual;


-- date_format 많이 사용
select date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %s초') from dual;
-- 자바에서 하지말고 여기서 끝내는 것이 더 좋음, 성능은 차이없지만, 유지보수에
-- 또 어떤놈이 이직하면 그럴수도
-- 아씨 성능 부족하면 돈 쓰면되지라고만 생각하지 오륜 답이없는걸
select date_format(now(), '%a %b %c %d %e %f %y') from dual; -- 뭐이리 많아



-- period_diff (실무)
-- 근무 개월
-- 포메팅(YYMM, YYYYMM)

select emp_no, 
	   hire_date,
       period_diff(date_format(curdate(),'%y%m'), date_format(hire_date, '%y%m')) as month 
from employees;

-- data_add(=adddate), date_sub(subdate)
-- 시간을 date 타입의 칼럼이나 값에 type(year, month, day)의 표현식으로 더하거나 뺼 수 있다.
-- 예) 각 사원의 근속 년 수가 5년이 되는 날에 휴가를 보내준다면 
-- 각 사원의 근속 휴가 날짜는?
select first_name,
	   hire_date,
       date_add(hire_date, interval 5 year)
       from employees;
       
       
-- cast 강제형변환이다
select '12345' + 10 from dual; -- int로 변환
select cast('12345' as int) + 10 from dual;
select date_format(cast('2023-07-06' as date), '%Y년 %m월 %d일') from dual; -- date타입이어야
-- '2023-07-06'은 스트링인데 날짜로 받어짐

select cast(cast(1-2 as unsigned) as integer) from dual;
-- 언더플로우 signed, int, integer 은 같은 말

-- type 
-- 문자 varchar(10), char(10), text, CLOB(character Large OBject) 낭비의 차이
-- 정수 : medium int, int, int(signed, unsigned) 여기도 int는 21억 사이즈alter
-- 시간 : date, datetime
-- LOB : CLOB, BLOB(binary large object)이미지나 음악 저장