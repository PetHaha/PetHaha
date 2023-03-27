package pethaha.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pethaha.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService ms;
	
	@RequestMapping("/") // 메인화면으로 이동
	public String main(Model model) {
		return "redirect:/index";
	}

	@RequestMapping("/index") // 메인화면으로 이동
	public String index(Model model) {
		HashMap<String,Object>prm=new HashMap<String,Object>();
		ArrayList<HashMap<String,Object>> list =(ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		return "index";
	}
	
	@RequestMapping("/loginForm") // 회원 로그인 폼 이동
	public String loginForm() {
		return "member/memberLogin";
	}
	
	

}
