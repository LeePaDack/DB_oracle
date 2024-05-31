/*******
DML : 데이터 조작 언어
테이블에 값을 삽입하거나 수정하거나 삭제하는 구문

INSERT : 삽입

UPDATE : 수정

DELETE : 삭제

한 후에 반드시 COMMIT ROLLBACK 진행할 것

COMMIT ROLLBACK - 팀원이나 다른 사람과 상의 후 진행
개발 연습이기 때문에 단독으로 진행해도 좋음

********/


CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE2;

CREATE TABLE DEPARTMENT2 AS SELECT * FROM DEPARTMENT;
SELECT * FROM department2;


----------------------------------
-- 1. INSERT    

-- 테이블에 새로운 행을 추가하는 구문

-- 1) INSERT INTO 테이블명 VALUES(데이터, 데이터, ...);
-- 테이블에 모든 컬럼에 대한 값을 INSERT 할 때 사용
-- INSERT 하고자 하는 컬럼이 모든 컬럼인 경우 컬럼명 생략 가능
-- 단, 컬럼의 순서를 지켜서 VALUES 값에 값을 기입해야함

-- 모두 INSERT 해줄 것이기 때문에 컬럼명 생략

INSERT INTO EMPLOYEE2 VALUES(800, '동그라미', '870814-213456', 'KIM@KH.KR', '01076996190', 'D1','J3','SS',4300000, 0.2, 200, SYSDATE, NULL, 'N');
COMMIT;

SELECT * FROM EMPLOYEE2 WHERE EMP_ID = 800;

-- 동그라미를 신규부서에
INSERT INTO DEPARTMENT2 VALUES ('D0', '개발운영부', 'L1');
ROLLBACK; -- 저장 X, 돌아가기


-- INSERT 에서 특정 부분을 선택해서 넣을 때는 컬럼명을 작성해서 넣어줌
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) VALUES (컬럼명1 에 해당하는 값, 컬럼명2에 해당하는값, ...);

-----------------------------------
-- 2. UPDATE 

-- 테이블에 기록된 럼의 값을 수정하는 구문
-- 업데이트를 사용하는 예제 : 회원정보 수정 (핸드폰번호, 주소, 아이디, 비번변경)
-- , 사업자-상품수정 (수량, 이름, 재고)
--


-- [작성법]
-- UPDATE 테이블명 SET 컬럼명 = 변경할값
-- [WHERE 컬럼명 비교연산자 비교값]; -- 필수 X

-- DEPARTMENT2 테이블에서 DEPT_ID 가 'D9' 인 부서 정보 조회
SELECT * FROM DEPARTMENT2 WHERE dept_id = 'D9';

-- DARTMENT 테이블에서 DEPT_ID 가 D9 인 부서를
-- 전략기획팀으로 수정
UPDATE DEPARTMENT2 SET DEPT_TITLE = '전략기획팀' WHERE DEPT_ID = 'D9';

-- UPDATE 확인
SELECT * FROM DEPARTMENT2 WHERE DEPT_ID = 'D9';

-- 저장을 원한다면 COMMIT 작성
-- 되돌리기를 원한다면 ROLLBACK;
ROLLBACK;

-- 조건을 설정하지 않고 모든 행의 컬럼 값을 변경
-- UPDATE 테이블명 SET 변경할 컬럼명 = 변경할내용작성;

-- 여러 컬럼을 한번에 수정할 경우 콤마(,) 로 컬럼을 구분해서 수정

-- D2 / 회계관리부 D0 / 회계관리팀 으로 변경
UPDATE DEPARTMENT2 
SET 
    DEPT_ID = 'D0',
    DEPT_TITLE = '회계관리팀'
WHERE DEPT_ID = 'D2';

SELECT * FROM DEPARTMENT2;

/**************
삭제하기
테이블안에 존재하는 값들을 삭제하는 구문

[작성법]
DELETE FROM 테이블명 WHERE 조건설정;
만약 WHERE 조건을 설정하지 않으면 모든 행이 다 삭제됨

DELETE FROM 테이블명
-> 테이블 안에 있는 내용을 모두 삭제

DELETE FROM 테이블명
WHERE 컬럼명 = 삭제할 컬럼값;
--> 테이블 안에서 특정한 컬럼값에 해당하는 줄을 모두 삭제

-- 완전 삭제 --> COMMIT

-- 되돌리기 --> ROLLBACK

주의할점 : 
DELETE 는 테이블 안에 있는 내용을 삭제하는 것
DROP 은 테이블 자체를 삭제

DROP TABLE 테이블명;

**************/


CREATE TABLE EMPLOYEE2 AS SELECT * FROM EMPLOYEE;
CREATE TABLE DEPARTMENT2 AS SELECT * FROM DEPARTMENT;

INSERT INTO EMPLOYEE2 VALUES (223,'김영수','850101-1234567', 'kim_ys@or.kr','01012345678','D1', 'J4', 'S2',3500000, 0.1,'200', '15/06/20',NULL,'N');

INSERT INTO DEPARTMENT2 VALUES ('D10','연구개발부','L6');

INSERT INTO EMPLOYEE2 VALUES( '224','이수진','900101-2345678', 'lee_sj@or.kr','01098765432','D2', 'J2', 'S3',3000000, 0.15,'201','16/07/01', NULL, 'N');

INSERT INTO DEPARTMENT2 VALUES ('D11', '품질관리부', 'L7');

INSERT INTO EMPLOYEE2 VALUES( '225', '박민수', '750303-3456789', 'park_ms@or.kr', '01123456789', 'D3', 'J5', 'S1', 2800000,  0.05,  '202',   '17/08/15',  NULL, 'N');

INSERT INTO DEPARTMENT2 VALUES('D12','재무부', 'L8');

INSERT INTO EMPLOYEE2 VALUES( '226',  '최은지','860404-4567890', 'choi_ej@or.kr', '01056789012', 'D4',  'J3', 'S4', 4200000, 0.2, '203', '18/09/25', NULL,'N');

INSERT INTO DEPARTMENT2 VALUES('D13',  '홍보부', 'L9');

INSERT INTO EMPLOYEE2 VALUES( '227','장영호', '950505-5678901',  'jang_yh@or.kr', '01067890123', 'D5', 'J1',  'S5',  5000000,  0.25,  '204',  '19/10/30',NULL,'N' );

INSERT INTO DEPARTMENT2 VALUES( 'D14', '전략기획부','L10');

INSERT INTO EMPLOYEE2 VALUES( '228','윤지혜', '760606-6789012',  'yoon_jh@or.kr',  '01734567890', 'D6','J2','S2', 3200000, 0.1,'205',  '20/11/05', NULL,'N');

INSERT INTO DEPARTMENT2 VALUES('D15','법무부', 'L11');

INSERT INTO EMPLOYEE2 VALUES('229', '김도현','830707-7890123',  'kim_dh@or.kr', '01078901234',  'D7', 'J4', 'S3',3600000, 0.15,'206','21/12/10',NULL,'N');

INSERT INTO DEPARTMENT2 VALUES( 'D16',  '고객지원부', 'L12');


------14 ㄲㅈ ㅎ---


UPDATE EMPLOYEE2 SET EMAIL = 'sun_di_updated@or.kr', PHONE = '01012345678' WHERE EMP_ID = 200;

UPDATE EMPLOYEE2 SET SALARY = SALARY * 1.1, BONUS = BONUS + 0.05 WHERE DEPT_CODE = 'D1';

UPDATE EMPLOYEE2 SET JOB_CODE = 'J5', DEPT_CODE = 'D3' WHERE JOB_CODE = 'J2';

UPDATE EMPLOYEE2 SET SALARY = SALARY * 1.05, BONUS = BONUS + 0.02 WHERE HIRE_DATE > TO_DATE('2001-01-01','YYYY-MM-DD'); -- ?? 

-- 4 ㄲㅈ ㅎ




























