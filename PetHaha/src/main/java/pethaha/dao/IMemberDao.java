package pethaha.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {

	void PgetMember(HashMap<String, Object> prm);

	void PmemberUpdate(HashMap<String, Object> prm);

	void PmyBoardCount(HashMap<String, Object> prm);

	void PmyBoard(HashMap<String, Object> prm);

	void PmessageCount(HashMap<String, Object> prm);

	void PmsgSend(HashMap<String, Object> prm);

	void PmessageCount2(HashMap<String, Object> prm);

	void PmsgReceive(HashMap<String, Object> prm);

	void msgDetail(HashMap<String, Object> prm);

	void msgWrite(HashMap<String, Object> prm);

	void msgDelete(HashMap<String, Object> prm);

	void nickok(HashMap<String, Object> prm);


}
