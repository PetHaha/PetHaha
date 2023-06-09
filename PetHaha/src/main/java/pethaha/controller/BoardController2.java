package pethaha.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pethaha.dto.BoardVO;
import pethaha.dto.ReplyVO;
import pethaha.dto.ReportVO;
import pethaha.service.BoardService2;
import pethaha.service.MemberService;

@Controller
public class BoardController2 {

	@Autowired
	BoardService2 bs;
	
	@Autowired
	MemberService ms;
	

	@RequestMapping("/boardView") 
	public String boardView( HttpSession session,@RequestParam("BNUM") String BNUM, Model model, HttpServletRequest request,
			@RequestParam(value="best", required=false)String best, @ModelAttribute("replycheck")String replycheck,HttpServletResponse response) {
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("BNUM", BNUM);
		bs.PboardView(prm); //게시글 내용 조회
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String,Object>bVO=list.get(0);
		prm.put("ID", bVO.get("ID")+"");
		
		// **쿠키를 통한 조회수 증가(새로고침, 답글작성 ,삭제를 통한 조회수 증가를 막기위해)
		//참조 블로그 : https://developersoo.tistory.com/14
		Cookie[] cookies = request.getCookies();
        // 비교하기 위해 새로운 쿠키
        Cookie viewCookie = null;
 
        // 쿠키가 있을 경우 
        if (cookies != null && cookies.length > 0) 
        {
            for (int i = 0; i < cookies.length; i++)
            {
                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
                if (cookies[i].getName().equals("cookie"+BNUM))
                { 
                    viewCookie = cookies[i];
                }
            }
        }
        
        if (viewCookie == null) {    
            // 쿠키 생성(이름, 값)
            Cookie newCookie = new Cookie("cookie"+BNUM, "|" + BNUM + "|");
            // 쿠키 추가
            response.addCookie(newCookie);
            // 쿠키를 추가 시키고 조회수 증가시킴
            bs.readCountPlus(BNUM);
        }
        
		
		
		ms.PgetMember(prm); //글쓴이 정보 조회
		list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String, Object> writer = list.get(0);
		
		bs.PgetReplyList(prm); //댓글리스트 조회
		list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		model.addAttribute("reply",list);
		
		if(session.getAttribute("loginUser")!=null) { //로그인 유저의 추천,신고 유무 체크
		HashMap<String,Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
		prm.put("ID",  loginUser.get("ID")+"");
		bs.PLikeOX(prm); //추천유무
		list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		if(list.size()!=0)model.addAttribute("LikeOX",1);
		
		bs.PReportOX(prm); //신고유무
		list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		if(list.size()!=0)model.addAttribute("ReportOX",1);
		
		}
		
		
		model.addAttribute("writer",writer);
		model.addAttribute("board",bVO);
		model.addAttribute("best", best);
		return "board/boardView";
	}
	

	
	@RequestMapping("/boardReplyWrite") 
	public String boardReplyWrite(@RequestParam(value="best", required=false)String best, Model model, HttpServletRequest request,ReplyVO RVO) {
		bs.PReplyWrite(RVO);
		return "redirect:/boardView?BNUM="+RVO.getBNUM()+"&best="+best;
	}
	
	@RequestMapping("/replydelete") 
	public String replydelete(@RequestParam(value="BNUM", required=false)String BNUM,@RequestParam(value="RNUM", required=false)String RNUM,
			@RequestParam(value="best", required=false)String best, Model model) {
		bs.PReplydelete(RNUM);
		bs.PReplyCountUpdate(BNUM);
		return "redirect:/boardView?BNUM="+BNUM+"&best="+best;
	}
	@RequestMapping("/BThumbsUp") 
	public String BThumbsUp(@RequestParam(value="BNUM", required=false)String BNUM,@RequestParam(value="ID", required=false)String ID,
			@RequestParam(value="best", required=false)String best,@RequestParam(value="NICK", required=false)String NICK, Model model) {
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("ID", ID);
		prm.put("NICK", NICK);
		prm.put("BNUM", BNUM);
		bs.PThumbsUp(prm);
		return "redirect:/boardView?BNUM="+BNUM+"&best="+best;			
	}
	
	@RequestMapping("/boardreportform") 
	public String boardreportform(@ModelAttribute("BNUM")String BNUM,@ModelAttribute("ID")String ID,
			@ModelAttribute("NICK")String NICK) {
		return "board/boardpolice";			
	}
	
	@RequestMapping("/boardReport") 
	public String boardReport(ReportVO rvo,Model model) {
		bs.PboardReport(rvo);
		model.addAttribute("result","1");
		return "board/boardpolice";			
	}
	
	@RequestMapping("/RThumbsUp") 
	public String RThumbsUp(@RequestParam(value="RNUM", required=false)String RNUM,@RequestParam(value="ID", required=false)String ID,
			@RequestParam(value="best", required=false)String best,@RequestParam(value="BNUM", required=false)String BNUM,
			@RequestParam(value="NICK", required=false)String NICK, Model model) {
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("ID", ID);
		prm.put("NICK", NICK);
		prm.put("RNUM", RNUM);
		bs.PReLikeOX(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		if(list.size()!=0) {return "redirect:/boardView?BNUM="+BNUM+"&best="+best+"&replycheck=1";	}	
		else {
			bs.PRThumbsUp(prm);
			return "redirect:/boardView?BNUM="+BNUM+"&best="+best;	
		}		
	}
	
	
	@RequestMapping("/replyreportform") 
	public String replyreportform(@ModelAttribute("RNUM")String RNUM,@ModelAttribute("ID")String ID,
			@ModelAttribute("NICK")String NICK,Model model) {
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("RNUM", RNUM);
		prm.put("ID", ID);
		bs.PreplyReportOX(prm);
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		if(list.size()!=0) model.addAttribute("result","0");	
		return "board/replypolice";			
	}
	
	@RequestMapping("/replyReport") 
	public String replyReport(ReportVO rvo,Model model) {
		bs.PreplyReport(rvo);
		model.addAttribute("result","1");
		return "board/replypolice";			
	}
	
	@RequestMapping("/boardwriteform")
	public String boardwriteform(@ModelAttribute("category")String category,HttpSession session) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		return "board/boardWrite";
	}
	
	@Autowired
	ServletContext context;

	@RequestMapping(value="/boardImgfileUp",method=RequestMethod.POST)
	@ResponseBody	
	  public HashMap<String , Object> boardImgfileUp(Model model,HttpServletRequest request) throws IOException{
		String path=context.getRealPath("images/boardimg/");
		HashMap<String,Object>result=new HashMap<String,Object>();		
		MultipartRequest multi =new MultipartRequest(request,path,5*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
		result.put("STATUS",1);
		result.put("FILENAME", multi.getFilesystemName("fileimage"));
		return result;
	}
	
	@RequestMapping("/boardWrite")
	public String boardWriteform(BoardVO bvo,HttpSession session) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		if(bvo.getBIMG1()==null)bvo.setBIMG1("");
		bs.PboardWrite(bvo);
		return "redirect:/dogcat?category="+bvo.getCATEGORY();
	}
	
	@RequestMapping("/boardEditForm")
	public String boardEditForm(@RequestParam("BNUM") String BNUM,HttpSession session,Model model) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		HashMap<String, Object> prm = new HashMap<>();
		prm.put("BNUM", BNUM);
		bs.PboardView(prm); //게시글 내용 조회
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		HashMap<String,Object>bVO=list.get(0);
		model.addAttribute("board",bVO);
		return "board/boardEdit";
	}
	
	@RequestMapping("/boardEdit")
	public String boardEdit(@RequestParam(value="oldImg", required=false) String oldImg,BoardVO bvo,HttpSession session) {
		if(session.getAttribute("loginUser")==null) return "redirect:/loginForm";
		if(oldImg==null)oldImg="";
		if(bvo.getBIMG1()==null||bvo.getBIMG1().equals(""))bvo.setBIMG1(oldImg);
		bs.PboardEdit(bvo);
		return "redirect:/boardView?BNUM="+bvo.getBNUM();
	}

}
