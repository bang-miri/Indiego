<%@page import="com.jmt.indiego.dao.CareerDAO"%>
<%@page import="com.jmt.indiego.vo.Career"%>
<%@page import="com.jmt.indiego.dao.PortfolioDAO"%>
<%@page import="com.jmt.indiego.vo.Portfolio"%>
<%@page import="com.jmt.indiego.dao.ProjectDAO"%>
<%@page import="com.jmt.indiego.vo.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo=6;

      List<Project> projects=ProjectDAO.selectList(userNo);

	  System.out.print(projects);
		
	  List<Project> launchingProjects=ProjectDAO.selectLaunchingList(userNo);
	  System.out.print(launchingProjects);

      List<Portfolio> portfolios=PortfolioDAO.selectList(userNo);
      List<Career> careers=CareerDAO.selectList(1);
%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>크리에이터 홈 </title>
    <link href="img/favicon/favicon.ico" rel="icon"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link rel="stylesheet" href="css/creator_main_page.css"/>
        <%@ include file="/WEB-INF/template/link.jsp" %>
</head>
<body>

<%@ include file="/WEB-INF/template/header.jsp" %>
<div class="wrap">
    <div class="box_content">
        <div class="home_creator">크리에이터 홈</div>
        <div class="title_stick"></div>

        <div class="btn btn_project_new" onclick="add(<%=userNo%>)" >프로젝트 추가</div>
        <div class="box_tap_one" id="tapProjectBox">
            <div class="tap on tap_progress">진행중</div>
            <div class="tap ">런칭</div>
        </div>
        <!--.box_tap_one end-->
        <div class="box_project progress">
            <div class="box_head">프로젝트명</div>
            <div class="box_head">기간</div>
            <div class="box_head">프로젝트 인원</div>
            <div class="box_head">체크리스트</div>

            <div class="box_progress">
                <ul class="list_project">
                <%
                	for(Project project:projects) {
                %>
                    <li class="project">
                        <a href="">
                            <div class="text_project"><%=project.getTitle()%></div>
                        </a>
                        <div class="text_project"><%=project.getFormatDate()%></div>
                        <div class="text_project"><%=project.getMaxPersonnel()%></div>
                        <div class="text_project">미완료</div>
                    </li>
                    <%
                    	}
                    %>
                </ul>
                <!--.list_project end-->

            </div>
            <!--.box_progress end-->
        </div>
        <!--.box_project end-->
        <div class="box_project launching">
            <div class="box_head">게임명</div>
            <div class="box_head">기간</div>
            <div class="box_head">프로젝트 인원</div>
            <div class="box_head">프로젝트명</div>

            <div class="box_launching">
                <ul class="list_launching">
                 <%
                 	for(Project launchingProject:launchingProjects) {
                 %>
                    <li class="project">
                        <a href="">
                            <div class="text_project"><%=launchingProject.getGameTitle()%></div>
                        </a>
                        <div class="text_project"><%=launchingProject.getFormatDate()%></div>
                        <div class="text_project"><%=launchingProject.getMaxPersonnel()%></div>
                        <div class="text_project"><%=launchingProject.getTitle()%></div>
                    </li>
                   <%
                   	}
                   %>
                </ul>
                <!--.list_project end-->

            </div>
            <!--.box_launching end-->
        </div>
        <!--.box_project end-->

        <div class="btn btn_spec_new">포트폴리오 추가</div>
        <div class="box_tap_two">
            <div class="tap on portfolio_view">포트폴리오</div>
            <div class="tap">경력</div>
        </div>
        <!--.box_tap end-->
        <div class="box_portfolio" id="portfolioBox">
            <div class="btn_secret">
                <input id="check1" size="30px" type="checkbox"><label for="check1"><i id="checkIcon1"
                                                                                      class="far fa-square"></i></label>
                비공개
            </div>
            <!--.btn_secret end-->
            <div class="box_head_portfolio">포트폴리오명</div>
            <div class="box_head_portfolio">등록 날짜</div>
            <ul class="list_portfolio">
            <%
            	for(Portfolio portfolio:portfolios){
            %>
                <li class="portfolio">
                    <img width="60px" height="60px" class="img_portfolio" src="img/portfolio/<%=portfolio.getImage()%>"/>
                    <span>
                        <strong class="text_portfolio" id="portfolio"><%=portfolio.getTitle()%></strong>
                         <time class="text_portfolio"><%=portfolio.getRegdate()%></time>
                     </span>
                </li>
              <%
              	}
              %>

            </ul>
        </div>
        <!--.box_portfolio end-->
        <div class="box_portfolio" id="careerBox">
            <div class="btn_secret">
                <input id="check2" size="30px" type="checkbox"><label for="check2"><i id="checkIcon2"
                                                                                      class="far fa-square"></i></label>
                비공개

            </div>
            <!--.btn_secret end-->
            <div class="box_head career_head"><strong>회사명</strong></div>
            <div class="box_head career_head"><strong>입사년월-퇴사년월</strong></div>
            <div class="box_head career_head"><strong>직급(직책)</strong></div>
            <div class="box_head career_head"><strong>직종</strong></div>
            <ul class="list_career">
            <%
            	for(Career career:careers) {
            %>
                <li class="career">
                    <strong class="text_career"><%=career.getCompany() %></strong>
                    <time class="text_career"><%=career.getFormatDate()%></time>
                    <strong class="text_career"><%=career.getJobRank() %></strong>
                    <strong class="text_career"><%=career.getJob() %></strong>
                </li>
                <%} %>
               
            </ul>
            <!--.list_career end-->
        </div>
        <!--.box_portfolio end-->

        <div class="popup">
            <div class="box_popup" id="portfolioPopup">
                        <form  method="post"
             action="portfolio.jsp">

                <div class="popup_title" id="protfilio">포트폴리오</div>
                <div class="title_portfolio_new" >포트폴리오명</div>
                <br>
                <input type="text" id="pfTitle" name="pfTitle"/><br>
                
                <div class="title_portfolio_new" id="portfolioImg">포트폴리오 대표 이미지</div>
                <br>
                <button class="replace">파일 첨부</button>
                <input class="upload" type="file" id="pfImage" name="pfImage"><br><br>
                
                <div class="title_portfolio_new" id="portfolioFile">포트폴리오</div>
                <br>

                <button class="replace">파일 첨부</button>
                <input class="upload" type="file" id="pfFile" name="pfFile"><br>


                <div class="box_button">
                    <button type="submit" class="btn_popup" >등록</button>
                    <button class="btn_popup cancel">취소</button>
                </div>
                </form>
            </div>
            <!--#portfolioPopup end-->

            <div class="box_popup" id="careerPopup">
            <form  method="post"
             action="career.jsp">
                <div class="popup_title" id="career">경력</div>
                <input class="text_input" type="text" placeholder="회사명" id="company" name="company">
                <div class="box_data_input">입사년월
                <input class="date_input " type="date"  id="joinDate" name="joinDate">
                </div>
                <div class="box_data_input">퇴사년월
                <input class="date_input" type="date"  id="leaveDate" name="leaveDate">
                </div>
                <input class="text_input" type="text" placeholder="직급(직책)"  id="jobRank" name="jobRank">
                <input class="text_input " id="jobInput" type="text" placeholder="직종"  id="job" name="job">

                <div class="box_button">
                    <button type="submit" class="btn_popup">등록</button>
                    <button class="btn_popup cancel">취소</button>
                </div>
                <!--.box_button end-->
                </form>
            </div>
            <!--#careerPopup end-->

        </div>
        <!--popup end-->

    </div>
    <!--.box_content end-->
</div>
<!--.wrap end-->
<script src="js/jquery.js"></script>
<script>
    var text;
    $(".box_tap_one>.tap").click(function () {
        $(".box_tap_one>.tap").removeClass("on");
        $(this).addClass("on");
        if ($(this).hasClass("tap_progress")) {
            $(".launching").css("display", "none");
            $(".progress").css("display", "block");
        } else {
            $(".progress").css("display", "none");
            $(".launching").css("display", "block");
        }
    });//.box_tap_one>.tap

    $(".box_tap_two>.tap").click(function () {
        $(".box_tap_two>.tap").removeClass("on");
        $(this).addClass("on");
        if ($(this).hasClass("portfolio_view")) {
            $("#careerBox").css("display", "none");
            $("#portfolioBox").css("display", "block");
            $(".btn_spec_new").text("포트폴리오 추가");
        } else {
            $("#portfolioBox").css("display", "none");
            $("#careerBox").css("display", "block");
            $(".btn_spec_new").text("경력 추가");
        }
    });//.box_tap_one>.tap


    $(".btn_spec_new").click(function () {
        text = $(this).text();
        popup(text);
    });

    function popup(text){
        $(".popup").show();
        if (text == "포트폴리오 추가") {
            $("#portfolioPopup").show();
        } else {
            $("#careerPopup").show();
        }

        $(".cancel").click(function () {
            $(".popup").hide();

            $("#portfolioPopup").hide();
            $("#careerPopup").hide();
        });
        $(".btn_popup").click(function () {
            $(".popup").hide();

            $("#portfolioPopup").hide();
            $("#careerPopup").hide();
        });
    };
    
   // $(".text_portfolio").click(function () {
   //     text="포트폴리오 추가";
    //    popup(text);
        
   // });
    //$(".text_career").click(function () {
   //     text="경력 추가";
    //    popup(text);
    //});



    $("#check1").change(function () {
        if ($("#check1").is(":checked")) {
            $("#checkIcon1").attr("class", "far fa-check-square");
        } else {
            $("#checkIcon1").attr("class", "far fa-square");
        }
    });
    $("#check2").change(function () {
        if ($("#check2").is(":checked")) {
            $("#checkIcon2").attr("class", "far fa-check-square");
        } else {
            $("#checkIcon2").attr("class", "far fa-square");
        }
    });
    
    function add(userNo){
    	location.href="project.jsp?userNo="+userNo;
    };


    
</script>
</body>
</html>