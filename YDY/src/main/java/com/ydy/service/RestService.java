package com.ydy.service;

import java.util.List;

import com.ydy.domain.PageVO;
import com.ydy.domain.RestVO;


public interface RestService {
	//Board에서 수행하는 동작 선언
	
	//글쓰기 -  Create
	public void insertRset(RestVO vo) throws Exception;
	
	//페이징처리x 전체리스트
	public List<RestVO> selectRest() throws Exception;
	
	//페이징처리
	public List<RestVO> readBoardList(Integer page) throws Exception;
	
	//페이징처리된 리스트
	public List<RestVO> getBoardListPage(PageVO vo) throws Exception;
	
	//글 수 가져오기
	public int getTotalCount(PageVO vo) throws Exception; 
	
	//특정글보기
	public RestVO selectRead(String rest_id) throws Exception;
	
	// 글삭제
	public void deleteList(String rest_id) throws Exception;
	
	// 글수정
	public void updateList(RestVO vo) throws Exception;

}
