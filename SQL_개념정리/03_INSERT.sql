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


























