<%@page import="com.spring.biz.chat.ChatHeaderVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	UserVO vo = new UserVO();
vo.setU_id("whale");
vo.setPassword("11");
vo.setPhone("010-2548-7326");
vo.setEmail("zaku20@naver.com");
vo.setBirth("19950628");
vo.setName("예명");
vo.setBio("반갑습니다.");

session.setAttribute("vo", vo);

//List<ChatHeaderVO> headers = 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>채팅을 구현해 보자</h1>
	
</body>
</html>