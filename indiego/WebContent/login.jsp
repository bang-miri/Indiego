<%@page import="com.jmt.indiego.dao.UsersDAO"%>
<%@page import="com.jmt.indiego.vo.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


//파라미터 : id, password

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

Users users = new Users(id,pwd);

Users loginUsers = UsersDAO.selectLogin(users);

session.setAttribute("loginUser", loginUsers);

String referer = request.getHeader("referer");

String url = "/index.jsp";

if(referer!=null) {
	url = referer;
}//if end

response.sendRedirect(url);


%>