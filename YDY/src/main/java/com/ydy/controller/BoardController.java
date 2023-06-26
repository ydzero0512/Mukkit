package com.ydy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.ydy.domain.RestVO;
import com.ydy.service.RestService;

@Controller
@RequestMapping(value = "/yummy/*")

public class BoardController {
	
	//서비스 객체 주입 
	@Autowired
	private RestService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	//	글쓰기 - http://localhost:8088/yummy/insertRes (GET)
	@RequestMapping(value = "/insertRes", method = RequestMethod.GET)
	public void insertResGET() throws Exception{
		logger.debug(" insertResGET()호출!");
		logger.debug(" /board/insertRes.jsp페이지이동");
	}
	

	//	글쓰기 - http://localhost:8088/yummy/writeRes (GET)
	@RequestMapping(value = "/writeRes", method = RequestMethod.GET)
	public void writeResGET() throws Exception{
		logger.debug(" insertResGET()호출!");
		logger.debug(" /board/insertRes.jsp페이지이동");
	}
	
	//	글쓰기 - http://localhost:8088/yummy/writeRes (GET)
	@RequestMapping(value = "/writeRes", method = RequestMethod.POST)
	public void writeResPOST(RestVO vo) throws Exception{
		logger.debug(" insertResPOST()호출!");
		logger.info("vo:"+vo);
		
		
		service.insertRset(vo);
		
		logger.debug(" /board/insertRes.jsp페이지이동");
	}
	
	@RequestMapping(value = "/restList", method = RequestMethod.GET)
	public void restListGET(Model model) throws Exception {
	    logger.debug("restListGET() 호출!");
	    List<RestVO> restList = service.selectRest();
	    model.addAttribute("restList",restList);
	}
	


	
	 
}
