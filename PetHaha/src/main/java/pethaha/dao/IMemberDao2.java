package pethaha.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import pethaha.dto.MemberVO;

@Mapper
public interface IMemberDao2 {

	void insertMember(MemberVO mvo);

	void PboardGetAllCount(HashMap<String, Object> prm);

	void PgetBoard(HashMap<String, Object> prm);

}
