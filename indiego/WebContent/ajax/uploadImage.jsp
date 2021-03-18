<%@page import="com.jmt.indiego.dao.UsersDAO"%>
<%@page import="com.jmt.indiego.vo.Users"%>
<%@page import="util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" 
contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int myUserNo = 40;

//기본 WAS 경로
String root = request.getServletContext().getRealPath("");
//원본 파일 경로
String uploadPath = root+"img/upload"+File.separator;
//프로필 사진 모아놓는 폴더 경로
String profilePath = root+"img/profile"+File.separator;

MultipartRequest mr = 
	   new MultipartRequest(request,//요청객체
			                uploadPath,//원본파일업로드경로
			                1024*1024*100,//파일사이즈(100메가)
			                "UTF-8",//한글처리 인코딩
			                new DefaultFileRenamePolicy());
                             //중복된 파일이름 어떻게 처리할지 객체

//파일 이름 얻기
   String fileName = mr.getFilesystemName("uploadImg");
                                 
	String type = mr.getParameter("type");
	
	String src = "img/";
		
	switch(type) {
	case "P" : 
		src+="profile/";

		//파일은 여길 없애
		ResizeImageUtil.resize(uploadPath+fileName,profilePath+fileName,200);
		break;
	case "B" : 
		src+="upload/";
		break;
	}//switch end
	
	src+= fileName;
	
	Users user=new Users(myUserNo,src);
	int result=UsersDAO.updateProfile(user);
%>
{"src":"<%=src%>"}








