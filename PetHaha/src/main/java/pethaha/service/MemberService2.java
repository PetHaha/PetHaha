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
		 
		if(request.getParameter("first")!=null) {
			session.removeAttribute("page");
			session.removeAttribute("key");
			request.removeAttribute("page");
			request.removeAttribute("key");
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
		}
		String sc="content";
		if (request.getParameter("sc")==null) sc="content";
		
		Paging paging = new Paging();
		paging.setPage(page);
		
		prm.put("cnt", 0);
		prm.put("key", key);
		prm.put("sc", sc);
		mdao.PboardGetAllCount(prm);
		System.out.println("cate : "+prm.get("category")+ " ,sc : "+prm.get("sc")+" , key : "+prm.get("key"));
		int count = Integer.parseInt( prm.get("cnt")+"" );
		System.out.println(count);
		paging.setTotalCount(count);
		paging.paging();
		
		prm.put("startNum", paging.getStartNum());
		prm.put("endNum", paging.getEndNum());
		prm.put("paging", paging);
		
		mdao.PgetBoard(prm);
		
	}
}
