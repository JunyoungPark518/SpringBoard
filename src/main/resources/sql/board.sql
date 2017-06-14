DROP TABLE Article;
DROP SEQUENCE seq;

-- CREATE SEQUENCE seq
CREATE SEQUENCE seq
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;


-- String seq, id, title, content, regdate, readCount;
-- CREATE
CREATE TABLE Article (
	seq DECIMAL NOT NULL,
	id VARCHAR2(10) NOT NULL,
	title VARCHAR2(30) NOT NULL,
	content VARCHAR2(1000) NOT NULL,
	regdate VARCHAR2(30) NOT NULL,
	readCount VARCHAR2(5) NOT NULL,
	PRIMARY KEY(seq)
);

-- INSERT 
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Hi','Hello my friends', sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Second','MY SECOND ARTICLE',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Third','MY THIRD ARTICLE',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Forth','MY FOUTH ARTICLE',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'babungv','Fifth','MY FIFTH ARTICLE',sysdate,'2');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'admin','Hi2','Hello my friends2',sysdate,'3');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'kkk','Second2','MY SECOND ARTICLE2',sysdate,'5');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'pjy','Third2','MY THIRD ARTICLE2',sysdate,'7');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'yhs','Forth2','MY FOUTH ARTICLE2',sysdate,'4');
INSERT INTO Article(seq, id, title, content, regdate, readCount) VALUES (seq.nextval, 'byj','Fifth2','MY FIFTH ARTICLE2',sysdate,'2');


SELECT * FROM Article;