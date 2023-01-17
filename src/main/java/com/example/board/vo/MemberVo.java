package com.example.board.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class MemberVo {
	private Integer rowNum;
	private Integer memIdx;
	private String memId;
	private String memName;
	private String memPwd;
	private String memAuth;
	private String memGender;
	private String memPhone;
	private String memEmail;
	private String memIp;
	
	
	private String registDate;
	private String updateDate;
	private String registId;
	private String updateIp;
	
	







	public MemberVo(Integer rowNum, Integer memIdx, String memId, String memName, String memPwd, String memAuth,
			String memGender, String memPhone, String memEmail, String memIp, String registDate, String updateDate,
			String registId, String updateIp) {
		super();
		this.rowNum = rowNum;
		this.memIdx = memIdx;
		this.memId = memId;
		this.memName = memName;
		this.memPwd = memPwd;
		this.memAuth = memAuth;
		this.memGender = memGender;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.memIp = memIp;
		this.registDate = registDate;
		this.updateDate = updateDate;
		this.registId = registId;
		this.updateIp = updateIp;
	}





	public MemberVo() {
		
	}
	
	
	
	

	public String getUpdateIp() {
		return updateIp;
	}





	public void setUpdateIp(String updateIp) {
		this.updateIp = updateIp;
	}





	public String getRegistId() {
		return registId;
	}




	public void setRegistId(String registId) {
		this.registId = registId;
	}




	public Integer getRowNum() {
		return rowNum;
	}

	public void setRowNum(Integer rowNum) {
		this.rowNum = rowNum;
	}

	public Integer getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(Integer memIdx) {
		this.memIdx = memIdx;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemAuth() {
		return memAuth;
	}
	public void setMemAuth(String memAuth) {
		this.memAuth = memAuth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemIp() {
		return memIp;
	}
	public void setMemIp(String memIp) {
		this.memIp = memIp;
	}





	public String getRegistDate() {
		return registDate;
	}





	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}





	public String getUpdateDate() {
		return updateDate;
	}





	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	
	
	
	
	
	
	
	
}
