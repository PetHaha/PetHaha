package pethaha.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pethaha.dto.MemberVO;
import pethaha.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService ms;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/") // 메인화면으로 이동
	public String main(Model model) {
		return "redirect:/index";
	}
	/*
	@RequestMapping("/index") // 메인화면으로 이동
	public String index(Model model) {
		HashMap<String,Object>prm=new HashMap<String,Object>();
		ArrayList<HashMap<String,Object>> list =(ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
		return "index";
	}
	*/
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
	
	@RequestMapping(value="fileUp",method=RequestMethod.POST)
	@ResponseBody	
	public HashMap<String , Object> fileUp(Model model,HttpServletRequest request) throws IOException{
		String path=context.getRealPath("");
		HashMap<String,Object>result=new HashMap<String,Object>();		
		MultipartRequest multi =new MultipartRequest(request,path,5*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
		result.put("STATUS",1);
		result.put("FILENAME", multi.getFilesystemName("fileimage"));
		return result;
	}
	
	  @RequestMapping(value="/memberUpdate", method=RequestMethod.POST) // 회원 정보 수정, validation 적용
	   public String memberUpdate( @ModelAttribute("loginUser") @Valid MemberVO mvo, BindingResult result, 
			   Model model, HttpSession session, @RequestParam(value="OLDIMAGE",required=false) String oldImage) {
	        if (session.getAttribute("loginUser")==null) return "redirect:/loginForm";
	      
			if( mvo.getMEMIMG().equals("") ) {
				if(oldImage==null)oldImage="noimg.jpg";
				mvo.setMEMIMG(oldImage);
			}
	         HashMap<String, Object> prm = new HashMap<String, Object>();      
	         prm.put("mvo", mvo);
	         ms.PmemberUpdate( prm ); // 업데이트 후, 갱신된 정보로 로그인 유저 조회
	         ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
	         HashMap<String,Object> loginUser = list.get(0);
	         session.setAttribute("loginUser", loginUser); // 갱신된 정보 세션에 저장
	         model.addAttribute("success", "1"); //정보수정 알림
	         
	      return "member/memberUpdate";
	   }


	
	

}
