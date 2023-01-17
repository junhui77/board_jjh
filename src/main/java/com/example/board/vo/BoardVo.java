package com.example.board.vo;



import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class BoardVo {
	
	private int rowNum;
	private Integer num;
	private String title;
	private String writer;
	private String content;
	
	
	private Date regdate;
	private Date updateDate;
	private String writeDate;
	private int boardLike;
	private int cnt;
	

	public BoardVo(int rowNum, Integer num, String title, String writer, String content, Date regdate, Date updateDate,
			String writeDate, int boardLike, int cnt) {
		super();
		this.rowNum = rowNum;
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.updateDate = updateDate;
		this.writeDate = writeDate;
		this.boardLike = boardLike;
		this.cnt = cnt;
	}





	public int getRowNum() {
		return rowNum;
	}





	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}





	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}






	public Integer getNum() {
		return num;
	}





	public void setNum(Integer num) {
		this.num = num;
	}





	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public Date getUpdateDate() {
		return updateDate;
	}



	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}



	public String getWriteDate() {
		return writeDate;
	}



	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}



	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
	}





	public int getBoardLike() {
		return boardLike;
	}





	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}

	
	
	
	
	
	
}
