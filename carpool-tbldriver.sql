

DROP TABLE tblDriver CASCADE CONSTRAINTS;
DROP TABLE tblCarpoolApply CASCADE CONSTRAINTS;


--테이블 수정함
CREATE TABLE tblDriver (
   driverseq   number      NOT NULL,
   id   varchar2(100)      NOT NULL,            
   licenseplate varchar2(100) NOT NULL,
   score number default 0 NOT NULL,
   count number default 0 NOT NULL,
   constraint tblDriver_pk1 primary key(driverseq),
   constraint tblDriver_fk1 foreign key(id) references tblMember(id)
);

CREATE TABLE tblCarpoolApply (
   carpoolapplyseq   number   NOT NULL,
   carpoolseq   number   NOT NULL,
   id   varchar2(100)  NOT NULL,
   constraint tblCarpoolApply_pk1 primary key(carpoolapplyseq),
   constraint tblCarpoolApply_fk1 foreign key(carpoolseq) references tblCarpool(carpoolseq),
   constraint tblCarpoolApply_fk2 foreign key(id) references tblMember(id)
);


create sequence driverseq;
drop sequence driverseq;


select * from tblDriver;
select * from tblCarpool;
select * from tblMember;



-- tblDriver insert (driverseq, id, carseq, licenseplate, score, count)

insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'OaKoFc263', '52가 3108');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'LRfZza812', '48가 4368');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'DArRBi431', '39나 2764');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'sjDUmD983', '36조 2428');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'jRSmEw625', '49주 1234');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'EmiefP858', '63마 9012');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'wCajGS125', '45조 6789');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'aOQoYL120', '23고 2341');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'NbovCY487', '19저 7489');
insert into tblDriver (driverseq, id, licenseplate) values (driverseq.nextval, 'DsvblN814', '42거 4401');


update tbldriver set score = 4, count = 1 where id = 'LRfZza812';


select tblCarpool.*, (select count from tblDriver where driverseq = tblCarpool.driverseq) as count from tblCarpool;