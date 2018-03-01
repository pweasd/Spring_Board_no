# Spring WebProject01 - MVC Board

Spring을 통해 만든 게시판 구성과 설정

## 개발환경
해당 프로젝트에서는 오라클 가상머신에 설치된 리눅스서버와 윈도우에 설치된 Tomcat7을 연동하여 게시판을 제작한다. 
|  |Setting |
|--|--|
| Os |Windows10  |
|DataBase        |Linux Server(Mysql)  |
|FrameWork       |Spring-MVC        |
|Tool          	 |Eclipse EE        |
|WAS          	 |Tomcat7           |
|Lib          	 |Mybatis           |
|CSS          	 |Bootstrap         |
## 0. 개발 전 설정
한글깨짐 방지
---

![enter image description here](https://github.com/pweasd/Spring_Board_no/blob/master/image/%ED%95%9C%EA%B8%80%EA%B9%A8%EC%A7%90%EC%84%A4%EC%A0%95.png?raw=true)
- 한글 깨짐 현상을 방지하기위해 Servers 프로젝트의 web.xml에서 UTF-8 encoding 부분의 주석을 풀어준다.
- Get방식에서도 한글깨짐을 방지하려면 Server프로젝트내 server.xml 파일을 수정

Java Update
---

![enter image description here](https://github.com/pweasd/Spring_Board_no/blob/master/image/%EC%9E%90%EB%B0%94%EB%B2%84%EC%A0%84%EC%88%98%EC%A0%95.png?raw=true)
- Project java version update(1.8) This file is pom.xml

Add Libraries (pom.xml)
--
![enter image description here](https://github.com/pweasd/Spring_Board_no/blob/master/image/%EC%8A%A4%ED%94%84%EB%A7%81%20%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC%20%EC%B6%94%EA%B0%80.png?raw=true)

Add Bootstrap (JSP)
--
![enter image description here](https://github.com/pweasd/Spring_Board_no/blob/master/image/%EB%B6%80%ED%8A%B8%EC%8A%A4%ED%8A%B8%EB%9E%A9.png?raw=true)

Using Mysql (root-context.xml)
--
![enter image description here](https://github.com/pweasd/Spring_Board_no/blob/master/image/%EB%8D%B0%EC%9D%B4%ED%83%80%EC%86%8C%EC%8A%A4.png?raw=true)

Create Table (board table & reply table)
--
- **borad**
>create table board (
>id INT NOT NULL AUTO_INCREMENT,
>title VARCHAR(200) NOT NULL,
>content TEXT NULL,
>regdate TIMESTAMP NOT NULL DEFAULT now(),
>view INT DEFAULT 0,
>PRIMARY KEY (id));
- **reply**
>create table reply (
>num int NOT NULL AUTO_INCREMENT,
>id int not null default 0,
>replytext varchar(1000) not null,
>replyer varchar(50) not null,
>regdate TIMESTAMP NOT NULL DEFAULT now(),
>updatedate TIMESTAMP NOT NULL DEFAULT now(),
>primary key (num))default charset=utf8;




## 1. 프로젝트의 구성

   ![enter image description here](https://github.com/pweasd/Spring_Board_no/blob/master/image/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EA%B5%AC%EC%A1%B0.png?raw=true)
Mybatis를 통한 리눅스 서버(Mysql)와 연동하여 가져온 데이터를 저러한 순서로 사용하게 된다.
>※참고
>PC에 Tomcat7을 설치하여 Web에 띄워준다. 
기본포트가 8080으로 잡히는데 글쓴이의 경우 이미 가상머신에서 8080으로 포트포워딩을 
해놓은게 있어서 8081로 변경
