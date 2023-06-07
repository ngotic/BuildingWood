
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



-- tblDriver에 추가된 멤버 리스트

insert into tblMember values('OaKoFc263','FkdPjo374','진분래','위축되는늑대840',TO_DATE('1970-12-12', 'YYYY-MM-DD'),'M','ETMgkH823@abcd.com','010-3713-7711',1,'profile.jpg','n',0);
insert into tblMember values('LRfZza812','zdXNQd293','금타마','배부른잠바920',TO_DATE('1972-10-28', 'YYYY-MM-DD'),'M','CEuYVB111@abcd.com','010-0899-9906',1,'profile.jpg','n',0);
insert into tblMember values('DArRBi431','cByZWa384','백관선','창피한염소400',TO_DATE('1972-11-08', 'YYYY-MM-DD'),'M','TnoiAE125@abcd.com','010-3308-3299',1,'profile.jpg','n',0);
insert into tblMember values('sjDUmD983','ZaQMLJ9','양뜸걸','비참한수달406',TO_DATE('1987-03-24', 'YYYY-MM-DD'),'M','RjiCFg303@abcd.com','012-4777-7847',1,'profile.jpg','n',0);
insert into tblMember values('jRSmEw625','fTEUYQ987','모묵병','기분나쁜커피400',TO_DATE('1972-03-27', 'YYYY-MM-DD'),'M','jrHqAm716@abcd.com','011-9241-6457',1,'profile.jpg','n',0);
insert into tblMember values('EmiefP858','NnIwhp868','방들회','기분좋은너구리626',TO_DATE('1973-04-12', 'YYYY-MM-DD'),'M','SbMzte122@abcd.com','012-0891-7524',1,'profile.jpg','n',0);
insert into tblMember values('wCajGS125','SgawCH782','임대늬','수줍은고릴라668',TO_DATE('1967-05-09', 'YYYY-MM-DD'),'F','LwHIPJ272@abcd.com','012-2352-8553',1,'profile.jpg','n',0);
insert into tblMember values('aOQoYL120','djhGHS52','선마들','긴장되는푸들423',TO_DATE('1997-11-11', 'YYYY-MM-DD'),'F','bxezyn960@abcd.com','011-4147-3439',1,'profile.jpg','n',0);
insert into tblMember values('NbovCY487','JeGHXA262','장열린','위험한자식물소977',TO_DATE('2001-03-18', 'YYYY-MM-DD'),'M','ZAVRXp487@abcd.com','012-7268-6458',1,'profile.jpg','n',0);
insert into tblMember values('DsvblN814','JODOgS134','손단인','울적한이병건797',TO_DATE('1995-03-15', 'YYYY-MM-DD'),'F','uhUaef242@abcd.com','012-1404-3992',1,'profile.jpg','n',0);