
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
