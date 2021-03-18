<%@page import="com.jmt.indiego.dao.UsersDAO"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String nickName = request.getParameter("nick_name");

//3초후에 응답
//Thread.sleep(3000);

int cnt = UsersDAO.selectCheckNickName(nickName);

%>
{"count":<%=cnt %>}









