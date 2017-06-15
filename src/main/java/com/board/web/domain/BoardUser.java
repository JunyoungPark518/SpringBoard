package com.board.web.domain;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import lombok.*;

@Component @Data @Lazy
public class BoardUser {
	String id, pass, phone, gender, age;
}
