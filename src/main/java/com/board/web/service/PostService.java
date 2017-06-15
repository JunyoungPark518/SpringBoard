package com.board.web.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.mapper.Mapper;

@Service
public class PostService {
	@Autowired
	Mapper mapper;
	public Object register(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.getArticleList(map);
		return service.execute(paramMap);
	}
	
	public Object write(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.getUser(map);
		return service.execute(paramMap);
	}
}
