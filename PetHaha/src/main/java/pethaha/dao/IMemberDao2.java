package pethaha.dao;

import org.apache.ibatis.annotations.Mapper;

import pethaha.dto.MemberVO;

@Mapper
public interface IMemberDao2 {

	void insertMember(MemberVO mvo);

}
