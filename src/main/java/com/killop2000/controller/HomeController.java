package com.killop2000.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.killop2000.domain.BoardVO;
import com.killop2000.domain.Criteria;
import com.killop2000.service.BoardService;

@Controller
public class HomeController {
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		Criteria newCri = new Criteria();
		newCri.setPerPageNum(5);
		List<BoardVO> newBoardList = boardService.listCriteria(newCri);
		List<BoardVO> hotBoardList = boardService.listHot(newCri);
		
		model.addAttribute("newBoardList", newBoardList);
		model.addAttribute("hotBoardList", hotBoardList);
		
		return "home";
	}
	
}
