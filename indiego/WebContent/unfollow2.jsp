<%@page import="com.jmt.indiego.dao.FollowDAO"%>
<%@page import="com.jmt.indiego.vo.Follow"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int userNo=Integer.parseInt(request.getParameter("userNo"));
int myUserNo=Integer.parseInt(request.getParameter("myUserNo"));
Follow follow =new Follow(userNo,myUserNo);
int result=FollowDAO.delete(follow);
response.sendRedirect("new_profile_main_page.jsp");

%>