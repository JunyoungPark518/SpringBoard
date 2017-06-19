package com.board.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.board.web.composite.Complex;
import com.board.web.mapper.Mapper;

@Controller
@SessionAttributes("context")
public class HomeController {
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   @Autowired Mapper mapper;
   @RequestMapping("/")
   public String home(Model model) {
      logger.info("HomeController home() {}","ENTER");
      model.addAttribute("context", Complex.ContextFactory.create());
      return "public:index";
   }
   @RequestMapping("/web")
   public String main(Model model) {
      logger.info("HomeController main() {}","ENTER");
      model.addAttribute("context", Complex.ContextFactory.create());
      return "public:index";
   }
   @RequestMapping("/list")
   public String board(Model model) {
	   logger.info("HomeController board() {}","ENTER");
	   model.addAttribute("context", Complex.ContextFactory.create());
	   return "board:list";
   }
   @RequestMapping("/write")
   public String write(Model model) {
	   model.addAttribute("context", Complex.ContextFactory.create());
	   return "board:write";
   }
   @RequestMapping("/register")
   public String register(Model model) {
	   model.addAttribute("context", Complex.ContextFactory.create());
	   return "user:register";
   }
}