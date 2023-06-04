select * from tblmember;
select tblsnsboard.*, (select nickname from tblMember where tblMember.id=tblSnsBoard.id) as nickname from tblSnsBoard;
select tblsnsboard.*, tblMember.nickname as nickname ,tblMember.profile as profile from tblSnsBoard inner join tblMember where tblSnsBoard.id = tblMember.id;
select tblsnsboard.content as content,tblsnsboard.regdate as regdate,tblsnsboard.editdate as editdate, tblMember.nickname as nickname ,tblMember.profile as profile from tblSnsBoard inner join tblMember where tblSnsBoard.id = tblMember.id;
select m.profile,m.nickname,b.content,b.regdate,b.editdate from tblSnsBoard b inner join tblMember m on b.id = m.id;


