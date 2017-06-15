DROP TABLE Article;
DROP TABLE BoardUser;
DROP SEQUENCE seq;

-- CREATE SEQUENCE seq
CREATE SEQUENCE seq
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;

-- CREATE
CREATE TABLE BoardUser (
	id VARCHAR2(10) NOT NULL,
	pass VARCHAR2(20) NOT NULL,
	phone VARCHAR2(15) NOT NULL,
	gender VARCHAR2(1) NOT NULL,
	age VARCHAR2(2) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE Article (
	seq DECIMAL NOT NULL,
	id VARCHAR2(10) NOT NULL,
	title VARCHAR2(30) NOT NULL,
	content VARCHAR2(1000) NOT NULL,
	regdate VARCHAR2(30) NOT NULL,
	readCount VARCHAR2(5) NOT NULL,
	PRIMARY KEY(seq),
	CONSTRAINT fk_column
    FOREIGN KEY (id)
    REFERENCES BoardUser(id)
);

ALTER TABLE Article
ADD CONSTRAINT FK_User FOREIGN KEY (id)
REFERENCE BoardUser(id);


SELECT * FROM BoardUser;
DELETE FROM BoardUser WHERE id = 'test';

-- INSERT 
INSERT INTO BoardUser(id, pass, phone, gender, age) VALUES ('admin', '1234', '010-2206-8900', 'M', '28');
INSERT INTO BoardUser(id, pass, phone, gender, age) VALUES ('babungv', '1234', '010-2206-8900', 'M', '28');


INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi2','Hello my friends2',sysdate,'3');

-- QUERY FOR Pagination
SELECT *
	FROM (
	SELECT @NO := @NO + 1 AS ROWNUM, A.*
	FROM
	  (
	    SELECT *
	    FROM Article
	  ) A,
	  ( SELECT @NO := 0 ) B 
	  ORDER BY seq DESC
	) C
	WHERE C.ROWNUM BETWEEN 1 AND 5;