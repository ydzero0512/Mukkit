package com.ydy.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
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
	public String writeResPOST(RestVO vo) throws Exception{
		// 파일 업로드 처리
		String file_name=null;
		MultipartFile upload = vo.getUpload();
		if (!upload.isEmpty()) {
			String originalFileName = upload.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			file_name=uuid+"."+ext;
			upload.transferTo(new File("C:\\Users\\ydyd0\\git\\Mukkit\\YDY\\src\\main\\webapp\\resources\\photo\\"+file_name));
		}
		vo.setFile_name(file_name);
		
		logger.debug(" insertResPOST()호출!");
		logger.info("vo:"+vo);
		
		
		service.insertRset(vo);
		
		logger.debug(" /yummy/restList.jsp페이지이동");
		
		return "redirect:/yummy/restList2";
		
	}
	
	@RequestMapping(value = "/restList", method = RequestMethod.GET)
	public void restListGET(Model model) throws Exception {
	    logger.debug("restListGET() 호출!");
	    List<RestVO> restList = service.selectRest();
	    model.addAttribute("restList",restList);
	}
	
	@RequestMapping(value = "/restList2", method = RequestMethod.GET)
	public void restList2GET(Model model) throws Exception {
	    logger.debug("restListGET() 호출!");
	    List<RestVO> restList = service.selectRest();
	    model.addAttribute("restList",restList);
	}
	
	@RequestMapping(value = "/restRead", method = RequestMethod.GET)
	public void restReadGET(@RequestParam("rest_id") String rest_id,Model model) throws Exception {
	    logger.debug("restReadGET() 호출!");
	   
	    model.addAttribute("vo", service.selectRead(rest_id));
	}
	
	@RequestMapping(value = "/deleteList", method = RequestMethod.POST)
	public String deleteListPOST(HttpServletRequest req) throws Exception {
		 logger.debug("@@@@@deletePOST() 호출!");
		String[] idArr = req.getParameterValues("valArr");
		
		for(int i=0;i<idArr.length;i++) {
			service.deleteList(idArr[i]);
			logger.debug("입고취소 완료 : "+idArr[i]);
		}
		return "redirect:/yummy/restList2";
		
	}
	
	
	 
}
