package com.ydy.service;

import java.util.List;


import com.ydy.domain.RestVO;


public interface RestService {
	//Board에서 수행하는 동작 선언
	
	//글쓰기 -  Create
	public void insertRset(RestVO vo) throws Exception;
	
	//전체리스트
	public List<RestVO> selectRest() throws Exception;
	
	//특정글보기
	public RestVO selectRead(String rest_id) throws Exception;
	
	// 글삭제
	public void deleteList(String rest_id) throws Exception;

}
