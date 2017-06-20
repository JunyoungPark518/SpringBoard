package com.board.web.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.board.web.domain.Article;
import com.board.web.domain.BoardUser;
import com.board.web.service.GetService;
import com.board.web.service.PostService;

@Controller
@SessionAttributes("permission")
public class PermissionController {
	private static final Logger logger = LoggerFactory.getLogger(PermissionController.class);
	@Autowired
	GetService getService;
	@Autowired
	PostService postService;
	@Autowired
	Article article;
	@Autowired BoardUser user;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(
			@RequestParam("userId") String userId, @RequestParam("pass") String pass,
			Model model, HttpSession session) throws Exception {
		logger.info("PermissionController - login() {}", "POST");
		Map<String, Object> map = new HashMap<>();
		map.put("id", userId);
		map.put("group", "BoardUser");
		int exist = getService.exist(map);
		String movePosition = "public:index";
		if(exist==0){
			model.addAttribute("result", "ID is not existed");
		} else {
			user = getService.getUser(map).get(0);
			if(pass.equals(user.getPass())){
				session.setAttribute("permission", user);
				model.addAttribute("result", "SUCCESS");
				model.addAttribute("userId", user.getId());
				movePosition = "user:main";
			} else {
				model.addAttribute("result", "Password is not matched");
			}
		}
		return movePosition;
	}
	
	@RequestMapping(value = "/register/finished", method = RequestMethod.POST)
	public String register(
			@RequestParam("userId") String userId, @RequestParam("age") String age, 
			@RequestParam("phone") String phone, @RequestParam("pass") String pass, 
			Model model) throws Exception {
		logger.info("PermissionController - login() {}", "POST");
		Map<String, Object> map = new HashMap<>();
		map.put("id", userId);
		map.put("age", age);
		map.put("phone", phone);
		map.put("pass", pass);
		int execute = postService.register(map);
		String movePosition = "user:register";
		if(execute==1){
			movePosition = "public:index";
			model.addAttribute("success","Success");
		}
		return movePosition;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 성공");
		session.invalidate();
		return "redirect:/";
	}
}
