<%@page import="org.apache.catalina.User"%>
<%@page import="com.jmt.indiego.dao.UserBadgeDAO"%>
<%@page import="com.jmt.indiego.dao.BadgeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.jmt.indiego.vo.Badge"%>
<%@page import="com.jmt.indiego.vo.Follow"%>
<%@page import="com.jmt.indiego.dao.FollowDAO"%>
<%@page import="com.jmt.indiego.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>profile</title>
    <link href="img/favicon/favicon.ico" rel="icon"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="css/profile_main_page.css"/>

<%@ include file="/WEB-INF/template/link.jsp" %>
    <style>
        #guestBookBox{
            display: none;
        }
        .box_attack.box_content{
        height: 270px;
        }
        div.box_commuity_content{
        line-height:180px;
        font-size:20px;
        text-align: center;
        text-indent: -100px;
        }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp" %>
    <%
    int myUserNo=loginUser.getUserNo();
    int userNo=myUserNo;
    String nickName=UsersDAO.selectNickName(userNo);
    String profile=UsersDAO.selectProfile(userNo);
   
    
    Follow followCheck=new Follow(userNo,myUserNo);
    int follower=FollowDAO.selectFollower(userNo);
    int follow=FollowDAO.selectFollow(userNo);
    
    int result=FollowDAO.selectOne(followCheck);


    List<Badge> badges=BadgeDAO.selectUserBadge(userNo);
    int mainNo=UserBadgeDAO.selectMainBadge(userNo);
   
    String badgeImg=BadgeDAO.selectImageBadge(mainNo);
    
    String userMode=UsersDAO.selectInder(userNo);
    System.out.print(userMode);
    if(badgeImg==null){
    	badgeImg="badge_default.jpg";
    }
    
    %>

    <div class="box_profile_title">

        <!--<div class="slide_bar"></div>-->
        <div class="box_profile">
        <%if(myUserNo==userNo) {%>
            <button class="btn_profile_edit">+</button>
            <input id="profileInput" type="file" name="profileInput" placeholder="이미지" class="screen_out">
            <%} %>
			<img src="<%=profile%>" width="200" height="200" id="profileCanvas"/>
        </div>
        <!--#profileImgBox end-->
        <div class="box_profile" id="profileNameBox"> <%=nickName%>
            <img class="img_profile_image" src="img/badge/<%=badgeImg%>"/>
        </div>
        <!--#profileNameBox end-->

        <div class="box_follow">
            <div class="box_follow_two" id="followerBox">
                팔로워<br><br>
                <a class="follow_num" href=""><%=follower%></a>
            </div>
            <!--#followerBox end-->
            <div class="box_follow_two" id="followingBox">
                팔로잉<br><br>
                <a class="follow_num" href=""><%=follow%></a>
            </div>
            <!--#followingBox end-->
            <%if(myUserNo!=userNo){ %>
            	<%if(result==0){ %>
            <button class="btn btn_follow" onclick="follow(<%=userNo%>,<%=myUserNo%>)" >팔로우</button>
              <%}else{ %>
            <button class="btn btn_follow" onclick="unfollow(<%=userNo%>,<%=myUserNo%>)" >팔로잉</button>
              <%} %>                                      
            <%} %>
            
        </div>
<!--#foolowBox end-->
<%if(userMode.equals("C")) {%>
        <button class="btn_creator_home"><a href="/project_page.jsp">NEW 프로젝트</a></button>
        <%} %>
        
        <div class="btn_config">
            <i class="fas fa-cog"></i>
        </div>
        <!--.btn_config end-->
    </div>
    
 <div class="contents">
 
 
 
    <div class="box_tap">
        <div class="tap on_profile profile">프로필</div>
        <div class="tap guestbook">방명록</div>

    </div>
    <!--#tapProfileBox end-->
    <div class="box_profile_con" id="profileBox">

        <div class="slide_bar"></div>
        <div class="box_badge ">
            <div class="title_category">뱃지</div>
            <div class="title_stick"></div>
            <ul class="list_badge">
            <%for(Badge badge:badges) {%>
        
               <%if(badge.getNo()==mainNo) {%>
                <li class="badge on_badge" onclick="mainBadge(<%=userNo%>,<%=badge.getNo()%>)">
<%}else{ %>
	 	<li class="badge" onclick="mainBadge(<%=userNo%>,<%=badge.getNo()%>)">
<%} %>              

                    <div class="badge_img "><img src="img/badge/<%=badge.getImage()%>" width="50px" height="50px"/>

                        <i class="check_icon fas fa-crown on_badge" ></i>

                    </div>
                    <div class="badge_title"><%=badge.getTitle()%>
                    </div>
                    <div class="badge_text">
                        <%=badge.getText()%>
                    </div>
                  </li>
                  <%} %>
                
            </ul>
            <!--ul #badgeList end-->

            <div class="btn_show open"><i class="fas fa-sort-down"></i></div>
        </div>
        <!--.box_badge end-->


        <div class="box_attack box_content">
            <div class="title_category">공략</div>
            <div class="title_stick"></div>
           <div class="box_commuity_content">
            작성한 공략이 없습니다.
            </div>

        </div>
        <!--.box_attack end-->
        <div class="paging"></div>

        <div class="box_writing box_content">

            <div class="title_category">커뮤니티</div>

            <div class="title_stick"></div>
            <div class="box_commuity_content">
            작성한 게시글이 없습니다.
            </div>



        </div>
        <!--.box_writing end-->
        <div class="paging"></div>

        <div class="box_review box_content">
            <div class="title_category">리뷰</div>
            <div class="title_stick"></div>
             <div class="box_commuity_content">
                        작성한 리뷰가 없습니다.
            
            </div>


        </div>
        <!--.box_review end-->
        <div class="paging"></div>

        <div class="box_debate box_content">
            <div class="title_category">토론</div>
            <div class="title_stick"></div>
            <div class="box_commuity_content">
                        작성한 토론이 없습니다.
            
            </div>

        </div>
        <!--.box_discussion end-->
        <div class="paging"></div>

        <div class="box_heart_list box_content">
            <div class="title_category">하트리스트</div>
            <div class="title_stick"></div>
             <div class="box_commuity_content">
            하트리스트에 담긴 게임이 없습니다.
            </div>
 <div class="paging"></div>
        </div>
        <!--#heartListBox end-->
        <div class="box_buy_list box_content">
            <div class="title_category">최근 구매 리스트</div>
            <div class="title_stick"></div>
             <div class="box_commuity_content">
            구매한 게임이 없습니다.
            </div>
 <div class="paging"></div>
            <!--.list_buy end-->
        </div>
        <!--.box_buy_list end-->
    </div>
    <!--.box_profile_con end-->

        <div class="box_profile_con on" id="guestBookBox">
            <div class="slide_bar"></div>
                <div class="title_guestbook">방명록 남기기</div><!-- .title_guestbook end -->
                <div>
                    <form class="form_leave">
                        <label class="lab_nondisclosure">
                            <input name="" type="checkbox">
                            비공개
                        </label><!-- .lab_nondisclosure end -->
                        <textarea class="inp_content"></textarea><!-- .inp_content end -->
                        <div class="btn_registration">
                            <button class="btn_small" type="button">등록</button>
                        </div><!-- .btn_registration end -->
                    </form><!-- form end -->
                </div> <!-- 방명록남기기 end -->
                <div class="list_content2">방명록 리스트</div><!-- .list_content2 end -->
                <div>
                    <form class="form_leave2">
                        <div class="write_none1">
                            <div class="list_content3"></div><!-- .list_content3 end -->
                            <div class="btn_change">
                                <button class="btn_small">수정</button>
                            </div><!-- .btn_change end -->
                            <div class="btn_delete">
                                <button class="btn_small">삭제</button>
                            </div><!-- .btn_delete end -->
                            <div class="btn_registration2">
                                <button class="btn_small" type="button">답변달기</button>
                            </div><!-- .btn_registration2 end -->
                            <div class="fa_profile"><i class="fas fa-user-circle"></i></div><!-- .fa_profile end -->
                            <div class="list_nick">닉네임</div><!-- .list_nick end -->
                        </div><!-- .write_none1 end -->
                        <div class="write_none2">
                            <textarea class="inp_content4 "></textarea><!-- .inp_content4 end -->
                            <div class="btn_change2">
                                <button class="btn_small">수정</button>
                            </div><!-- .btn_change2 end -->
                            <div class="btn_delete2">
                                <button class="btn_small">삭제</button>
                            </div><!-- .btn_delete2 end -->
                            <div class="btn_registration3">
                                <button class="btn_small" type="button">등록</button>
                            </div><!-- .btn_registration3 end -->
                            <div class="fa_profile2"><i class="fas fa-user-circle"></i></div><!-- .fa_profile2 end -->
                            <div class="list_nick2">닉네임</div><!-- .list_nick2 -->
                        </div><!-- .write_none2 end -->
                        <div class="write_none3">
                            <div class="list_content5"></div><!-- .list_content5 end -->
                            <div class="btn_change3">
                                <button class="btn_small">수정</button>
                            </div><!-- .btn_change3 end -->
                            <div class="btn_delete3">
                                <button class="btn_small">삭제</button>
                            </div><!-- .btn_delete3 end -->
                            <div class="btn_registration4">
                                <button class="btn_small">답변달기</button>
                            </div><!-- .btn_registration4 end -->
                            <div class="fa_profile3"><i class="fas fa-user-circle"></i></div><!-- .fa_profile3 end -->
                            <div class="list_nick3">닉네임</div><!-- .list_nick3 end -->
                        </div><!-- .write_none3 end -->
                        <div id="paging"></div><!-- #paging end -->
                    </form><!-- .form_leave2 end -->
                </div><!-- 방명록리스트 end -->
            </div><!-- #guestBookBox end -->

        </div><!--.content end-->
        
        
        

<%@ include file="/WEB-INF/template/footer.jsp" %>



<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
    $(".tap").click(function () {
        $(".tap").removeClass("on_profile");
        $(this).addClass("on_profile");
        if ($(this).hasClass("profile")) {
            $("#guestBookBox").css("display", "none");
            $("#profileBox").css("display", "block");
        } else {
            $("#profileBox").css("display", "none");
            $("#guestBookBox").css("display", "block");
        }
    });//box_tap>.tap end

    $(".btn_show").click(function () {
        if($(this).hasClass("open")){
            $(".box_badge").css("height","550px");
            $(".btn_show>i").attr("class","fas fa-sort-up");

        }else{
            $(".box_badge").css("height","200px");
            $(".btn_show>i").attr("class","fas fa-sort-down");
        }
        $(this).toggleClass("open");
    });//.btn_show_badge click end


    $(".badge").click(function () {
        $(".badge").removeClass("on_badge");
        $(this).addClass("on_badge");
    });


    
    $(".btn_registration").click(function () {
        $(".write_none1").show();
    });

    $(".btn_registration2").click(function () {
        $(".write_none2").show();
    });

    $(".btn_registration3").click(function () {
        $(".write_none2").hide();
        $(".write_none3").show();
    });
    
    
    function follow(userNo,myUserNo){
    	location.href="follow2.jsp?myUserNo="+myUserNo+"&userNo="+userNo;
    }
    function unfollow(userNo,myUserNo){
    	location.href="unfollow2.jsp?myUserNo="+myUserNo+"&userNo="+userNo;
    }
    
    
    var $profile=$("#profileInput");
  //MIME-image로 시작하는 유효성검사
    var profileReg=/^image/;
    var oldProfile=null;
  
  //프로필 사진이 변경되면 
    $profile.change(function(){
    	//jquery객체에서 순수자바스크립트요소객체 얻기
    	var profile=$profile.get(0);
    	//input type=file 요소(순수 자바스크립트)는 무조건
    	//files 배열을 가지고 있습니다.
    	
    	//한개의파일
    	var file=profile.files[0];
    	
    	//File 객체의 속성
    	//- type : MIME (이런거->image/jped,audio/mp3,video/mp4...)
    	//- name : 파일명
    	//- lastModified :최종수정일
    	//- size : 파일크기
    	console.log(file);
    	
    	if(file==null||file.size<=0){
    		alert("제대로 된 파일을 선택해주세요.");
    	return;
    	}//if end
    	if(!profileReg.test(file.type)){
    		alert("이미지 파일을 선택해주세요.");
    		return;
    	}//if end

    	if(oldProfile!=file.name){
    		oldProfile = file.name;
    	  
    	var form=new FormData();
    	
    	//우리가 선택한 파일을 붙임
    	form.append("type","P");//일반적인 데이터
    	//(1:파라미터명,2:파일,3:파일명)
    	form.append("uploadImg",file,file.name);
    	
    	//multipart/form-data로 ajax처리~~
    	//업로드를 같은데서 처리
    	$.ajax({
    		url:"ajax/uploadImage.jsp",
    		dataType:"json",
    	 	type:"POST",
    		processData:false,//multipart/form-data로 처리하기위해 꼭 필요ㅋ
    		contentType:false,//multipart/form-data로 처리하기위해 꼭 필요ㅎ
    		data:form,
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			$("#profileCanvas").attr("src",json.src);
    		}
    		
    	});//ajax end
    	}
    });//change() end
    
    function mainBadge(userNo,mainNo){

    	location.href="mainUserBadge.jsp?userNo="+userNo+"&mainNo="+mainNo;
    }
</script>




</body>
</html>