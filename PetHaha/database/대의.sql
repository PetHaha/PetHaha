
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


 select count(*) as cnt from pboard where  content like '%'||'용'||'%' and thumbs>-1 ;

select count(*) as cnt from pboard where subject like '%%' and thumbs<-1 ;

select count(*) as p_cnt from pboard where subject like '%'||''||'%' and thumbs>-1;

select*from pboard;
