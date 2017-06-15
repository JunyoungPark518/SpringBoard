package com.board.web.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.board.web.domain.Article;

@Repository
public interface Mapper {
	public List<Article> getArticleList(Map<?,?> map) throws Exception;
}