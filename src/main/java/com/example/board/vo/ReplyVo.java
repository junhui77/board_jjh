package com.example.board.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class ReplyVo {
	private Integer replyIdx;
	private String replyContent;
	private String replyRegdate;
	private Integer num;
	private Integer memIdx;
	private String memId;
	

	
	
	

	public ReplyVo(Integer replyIdx, String replyContent, String replyRegdate, Integer num, Integer memIdx,
			String memId) {
		super();
		this.replyIdx = replyIdx;
		this.replyContent = replyContent;
		this.replyRegdate = replyRegdate;
		this.num = num;
		this.memIdx = memIdx;
		this.memId = memId;
	}


	public ReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public Integer getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(Integer replyIdx) {
		this.replyIdx = replyIdx;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(Integer memIdx) {
		this.memIdx = memIdx;
	}
	

	
}
