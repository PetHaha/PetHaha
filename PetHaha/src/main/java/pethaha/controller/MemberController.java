package pethaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import pethaha.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService ms;

}
