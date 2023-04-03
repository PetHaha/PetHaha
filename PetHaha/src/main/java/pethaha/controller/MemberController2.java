package pethaha.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pethaha.dto.MemberVO;
import pethaha.dto.Paging;
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
		msi.PgetMember( paramMap );
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
	
	@RequestMapping("/index") // 메인화면으로 이동
	public String index(Model model,HttpServletRequest request ,@RequestParam(value="category", required=false) String category) {
		HashMap<String,Object>prm=new HashMap<String,Object>();
		
		if (category==null)category="0";
		prm.put("category",category );
		prm.put("request", request);
		ms.Pgetboard(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		model.addAttribute("paging", (Paging)prm.get("paging"));
		model.addAttribute("key", (String)prm.get("key"));
		model.addAttribute("list", list);
		return "index";
	}
	
	@RequestMapping("/dogcat") // 메인화면으로 이동
	public String dogcat(Model model,HttpServletRequest request ,@ModelAttribute("category") String category) {
		HashMap<String,Object>prm=new HashMap<String,Object>();
		
		prm.put("category",category );
		prm.put("request", request);
		ms.Pgetboard(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		model.addAttribute("paging", (Paging)prm.get("paging"));
		model.addAttribute("key", (String)prm.get("key"));
		model.addAttribute("list", list);
		return "board/dogcat";
	}
	
	
}
