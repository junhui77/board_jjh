package com.example.board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.board.dao.BoardDao;
import com.example.board.vo.BoardLikeVo;
import com.example.board.vo.BoardVo;

@Service
public class BoardServiceImplement implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVo> boardList(HashMap<String, Object> reqMap){
		System.out.print("-------------------------------------BoardServiceImpllement: boardList():" +reqMap + "---------------");
		return boardDao.boardList(reqMap);
	}
	
	@Override
	public BoardVo boardDetail(Integer num){
		System.out.print("-------------------------------------BoardServiceImpllement: boardDetail():" +num + "---------------");
		return boardDao.boardDetail(num);
	}
	
	@Override
	public void registerBoard(BoardVo board) {
		boardDao.registerBoard(board);
	}
	
	@Override
	public void updateBoard(BoardVo board) {
		boardDao.updateBoard(board);
	}
	
	@Override
	public void deleteBoard(Integer num) {
		boardDao.deleteBoard(num);
	}

	public Integer boardListCount(HashMap<String, Object> reqMap) {
		
		return boardDao.boardListCount(reqMap);
	}

	@Override
	public Integer plusViewCount(Integer num) {
		return boardDao.updateViewCount(num);
		
	}
	
	@Override
	public Integer boardLike(BoardLikeVo boardLike) {
		return boardDao.boardLike(boardLike);
	}
	
	
	@Override
	public Integer boardFindLike(BoardLikeVo findLike) {
		return boardDao.boardFindLike(findLike);
	}
	
	
	@Override
	public Integer boardLikeCount(Integer num) {	
		return boardDao.boardLikeCount(num);
	}
	
	@Override
	public Integer boardRemoveLike(BoardLikeVo boardLikeVo) {
		
		return boardDao.boardRemoveLike(boardLikeVo);
	}
	
	 


	

	
	
}
