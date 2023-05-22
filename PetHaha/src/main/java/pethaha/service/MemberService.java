package pethaha.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IMemberDao;
import pethaha.dto.Paging;

@Service
public class MemberService {
	
	@Autowired
	IMemberDao mdao;

	public void PgetMember(HashMap<String, Object> prm) {
		mdao.PgetMember(prm);		
	}

	public void PmemberUpdate(HashMap<String, Object> prm) {
		mdao.PmemberUpdate(prm);
		
	}

	public void PmyBoard(HashMap<String, Object> prm) {
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		int page = 1;
		 
		if(request.getParameter("first")!=null) {
			session.removeAttribute("page");
			request.removeAttribute("page");

		} else {
	        if (request.getParameter("page")!=null) {
	           page = Integer.parseInt( request.getParameter("page") );
	           session.setAttribute("page", page);
	        } else if (session.getAttribute("page")!=null)
	           page = (Integer)session.getAttribute("page");
		}
	
		Paging paging = new Paging();
		paging.setPage(page);
		
		prm.put("cnt", 0);
		mdao.PmyBoardCount(prm);
		int count = Integer.parseInt( prm.get("cnt")+"" );
		paging.setTotalCount(count);
		paging.paging();
		
		prm.put("startNum", paging.getStartNum());
		prm.put("endNum", paging.getEndNum());
		prm.put("paging", paging);
		
		mdao.PmyBoard(prm);
		
		
	}

	public void PmsgSend(HashMap<String, Object> prm) {
		
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		int page = 1;
		 
		if(request.getParameter("first")!=null) {
			session.removeAttribute("page");
			request.removeAttribute("page");

		} else {
	        if (request.getParameter("page")!=null) {
	           page = Integer.parseInt( request.getParameter("page") );
	           session.setAttribute("page", page);
	        } else if (session.getAttribute("page")!=null)
	           page = (Integer)session.getAttribute("page");
		}
	
		Paging paging = new Paging();
		paging.setPage(page);
		
		prm.put("cnt", 0);
		mdao.PmessageCount(prm);
		int count = Integer.parseInt( prm.get("cnt")+"" );
		paging.setTotalCount(count);
		paging.paging();
		
		prm.put("startNum", paging.getStartNum());
		prm.put("endNum", paging.getEndNum());
		prm.put("paging", paging);
		
		mdao.PmsgSend(prm);
		
	}

	public void PmsgReceive(HashMap<String, Object> prm) {
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		int page = 1;
		 
		if(request.getParameter("first")!=null) {
			session.removeAttribute("page");
			request.removeAttribute("page");

		} else {
	        if (request.getParameter("page")!=null) {
	           page = Integer.parseInt( request.getParameter("page") );
	           session.setAttribute("page", page);
	        } else if (session.getAttribute("page")!=null)
	           page = (Integer)session.getAttribute("page");
		}
	
		Paging paging = new Paging();
		paging.setPage(page);
		
		prm.put("cnt", 0);
		mdao.PmessageCount2(prm);
		int count = Integer.parseInt( prm.get("cnt")+"" );
		paging.setTotalCount(count);
		paging.paging();
		
		prm.put("startNum", paging.getStartNum());
		prm.put("endNum", paging.getEndNum());
		prm.put("paging", paging);
		
		mdao.PmsgReceive(prm);
		
		
	}

	public void msgDetail(HashMap<String, Object> prm) {
		mdao.msgDetail(prm);
	}

	public void msgWrite(HashMap<String, Object> prm) {
		mdao.msgWrite(prm);
		
	}

	public void msgDelete(HashMap<String, Object> prm) {
		mdao.msgDelete(prm);
		
	}

	public void nickok(HashMap<String, Object> prm) { //닉네임 중복확인
		mdao.nickok(prm);
		
	}

	public void PmyReply(HashMap<String, Object> prm) {
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		int page = 1;
		 
		if(request.getParameter("first")!=null) {
			session.removeAttribute("page");
			request.removeAttribute("page");

		} else {
	        if (request.getParameter("page")!=null) {
	           page = Integer.parseInt( request.getParameter("page") );
	           session.setAttribute("page", page);
	        } else if (session.getAttribute("page")!=null)
	           page = (Integer)session.getAttribute("page");
		}
	
		Paging paging = new Paging();
		paging.setPage(page);
		
		prm.put("cnt", 0);
		mdao.PmyReplyCount(prm);
		int count = Integer.parseInt( prm.get("cnt")+"" );
		paging.setTotalCount(count);
		paging.paging();
		
		prm.put("startNum", paging.getStartNum());
		prm.put("endNum", paging.getEndNum());
		prm.put("paging", paging);
		
		mdao.PmyReply(prm);
		
	}

	public void PgetNick(HashMap<String, Object> prm) {
		mdao.PgetNick(prm);
		
	}

	public void msgCheck(HashMap<String, Object> prm) {
		mdao.msgCheck(prm);
		
	}



}
