package pethaha.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {

	void PgetMember(HashMap<String, Object> prm);

	void PmemberUpdate(HashMap<String, Object> prm);

	void PmyBoardCount(HashMap<String, Object> prm);

	void PmyBoard(HashMap<String, Object> prm);

}
