/*
DDL (DATA DEFINITION LANGUAGE) : 데이터 정의 언어

OBJECT  CREATE   ALTER   DROP 
객체      만들고    수정하고  삭제하는    언어

오라클에서 객체 : TABLE, VIEW, SEQUENCE, INDEX, PACKAGE, 
               TRIGGER, PROCEDURE, FUNCTION, SYNONYM(동의어), USER

-----------------------------------------------------------------------------------

CREATE
- 테이블이나 인덱스, 뷰 등 다양한 데이터 베이스 객체를 생성하는 구문
-- 테이블로 생성된 객체는 DROP 구문을 통해 제거할 수 있음

1. 테이블 생성하기
    - 테이블이란 ? 
    -- 행(ROW) 과 열(COLUMN) 으로 구성되는 가장 기본적인 데이터베이스 객체
    --- 데이터베이스 내에서 모든 데이터는 테이블을 통해 저장
    
    --- [표현식]
CREATE TABLE 테이블명(
            컬럼명 자료형(크기),
            컬럼명 자료형(크기),
            ...);
            
            
---- [자료형]
    NUMBER : 숫자형 (정수, 실수)
    CHAR(크기) : 고정길이 문자형 (2000BYTE 까지 가능)
    VARCHAR2(크기) : 가변길이 문자형 (4000BYTE 까지 가능) - VARCHAR1 의 업그레이드 버전
    
    ABC 문자열을 CAHR VARCHAR2 에 저장하면 어떻게 되는가?
    CHAR(10) 컬럼 : CHAR 는 10 을 모두 소진(사용)
    VARCHAR2(10) 컬럼 : VARCHAR2 3 만큼만 소진 나머지 7 은 반환 (ABC 라서 3)
    
    DATE : 날짜 타입
    BLOB : 대용량 사진 / 동영상 / 파일 데이터 저장 (4GB)
    CLOB : 대용량 문자 데이터 (4GB)
    
UTF-8
    영어 숫자 특수문자 == 1BYTE
    나머지 == 3BYTE

*/

-- USER_MEMBER 테이블 생성
--- 필요한 컬럼 : 아이디 비밀번호 이름 주민번호 가입일
-- 아이디 USER_ID / 자료형 VARCHAR2(20)
-- 비밀번호 USER_PW / 자료형 VARCHAR2(20)
-- 이름 USER_NAME / 자료형 VARCHAR2(15) -- 한글 5 자 까지 OK
-- 주민번호 USER_SSN / 자료형 CHAR(14) -- 14 글자 고정
-- 가입일 ENROLL_DATE / 자료형 DATE  -- DEFAULT SYSDATE 를 넣어 현재시간을 기본값으로 고정

CREATE TABLE "USER_MEMBER" (USER_ID VARCHAR2(20), USER_PW VARCHAR2(20), USER_NAME VARCHAR2(15), USER_SSN CHAR(14),ENROLL_DATE DATE DEFAULT SYSDATE);
-- DEFAULT (= 기본값) 컬럼의 기본값 지정 (필수 아님)
--> DEFAULT 기본값을 지정하고 INSERT 나 UPDATE 문을 작성해줄 때
---> 지정한 기본값이 들어감

-- 테이블 잘 만들어졌는지 확인
SELECT * FROM USER_MEMBER;

-- 2. 컬럼에 주석으로 컬럼에 대한 설명 추가
-- [표현식]
-- COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용'; -> 주석 내용은 ' ' 만 사용 가능

COMMENT ON COLUMN "USER_MEMBER".USER_ID IS '회원아이디';






































