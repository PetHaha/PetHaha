package pethaha.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pethaha.dto.ReplyVO;
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
			@RequestParam(value="best", required=false)String best, HttpServletResponse response) {
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
		
		if(session.getAttribute("loginUser")!=null) { //로그인 유저의 추천 유무 체크
		HashMap<String,Object> loginUser = (HashMap<String , Object>)session.getAttribute("loginUser");
		prm.put("ID",  loginUser.get("ID")+"");
		bs.PLikeOX(prm);
		list = (ArrayList<HashMap<String,Object>>)prm.get("ref_cursor");
		if(list.size()!=0)model.addAttribute("LikeOX",1);
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
	
	
}
