package com.example.board.service;

import java.util.HashMap;
import java.util.List;

import com.example.board.vo.BoardLikeVo;
import com.example.board.vo.BoardVo;

public interface BoardService {
	
	public List<BoardVo> boardList(HashMap<String, Object> reqMap);
	public BoardVo boardDetail(Integer num);
	public void registerBoard(BoardVo board);
	public void updateBoard(BoardVo board);
	public void deleteBoard(Integer num);
	Integer plusViewCount(Integer num);
	Integer boardLike(BoardLikeVo boardLike);
	Integer boardLikeCount(Integer num);
	Integer boardFindLike(BoardLikeVo findLike);
	Integer boardRemoveLike(BoardLikeVo boardLikeVo);
	
	

}
