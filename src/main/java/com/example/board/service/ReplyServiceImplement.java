package com.example.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.board.dao.ReplyDao;
import com.example.board.vo.ReplyVo;

@Service
public class ReplyServiceImplement implements ReplyService {

	@Autowired
	private ReplyDao replyDao;

	//댓글 조회
	@Override
	public List<ReplyVo> retrieveReplyList(Map<String, Object> reqMap) {
		
		return replyDao.replyList(reqMap);
	}
	
	//댓글 등록
	@Transactional
	@Override
	public void registerReply(ReplyVo replyVo) {
		
		replyDao.registerReply(replyVo);
		
	}

	
	//댓글 삭제
	@Transactional
	@Override
	public int removeReply(int replyIdx) {
		
		return replyDao.removeReply(replyIdx);
		
	}
	
	//댓글 수정
	@Transactional
	@Override
	public int modifyReply(ReplyVo replyIdx) {
		
		return replyDao.updateReply(replyIdx);
		
	}
	
}
