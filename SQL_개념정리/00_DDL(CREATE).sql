-- 자동정렬 단축키 CTRL + F7
-- 작성한 시트 모두 실행 f5
/*
올림   CEIL
반올림 ROUND
버림   FLOOR

오름차순 ASC(ASCENDING)
내림차순 DESC(DESCENDING)



자료형

NUMBER : 숫자형(정수, 실수)
        실수 자리 : 소수 자리 몇 번째 까지 가능한지
        NUMBER(2,2) -> (0 ~ 99, 0.99) 즉 0 ~ 99.99 까지 가능

CHAR(크기) : 고정길이 문자형 -> 현재 사용 거의 하지 않음

VARCHAR : 이전버전 사용 많이 하지 않음
VARCHAR2 : 최신버전 제일 많이 사용
           가변길이 문자형
           
    CHAR   VS   VARCHAR2
     고정          가변
     
Ex) CHAR(10BYTE)  VARCHAR2(10BYTE)
    CHAR = 1;  -> 1 하나를 넣는데 10 을 모두 사용
    VARCHAR2 = 1;  -> 1 하나를 넣으면 나머지 99 를 돌려줌
    
VARCHAR2 같은 경우 공간 확보는 하되, 사용하지 않는 크기는 돌려줌

DATE : 날짜 타입
CLOB : 메일, 항소문, 소설 등 VARCHAR2 에서 감당하지 못할 크기의
       글 내용을 삽입할 때 사용
BLOB : 이미지, 동영상과 같은 파일 저장

영어, 숫자, 특수문자 == 1BYTE
이외 문자(한글) == 3BYTE
ㄱ,가,힇 모두 3BYTE
*/

/*
PRIMARY KEY(기본키)
    - 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미
    - NOT NULL + UNIQUE (한 행에서 COLUMN 에서 똑같은 모양의 데이터는 존재해서는 안됨
    
    - 한 테이블 한 개만 설정
    
    - 컬럼 레벨, 테이블 레벨 설정 가능함

*/



































