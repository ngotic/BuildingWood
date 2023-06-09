

DROP TABLE tblDriver CASCADE CONSTRAINTS;



--테이블 수정함
CREATE TABLE tblDriver (
   driverseq   number      NOT NULL,
   id   varchar2(100)      NOT NULL, 
   carname varchar2(100)   NOT NULL,
   licenseplate varchar2(100) NOT NULL,
   score number default 0 NOT NULL,
   count number default 0 NOT NULL,
   constraint tblDriver_pk1 primary key(driverseq),
   constraint tblDriver_fk1 foreign key(id) references tblMember(id)
);



CREATE TABLE tblCarpoolReview (
   reviewseq number NOT NULL,
   driverseq number NOT NULL,
   id   varchar2(100)  NOT NULL,
   reviewscore number default 5 NOT NULL,
   
   constraint tblCarpoolReview_pk1 primary key(reviewseq),
   constraint tblCarpoolReview_fk1 foreign key(driverseq) references tblDriver(driverseq),
   constraint tblCarpoolReview_fk2 foreign key(id) references tblMember(id)
);


create sequence driverseq;
drop sequence driverseq;


insert into tblCarpool (carpoolseq, boardcategoryseq, driverseq, content, regdate, departtime, departurescity, departures, arrivalscity, arrivals, fee, recruitstatus, recruit) values (carpoolseq.nextval, default, (select driverseq from tblDriver where id = 'OaKoFc263'), 'asdf', default, ', ?, ?, ?, ?, ?, default, ?)

select * from tblDriver;
select * from tblCarpool;
select * from tblMember;



-- tblDriver insert (driverseq, id, carseq, licenseplate, score, count)

insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'OaKoFc263', '52가 3108', 'K5');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'LRfZza812', '48가 4368', '카니발');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'DArRBi431', '39나 2764', 'G80');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'sjDUmD983', '36조 2428', '레이');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'jRSmEw625', '49주 1234', 'K8');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'EmiefP858', '63마 9012', '그랜저');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'wCajGS125', '45조 6789', '스포티지');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'aOQoYL120', '23고 2341', '포터2');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'NbovCY487', '19저 7489', 'K3');
insert into tblDriver (driverseq, id, licenseplate, carname) values (driverseq.nextval, 'DsvblN814', '42거 4401', 'K5');


update tbldriver set score = 4, count = 1 where id = 'LRfZza812';


select tblCarpool.*, (select count from tblDriver where driverseq = tblCarpool.driverseq) as count from tblCarpool;



select (select (select nickname from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as nickname from tblCarpool order by carpoolseq desc;