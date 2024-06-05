/*
형변환(PARSING) 함수

-- 문자열(CHAR,VARCHAR2) <-> 숫자(NUMBER)
-- 문자열(CHAR,VARCHAR2) <-> 날짜(DATE)
-- 숫자(NUMBER)------------> 날짜(DATE)
*/

/*
TO_CHAR(날짜 | 숫자 [. 포멧]) : 문자열로 변환

숫자 -> 문자열
포멧 
1) 9 : 숫자 한 칸을 의미, 오른쪽 정렬
2) 0 : 숫자 한 칸을 의미, 오른쪽 정렬, 빈칸에 0 을 추가
3) L : 현재 시스템이나 DB 에 설정된 나라의 화폐 기호
4) , : 숫자의 자릿수 구분
*/

-- DUAL 이라는 가상 테이블을 이용해서 조회
SELECT 1234, TO_CHAR(1234) FROM DUAL; -- 데이터 타입 변경 숫자 -> 문자열
SELECT 1234, TO_CHAR(1234,'99999999') FROM DUAL; -- 데이터'    1234' 앞에 공백 4 칸 생성
-- 9 를 사용하지 않으면 기본으로 왼쪽 정렬  9 의 반대는 아무것도 작성하지 않는 것
SELECT 1234, TO_CHAR(1234,'00000000') FROM DUAL; -- '00001234' 앞에 0 이 4 칸 생성

-- 숫자 -> 문자열 변환시 주의 사항
--> 지정된 칸 수가 숫자 길이보다 적으면 전부 # 으로 변환돼서 출력

SELECT 1234, TO_CHAR(1234,'000') FROM DUAL; -- '####' 지정된 자리값보다 변환해야하는 값의 길이가 더 크기 때문에 ### 출력
SELECT 1234, TO_CHAR(1234,'999') FROM DUAL; -- '####' 지정된 자리값보다 변환해야하는 값의 길이가 더 크기 때문에 ### 출력

-- 화폐기호 + 자릿수 구분
SELECT
    TO_CHAR(123456789, 'L999999999'), -- L 9 아홉개
    TO_CHAR(123456789, '$999999999'), -- $ 9 아홉개
    TO_CHAR(123456789, '$999,999,999') -- $ 9 아홉개
FROM DUAL;  --         ￦123456789	 $123456789	 $123,456,789
-- L 의 경우 현재 시스템에서 사용하는 화폐 단위 기호, 한국이라 원이 나옴

-- 모든 사원의 연봉 조회 
-- 현재 화폐 단위 , 사용해서 조회
-- FROM EMPLOYEE
SELECT EMP_NAME ,TO_CHAR(SALARY * 12, 'L999,999,999') AS "연봉" FROM EMPLOYEE;

-- DUAL 사용해서 현재 날짜 (SYSDATE) YYYY-MM-DD    
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS "현재날짜" FROM DUAL;

-- DUAL 사용해서 현재 날짜 (SYSDATE) 2024-06-05 수요일
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') AS "현재날짜" FROM DUAL;

-- DUAL 사용해서 현재 날짜 (SYSDATE) 2024-06-05 (수)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY)') AS "현재날짜" FROM DUAL;

-- DUAL 사용해서 현재 날짜 (SYSDATE) 2024-06-05 (수) 오전 시:분:초
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY) AM HH:MI:SS') AS "현재날짜" FROM DUAL;

-- DUAL 사용해서 현재 날짜 (SYSDATE) 2024년 06월 05일 오전 00시 00분 00초
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" AM HH24"시" MI"분" SS"초"') AS "현재날짜" FROM DUAL;

/*
TO_DATE(문자열 | 숫자 [,포맷])
-- 문자열 또는 수자를 날짜 형식 변환
*/

-- DUAL 가상 테이블 사용
-- 문자열이 날짜를 표현하는 형식이면 형식 지정없이 바로 변경 가능
SELECT TO_DATE('2024-05-05')
FROM DUAL;

-- 날짜 - 월 - 년으로 표기
SELECT TO_DATE('06-05-2024','DD-MM-YYYY')
FROM DUAL; -- TO_DATE 형식으로 년/월/일 변경하겠다 06-05-2024 -> 24/05/06

SELECT TO_DATE('05월 27일 월요일 12시 50분', 'MM"월" DD"일" DAY HH"시" MI"분"')
FROM DUAL; -- TO_DATE 형식 년/월/일 변경하겠다 05월 27일 월요일 12시 50분 -> 24/05/27

-- 숫자 -> 날짜
SELECT TO_DATE(20240605, 'YYYYMMDD') FROM DUAL; --> 20/06/05

-- RR YY 차이점

-- 년도가 두 자리만 작성이 되어있는 경우에는 
-- 50 이상 : Y 현재 세기(2000 년대 기준 이후) R 이전 세기(1900 년대 기준) 
-- 50 미만 : Y,R 둘다 누락된 년도 앞부분에 현재 2000 년대 세기 추가

-- 년도가 앞 두자리 누락   50 년대 기준으로 살펴봄

-- 1) 50 년대 미만 확인
SELECT
    TO_DATE('49-12-01', 'YY-MM-DD') AS "YY", -- 2049
    TO_DATE('49-12-01', 'RR-MM-DD') AS "RR" -- 2049
FROM DUAL;


-- 2) 50 년대 이상 확인
SELECT
    TO_DATE('50-12-01', 'YY-MM-DD') AS "YY", -- 2050
    TO_DATE('50-12-01', 'RR-MM-DD') AS "RR" -- 1950
FROM DUAL;






