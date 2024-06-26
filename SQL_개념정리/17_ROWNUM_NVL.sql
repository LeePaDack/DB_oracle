/*
ROWNUM
쿼리의 결과 집합에서 각 행에 순차적으로 1 부터 시작하는 번호를 부여

결과 집합의 크기를 제한
*/

-- 예제 1 : 상위 5 개의 행만 선택하는 예제
SELECT ROWNUM,EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5;


-- 정렬된 결과 집합에서 상위 5 개 행만 선택
-- 예제 2 : 급여가 높은 상위 5 명의 직원 선택
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
FROM(SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

-- 주의할 점
-- 5 위 이후부터 번호 매김이 하고싶어짐
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM > 5; -- 나오지 않음
-- ROWNUM 은 무조건 1 부터 시작하기 때문에 5 이후는 처음부터 나올 수 없는 조건
-- 랭킹

-- ROWNUM 을 이용해서 월급이 가장 높은 3 명을 뽑으려 했지만 되지 않음
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 3
ORDER BY SALARY DESC;

-- 1. SALARY 월급 높은 순서대로 출력한 다음 제대로 월급이 가장 높은 3 명이 나온 것이 맞는지 확인
-- 2. 만약 제대로 나온 값이 아니라면 수정 (SUBQUERY) SUBQUERY = 1 에서 조회한 쿼리
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;

SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC) 
WHERE ROWNUM <= 3
ORDER BY SALARY DESC;


/*******
NVL : NULL 로 되어있는 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
[사용법]
NYL(컬럼명, 컬럼값이 NULL 일 때 변경할 값)

NVL2 : 
NULL 이 아닌 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
NULL 로 되어있는 컬럼의 값을 지정한 숫자 또는 문자로 변경해서 반환
[사용법]
NYL2(컬럼명, NULL 이 아닌 경우 변경할 값 ,컬럼값이 NULL 일 때 변경할 값)
*********/

-- EMPLOYEE 테이블에서 
-- 사번 이름 전화번호 조회
-- 전화번호가 없으면 없음으로 조회
SELECT EMP_ID, EMP_NAME, NVL(PHONE,'없음') AS "전화번호"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 이름 급여 성과금(급여 * 보너스) 조회
-- 단 성과금이 없으면 0 으로 표시
SELECT EMP_NAME, SALARY, NVL(SALARY * BONUS,'0') AS "성과금"
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서 사번, 이름, 전화번호 조회
-- 전화번호가 없으면 없음으로 표기
-- 전화번호가 있으면 010******** 형식으로 변경해서 조회
SELECT EMP_ID, EMP_NAME, NVL2(PHONE,'010********', '없음') AS "전화번호"
FROM EMPLOYEE;














