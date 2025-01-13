create table TBL_PIZZA_01 (
	pcode char(4) primary key,
	pname varchar(30),
	cost number(7)
);

create table TBL_SHOP_01(
	scode char(4) primary key,
	sname varchar(20)
);

create table TBL_SALELIST_01 (
	saleno number(7) primary key,
	scode char(4),
	saledate date,
	pcode char(4),
	amount number(5)
);

-- 통합매출현황조회
select
	C.saleno,
	B.scode || '-' || B.sname as sname,
	TO_CHAR(C.saledate, 'yyyy-mm-dd') saledate,
	A.pcode,
	A.pname,
	C.amount,
	'#' || TO_CHAR(A.cost * C.amount, '999,999,999') count
from
TBL_PIZZA_01 A,
TBL_SHOP_01 B,
TBL_SALELIST_01 C
where
A.pcode = C.pcode
and B.scode = C.scode
order by
C.saleno;

-- 지점별 매출 현황
select
	B.scode,
	B.sname,
	'#' ||	TO_CHAR(SUM(A.cost * C.amount), '999,999,999') as cost
from
	TBL_PIZZA_01 A,
	TBL_SHOP_01 B,
	TBL_SALELIST_01 C
where
	A.pcode = C.pcode
	and B.scode = C.scode
group by
	B.scode, B.sname
order by
	B.scode, B.sname;
	
-- 상품별 매출 현황
SELECT
    A.pcode,
    A.pname,
    '#' || TO_CHAR(SUM(A.cost * C.amount), '999,999,999') AS sales
FROM
    TBL_PIZZA_01 A,
    TBL_SHOP_01 B,
    TBL_SALELIST_01 C
WHERE
    A.pcode = C.pcode
    AND B.scode = C.scode
GROUP BY
    A.pcode, A.pname
ORDER BY
    sales desc;

insert into TBL_PIZZA_01 values ('AA01', '고르골졸라피자', 6000);
insert into TBL_PIZZA_01 values ('AA02', '치즈피자', 6500);
insert into TBL_PIZZA_01 values ('AA03', '페퍼로니피자', 7000);
insert into TBL_PIZZA_01 values ('AA04', '콤비네이션피자', 7500);
insert into TBL_PIZZA_01 values ('AA05', '고구마피자', 6000);
insert into TBL_PIZZA_01 values ('AA06', '포테이토피자', 7000);
insert into TBL_PIZZA_01 values ('AA07', '불고기피자', 8000);
insert into TBL_PIZZA_01 values ('AA08', '나폴리피자', 8000);

insert into TBL_SHOP_01 values ('S001', '강남점');
insert into TBL_SHOP_01 values ('S002', '강서점');
insert into TBL_SHOP_01 values ('S003', '강동점');
insert into TBL_SHOP_01 values ('S004', '영동점');
insert into TBL_SHOP_01 values ('S005', '시청점');
insert into TBL_SHOP_01 values ('S006', '인천점');

insert into TBL_SALELIST_01 values (1000001, 'S001', '20181202', 'AA01', 50);
insert into TBL_SALELIST_01 values (1000002, 'S001', '20181202', 'AA02', 30);
insert into TBL_SALELIST_01 values (1000003, 'S001', '20181202', 'AA03', 20);
insert into TBL_SALELIST_01 values (1000004, 'S001', '20181202', 'AA04', 50);
insert into TBL_SALELIST_01 values (1000005, 'S003', '20181203', 'AA01', 40);
insert into TBL_SALELIST_01 values (1000006, 'S003', '20181203', 'AA02', 60);
insert into TBL_SALELIST_01 values (1000007, 'S003', '20181203', 'AA04', 60);
insert into TBL_SALELIST_01 values (1000008, 'S003', '20181204', 'AA05', 70);
insert into TBL_SALELIST_01 values (1000009, 'S005', '20181202', 'AA01', 80);
insert into TBL_SALELIST_01 values (1000010, 'S005', '20181202', 'AA03', 30);
insert into TBL_SALELIST_01 values (1000011, 'S005', '20181202', 'AA04', 40);
insert into TBL_SALELIST_01 values (1000012, 'S005', '20181202', 'AA05', 50);
insert into TBL_SALELIST_01 values (1000013, 'S004', '20181204', 'AA01', 30);
insert into TBL_SALELIST_01 values (1000014, 'S004', '20181204', 'AA02', 20);
insert into TBL_SALELIST_01 values (1000015, 'S004', '20181204', 'AA06', 50);