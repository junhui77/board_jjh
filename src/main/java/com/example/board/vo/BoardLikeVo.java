package com.example.board.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class BoardLikeVo {
	private Integer likeIdx;
	private Integer num;
	private Integer memIdx;
	
	public Integer getLikeIdx() {
		return likeIdx;
	}
	public void setLikeIdx(Integer likeIdx) {
		this.likeIdx = likeIdx;
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
