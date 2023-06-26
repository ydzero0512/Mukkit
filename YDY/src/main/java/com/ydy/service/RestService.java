package com.ydy.service;

import java.util.List;


import com.ydy.domain.RestVO;


public interface RestService {
	//Board에서 수행하는 동작 선언
	
	//글쓰기 -  Create
	public void insertRset(RestVO vo) throws Exception;
	
	public List<RestVO> selectRest() throws Exception;
	

}
