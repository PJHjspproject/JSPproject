/* 차령번호가 저아되는 carlist 테이블 

	차번호
    차이름
    차제조사
    차가격
    차인승(int)
    차정보
    차이미지명(파일명)
	차종류(대,중,소)

*/
/*테이블 생성*/
create table carlist(
	carno int not null primary key,
    carname varchar(50) not null,
    carcompany varchar(50) not null,
    carprice int not null,
    carusepeople int not null,
    carinfo varchar(500) not null,
    carimg varchar(50) not null,
    carcategory varchar(10) not null
    );
/*정보 insert*/    
insert into carlist values(1,'아반떼','현대',80000,4,'이 차량은 소형차량으로 인기차량입니다.','avante.jpg','Small');
INSERT INTO carlist VALUES(2, '카렌스', '현대', 90000, 4, '이차량은 소형차량으로 잘나갑니다.', 'carens.jpg', 'Small' );
INSERT INTO carlist VALUES(3, '카니발', '기아', 100000, 9, '이차량은 소형차량으로 잘나갑니다.', 'canival.jpg', 'Small' );
INSERT INTO carlist VALUES(4, '코란도', '쌍용', 110000, 4, '이차량은 소형차량으로 잘나갑니다.', 'co.jpg', 'Small' );
INSERT INTO carlist VALUES(101, '에쿠스', '현대', 120000, 5, '이차량은 중형차량으로 잘나갑니다.', 'equus.jpg', 'Mid' );
INSERT INTO carlist VALUES(102, '그렌져', '현대', 130000, 5, '이차량은 중형차량으로 잘나갑니다.', 'grandeur.jpg', 'Mid' );
INSERT INTO carlist VALUES(103, 'k3', '기아', 140000, 4, '이차량은 중형차량으로 잘나갑니다.', 'k3.jpg', 'Mid' );
INSERT INTO carlist VALUES(104, 'k5', '기아', 150000, 4, '이차량은 중형차량으로 잘나갑니다.', 'k5.jpg', 'Mid' );
INSERT INTO carlist VALUES(201, 'k7', '기아', 160000, 4, '이차량은 대형차량으로 잘나갑니다.', 'k7.jpg', 'Big' );
INSERT INTO carlist VALUES(202, 'k9', '기아', 170000, 4, '이차량은 대형차량으로 잘나갑니다.', 'k9.jpg', 'Big' );
INSERT INTO carlist VALUES(203, '말리부', 'GM', 180000, 4, '이차량은 대형차량으로 잘나갑니다.', 'malibu.jpg', 'Big' );
INSERT INTO carlist VALUES(204, 'bmw528i', 'bmw', 190000, 5, '이차량은 대형차량으로 잘나갑니다.', 'bmw.jpg', 'Big' );   
    
 