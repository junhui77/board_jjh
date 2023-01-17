package com.example.board;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.board.service.MemberServiceImplement;
import com.example.board.util.BoardUtil;
import com.example.board.util.Criteria;
import com.example.board.util.Paging;
import com.example.board.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImplement memberService;
	
	@RequestMapping(value="/login")
	public String login() {
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginCheck")
	public String loginCheck(HttpServletRequest request, MemberVo member, Model model) {
		
		
		HttpSession session = request.getSession();
		HashMap<String, Object> reqMap = new HashMap<String,Object>();
		reqMap.put("memId", member.getMemId());
		reqMap.put("memIdx", member.getMemIdx());
		reqMap.put("memPwd", member.getMemPwd());
		reqMap.put("memName", member.getMemName());
		reqMap.put("memAuth", member.getMemAuth());
		System.out.println("------------------------------MemberController.java || /loginCheck  || 컨트롤러 진입~~~~~ getMemId():" + member.getMemId());
		System.out.println("------------------------------MemberController.java || /loginCheck  || 컨트롤러 진입~~~~~ getMemPwd():" + member.getMemPwd());
		MemberVo memberInfo = memberService.loginCheck(reqMap);
		String result = "";
			
		if(memberInfo == null) {
			result = "N";
		}else{
			session.setAttribute("member", memberInfo);
			session.setAttribute("sesMemId", memberInfo.getMemId());
			session.setAttribute("sesMemIdx", memberInfo.getMemIdx());
			session.setAttribute("sesMemName", memberInfo.getMemName());
			session.setAttribute("sesMemAuth", memberInfo.getMemAuth());
			result = "Y";
		}
		
//		System.out.println("------------------------------MemberController.java || /loginCheck  || 컨트롤러 완료~~~~~ result:" +  result );
//		System.out.println("------------------------------MemberController.java || /loginCheck  || 컨트롤러 완료~~~~~ sesMemId(아이디):" + memberInfo.getMemId() );
//		System.out.println("------------------------------MemberController.java || /loginCheck  || 컨트롤러 완료~~~~~ sesMemName(이름):" + memberInfo.getMemName() );
//		System.out.println("------------------------------MemberController.java || /loginCheck  || 컨트롤러 완료~~~~~ sesMemAuth(권한):" + memberInfo.getMemAuth()  );
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck")
	public Integer idCheck(HttpServletRequest request) {
		String memIdCheck = request.getParameter("memId");
		Integer result = memberService.idCheck(memIdCheck);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdCheck")
	public Integer PwdCheck(HttpServletRequest request) {
		String memPwdCheck = request.getParameter("memId");
		Integer result = memberService.idCheck(memPwdCheck);
		return result;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:boardList";
	}
	
	@RequestMapping(value="/join")
	public String registerMemberForm() {
		return "join";
	}
	
	@RequestMapping(value = "/registerMember")
	public String registerMember(HttpServletRequest request, MemberVo member, Model model) {
		System.out.println("------------------------------MemberController.java || /registerMember  || 컨트롤러 진입~~~~~ registerMemberd():" + member);
		BoardUtil ipUtil = new BoardUtil();
		String ip = ipUtil.getClientIP(request);
		member.setMemIp(ip);
		memberService.registerMember(member);
		System.out.println("------------------------------MemberController.java || /registerMember  || 컨트롤러 완료~~~~~ registerMemberd():" + member +"," + ip);
		
		return "redirect:memberList";
	}
	
	@RequestMapping(value="/memberList")
	public String memberList(HttpServletRequest request, Model model, Criteria criteria) {
		String searchCondition = request.getParameter("searchCondition");
		String memSearchWord = request.getParameter("memSearchWord");
		
		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		reqMap.put("searchCondition", searchCondition);
		reqMap.put("memSearchWord", memSearchWord);
		
		Integer memberListCnt = memberService.memberListCount(reqMap);

		Paging paging = new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(memberListCnt);
		
		reqMap.put("criteria", criteria);
//		String memIp = member.getMemIp();
//		model.addAttribute("memIp",memIp);
		
		model.addAttribute("memberList", memberService.memberList(reqMap));
		model.addAttribute("search", reqMap);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", criteria);
		System.out.println("------------------------------MemberController.java || /memberList  || 컨트롤러 완료~~~~~ reqMap:" + reqMap);
		return "memberList";

	}
	
	@RequestMapping(value = "/memberDetail")
	public String memberDetail(@RequestParam("memIdx") Integer memIdx, Model model) {
		model.addAttribute("memberDetail", memberService.memberDetail(memIdx));
		return "memberDetail";
	}
	
	
	
	//일반유저 로그인시 : 마이페이지 클릭시 페이지 이동
		@RequestMapping(value="/goMyPageUpdate")
		public String boardMemberMyPage(@RequestParam("memIdx") Integer memIdx, Model model) {
			System.out.println("------------------------------MemberController.java || /boardMemberMyPage  || 컨트롤러 진입~~~~~ reqMap:" + memIdx);
			model.addAttribute("memberMyPageDetail",memberService.memberDetail(memIdx));
			System.out.println("------------------------------MemberController.java || /boardMemberMyPage  || 컨트롤러 완료~~~~~ reqMap:" + memIdx);
			return "memberMyPage";
		}
	
		@RequestMapping(value="/memberMyPageUpdate")
		public String updateMyPageMemberForm(@RequestParam("memIdx") Integer memIdx, Model model) {
			model.addAttribute("memberUpdateDetail",memberService.memberDetail(memIdx));
			return "memberMyPageUpdate";
		}
		
	//일반유저 로그인후 마이페이지 접근해서 회원 수정시 호출
	@RequestMapping(value="/procUpdateMyPage")
	public String updateMemberMyPage(HttpServletRequest request, MemberVo member) {
		memberService.updateMember(member);
		return "redirect:boardList";
	}
	
	//회원관리에서 수정버튼 클릭시 호출 : 수정페이지로 이동
	@RequestMapping(value="/memberUpdate")
	public String updateMemberForm(@RequestParam("memIdx") Integer memIdx, Model model) {
		model.addAttribute("memberUpdateDetail",memberService.memberDetail(memIdx));
		return "memberUpdate";
	}
	
	
	
	//회원관리에서 회원 수정시 호출
	@RequestMapping(value="/updateMember")
	public String updateMember(HttpServletRequest request, MemberVo member) {
		memberService.updateMember(member);
		return "redirect:memberList";
	}
	
	//회원관리 상세,수정에서 삭제 버튼 클릭시 호출
	@RequestMapping(value = "/deleteMember")
	public String deleteMember(@RequestParam("memIdx") Integer memIdx, Model model) {
		model.addAttribute("memIdx",memIdx);
		memberService.deleteMember(memIdx);
		return "redirect:memberList";
	}
	
	
	
	
	
	
	
	
}
