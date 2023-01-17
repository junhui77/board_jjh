package com.example.board.service;

import java.util.HashMap;
import java.util.List;

import com.example.board.vo.MemberVo;

public interface MemberService {
	public MemberVo loginCheck(HashMap<String, Object> reqMap);
	public Integer idCheck(String memId);
	public Integer pwdCheck(String memPwd);
	public void registerMember(MemberVo member);
	public List<MemberVo> memberList(HashMap<String, Object> reqMap);
	public Integer memberListCount(HashMap<String, Object> reqMap);
	public MemberVo memberDetail(Integer memIdx);
	

	
}
