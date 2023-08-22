package com.ydy.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ydy.domain.PageVO;
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
		return sqlSession.selectList(NAMESPACE+".getMapList");
	}

	@Override
	public List<RestVO> readBoardList(Integer page) throws Exception {
		logger.debug("  readBoardListPage(Integer page) 호출!");
		
		if(page<=0) {
			page=1;
		} //페이지에 따른 위치 인덱스 계산
		// page=1 -> 0번부터 2-> 10번부터 3->20번부터 
		page = (page - 1)*10;
		
		return sqlSession.selectList(NAMESPACE+".getList",page);
	}

	@Override
	public List<RestVO> getBoardListPage(PageVO vo) throws Exception {
		logger.debug("  getBoardListPage(PageVO vo) 호출!");
		
		return sqlSession.selectList(NAMESPACE+".getList",vo);
	}

	@Override
	public int getTotalCount(PageVO vo) throws Exception {
		logger.debug("  getTotalCount() 호출!");
		return sqlSession.selectOne(NAMESPACE+".totalCnt",vo);
	}
	

	@Override
	public RestVO selectRead(String rest_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getRead",rest_id);
	}

	@Override
	public void deleteList(String rest_id) throws Exception {
		logger.debug("deleteList(String rest_id) 호출!");
		sqlSession.delete(NAMESPACE+".deleteList",rest_id);
		
	}

	@Override
	public void updateList(RestVO vo) throws Exception {
		logger.debug("updateList(Integer rest_id) 호출!");
		sqlSession.update(NAMESPACE+".updateList",vo);
		
	}
	

	 
	
}
