package pethaha.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pethaha.dao.IMemberDao2;
import pethaha.dto.MemberVO;
import pethaha.dto.Paging;

@Service
public class MemberService2 {

	@Autowired
	IMemberDao2 mdao;

	public void insertMember(MemberVO mvo) {
		mdao.insertMember(mvo);
		
	}

	public void Pgetboard(HashMap<String, Object> prm) {
		
		
		HttpServletRequest request = (HttpServletRequest)prm.get("request");
		HttpSession session = request.getSession();
		String key = "";
		int page = 1;
		String sc=""; 
		 
		if(request.getParameter("first")!=null) {
			session.removeAttribute("page");
			session.removeAttribute("key");
			session.removeAttribute("sc");
			request.removeAttribute("page");
			request.removeAttribute("key");
			request.removeAttribute("sc");
		} else {
	        if (request.getParameter("page")!=null) {
	           page = Integer.parseInt( request.getParameter("page") );
	           session.setAttribute("page", page);
	        } else if (session.getAttribute("page")!=null)
	           page = (Integer)session.getAttribute("page");
	        
	        if(request.getParameter("key")!=null) {
	           session.setAttribute("key", request.getParameter("key"));
	           key = request.getParameter("key");
	        } else if (session.getAttribute("key")!=null)
	           key = (String)session.getAttribute("key");
	        
	        if(request.getParameter("sc")!=null) {
		           session.setAttribute("sc", request.getParameter("sc"));
		           sc = request.getParameter("sc");
		        } else if (session.getAttribute("sc")!=null)
		           sc = (String)session.getAttribute("sc");
		}
		
		
		Paging paging = new Paging();
		paging.setPage(page);
		
		prm.put("cnt", 0);
		prm.put("key", key);
		prm.put("sc", sc);
		mdao.PboardGetAllCount(prm);
		int count = Integer.parseInt( prm.get("cnt")+"" );
		paging.setTotalCount(count);
		paging.paging();
		
		prm.put("startNum", paging.getStartNum());
		prm.put("endNum", paging.getEndNum());
		prm.put("paging", paging);
		
		mdao.PgetBoard(prm);
		
	}
}
