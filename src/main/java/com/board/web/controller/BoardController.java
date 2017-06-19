package com.board.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.board.web.domain.Article;
import com.board.web.service.GetService;
import com.board.web.service.PostService;

@Controller
@SessionAttributes("context")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	GetService getService;
	@Autowired
	PostService postService;
	@Autowired
	Article article;

	@RequestMapping(value = "/list/{pageNo}", method = RequestMethod.POST)
	public String board(
			@PathVariable String pageNo, 
			Model model) throws Exception {
		logger.info("BoardController - board() {}", "POST");
		Map<String, Object> map = new HashMap<>();
		map.put("group", "Article");
//		int pageNumber = Integer.parseInt("1");
		int pageNumber = Integer.parseInt(pageNo);
		// int theNumberOfRows = getService.getArticleList(map).size();
		int theNumberOfRows = getService.count(map);
		System.out.println("theNumberOfRows:    " + theNumberOfRows);
		int pagesPerOneBlock = 5, rowsPerOnePage = 5,
				theNumberOfPages = (theNumberOfRows % rowsPerOnePage == 0) ? theNumberOfRows / rowsPerOnePage
						: theNumberOfRows / rowsPerOnePage + 1,
				startPage = pageNumber - ((pageNumber - 1) % pagesPerOneBlock),
				endPage = ((startPage + rowsPerOnePage - 1) < theNumberOfPages) ? startPage + pagesPerOneBlock - 1
						: theNumberOfPages,
				startRow = (pageNumber - 1) * rowsPerOnePage + 1, endRow = pageNumber * rowsPerOnePage,
				prevBlock = startPage - pagesPerOneBlock, nextBlock = startPage + pagesPerOneBlock;
		List<Article> list = new ArrayList<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		list = getService.getArticleList(map);
		model.addAttribute("list", list);
		model.addAttribute("theNumberOfRows", theNumberOfRows);
		model.addAttribute("nextBlock", nextBlock);
		model.addAttribute("prevBlock", prevBlock);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("theNumberOfPages", theNumberOfPages);
		model.addAttribute("result", "SUCCESS");
		return "board:list";
	}
}
