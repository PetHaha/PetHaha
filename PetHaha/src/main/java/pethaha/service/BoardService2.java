package pethaha.service;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IBoardDao2;
import pethaha.dto.ReplyVO;

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
		bdao.PReplydelete(rNUM);
		
	}
}
