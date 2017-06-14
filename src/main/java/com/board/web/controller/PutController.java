package com.board.web.controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.board.web.service.PutService;
import com.board.web.util.Util;

@RestController
public class PutController {
	private static final Logger logger = LoggerFactory.getLogger(PutController.class);
	@Autowired PutService putService;
	
}
