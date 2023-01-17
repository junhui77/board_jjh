package com.example.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.dao.MemberDao;
import com.example.board.vo.MemberVo;

@Service
public class MemberServiceImplement implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public MemberVo loginCheck(HashMap<String, Object> reqMap) {
		return memberDao.loginCheck(reqMap);
	}

	@Override
	public Integer idCheck(String memId) {
		
		return memberDao.idCheck(memId);
	}

	@Override
	public Integer pwdCheck(String memPwd) {
		
		return memberDao.pwdCheck(memPwd);
	}
	
	@Override
	public List<MemberVo> memberList(HashMap<String, Object> reqMap){
		return memberDao.memberList(reqMap);
	}
	
	@Override
	public Integer memberListCount(HashMap<String, Object> reqMap) {
		
		return memberDao.memberListCount(reqMap);
	}
	
	@Override
	public void registerMember(MemberVo member) {
		memberDao.registerMember(member);
	}
	
	@Override
	public MemberVo memberDetail(Integer memIdx) {
		
		return memberDao.memberDetail(memIdx);
	}

	public void updateMember(MemberVo member) {
		memberDao.updateMember(member);
		
	}

	public void deleteMember(Integer memIdx) {
		memberDao.deleteMember(memIdx);
		
	}

}
