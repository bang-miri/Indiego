<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.jmt.indiego.util.PaginateUtil"%>
<%@page import="com.jmt.indiego.vo.PageVO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.jmt.indiego.vo.Game"%>
<%@page import="java.util.List"%>
<%@page import="com.jmt.indiego.dao.GameDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageNoStr = request.getParameter("pageNo");


int  pageNo = Integer.parseInt(pageNoStr);
int  numPage = 15;

	PageVO pageVO = new PageVO(pageNo , numPage);
	List<Game> list = GameDAO.selectPopularPageList(pageVO);

	int total = GameDAO.selectTotal();    
	int numBlock = 5;
	String url = "/gameMainPage.jsp";
	String param ="page=";
	
	String paginate=PaginateUtil.getPaginate(
   			pageNo,
   			total, 
   			numPage,
   			numBlock, 
   			url, 
   			param);
   		 	

Map<String,Object> map = new HashMap();


map.put("list",list);
map.put("paginate",paginate);

ObjectMapper om = new ObjectMapper();
String json = om.writeValueAsString(map);
%>

<%=json%>