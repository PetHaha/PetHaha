create or replace procedure PgetMember(p_id IN pmember.id%type, p_curvar OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_curvar For 
    select * from pmember where id=p_id;
END;

create or replace procedure PmemberUpdate(
    p_id in varchar2,
    p_pwd in varchar2,
    p_nick in varchar2,
    p_phone in varchar2,
    p_name in varchar2,
    p_intro in varchar2,
    p_memimg in varchar2,
    p_curvar out sys_refcursor
)
is
begin
    update pmember set pwd=p_pwd,nick=p_nick,phone=p_phone,name=p_name,intro=p_intro,memimg=p_memimg where id=p_id;
    commit;
     OPEN p_curvar For select * from pmember where id=p_id;
end;

create or replace procedure PmyBoardCount(p_nick IN pmember.nick%type, p_cnt out number)
IS
BEGIN
        select count(*) into p_cnt from pboard where nick=p_nick;
  
END;

create or replace procedure pmyBoard(
    p_nick IN pmember.nick%type,
    p_startNum in number,
    p_endNum in number,
    p_rc out sys_refcursor
)
is
begin
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pboard where nick=p_nick order by bnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;
  

end;


create or replace procedure PmessageCount(p_nick IN pmessage.nick%type, p_cnt out number)
IS
BEGIN
        select count(*) into p_cnt from pmessage where nick=p_nick;

END;

create or replace procedure pmsgSend(
    p_nick IN pmessage.nick%type,
    p_startNum in number,
    p_endNum in number,
    p_rc out sys_refcursor
)
is
begin
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pmessage where nick=p_nick order by msnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;

end;

create or replace procedure PmessageCount2(p_nick IN pmessage.nick%type, p_cnt out number)
IS
BEGIN
        select count(*) into p_cnt from pmessage where tonick=p_nick;

END;


create or replace procedure pmsgReceive(
    p_nick IN pmessage.nick%type,
    p_startNum in number,
    p_endNum in number,
    p_rc out sys_refcursor
)
is
begin
            open p_rc for
            select * from (select * from (select rownum as rn, b.* from ((select * from pmessage where tonick=p_nick order by msnum desc) b)) where rn>=p_startNum) where rn<=p_endNum;

end;

create or replace procedure msgDetail(p_msnum IN pmessage.msnum%type, p_curvar OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_curvar For 
    select * from pmessage where msnum=p_msnum;
END;

create or replace procedure msgWrite(

p_tonick IN pmessage.tonick%type,
p_mtitle IN pmessage.mtitle%type,
p_mcontent IN pmessage.mcontent%type,
p_nick IN pmessage.nick%type,
p_id IN pmessage.id%type
)
IS
BEGIN
    insert into pmessage(msnum,tonick,mtitle,mcontent,nick,id) values(pmessage_seq.nextval,p_tonick,p_mtitle,p_mcontent,p_nick,p_id);
    commit;
END;


