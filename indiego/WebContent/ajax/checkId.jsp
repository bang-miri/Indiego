<%@page import="com.jmt.indiego.dao.UsersDAO"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");

//3초후에 응답
//Thread.sleep(3000);

int cnt = UsersDAO.selectCheckId(id);

%>
{"count":<%=cnt %>}









