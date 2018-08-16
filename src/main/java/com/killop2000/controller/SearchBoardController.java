package com.killop2000.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.killop2000.domain.BoardVO;
import com.killop2000.domain.PageMaker;
import com.killop2000.domain.SearchCriteria;
import com.killop2000.service.BoardService;
import com.killop2000.service.ReplyService;

@Controller
@RequestMapping("/freeBoard/*")
public class SearchBoardController {
	@Inject
	private BoardService boardService;
	@Inject
	private ReplyService replyService;
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		
		model.addAttribute("list",boardService.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCnt(boardService.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/hotList", method=RequestMethod.GET)
	public void hotListPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		
		model.addAttribute("list", boardService.listHot(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCnt(boardService.hotListSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("boardNumber") int boardNumber, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		boardService.increaseCnt(boardNumber);
		
		model.addAttribute("replies", replyService.listReplyPage(boardNumber, cri));
		model.addAttribute(boardService.read(boardNumber));
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("boardNumber") int boardNumber, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		boardService.remove(boardNumber);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/freeBoard/list";
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyPagingGET(int boardNumber, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(boardService.read(boardNumber));
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		boardService.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/freeBoard/list";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("register get ...");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("register post ...");
		logger.info(board.toString());

		boardService.register(board);

		rttr.addFlashAttribute("msg", "success");

		return "redirect:/freeBoard/list";
	}
}
