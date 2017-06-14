package com.board.web.domain;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.*;

@Component @Data @Lazy
public class Article {
	String seq, id, title, content, regdate, readCount;
}
