package com.example.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.board.vo.ReplyVo;

@Repository
public class ReplyDao {
	
	@Autowired
	SqlSessionTemplate tpl;
	
	
	public List<ReplyVo> replyList(Map<String, Object> reqMap) {
			
			return tpl.selectList("replyDao.replyList", reqMap);
		}


	public void registerReply(ReplyVo reply) {
		
		tpl.insert("replyDao.registerReply", reply);
	}
	
	public int removeReply(int replyIdx) {
		
		return	tpl.delete("replyDao.deleteReply",replyIdx);
		
	}


	public int updateReply(ReplyVo replyIdx) {
		
		return tpl.update("replyDao.updateReply",replyIdx);
	}


	
}
