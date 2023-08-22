package com.ydy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydy.domain.PageVO;
import com.ydy.domain.RestVO;
import com.ydy.persistence.RestDAO;

@Service
public class RestServiceImpl implements RestService{

	@Autowired
	private RestDAO rdao;

	@Override
	public void insertRset(RestVO vo) throws Exception {
		rdao.insertRset(vo);
		
	}

	@Override
	public List<RestVO> selectRest() throws Exception {
	
		return rdao.selectRest();
	}

	@Override
	public RestVO selectRead(String rest_id) throws Exception {
	
		return rdao.selectRead(rest_id);
	}

	@Override
	public void deleteList(String rest_id) throws Exception {
		rdao.deleteList(rest_id);
		
	}

	@Override
	public List<RestVO> readBoardList(Integer page) throws Exception {
	
		return rdao.readBoardList(page);
	}

	@Override
	public List<RestVO> getBoardListPage(PageVO vo) throws Exception {
		
		return rdao.getBoardListPage(vo);
	}

	@Override
	public int getTotalCount(PageVO vo) throws Exception {
		
		return rdao.getTotalCount(vo);
	}

	@Override
	public void updateList(RestVO vo) throws Exception {
		rdao.updateList(vo);
		
	}


}
