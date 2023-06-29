package com.ydy.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	public void writeResPOST(RestVO vo) throws Exception{
		/*
		 * if(!upload.getOriginalFilename().equals("")) { // 파일명 수정 작업 후 서버에 업로드
		 * ("flower.png" => "20220118103646521.png")
		 * 
		 * String originName = upload.getOriginalFilename(); // "flower.png"
		 * 
		 * String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new
		 * Date()); // "202201181036" int ranNum = (int)(Math.random() * 90000 + 10000);
		 * // 46521 (5자리랜덤값) String ext =
		 * originName.substring(originName.lastIndexOf(".")); // ".png"
		 * 
		 * String changeName = currentTime + ranNum + ext;
		 * 
		 * // 업로드한 파일을 보관할 폴더의 물리적인 경로 알아내어 파일을 changeName의 이름으로 저장 // 물리적인 경로는 세션객체를 먼저
		 * 얻어내서 겟리얼패스메소드까지 호출 String savePath =
		 * session.getServletContext().getRealPath("/resources/photo/");
		 * 
		 * try { upload.transferTo(new File(savePath + changeName)); } catch
		 * (IllegalStateException | IOException e) { e.printStackTrace(); }
		 * 
		 * vo.setOri_name(originName);
		 * vo.setChange_name("/resources/photo/"+changeName);
		 * 
		 * }
		 */
		
		logger.debug(" insertResPOST()호출!");
		logger.info("vo:"+vo);
		
		
		service.insertRset(vo);
		
		logger.debug(" /yummy/restList.jsp페이지이동");
		

		
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

	
	 
}
