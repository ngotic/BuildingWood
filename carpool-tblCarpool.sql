
-- 게시판seq 몇번인지 모르겠어서 1번으로함
insert into tblBoardCategory values (1, '카풀게시판');
select * from tblBoardCategory;


create sequence carpoolseq;
create sequence boardcategoryseq;

drop sequence carpoolseq;
drop sequence boardcategoryseq;


DROP TABLE tblCarpool CASCADE CONSTRAINTS;


select
    carpoolseq as "번호",
    d.id as "운전자 ID",
    content as "내용",
    to_char(regdate, 'YYYY-MM-DD HH24:MI:SS') as "작성",
    to_char(departtime, 'YYYY-MM-DD HH24:MI:SS') as "예정",
    departures as "출발지",
    arrivals as "도착지",
    fee as "비용",
    status as "상태",
    recruit as "인원"
from tblCarpool c
join tblDriver d on c.driverseq = d.driverseq;

-- tblCarpool 수정
CREATE TABLE tblCarpool (
   carpoolseq   number      NOT NULL,
   boardcategoryseq   number  DEFAULT 1   NOT NULL, 
   driverseq   number      NOT NULL,
   content   varchar2(500)      NOT NULL,
   regdate   date   DEFAULT sysdate   NOT NULL,
   departtime   date      NOT NULL,
   departurescity varchar2(10)  NOT NULL,
   departures   varchar2(100)      NOT NULL,
   arrivalscity varchar2(10)  NOT NULL,
   arrivals   varchar2(100)      NOT NULL,
   fee   number   DEFAULT 0   NOT NULL,
   status   varchar2(20)  DEFAULT '모집 중'   NOT NULL,    -- 모집 중 OR 모집 완료(종료)
   recruit   number      NOT NULL,
   constraint tblCarpool_pk1 primary key(carpoolseq),
   constraint tblCarpool_fk1 foreign key(boardcategoryseq) references tblBoardCategory(boardcategoryseq),
   constraint tblCarpool_fk2 foreign key(driverseq) references tblDriver(driverseq)  
);




insert into tblCarpool values (carpoolseq.nextval, default, 1, '내용1', default, to_date('2023-06-10 16:33:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지1', '서울', '집', 4000, default, 4);
insert into tblCarpool values (carpoolseq.nextval, default, 2, '내용2', default, to_date('2023-06-24 16:33:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지2', '경기', '집', 7000, default, 2);
insert into tblCarpool values (carpoolseq.nextval, default, 3, '내용3', default, to_date('2023-06-05 16:33:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지3', '서울', '집', 5500, default, 3);
insert into tblCarpool values (carpoolseq.nextval, default, 4, '내용4', default, to_date('2023-06-03 16:33:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지4', '대구', '집', 3500, default, 2);
insert into tblCarpool values (carpoolseq.nextval, default, 5, '내용5', default, to_date('2023-06-07 16:33:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지5', '광주', '집', 6000, default, 2);
insert into tblCarpool values (carpoolseq.nextval, default, 6, '내용6', default, to_date('2023-06-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), '경기', '출발지6', '서울', '집', 4500, default, 3);
insert into tblCarpool values (carpoolseq.nextval, default, 7, '내용7', default, to_date('2023-06-14 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), '경기', '출발지7', '서울', '집', 3500, default, 2);
insert into tblCarpool values (carpoolseq.nextval, default, 8, '내용8', default, to_date('2023-06-06 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지8', '서울', '집', 10000, default, 2);
insert into tblCarpool values (carpoolseq.nextval, default, 9, '내용9', default, to_date('2023-06-06 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지9', '충북', '집', 8500, default, 4);
insert into tblCarpool values (carpoolseq.nextval, default, 10, '내용10', default, to_date('2023-06-14 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), '서울', '출발지10', '대전', '집', 7000, default, 2);
insert into tblCarpool values (carpoolseq.nextval, default, 1, '내용11', default, to_date('12:30:00', 'HH24:MI:SS'), '서울', '테스트', '서울', '테스트', 7000, default, 1);



commit;




select * from tblCarpool order by carpoolseq desc;

select (select to_char(departtime, 'Dy') as day from tblCarpool;


select  tblCarpool.*, 
        (select score from tblDriver where driverseq = tblCarpool.driverseq) as score,
		(select count from tblDriver where driverseq = tblCarpool.driverseq) as count,
		(select id from tblDriver where driverseq = tblCarpool.driverseq) as id,
		(select (select gender from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as gender,
		(select (select nickname from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as nickname
from tblCarpool order by carpoolseq desc;


select to_char(departtime, 'Dy') as day from tblCarpool;

select to_char(departtime, 'MM/DD(DY) HH24:MI') as departtime from tblCarpool;