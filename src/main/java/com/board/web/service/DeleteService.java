package com.board.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.mapper.Mapper;

@Service
public class DeleteService {
	@Autowired Mapper mapper;
}
