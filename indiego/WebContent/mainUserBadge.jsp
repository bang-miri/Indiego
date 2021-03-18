<%@page import="com.jmt.indiego.dao.UserBadgeDAO"%>
<%@page import="com.jmt.indiego.vo.UserBadge"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int userNo=Integer.parseInt(request.getParameter("userNo"));

int mainNo=Integer.parseInt(request.getParameter("mainNo"));

UserBadge userMainBadge=new UserBadge(userNo,mainNo);

int result=UserBadgeDAO.updateMainBadge(userMainBadge);


response.sendRedirect("new_profile_main_page.jsp");

%>