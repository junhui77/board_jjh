package com.example.board;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.board.service.BoardServiceImplement;
import com.example.board.service.ReplyService;
import com.example.board.util.Criteria;
import com.example.board.util.Paging;
import com.example.board.vo.BoardLikeVo;
import com.example.board.vo.BoardVo;
import com.example.board.vo.MemberVo;
import com.example.board.vo.ReplyVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BoardServiceImplement boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/")
	public String boarList() {
		
		return "redirect:/boardList";
	}
	
	@RequestMapping(value = "/boardList")
	public String boardList(Integer num, HttpServletRequest request,Criteria criteria ,Model model) throws UnsupportedEncodingException {
		System.out.println("HomeController.java || /boardList || boardList || 컨트롤러 진입~~~~~");
		String searchCondition = request.getParameter("searchCondition");
		String boardSearchWord = request.getParameter("boardSearchWord");
		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		reqMap.put("searchCondition",searchCondition);
		reqMap.put("boardSearchWord",boardSearchWord);
		
		
		
		Integer boardListCnt = boardService.boardListCount(reqMap);
		
		Paging paging = new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(boardListCnt);
		
		reqMap.put("criteria", criteria);
		
		
//		List<BoardVo> list = boardService.boardList(reqMap);
//		model.addAttribute("boardList", list);
		model.addAttribute("boardList", boardService.boardList(reqMap));
		model.addAttribute("search", reqMap);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", criteria);
		model.addAttribute("num",num);// 좋아요 개수
		model.addAttribute("boardLikeCount",boardService.boardLikeCount(num));// 좋아요 개수
		
		System.out.println("-------------------------HomeController.java || /boardLike || 진입완료(num) :" + num);
		
		return "boardList";
	}
	
	
//	@RequestMapping(value = "/boardDetail")
//	public String boardDetail(HttpServletRequest request, Model model) {
//		
//		System.out.println("HomeController.java || /boardDetail || bordeDetail|| 컨트롤러 진입~~~~~");
//		
//		
//		HashMap<String, Object> reqMap = new HashMap<String, Object>();
//		Integer num = request.getParameter("num");
//		reqMap.put("num", num);
//
//		BoardVo detail = boardService.boardDetail(reqMap);
//		model.addAttribute("boardDetail", detail);
//		
//		return "boardDetail";
//	}
	
	@RequestMapping(value = "/boardDetail")
	public String boardDetail(@RequestParam("num") Integer num, Model model, HttpSession session) {
		
		model.addAttribute("boardDetail", boardService.boardDetail(num));
		
		BoardLikeVo boardLikeVo = new BoardLikeVo();
		ReplyVo replyVo = new ReplyVo();
		MemberVo member = (MemberVo) session.getAttribute("member");
		
		
		
		
		boardService.plusViewCount(num); //게시글 조회수 증가
		model.addAttribute("boardLikeCount",boardService.boardLikeCount(num));// 좋아요 개수
		System.out.println("-------------------------HomeController.java || /boardDetail || start~~~~~ boardLikeCount(num) :" + boardService.boardLikeCount(num));
		

		//Integer memIdx2 = ((MemberVo)model.addAttribute("member")).getMemIdx();
		
//		HashMap<String, Object> map = new HashMap<String, Object>(); 
//		List<ReplyVo> replyVoList = replyService.retrieveReplyList(map);
//		model.addAttribute("replyVoList",replyVoList);
		
		
		//Integer replyMemIdx = ((MemberVo)session.getAttribute("member")).getMemIdx();
		
		
		
		
		
		if (member != null) {
			
			
			
			//Integer replyMemIdx = ((MemberVo)session.getAttribute("member")).getMemIdx();
			
			//System.out.println("-------------------------HomeController.java || /boardDetail || 진입 시작 memIdx : " + replyMemIdx);
//			HashMap<String, Object> reqMap = new HashMap<String, Object>();
//			
//			System.out.println("-------------------------HomeController.java || /boardDetail || 진입 과정 reqMap : " + reqMap);
			
			//reqMap.put("memIdx", replyMemIdx);
//			reqMap.put("num", num);
//			
//			List<ReplyVo> replyVoList = replyService.retrieveReplyList(reqMap);
//			
//			HashMap<String, Object> resMap = new HashMap<String, Object>();
//			
//			resMap.put("replyList", replyVoList);
//			
			
			
			//좋아요 기능
			Integer memIdx = member.getMemIdx();
			boardLikeVo.setMemIdx(memIdx);
			boardLikeVo.setNum(num);
			System.out.println("-------------------------HomeController.java || /boardDetail || 진입~~~~~ boardFindLike(memIdx) :" + memIdx);
			System.out.println("-------------------------HomeController.java || /boardDetail || 진입~~~~~ boardFindLike(num) :" + num);
			Integer findLike = boardService.boardFindLike(boardLikeVo); // 좋아요 누른 상태 == 1,
			
			
			model.addAttribute("boardFindLike",findLike);// 좋아요 상태
			System.out.println("-------------------------HomeController.java || /boardDetail || start~~~~~ boardFindLike :" + findLike);
		}else {

			
			
			
//			HashMap<String, Object> reqMap = new HashMap<String, Object>();
//			
//			
//			
//			//reqMap.put("memIdx", replyMemIdx);
//			reqMap.put("num", num);
//			System.out.println("-------------------------HomeController.java || /boardDetail || 로그아웃 상태 num : " + num);
//			
//			List<ReplyVo> replyVoList = replyService.retrieveReplyList(reqMap);
//			
//			HashMap<String, Object> resMap = new HashMap<String, Object>();
//			System.out.println("-------------------------HomeController.java || /boardDetail || 로그아웃 상태 resMap : " + resMap);
//			resMap.put("replyList", replyVoList);
//			
//			
//			
		}

		
		
		
		
		
		return "boardDetail";
	}
	
	@RequestMapping(value = "/boardRegister")
	public String registerForm(HttpServletRequest request, BoardVo board) throws UnsupportedEncodingException {
		System.out.println("-------------------------HomeController.java || /registerForm || 컨트롤러 진입~~~~~");
		request.setCharacterEncoding("utf-8");
		return "boardRegister";
	}
	
	@RequestMapping(value = "/register")
	public String register(HttpServletRequest request, BoardVo board, Model model) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		boardService.registerBoard(board);
		System.out.println("-------------------------HomeController.java || /registerForm || register start~~~~~");
		return "redirect:boardList";
	}
	
	@RequestMapping(value="/boardUpdate")
	public String boardUpdate(@RequestParam("num") Integer num, Model model) {
		model.addAttribute("updateBoard" ,boardService.boardDetail(num));
		System.out.println("-------------------------HomeController.java || /boardUpdate || start~~~~~");
		return "boardUpdate";
	}
	
	@RequestMapping(value="/update")
	public String update(HttpServletRequest request, BoardVo board) {
		boardService.updateBoard(board);		
		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/boardDelete")
	public String boardDelete(@RequestParam("num") Integer num, Model model) {
		model.addAttribute("num", num);
		boardService.deleteBoard(num);
		System.out.println("-------------------------HomeController.java || /boardDelete || start~~~~~ :" + num);
		return "redirect:boardList";
	}
	
	//체크하여 게시글 삭제
		@RequestMapping(value="/boardCheckDelete")
		public @ResponseBody HashMap<String, Object> checkDelete(HttpServletRequest request){
			System.out.println("-------------------------HomeController.java || /checkDelete || 진입");
			Integer num = 0;
			HashMap<String,Object> resMap = new HashMap<String,Object>();
			System.out.println("-------------------------HomeController.java || /checkDelete || start~~~~~ :" + num);
			String chekV = request.getParameter("chk");
			String [] strArray = chekV.split(",");
			for (int i = 0; i < strArray.length; i++) {
				num = Integer.parseInt(strArray[i]);
				boardService.deleteBoard(num);

			}
			System.out.println("-------------------------HomeController.java || /checkDelete || end~~~~~ :" + num);
			resMap.put("result","ok");
	
			
			return resMap;
		}
		
		//게시글 좋아요
		@RequestMapping(value="/boardLike/{num}")
		public @ResponseBody HashMap<String,Object> boardLike(@PathVariable Integer num, HttpSession session){
			
			
			System.out.println("-------------------------HomeController.java || /boardLike || 진입 num : " + num);
			MemberVo member = (MemberVo) session.getAttribute("member");
			System.out.println("-------------------------HomeController.java || /boardLike || 진입 member : " + member);
			Integer memIdx = member.getMemIdx();
			System.out.println("-------------------------HomeController.java || /boardLike || 진입 memIdx : " + memIdx);
			
			BoardLikeVo boardLikeVo = new BoardLikeVo();
			
			boardLikeVo.setMemIdx(memIdx);
			boardLikeVo.setNum(num);
			
			
			HashMap<String,Object> resMap = new HashMap<String,Object>();
			Integer findLike = boardService.boardFindLike(boardLikeVo); // 좋아요 누른 상태 == 1, 아니면 0
			
			if(findLike == 0) { // 좋아요 안 누른 상태
				Integer boardLike = boardService.boardLike(boardLikeVo); // 좋아요 누르기
				Integer boardLikeCount = boardService.boardLikeCount(num);// 좋아요 개수
				
				resMap.put("boardLike", boardLike);
				resMap.put("boardLikeCount", boardLikeCount);
				resMap.put("boardFindLike", findLike);
				
				
				System.out.println("-------------------------HomeController.java || /boardLike || 진입 완료 boardLike : " + boardLike);
				System.out.println("-------------------------HomeController.java || /boardLike || 진입 완료 boardLikeCount : " + boardLikeCount);
				
				
				
				
			}
			//System.out.println("-------------------------HomeController.java || /boardLike || 진입 완료 boardFindLike : " + findLike);
			
			
					
			return resMap;
		}
		
		
		//게시글 좋아요 취소
		@RequestMapping(value="/deleteBoardLike/{num}")
		public @ResponseBody HashMap<String, Object> deleteLike(@PathVariable Integer num, HttpSession session){
			
			HashMap<String, Object> resMap = new HashMap<String, Object>();
			MemberVo member = (MemberVo) session.getAttribute("member");
			Integer memIdx = member.getMemIdx();
			
			BoardLikeVo boardLikeVo = new BoardLikeVo();
			boardLikeVo.setMemIdx(memIdx);
			boardLikeVo.setNum(num);
			
			Integer boardFindLike = boardService.boardFindLike(boardLikeVo);
			
			if(boardFindLike == 1) {
				Integer deleteBoardLike = boardService.boardRemoveLike(boardLikeVo); //좋아요 삭제
				Integer boardLikeCount = boardService.boardLikeCount(num); //좋아요 개수
				
				resMap.put("deleteBoardLike",deleteBoardLike);
				resMap.put("boardLikeCount", boardLikeCount);
				resMap.put("boardFindLike", boardFindLike);
	
				System.out.println("-------------------------HomeController.java || /boardLike || 진입 완료 boardLike : " + deleteBoardLike);
				System.out.println("-------------------------HomeController.java || /boardLike || 진입 완료 boardLikeCount : " + boardLikeCount);
				
				
			}
			
			return resMap;
		}
		
		
		@Autowired
		private ReplyService replyService;
		
		
		//댓글 조회
		@RequestMapping(value="/boards/{num}/replies", method = {RequestMethod.GET})
		public @ResponseBody HashMap<String, Object> getReplyList(@PathVariable("num") Integer num, HttpSession session, Model model, ServletRequest request){
			//Integer memIdx = ((MemberVo) request.getAttribute("member")).getMemIdx();
			
			
			//Integer memIdx = ((MemberVo)session.getAttribute("member")).getMemIdx();//로그아웃시에 댓글 안보였던 원인
			//Integer memIdx = ((MemberVo)((ServletRequest) model).getAttribute("member")).getMemIdx();
			//System.out.println("-------------------------HomeController.java || /getReplyList || 진입 시작 memIdx : " + memIdx);
			HashMap<String, Object> reqMap = new HashMap<String, Object>();
			
			System.out.println("-------------------------HomeController.java || /getReplyList || 진입 과정 reqMap : " + reqMap);
			
			//reqMap.put("memIdx", memIdx);
			reqMap.put("num", num);
			
			List<ReplyVo> replyVoList = replyService.retrieveReplyList(reqMap);
			
			HashMap<String, Object> resMap = new HashMap<String, Object>();
			
			resMap.put("replyList", replyVoList);
			System.out.println("-------------------------HomeController.java || /getReplyList || 진입 완료 replyVoList : " + replyVoList);
			return resMap;
			
			
		}
		
		
		
		//댓글 등록
		@RequestMapping(value="/boards/{num}/replies", method = {RequestMethod.POST})
		public @ResponseBody HashMap<String,Object> regReply(@RequestBody ReplyVo replyVo, @PathVariable("num") Integer num, HttpSession session, Model model, MemberVo memberVo ){	
			
			System.out.println("-------------------------HomeController.java || /regReply || 진입 시작 num : " + num);
			replyVo.setNum(num);
			
			MemberVo member = (MemberVo)session.getAttribute("member");
			
			
			Integer memIdx = member.getMemIdx();
			replyVo.setMemIdx(memIdx);
			
			HashMap<String, Object> reqMap = new HashMap<String, Object>();
			//reqMap.put("memIdx", memIdx);
			reqMap.put("num", num);
			
			//게시글 등록
			replyService.registerReply(replyVo);
			
			
			//게시글 조회
			List<ReplyVo> replyVoList = replyService.retrieveReplyList(reqMap);
			HashMap<String, Object> resMap = new HashMap<String, Object>();
			
			resMap.put("replyList", replyVoList);
			
			System.out.println("-------------------------HomeController.java || /regReply || 진입 완료 replyVoList : " + replyVoList);
			return resMap;
		}


		//댓글 삭제
		@RequestMapping(value="/boards/{num}/replies/{replyIdx}")
		public @ResponseBody Map<String, Object> deleteReply(@PathVariable("num") Integer num, @PathVariable("replyIdx") Integer replyId, HttpSession session){
			int memIdx = ((MemberVo)session.getAttribute("member")).getMemIdx();
			Map<String, Object> reqMap = new HashMap<String, Object>();
			
			reqMap.put("memIdx", memIdx);
			reqMap.put("num", num);
			
			replyService.removeReply(replyId);
			
			List<ReplyVo> replyVoList = replyService.retrieveReplyList(reqMap);
			Map<String, Object> resMap = new HashMap<String, Object>();
			resMap.put("replyList", replyVoList);
			
			return resMap;
		}
				
		//댓글 수정
		@RequestMapping(value="/boards/{num}/replies/{replyIdx}", method = {RequestMethod.PUT})
		public @ResponseBody Map<String, Object> modifyReply(@RequestBody ReplyVo replyVo,
				@PathVariable("num") Integer num, @PathVariable("replyIdx") Integer replyIdx, HttpSession session) {
			System.out.println("-------------------------HomeController.java || /modifyReply || 진입 시작 replyIdx : " + replyIdx);
			logger.info("logger-------------------------HomeController.java || /modifyReply || 진입 시작 replyIdx : " + replyIdx);
			replyVo.setReplyIdx(replyIdx);
			
			
			int memIdx = ((MemberVo)session.getAttribute("member")).getMemIdx();
			Map<String, Object> reqMap = new HashMap<String, Object>();
			
			reqMap.put("memIdx", memIdx);
			reqMap.put("num", num);
			
			replyService.modifyReply(replyVo);
			
			List<ReplyVo> replyVoList = replyService.retrieveReplyList(reqMap);
			Map<String, Object> resMap = new HashMap<String, Object>();
			
			resMap.put("replyList",replyVoList );
			
			
			return resMap;
		}
		
	
}
