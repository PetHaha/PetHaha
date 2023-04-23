package pethaha.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import pethaha.dto.ReplyVO;
import pethaha.dto.ReportVO;

@Mapper
public interface IBoardDao2 {

	void PboardView(HashMap<String, Object> prm);

	void PgetReplyList(HashMap<String, Object> prm);

	void PReplyWrite(ReplyVO rVO);

	void PReplydelete(String rNUM);

	void readCountPlus(String bnum);

	void PReplyCountUpdate(String bnum);

	void PLikeOX(HashMap<String, Object> prm);

	void PThumbsUp(HashMap<String, Object> prm);

	void PboardReport(ReportVO rvo);

	void PReportOX(HashMap<String, Object> prm);

	void PRThumbsUp(HashMap<String, Object> prm);

	void PReLikeOX(HashMap<String, Object> prm);

}
