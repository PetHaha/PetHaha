package pethaha.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pethaha.dto.MemberVO;
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
	
	@RequestMapping(value="/login", method=RequestMethod.POST) // 회원 로그인, validation 적용
	public String login(@ModelAttribute("dto") @Valid MemberVO mvo, BindingResult result, HttpSession session, Model model) {
		String url = "member/memberLogin";{
			HashMap<String, Object> prm = new HashMap<>();
			prm.put("ID", mvo.getID());
			ms.getMember(prm);
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			if(list.size()==0) model.addAttribute("message","아이디가 없습니다.");
			else { HashMap<String, Object> hvo = list.get(0);
				if(!hvo.get("PWD").equals(mvo.getPWD())) model.addAttribute("message","비밀번호가 틀렸습니다.");
				else if (hvo.get("PWD").equals(mvo.getPWD())) {
					session.setAttribute("loginUser", hvo);
					url = "redirect:/";
				}
			}
		}
		return url;
	}
	
	@RequestMapping("/logout") // 회원 로그아웃
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	@RequestMapping("/memberUpdateForm") // 회원 정보 수정 폼으로 이동
	public String memberUpdateForm(HttpSession session) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		return "member/memberUpdate";
	}
	
	/*
	  @RequestMapping(value="/memberUpdate", method=RequestMethod.POST) // 회원 정보 수정, validation 적용
	   public String memberUpdate( @ModelAttribute("loginUser") @Valid MemberVO mvo, BindingResult result, Model model, HttpSession session ) {
	      if (session.getAttribute("loginUser")==null) return "redirect:/loginForm";
	      if (result.getFieldError("PWD")!=null ) model.addAttribute("message", result.getFieldError("PWD").getDefaultMessage());
	      else if (result.getFieldError("NAME")!=null ) model.addAttribute("message", result.getFieldError("NAME").getDefaultMessage());
	      else if (result.getFieldError("PHONE")!=null ) model.addAttribute("message", result.getFieldError("PHONE").getDefaultMessage());
	      else if (result.getFieldError("EMAIL")!=null ) model.addAttribute("message", result.getFieldError("EMAIL").getDefaultMessage());
	      else if (mvo.getADDRESS2()==null||mvo.getADDRESS2().equals(""))model.addAttribute("message","상세주소를 입력해주세요");
	      else if (mvo.getNICK()==null||mvo.getNICK().equals(""))model.addAttribute("message","닉네임을 입력해주세요");
	      else if (mvo.getUSERPWDCHK().equals("") || mvo.getUSERPWDCHK() == null || !mvo.getUSERPWDCHK().equals(mvo.getPWD() ) ) model.addAttribute("message", "비밀번호가 일치하지 않습니다");
	      else {
	         HashMap<String, Object> prm = new HashMap<String, Object>();      
	         prm.put("mvo", mvo);
	         ms.memberUpdate( prm ); // 업데이트 후, 갱신된 정보로 로그인 유저 조회
	         ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
	         HashMap<String,Object> loginUser = list.get(0);
	         session.setAttribute("loginUser", loginUser); // 갱신된 정보 세션에 저장
	         model.addAttribute("success", "1"); //정보수정 알림
	      }
	      return "member/memberUpdate";
	   }
	   */
	
	

}
