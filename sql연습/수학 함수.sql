-- 수학 함수

-- abs
select abs(1), abs(-1) from dual;
-- ceil
select ceil(3.14), ceiling(3.14) from dual;

-- floor
select floor(3.14) from dual;
-- mod 나머지 연산
select mod(10, 3) from dual;

-- round(x) : x의 가장 근접한 정수
-- round(x , d) : x의 소숫점 d 자리에 가장 근접한 함수
select round(1.498), round(1.50001), round(1.498, 1), round(1.009 , 2) from dual;

-- power(x, y), pow(x, y) : x의 지수? 그러네
select power(2, 13), pow(2, 13) from dual;

-- sign : 양수는 1 음수는 -1 제로는 제로
select sign(231321903103120391039120391023912039), sign(-123091203 * 30293) from dual;

-- greatest(a1, a2, a3, a4, a5, ..) 젤 큰거, least(a1, a2, a3, ... or 문자) 젤 작은거
select greatest(10, 40, 231023, -20239, 0 / 10), greatest('z', 'Z', 'A'), least('hello', 'hella', 'hell') from dual;

