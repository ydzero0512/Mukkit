package com.ydy.persistence;

import java.util.List;

import com.ydy.domain.PageVO;
import com.ydy.domain.RestVO;

public interface RestDAO {
	// Board관련  db동작 선언/호출
	
	// 글쓰기-C
	public void insertRset(RestVO vo) throws Exception;
	
	// 전체리스트 
	public List<RestVO> selectRest() throws Exception;
	
	public List<RestVO> readBoardList(Integer page) throws Exception;
	
	public List<RestVO> getBoardListPage(PageVO vo) throws Exception;
	
	public int getTotalCount(PageVO vo) throws Exception; 
	
	
	// 특정글 보기
	public RestVO selectRead(String rest_id) throws Exception;
	
	// 글삭제
	public void deleteList(String rest_id) throws Exception;
	
	// 글수정
	public void updateList(RestVO vo) throws Exception;
}
