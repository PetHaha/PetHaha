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
import pethaha.dto.Paging;
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
			ms.PgetMember(prm);
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			if(list.size()==0) model.addAttribute("message","아이디가 없습니다.");
			else { HashMap<String, Object> hvo = list.get(0);
				if(!hvo.get("PWD").equals(mvo.getPWD())) model.addAttribute("message","비밀번호가 틀렸습니다.");
				else if (hvo.get("PWD").equals(mvo.getPWD())) {
					session.setAttribute("loginUser", hvo);
					prm.put("NICK", hvo.get("NICK")+""); // 메세지 알림 (로그인할 시 세션값 저장) ~ 로그아웃시 세션값 제거
					ms.msgCheck(prm);
					session.setAttribute("mcheck",prm.get("cnt")+"");
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
		session.removeAttribute("mcheck");
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
			String path=context.getRealPath("images/profile/");
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
	  
	  @RequestMapping("/memberUpdateChkForm") // 회원 정보 확인 폼으로 이동
		public String memberUpdateChkForm(HttpSession session) {
			if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
			return "member/memberUpdateCheck";
		}
	  
	  @RequestMapping("/myBoard") // 내가 쓴 글로 이동 
		public String myBoard( HttpSession session, HttpServletRequest request, Model model) {
			if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
			HashMap<String,Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
			HashMap<String,Object>prm=new HashMap<String,Object>();
			prm.put("NICK", loginUser.get("NICK")+"");
			prm.put("request", request);
			ms.PmyBoard(prm);
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			model.addAttribute("paging", (Paging)prm.get("paging"));
			model.addAttribute("list", list);
			return "member/myBoard";
		}
	  
	  @RequestMapping("/myMsg_S") // 보낸 메세지 함으로 이동
		public String myMsg_S(HttpSession session, HttpServletRequest request, Model model) {
		  if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
			HashMap<String,Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
			HashMap<String,Object>prm=new HashMap<String,Object>();
			prm.put("NICK", loginUser.get("NICK")+"");
			prm.put("request", request);
			ms.PmsgSend(prm);
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			model.addAttribute("paging", (Paging)prm.get("paging"));
			model.addAttribute("list", list);
			return "member/myMsg_S";
	}
	  
	  @RequestMapping("/myMsg_R") // 받은 메세지 함으로 이동
		public String myMsg_R(HttpSession session,  HttpServletRequest request, Model model) {
		  if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
			HashMap<String,Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
			HashMap<String,Object>prm=new HashMap<String,Object>();
			prm.put("NICK", loginUser.get("NICK")+"");
			prm.put("request", request);
			ms.PmsgReceive(prm);
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			model.addAttribute("paging", (Paging)prm.get("paging"));
			model.addAttribute("list", list);
			return "member/myMsg_R";
		}
	  
	  @RequestMapping("/msgDetail")// 메세지 디테일 내용 확인
	  	public String msgDetail(HttpSession session,  HttpServletRequest request, Model model,
	  			@RequestParam("MSNUM") int MSNUM) {
		  if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		  	HashMap<String,Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
		  	HashMap<String,Object>prm=new HashMap<String,Object>();
		  	prm.put("MSNUM",MSNUM);
		  	ms.msgDetail(prm);
		  	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		  	HashMap<String,Object> message = list.get(0);
		  	model.addAttribute("message",message);
		  	prm.put("NICK", loginUser.get("NICK")+""); // 메세지 확인시(디테일 확인) 세션값 변경(덮어씌움)
			ms.msgCheck(prm);
			session.setAttribute("mcheck",prm.get("cnt")+"");
		  	return "member/msgDetail";
	  }
	  
	  @RequestMapping("/msgWriteForm")// 메세지 보내기 폼으로 이동
	  	public String msgWriteForm(HttpSession session,  HttpServletRequest request, Model model) {
	  	  if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";	  
	  	  model.addAttribute("AN",request.getParameter("AN"));
	  	  model.addAttribute("TONICK",request.getParameter("TONICK"));
	  		return "member/msgWrite";
	  }
	  
	  @RequestMapping(value="/msgWrite", method=RequestMethod.POST)// 메세지 보내기
	  	public String msgWrite(HttpSession session,  HttpServletRequest request, Model model,
	  			@RequestParam(value="TONICK",required=false) String TONICK,
	  			@RequestParam(value="ID",required=false) String ID){
	  	  if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
	  	  	HashMap<String,Object>prm=new HashMap<String,Object>();
	  	  	prm.put("TONICK", TONICK);
	  	  	//xml 통해 닉네임 유무 확인
	  	  	ms.nickok(prm); 
	  	  	
	  	  	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) prm.get("ref_cursor");
	  	  	if(list.size()==0) {
	  	  		model.addAttribute("message","닉네임을 확인해주세요.");
	  	  		model.addAttribute("MTITLE", request.getParameter("MTITLE"));
	  	  		model.addAttribute("MCONTENT", request.getParameter("MCONTENT"));
	  	  		return "member/msgWrite";
	  	  	}
	  			
	  	  	//닉네임이 없다면 필드에러를 가지고 MTITLE,MCONTENT,NICK값을 가지고 되돌아간다
	  	  	else {
		  	  	prm.put("TONICK", TONICK);
		  	  	prm.put("ID", ID);
		  	  	prm.put("MTITLE", request.getParameter("MTITLE"));
		  	  	prm.put("MCONTENT", request.getParameter("MCONTENT")); 	  	
		  	  	prm.put("NICK", request.getParameter("NICK"));  
		  	  	ms.msgWrite(prm);
		  		return "redirect:/myMsg_S";
	  	  		}
	  	 }
	  	  		
	  	  	
	  
  		@RequestMapping("/msgDelete") 
  		 public String msgDelete( HttpSession session, @RequestParam("MSNUM") int MSNUM
  				,@RequestParam("a") int a) {
			 if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
				 HashMap<String, Object> prm = new HashMap<String,Object>(); 
				 prm.put("MSNUM",MSNUM );
				 ms.msgDelete(prm);
				 if(a==1)
					 return "redirect:/myMsg_S";
				 else
					 return "redirect:/myMsg_R";
  		}
  		
  		 @RequestMapping("/myReply") // 내가 쓴 댓글로 이동 
  		  public String myReply( HttpSession session, HttpServletRequest request, Model model) {
 			 if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
 			 HashMap<String,Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
 			 HashMap<String,Object>prm=new HashMap<String,Object>();
			 prm.put("NICK", loginUser.get("NICK")+"");
			 prm.put("request", request);
			 ms.PmyReply(prm);
			 ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
			 model.addAttribute("paging", (Paging)prm.get("paging"));
			 model.addAttribute("list", list);
 			 
 			 return "member/myReply";
  		 }
  		 
  		@RequestMapping("/memberNickCheck") // 회원가입 닉네임 중복체크(메세지보내기 때문에)
  		public String member_nick_check( @RequestParam("NICK") String NICK, Model model, HttpServletRequest request ) {
  			HashMap<String, Object> prm = new HashMap<String, Object>();
  			prm.put("NICK", NICK);
  			ms.PgetNick( prm );
  			ArrayList< HashMap<String,Object> > list = (ArrayList< HashMap<String,Object> >) prm.get("ref_cursor");
  			if( list.size()==0 ) model.addAttribute("result" , -1);
  			else model.addAttribute("result" , 1);
  			model.addAttribute("NICK", NICK);		
  			return "member/memberNickCheck";
  		}
  		 
} 
		 
 
	  


	
	


