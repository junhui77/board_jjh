package com.example.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.board.vo.ReplyVo;

public interface ReplyService {

	//댓글 조회
	public List<ReplyVo> retrieveReplyList(Map<String, Object> reqMap);
	
	//댓글 등록
	public void registerReply(ReplyVo replyVo);
	
	//댓글 삭제
	public int removeReply(int replyId);
	
	//댓글 수정
	public int modifyReply(ReplyVo replyVo);
	
	
}
