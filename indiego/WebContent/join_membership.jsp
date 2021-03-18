<%@page import="com.jmt.indiego.dao.UsersDAO"%>
<%@page import="com.jmt.indiego.vo.Users"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String nickname = request.getParameter("nickName");
String email = request.getParameter("email");

Users users = 
new Users(id,pwd,nickname,email);

int result = UsersDAO.insert(users);

System.out.println(result);

response.sendRedirect("index.jsp");

%>