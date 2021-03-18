
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="com.jmt.indiego.dao.ProjectDAO"%>
<%@page import="com.jmt.indiego.vo.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Calendar now =Calendar.getInstance();
int year=now.get(Calendar.YEAR);
int month=now.get(Calendar.MONTH)+1;
int date=now.get(Calendar.DATE);


int userNo=Integer.parseInt(request.getParameter("userNo"));
String title="UNTITLE";
Date startDate=Date.valueOf(year+"-"+month+"-"+date);
int maxPersonnel=1;
String visibility="Y";
String launchingV="N";
Project project=new Project(title,startDate,maxPersonnel,visibility,userNo,launchingV);

int result=ProjectDAO.insert(project);

response.sendRedirect("creator_main_page.jsp");
%>
