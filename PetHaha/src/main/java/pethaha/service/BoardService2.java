package pethaha.service;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IBoardDao2;
import pethaha.dto.ReplyVO;
import pethaha.dto.ReportVO;

@Service
public class BoardService2 {
	
	@Autowired
	IBoardDao2 bdao;

	public void PboardView(HashMap<String, Object> prm) {
		bdao.PboardView(prm);
		
	}

	public void PgetReplyList(HashMap<String, Object> prm) {
		bdao.PgetReplyList(prm);
		
	}

	public void PReplyWrite(ReplyVO rVO) {
		bdao.PReplyWrite(rVO);
		
	}

	public void PReplydelete(String rNUM) {
		bdao.PReplyredelete(rNUM);
		bdao.PReplythdelete(rNUM);
		bdao.PReplydelete(rNUM);
		
	}

	public void readCountPlus(String bnum) {
		bdao.readCountPlus(bnum);
		
	}

	public void PReplyCountUpdate(String bnum) {
		bdao.PReplyCountUpdate(bnum);
		
	}

	public void PLikeOX(HashMap<String, Object> prm) {
		bdao.PLikeOX(prm);
		
	}

	public void PThumbsUp(HashMap<String, Object> prm) {
		bdao.PThumbsUp(prm);
		
	}

	public void PboardReport(ReportVO rvo) {
		bdao.PboardReport(rvo);
		
	}

	public void PReportOX(HashMap<String, Object> prm) {
		bdao.PReportOX(prm);
		
	}

	public void PRThumbsUp(HashMap<String, Object> prm) {
		bdao.PRThumbsUp(prm);
		
	}

	public void PReLikeOX(HashMap<String, Object> prm) {
		bdao.PReLikeOX(prm);
		
	}

	public void PreplyReport(ReportVO rvo) {
		bdao.PreplyReport(rvo);
		
	}

	public void PreplyReportOX(HashMap<String, Object> prm) {
		bdao.PreplyReportOX(prm);
		
	}

	

}
