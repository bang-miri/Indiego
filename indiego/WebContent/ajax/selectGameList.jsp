<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.jmt.indiego.vo.Game"%>
<%@page import="java.util.List"%>
<%@page import="com.jmt.indiego.dao.GameDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String gameName = request.getParameter("gameName");
	gameName = "%"+gameName+"%";
	List<Game> list = GameDAO.selectSearch(gameName);
	ObjectMapper om = new ObjectMapper();
	String json = om.writeValueAsString(list);
	
%>
<%=json%>