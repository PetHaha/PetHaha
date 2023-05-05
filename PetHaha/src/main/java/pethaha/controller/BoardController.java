package pethaha.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pethaha.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bs1;
	
	@RequestMapping("/mapinfo")
	  public String memberUpdateChkForm(HttpSession session) {

		 return "board/info";
	}

}
