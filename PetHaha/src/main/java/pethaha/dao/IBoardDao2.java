package pethaha.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IBoardDao2 {

	void PboardView(HashMap<String, Object> prm);

	void PgetReplyList(HashMap<String, Object> prm);

}
