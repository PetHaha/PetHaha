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

