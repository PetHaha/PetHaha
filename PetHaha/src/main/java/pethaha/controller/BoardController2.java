package pethaha.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pethaha.service.BoardService2;
import pethaha.service.MemberService;

@Controller
public class BoardController2 {

	@Autowired
	BoardService2 bs;
	
	@Autowired
	MemberService ms;
	

	@RequestMapping("/boardView") 
	public String boardView(@RequestParam("BNUM") String BNUM, Model model, HttpServletRequest request,
			@RequestParam(value="best", required=false)String best) {
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("BNUM", BNUM);
		bs.PboardView(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String,Object>bVO=list.get(0);
		prm.put("ID", bVO.get("ID")+"");
		
		ms.PgetMember(prm);
		list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String, Object> writer = list.get(0);
		model.addAttribute("writer",writer);
		model.addAttribute("board",bVO);
		model.addAttribute("best", best);
		return "board/boardView";
	}
	
	
}
