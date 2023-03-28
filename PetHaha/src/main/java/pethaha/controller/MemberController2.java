package pethaha.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pethaha.dto.MemberVO;
import pethaha.service.MemberService;
import pethaha.service.MemberService2;

@Controller
public class MemberController2 {

	@Autowired
	MemberService2 ms;
	
	@Autowired
	MemberService msi;
	
	@RequestMapping("/memberJoin") //회원가입 폼 이동
	public String memberJoin(Model model) {
		return "member/memberJoin";
	}
	
	@RequestMapping("/memberIdCheck") // 회원가입 아이디 중복체크
	public String member_id_check( @RequestParam("ID") String ID, Model model, HttpServletRequest request ) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ID", ID);
		msi.getMember( paramMap );
		ArrayList< HashMap<String,Object> > list = (ArrayList< HashMap<String,Object> >) paramMap.get("ref_cursor");
		if( list.size()==0 ) model.addAttribute("result" , -1);
		else model.addAttribute("result" , 1);
		model.addAttribute("ID", ID);		
		return "member/memberIdCheck";
	}
	
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST) // 회원가입, validation 적용
	public String method(MemberVO mvo,  Model model ,HttpServletRequest request) {
		String url = "member/memberJoin";
		
			ms.insertMember( mvo);
			model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
			return "member/memberLogin";
		
	}
	
	
	
}
