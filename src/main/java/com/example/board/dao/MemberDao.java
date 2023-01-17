package com.example.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.board.vo.MemberVo;


@Repository
public class MemberDao {

	@Autowired
	SqlSessionTemplate tpl;
	
	public MemberVo loginCheck(HashMap<String, Object> reqMap) {
		
		return tpl.selectOne("memberDao.loginCheck", reqMap);
	}
	
	public Integer idCheck(String memId) {
		Integer idCheckCnt = tpl.selectOne("memberDao.idCheck", memId);
		return idCheckCnt;
	} 
	
	public Integer pwdCheck(String memPwd) {
			
		return tpl.selectOne("memeberDao.pwdCheck", memPwd);
	} 
	
	public List<MemberVo> memberList(HashMap<String, Object> reqMap){
		return tpl.selectList("memberDao.memberList",reqMap);
	}
	

	public Integer memberListCount(HashMap<String, Object> reqMap) {
		
		return tpl.selectOne("memberDao.memberListCount",reqMap);
	}
	
	public void registerMember(MemberVo member) {
		tpl.insert("memberDao.registerMember", member);
	}

	public MemberVo memberDetail(Integer memIdx) {
		System.out.println("-------------------------------------MemberDao: memberDetail():" + memIdx + "---------------");
		return tpl.selectOne("memberDao.memberDetail",memIdx);
	}

	public void updateMember(MemberVo member) {
		tpl.update("memberDao.updateMember",member);
	}

	public void deleteMember(Integer memIdx) {
		tpl.delete("memberDao.deleteMember", memIdx);
		
	}

	
}
