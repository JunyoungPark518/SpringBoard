package com.board.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.board.web.service.DeleteService;

@RestController
public class DeleteController {
	@Autowired DeleteService deleteService;
	
}
