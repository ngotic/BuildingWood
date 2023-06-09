CREATE TABLE tblCarpoolApply (
   carpoolapplyseq   number   NOT NULL,
   carpoolseq   number   NOT NULL,
   id   varchar2(100)  NOT NULL,
   applystatus varchar2(20)  DEFAULT '신청 중' NOT NULL,     -- 신청 중, 신청 완료(승인) / 탑승 완료(이 상태가 되면 후기 남기기 가능)
   
   constraint tblCarpoolApply_pk1 primary key(carpoolapplyseq),
   constraint tblCarpoolApply_fk1 foreign key(carpoolseq) references tblCarpool(carpoolseq),
   constraint tblCarpoolApply_fk2 foreign key(id) references tblMember(id)
);

DROP TABLE tblCarpoolApply CASCADE CONSTRAINTS;

create sequence carpoolapplyseq;
drop sequence carpoolapplyseq;

select * from tblCarpoolApply;

insert into tblCarpoolApply (carpoolapplyseq, carpoolseq, id, applystatus) values (carpoolapplyseq.nextval, 11, 'DArRBi431', default);



select * from tblCarpoolApply where applystatus = '신청 중';

select (select (select * from tblCarpoolApply where applystatus = '신청 중') from tblCarpool where carpoolseq = tblCarpoolApply.carpoolseq) as applyrecruit from tblCarpool;
select (select (select nickname from tblMember where id = tblDriver.id) from tblDriver where driverseq = tblCarpool.driverseq) as nickname from tblCarpool;


select * from tblCarpoolApply where applystatus = '신청 중' and carpoolseq = tblCarpool.carpoolseq;

