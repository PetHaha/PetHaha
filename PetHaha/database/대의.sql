
CREATE OR REPLACE PROCEDURE insertMember(
    p_id IN pmember.id%TYPE,
    p_pwd IN pmember.pwd%TYPE,
    p_name IN pmember.name%TYPE,
    p_phone IN pmember.phone%TYPE,
    p_nick IN pmember.nick%TYPE, 
    p_intro IN pmember.intro%TYPE
)
IS
BEGIN
    INSERT INTO pmember( id, pwd, name, phone,  nick, intro)
    VALUES( p_id, p_pwd, p_name, p_phone, p_nick,p_intro );
    COMMIT;
END;

create or replace procedure PboardGetAllCount(p_category in number, p_key in varchar2,p_sc in varchar2, p_cnt out number)
IS
BEGIN
if p_category= '0' then
    if p_sc='3' then
        select count(*) into p_cnt from pboard where nick like '%'|| p_key ||'%' and thumbs>-1;
    elsif p_sc='2' then
        select count(*) into p_cnt from pboard where content like '%'|| p_key ||'%' and thumbs>-1;
    else
        select count(*) into p_cnt from pboard where subject like '%'|| p_key ||'%' and thumbs>-1;
       
    end if;
else
    if p_sc='3' then
        select count(*) into p_cnt from pboard where nick like '%'|| p_key ||'%' and category=p_category ;
    elsif p_sc='2' then
        select count(*) into p_cnt from pboard where content like '%'|| p_key ||'%'and category=p_category ;
    else
        select count(*) into p_cnt from pboard where subject like '%'|| p_key ||'%' and category=p_category ;
        
    end if;
end if;
END;


create or replace procedure pgetboard(
    p_category in number,
    p_sc in varchar2,
    p_key in varchar2,
    p_startNum in number,
    p_endNum in number,
    p_rc out sys_refcursor
)
is
begin
    if p_category='0' then
        if p_sc='3' then
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pboard where nick like '%'|| p_key ||'%' and thumbs>-1 order by bnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;
        elsif p_sc='2' then
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pboard where content like '%'|| p_key ||'%' and thumbs>-1 order by bnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;
        else
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pboard where subject like '%'|| p_key ||'%' and thumbs>-1 order by bnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;
        end if;       
    else
        if p_sc='3' then
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pboard where nick like '%'|| p_key ||'%' and category=p_category  order by bnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;
        elsif p_sc='2' then
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pboard where content like '%'|| p_key ||'%' and category=p_category  order by bnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;
        else
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pboard where subject like '%'|| p_key ||'%' and category=p_category  order by bnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;        
        end if;  
    end if;
end;



create or replace procedure PboardView(p_bnum IN pboard.bnum%type, p_curvar OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_curvar For 
    select * from pboard where bnum=p_bnum;
END;

create or replace procedure PgetReplyList(p_bnum IN pboard.bnum%type, p_curvar OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_curvar For 
    select * from replyview where bnum=p_bnum order by rnum;
END;


create or replace view replyview
as
select
    a.rnum, a.rthumbs, a.rreport,a.bnum,a.rwriter,a.rcontent,a.id,a.nick,a.indate,
    b.intro,b.memimg
from preply a, pmember b
where a.id=b.id ;

create or replace procedure PReplyWrite(p_rwriter in varchar2 , p_bnum in number, p_id in varchar2, p_nick in varchar2, p_rcontent in varchar2)
IS
BEGIN
    insert into preply(rnum,rwriter,bnum,id,nick,rcontent) 
    values(preply_seq.nextval,p_rwriter,p_bnum,p_id,p_nick,p_rcontent);
    update pboard set replycnt=replycnt+1 where bnum=p_bnum;
    commit;
END;

create or replace procedure PLikeOX(p_id in varchar2,p_bnum in number, p_curvar OUT SYS_REFCURSOR)
is
begin
    open p_curvar For
    select*from pblike where id=p_id and bnum=p_bnum;
end;

create or replace procedure PreportOX(p_id in varchar2,p_bnum in number, p_curvar OUT SYS_REFCURSOR)
is
begin
    open p_curvar For
    select*from pbreport where id=p_id and bnum=p_bnum;
end;


create or replace procedure PThumbsUp(p_id in varchar2,p_bnum in number, p_nick in varchar2)
is
begin
    insert into pblike (lnum,bnum,id,nick)
    values(pblike_seq.nextval,p_bnum,p_id,p_nick);
    update pboard set thumbs=thumbs+1 where bnum=p_bnum;
    commit;
end;


create or replace procedure Pboardreport(p_rcategory in number , p_bnum in number, p_id in varchar2, p_nick in varchar2, p_rcontent in varchar2)
IS
BEGIN
    insert into pbreport(reportnum,rcategory,bnum,id,nick,rcontent) 
    values(pbreport_seq.nextval,p_rcategory,p_bnum,p_id,p_nick,p_rcontent);
    commit;
END;


create or replace procedure PRThumbsUp(p_id in varchar2,p_rnum in number, p_nick in varchar2)
is
begin
    insert into prelike (lnum,rnum,id,nick)
    values(prelike_seq.nextval,p_rnum,p_id,p_nick);
    update preply set rthumbs=rthumbs+1 where rnum=p_rnum;
    commit;
end;


create or replace procedure PreLikeOX(p_id in varchar2,p_rnum in number, p_curvar OUT SYS_REFCURSOR)
is
begin
    open p_curvar For
    select*from prelike where id=p_id and rnum=p_rnum;
end;


create or replace procedure Preplyreport(p_rcategory in number , p_rnum in number, p_id in varchar2, p_nick in varchar2, p_rcontent in varchar2)
IS
BEGIN
    insert into prereport(reportnum,rcategory,rnum,id,nick,rcontent) 
    values(prereport_seq.nextval,p_rcategory,p_rnum,p_id,p_nick,p_rcontent);
    commit;
END;


create or replace procedure PreplyReportOX(p_rnum in number,p_id in varchar2, p_curvar OUT SYS_REFCURSOR)
is
begin
    open p_curvar For
    select*from prereport where id=p_id and rnum=p_rnum;
end;


create or replace procedure PboardWrite(p_category in number, p_subject in varchar2, p_content in varchar2 , p_id in varchar2, p_nick in varchar2, p_bimg1 in varchar2)
IS
BEGIN
    insert into pboard(bnum,category,subject,content,id,nick,bimg1) 
    values(pboard_seq.nextval,p_category,p_subject,p_content,p_id,p_nick,p_bimg1);
    commit;
END;