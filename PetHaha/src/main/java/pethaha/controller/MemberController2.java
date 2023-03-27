package pethaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pethaha.service.MemberService2;

@Controller
public class MemberController2 {

	@Autowired
	MemberService2 ms;
	
	@RequestMapping("/memberJoin") // 메인화면으로 이동
	public String memberJoin(Model model) {
		return "member/memberJoin";
	}
}
