package pethaha.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {

	void getMember(HashMap<String, Object> prm);

	void PmemberUpdate(HashMap<String, Object> prm);

}
