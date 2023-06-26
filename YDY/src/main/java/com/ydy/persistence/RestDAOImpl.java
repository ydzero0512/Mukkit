package com.ydy.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.ydy.domain.RestVO;


@Repository
public class RestDAOImpl implements RestDAO {
	
	// 디비연결정보, mapper접근 => SqlSession객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger
	= LoggerFactory.getLogger(RestDAOImpl.class);

	private static final String NAMESPACE ="com.ydy.mapper.RestMapper";

	@Override
	public void insertRset(RestVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".create",vo);
		
	}

	@Override
	public List<RestVO> selectRest() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getList");
	}
	

	 
	
}
