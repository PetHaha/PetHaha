package pethaha.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	/*
	@PostMapping(value = "/image/upload")
	public ModelAndView image(MultipartHttpServletRequest request) throws Exception {
    
		// ckeditor는 이미지 업로드 후 이미지 표시하기 위해 uploaded 와 url을 json 형식으로 받아야 함
		// modelandview를 사용하여 json 형식으로 보내기위해 모델앤뷰 생성자 매개변수로 jsonView 라고 써줌
		// jsonView 라고 쓴다고 무조건 json 형식으로 가는건 아니고 @Configuration 어노테이션을 단 
		// WebConfig 파일에 MappingJackson2JsonView 객체를 리턴하는 jsonView 매서드를 만들어서 bean으로 등록해야 함 
		ModelAndView mav = new ModelAndView("jsonView");

		// ckeditor 에서 파일을 보낼 때 upload : [파일] 형식으로 해서 넘어오기 때문에 upload라는 키의 밸류를 받아서 uploadFile에 저장함
		MultipartFile uploadFile = request.getFile("upload");

		// 파일의 오리지널 네임
		String originalFileName = uploadFile.getOriginalFilename();
		
        // 파일의 확장자
		String ext = originalFileName.substring(originalFileName.indexOf("."));
		
        // 서버에 저장될 때 중복된 파일 이름인 경우를 방지하기 위해 UUID에 확장자를 붙여 새로운 파일 이름을 생성
		String newFileName = UUID.randomUUID() + ext;

		// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
		String realPath = request.getServletContext().getRealPath("/");

		// 현재경로/upload/파일명이 저장 경로
		String savePath = realPath + "upload/" + newFileName;

		// 브라우저에서 이미지 불러올 때 절대 경로로 불러오면 보안의 위험 있어 상대경로를 쓰거나 이미지 불러오는 jsp 또는 클래스 파일을 만들어 가져오는 식으로 우회해야 함
		// 때문에 savePath와 별개로 상대 경로인 uploadPath 만들어줌
		String uploadPath = "./upload/" + newFileName; 

		// 저장 경로로 파일 객체 생성
		File file = new File(savePath);

		// 파일 업로드
		uploadFile.transferTo(file);

		// uploaded, url 값을 modelandview를 통해 보냄
		mav.addObject("uploaded", true); // 업로드 완료
		mav.addObject("url", uploadPath); // 업로드 파일의 경로

		return mav;
	}
	*/
	
	
}
