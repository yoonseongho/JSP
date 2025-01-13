create table tbl_artist_201905 (
	artist_id char(4) primary key,
	artist_name varchar2(20),
	artist_birth char(8),
	artist_gender char(1),
	talent char(1),
	agency varchar2(30)
);

create table tbl_mento_201905 (
	mento_id char(4) primary key,
	mento_name varchar2(20)
);

create table tbl_point_201905 (
	serial_no number(8) primary key,
	artist_id char(4),
	mento_id char(4),
	point number(3)
);

-- 참가자목록조회
select
	artist_id,
	artist_name,
	substr(artist_birth, 1, 4),
	substr(artist_birth, 5, 2),
	substr(artist_birth, 7, 2),
	artist_gender,
	talent,
	agency
from tbl_artist_201905

-- 멘토점수조회
select
C.serial_no,
A.artist_id,
A.artist_name,
substr(artist_birth, 1, 4),
substr(artist_birth, 5, 2),
substr(artist_birth, 7, 2),
C.point,
case when C.point >= 90 then 'A'
when C.point >= 80 then 'B'
when C.point >= 70 then 'C'
when C.point >= 60 then 'D'
ELSE 'F' end as point,
B.mento_name
from
tbl_artist_201905 A,
tbl_mento_201905 B,
tbl_point_201905 C
where
A.artist_id = C.artist_id
and B.mento_id = C.mento_id;

--참가자 등수 조회
select
A.artist_id,
A.artist_name,
SUM(B.point) as SUM,
TO_CHAR(SUM(B.point) / count(A.artist_id), '999.00') as AVG,
RANK() OVER (ORDER BY SUM(B.point) DESC) rank
from tbl_artist_201905 A, tbl_point_201905 B
where A.artist_id = B.artist_id
group by A.artist_id, A.artist_name

insert into tbl_artist_201905 values ('A001', '김스타', '19970101', 'F', '1', 'A엔터테이먼트');
insert into tbl_artist_201905 values ('A002', '조스타', '19980201', 'M', '2', 'B엔터테이먼트');
insert into tbl_artist_201905 values ('A003', '왕스타', '19900301', 'M', '3', 'C엔터테이먼트');
insert into tbl_artist_201905 values ('A004', '정스타', '20000401', 'M', '1', 'D엔터테이먼트');
insert into tbl_artist_201905 values ('A005', '홍스타', '20010501', 'F', '2', 'E엔터테이먼트');

insert into tbl_mento_201905 values ('J001', '함멘토');
insert into tbl_mento_201905 values ('J002', '박멘토');
insert into tbl_mento_201905 values ('J003', '장멘토');

insert into tbl_point_201905 values (2019001, 'A001', 'J001', 78);
insert into tbl_point_201905 values (2019002, 'A001', 'J002', 76);
insert into tbl_point_201905 values (2019003, 'A001', 'J003', 70);
insert into tbl_point_201905 values (2019004, 'A002', 'J001', 80);
insert into tbl_point_201905 values (2019005, 'A002', 'J002', 72);
insert into tbl_point_201905 values (2019006, 'A002', 'J003', 78);
insert into tbl_point_201905 values (2019007, 'A003', 'J001', 90);
insert into tbl_point_201905 values (2019008, 'A003', 'J002', 92);
insert into tbl_point_201905 values (2019009, 'A003', 'J003', 88);
insert into tbl_point_201905 values (2019010, 'A004', 'J001', 96);
insert into tbl_point_201905 values (2019011, 'A004', 'J002', 90);
insert into tbl_point_201905 values (2019012, 'A004', 'J003', 98);
insert into tbl_point_201905 values (2019013, 'A005', 'J001', 88);
insert into tbl_point_201905 values (2019014, 'A005', 'J002', 86);
insert into tbl_point_201905 values (2019015, 'A005', 'J003', 86);