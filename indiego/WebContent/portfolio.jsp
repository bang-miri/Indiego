
<%@page import="com.jmt.indiego.dao.PortfolioDAO"%>
<%@page import="com.jmt.indiego.vo.Portfolio"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int userNo=6;
String title = request.getParameter("pfTitle");
String image = request.getParameter("pfImage");
String fileName = request.getParameter("pfFile");

Portfolio portfolio=new Portfolio(userNo,title,image,fileName);

int result=PortfolioDAO.insert(portfolio);


response.sendRedirect("creator_main_page.jsp");
%>
