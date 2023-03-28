create or replace procedure getMember(p_id IN pmember.id%type, p_curvar OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN p_curvar For 
    select * from pmember where id=p_id;
END;