CREATE TABLE tblCarpoolApply (
   carpoolapplyseq   number   NOT NULL,
   carpoolseq   number   NOT NULL,
   id   varchar2(100)  NOT NULL,
   applystatus varchar2(20)  NULL,     -- 신청 중, 신청 완료(승인)
   
   constraint tblCarpoolApply_pk1 primary key(carpoolapplyseq),
   constraint tblCarpoolApply_fk1 foreign key(carpoolseq) references tblCarpool(carpoolseq),
   constraint tblCarpoolApply_fk2 foreign key(id) references tblMember(id)
);

drop table tblCarpoolApply;

create sequence carpoolapplyseq;
drop sequence carpoolapplyseq;

select * from tblCarpoolApply;

insert into tblCarpoolApply (carpoolapplyseq, carpoolseq, id, applystatus) values (carpoolapplyseq.nextval, 11, 'DArRBi431', '신청 중');