<%@page import="com.jmt.indiego.util.PaginateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.jmt.indiego.dao.FreeDAO"%>
<%@page import="com.jmt.indiego.vo.Free"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String noStr = request.getParameter("no");
	int no = 0;
	if (noStr != null) {
		no = Integer.parseInt(noStr);
	} //if end

	List<Free> list = FreeDAO.selectList();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>자유게시판 게시판 목록</title>
<link rel="stylesheet" href="css/free_bulletin_board.css">
<%@include file="/WEB-INF/template/link.jsp"%>
</head>
<body>

	<%@include file="/WEB-INF/template/header.jsp"%>

	<div id="contents">
		<div class="title">자유게시판</div>
		<div class="box_hot">
			<div class="hot_like">
				최신 좋아요 TOP 5
				<ul class="list_like">
					<%
						for (Free free : list) {
					%>
					<li class="list_like_title"><%=free.getTitle()%></li>
					<li class="list_like_writer"><%=free.getNickName()%></li>
					<%
						}
					%>

				</ul>
				<!-- .list_like end -->
			</div>
			<!-- .hot_like end -->
			<div class="hot_comment">
				댓글 수 BEST 5
				<ul class="list_comment">

					<%
						for (Free free : list) {
					%>
					<li class="list_comment_title"><%=free.getTitle()%></li>
					<!-- .list_comment_title end -->
					<li class="list_comment_writer"><%=free.getNickName()%></li>
					<!-- .list_comment_writer end -->
					<%
						}
					%>

				</ul>
				<!-- .list_comment end -->
			</div>
			<!-- .hot_comment end -->
		</div>
		<!-- .box_hot end -->
		<div class="btn_wrap">
			<button class="btn_small2">글쓰기</button>
			<!-- .btn_content_write end -->
		</div>
		<div class="box_content">
			<div class="box_content_form">
				<div class="content_title">
					<div class="content_title_num">NO</div>
					<!-- .content_title_num end -->
					<div class="content_title_title">글제목</div>
					<!-- .content_title_title end -->
					<div class="content_title_nickname">작성자</div>
					<!-- .content_title_nickname end -->
					<div class="content_title_clock">작성시간</div>
					<!-- .content_title_clock end -->
					<div class="content_title_view">조회수</div>
					<!-- .content_title_view end -->
					<div class="content_title_like">좋아요 수</div>
					<!-- .content_title_like end -->
				</div>
				<!-- .content_title end -->
				<div class="content_content">
					<!-- .content_content end -->
					<%
						for (Free free : list) {
					%>
					<div class="content_content_num"><%=free.getNo()%></div>
					<div class="content_content_title"><%=free.getTitle()%></div>
					<div class="content_content_nickname"><%=free.getNickName() %></div>
					<div class="content_content_clock"><%=free.getRegdateTo()%></div>
					<div class="content_content_view"><%=free.getViews()%></div>
					<div class="content_content_like"></div>
					<%
					
						}
					%>
				</div>
				<!-- .content_content end -->
			</div>
			<!-- .box_content_form end -->
		</div>
		<!-- .box_content end -->
		<form class="form_search">
			<select class="select_search">
				<option>검색기준</option>
				<option>작성자</option>
				<option>제목+내용</option>
				<option>제목</option>
			</select>
			<!-- .select_search end -->
			<input class="inp_search" name="">
			<!-- .inp_search end -->
			<button class="btn_search">
				<i class="fas fa-search"></i>
			</button>
			<!-- .btn_search end -->
		</form>
		<!-- .form_search end -->
	</div>
	<!-- #contents end -->

	<%@include file="/WEB-INF/template/footer.jsp"%>

	<script src="js/underscore-min.js"></script>
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
	</script>
</body>
</html>