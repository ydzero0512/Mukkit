package com.ydy.persistence;

import java.util.List;

import com.ydy.domain.RestVO;

public interface RestDAO {
	// Board관련  db동작 선언/호출
	
	// 글쓰기-C
	public void insertRset(RestVO vo) throws Exception;
	
	public List<RestVO> selectRest() throws Exception;
	

}
