-- 자동정렬 단축키 CTRL + F7
-- 작성한 시트 모두 실행 f5

-- MENU TABLE 생성
CREATE TABLE menu (
    menu_id    NUMBER(10, 0) PRIMARY KEY, -- 메뉴 ID(기본 키)
    menu_name  VARCHAR2(100 BYTE), -- 메뉴 이름
    menu_desc  VARCHAR2(255 BYTE), -- 메뉴 설명
    menu_price NUMBER(10, 2)
);

-- INSERT DATA 집어넣기
INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    1,
    '아메리카노',
    '신선한 원두로 만든 아메리카노',
    '3000'
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    2,
    '카페라테',
    '부드러운 우유가 들어간 라떼',
    '3500'
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    3,
    '카푸치노',
    '진한 커피와 거품이 어우러진 카푸치노',
    '3500'
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    4,
    '카라멜 마키아토',
    '달콤한 카라멜 시럽이 들어간 마키아토',
    '4000'
);

INSERT INTO menu (
    menu_id,
    menu_name,
    menu_desc,
    menu_price
) VALUES (
    5,
    '에스프레소',
    '강한 맛과 향의 에스프레소',
    '2500'
);

-- menu table 
-- 메뉴 이름 맨 앞에 카가 들어간 메뉴 출력
SELECT * FROM MENU WHERE menu_name LIKE '카%';
-- menu_price 3500 인 메뉴들 출력
SELECT * FROM MENU WHERE MENU_PRICE = 3500;
-- 키오스크에서 1 을 눌렀을 때 나올 메뉴 출력
SELECT * FROM MENU WHERE MENU_ID = 1;
-- 특정 단어가 포함된 메뉴 설명 조회 (카라멜)
SELECT menu_name,menu_desc, menu_price FROM MENU WHERE MENU_DESC LIKE '%카라멜%';
-- 가격이 낮은 순으로 메뉴 조회
SELECT menu_name,menu_desc, menu_price FROM MENU ORDER BY MENU_PRICE ASC;































