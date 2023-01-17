package com.example.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.board.vo.BoardLikeVo;
import com.example.board.vo.BoardVo;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate tpl;
	
	public List<BoardVo> boardList(HashMap<String, Object> reqMap){
		System.out.println("-------------------------------------BoardDao: boardList():" +reqMap + "---------------");
		return tpl.selectList("boardDao.boardList", reqMap);
	} 
	
	public BoardVo boardDetail(Integer num){
		System.out.println("-------------------------------------BoardDao: boardDetail():" +num + "---------------");
		return tpl.selectOne("boardDao.boardDetail", num);
	} 
	
	public void registerBoard(BoardVo board) {
		System.out.println("-------------------------HomeController.java || /registerForm || register dao start~~~~~");
		tpl.insert("boardDao.registerBoard", board);
	}
	
	public void updateBoard(BoardVo board) {
		tpl.update("boardDao.updateBoard", board);
	}
	
	public void deleteBoard(Integer num) {
		tpl.delete("boardDao.deleteBoard", num);
	}

	public Integer boardListCount(HashMap<String, Object> reqMap) {
		Integer totalCnt = tpl.selectOne("boardDao.boardListCount", reqMap);
		return totalCnt;
	}

	public Integer updateViewCount(Integer num) {
		Integer boardCount = tpl.update("boardDao.updateViewCount",num);
		return boardCount;
	}
	
	
	public int boardLike(BoardLikeVo like) {
		return tpl.insert("boardDao.boardLike",like);
	}
	

	public Integer boardFindLike(BoardLikeVo findLike) {
		return tpl.selectOne("boardDao.boardFindLike", findLike);
	}

	public Integer boardLikeCount(Integer num) {
		return tpl.selectOne("boardDao.boardLikeCount",num);
	}

	public Integer boardRemoveLike(BoardLikeVo like) {
		
		return tpl.delete("boardDao.boardLikeDelete",like);
	}

	

	

	
	
	
	
}
