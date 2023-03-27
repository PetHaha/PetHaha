package pethaha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import pethaha.service.MemberService2;

@Controller
public class MemberController2 {

	@Autowired
	MemberService2 ms;
}
