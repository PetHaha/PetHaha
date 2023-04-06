insert into PMember(id, pwd, nick, phone, name, intro)
values('yijin','1234','이진이진','010-1234-5678','채이진', '강아지 조아용');
insert into PMember(id, pwd, nick, phone, name, intro)
values('daeui','1234','대의대의','010-5678-1234','김대의', '고양이 조아용');


insert into PBanner(bnseq,bnborder,bnimage,bnname)
values(pbanner_seq.nextVal, 1, 'pet1.jpg', 'pet1');

insert into PBanner(bnseq,bnborder,bnimage,bnname)
values(pbanner_seq.nextVal, 2, 'pet2.jpg', 'pet2');

insert into pmessage(msnum,tonick,id,nick,mcontent,answer,mcheck)
values(pmember_seq.nextVal,'대의대의','yijin','이진이진','안녕하세요 반갑습니다','네 반가워요','0');

insert into pmessage(msnum,tonick,id,nick,mcontent,answer,mcheck)
values(pmessage_seq.nextVal,'대의대의','yijin','이진이진','안녕하세요 반갑습니다','네 반가워요','0');

insert into pmessage(msnum,tonick,id,nick,mcontent,answer,mcheck)
values(pmessage_seq.nextVal,'이진이진','daeui','대의대의','안녕하세요 반갑습니다','누구시죠?','1');