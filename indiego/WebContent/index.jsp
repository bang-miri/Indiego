
<%@page import="com.jmt.indiego.dao.AttackDAO"%>
<%@page import="com.jmt.indiego.vo.Attack"%>
<%@page import="com.jmt.indiego.dao.IdeaDAO"%>
<%@page import="com.jmt.indiego.vo.Idea"%>
<%@page import="com.jmt.indiego.dao.GameDAO"%>
<%@page import="com.jmt.indiego.vo.Game"%>
<%@page import="com.jmt.indiego.dao.ReplyDAO"%>
<%@page import="com.jmt.indiego.vo.Reply"%>
<%@page import="com.jmt.indiego.dao.FreeDAO"%>
<%@page import="com.jmt.indiego.vo.Free"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
     		List<Game> popularGame = GameDAO.selectPopularGameList();
          	List<Game> bestGame = GameDAO.selectBestGameList();
          	
          	
          
          	
          	List<Reply> replyList = ReplyDAO.replyListTopten();
          	
          	List<Idea> ideaList = IdeaDAO.selctBestTenIdea();
          	
          	List<Users> users=UsersDAO.selectAttackInder();
          	
          	String inder1=users.get(0).getNickName();
          	String inder2=users.get(1).getNickName();
          	String inder3=users.get(2).getNickName();

          	List<Attack> attacks=AttackDAO.selectInderList(inder1);
          	List<Attack> attacks2=AttackDAO.selectInderList(inder2);
          	List<Attack> attacks3=AttackDAO.selectInderList(inder3);

     
     %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>index</title>
  	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link href="css/indexPage.css" rel="stylesheet"/>
</head>

<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
    <div id="contents">
        <div class="box_banner">
            <div class="box_banner_contents">
                <img class="img_banner" src="img/banner/banner5.png">
                <img class="img_banner" src="img/banner/banner6.png">
                <img class="img_banner" src="img/banner/banner7.png">
                <img class="img_banner" src="img/banner/banner8.png">
            </div><!--// box_banner_contents end-->
            <div class="btn_banner" id="rightArrowBtn"><i class="fas fa-angle-right"></i></div>
            <div class="btn_banner" id="leftArrowBtn"><i class="fas fa-angle-left" ></i></div>
        </div><!--#bannerBox end-->
        <div id="listBox">
            <div class="box_tap tap">
                <div  class="btn_tap click">?????? ??????</div><!--//btn_tap end-->
                <div  class="btn_tap">?????? ??????</div><!--//btn_tap end-->
                <div  class="btn_tap">EarlyAccess</div><!--//btn_tap end-->
                <div  class="btn_tap">?????? ??????</div><!--/btn_tap end-->
            </div><!-- #tapBox end-->

            <div class="box_gameList_tap tap on_index">
          				<%
						for(Game a :bestGame){
						%>
         			<div class="box_card">
        			<img class="img_thumbnail_game" src="img/game/<%= a.getImage()%>"/><!-- thumbnail_img -->
        			<div class="text_name"><%= a.getGameName() %></div><!-- //text_name end-->
        			<div class="text_genre"><%= a.getGenre() %></div><!--//text_genre end-->
        			<div class="text_price">
        			<%if(a.getPrice() == 0){%>
        			??????
        			<%}else{%>
        				<i class="fas fa-won-sign"></i> <%= a.getPrice() %>
        			<%}%>
        			</div><!-- text_price end-->
   					 </div><!--//box_card end-->
   					 <%
					}
   		 			%>
            </div><!--box_gameList_tap end-->

            <div class="box_gameList_tap tap">
            		<%
					for(Game a :popularGame){
					%>
         			<div class="box_card">
        			<img class="img_thumbnail_game" src="img/game/<%= a.getImage()%>"/><!-- thumbnail_img -->
        			<div class="text_name"><%= a.getGameName() %></div><!-- //text_name end-->
        			<div class="text_genre"><%= a.getGenre() %></div><!--//text_genre end-->
        			<div class="text_price">
        			<%if(a.getPrice() == 0){%>
        			??????
        			<%}else{%>
        				<i class="fas fa-won-sign"></i> <%= a.getPrice() %>
        			<%}%>
        			</div><!-- text_price end-->
   					 </div><!--//box_card end-->
   					 <%
					}
   		 			%>
            </div><!--box_gameList_tap end-->

            <div class="box_gameList_tap tap">
            </div><!--box_gameList_tap end-->


            <div class="box_gameList_tap tap">
            </div><!--box_gameList_tap end-->
        </div><!-- #listBox end-->

        <!--????????? ?????? ??????-->
        <div id="listBestIndieerBox">
            <div class="box_content" id="inderAttackBox">
                <div id="inderAttackTitle">????????? ????????? ??????</div>
                <div class="box_inder" >
                    <div class="box_game_img ">
                        <img class="img_game_attack" src="img/game/game_2.png" width="100" height="100" alt="???????????????"/>
                        <br>
                        <strong></strong>
                    </div>
                    <!--.box_game_img end-->
                     <div class="box_attack_list">
                    <div class="attack_nick"> <%=inder1%></div>
                    <div class="list_attack_inder">
                        <ul class="list_writing_inder">
                        <%for(Attack attack:attacks){ %>
                            <li class="title_writing_inder" data-parent="<%=attack.getImage()%>">
                                <%=attack.getTitle() %>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                    <!--#inderAttackList end-->
                    </div>
                    <!--.box_attack_list end-->

                </div>
                <!--.box_inder end-->
                 <div class="box_inder">
                <div class="box_game_img ">
                    <img class="img_game_attack" src="img/game/game_1.png" width="100" height="100" alt="???????????????"/>
                    <br>
                    <strong></strong>
                </div>
                <!--.box_game_img end-->
                <div class="box_attack_list">
                    <div class="attack_nick"> <%=inder2%></div>
                    <div class="list_attack_inder">
                        <ul class="list_writing_inder">
                        <%for(Attack attack:attacks2){ %>
                            <li class="title_writing_inder" data-parent="<%=attack.getImage()%>">
                                <%=attack.getTitle() %>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                    <!--#inderAttackList end-->
                </div>
                <!--.box_attack_list end-->

            </div>
            <!--.box_inder end-->
              <div class="box_inder">
                <div class="box_game_img ">
                    <img class="img_game_attack" src="img/game/game_3.png" width="100" height="100" alt="???????????????"/>
                    <br>
                    <strong></strong>
                </div>
                <!--.box_game_img end-->
                <div class="box_attack_list">
                    <div class="attack_nick"> <%=inder3%></div>
                    <div class="list_attack_inder">
                        <ul class="list_writing_inder">
                        <%for(Attack attack:attacks3){ %>
                            <li class="title_writing_inder" data-parent="<%=attack.getImage()%>">
                                <%=attack.getTitle() %>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                    <!--#inderAttackList end-->
                </div>
                <!--.box_attack_list end-->

            </div>
            <!--.box_inder end-->
            </div>
        </div><!--listBestIndieerBox end-->


        <div id="communicationBox">
            <ul id="listFreeBoardBox" class="list_communication_box">



                <li id="freeBoardmTitle" class="mTitle_communication">???????????????</li><!--//mTitle_communication end-->

                <li class=" list_box_one">
                    <div class="sTitle_FreeBoard">??????</div><!--//sTitle_FreeBoard end-->
                    <div class="text_ripple">??????</div><!--//text_ripple end-->
                    <div class="text_writer">?????????</div><!--//text_writer end-->
                </li><!--//list_box ends-->
			<li class="list_box">
    <div class="sTitle_FreeBoard">?????? ????????????;;</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[7]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->


<li class="list_box">
    <div class="sTitle_FreeBoard">????????? ????????? ??????????</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[10]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->


<li class="list_box">
    <div class="sTitle_FreeBoard">??????????????? ????????? ??????????</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[7]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->



<li class="list_box">
    <div class="sTitle_FreeBoard">????????? ????????? ??????</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[7]</div><!--//text_ripple end-->
    <div class="text_writer">GR??????</div><!--//text_writer end-->
</li><!--//list_box ends-->



<li class="list_box">
    <div class="sTitle_FreeBoard">????????? ?????????!!!</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[10]</div><!--//text_ripple end-->
    <div class="text_writer">??????</div><!--//text_writer end-->
</li><!--//list_box ends-->


<li class="list_box">
    <div class="sTitle_FreeBoard">??????;; ?????? ????????? ?????????~</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[1]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->


<li class="list_box">
    <div class="sTitle_FreeBoard">????????? ?????? ????????????</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[7]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->


<li class="list_box">
    <div class="sTitle_FreeBoard">???????????? ?????? ???????????????</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[7]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->



<li class="list_box">
    <div class="sTitle_FreeBoard">???????????? ????????????</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[10]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->



<li class="list_box">
    <div class="sTitle_FreeBoard">??????;;;</div><!--//sTitle_FreeBoard end-->
    <div class="text_ripple">[7]</div><!--//text_ripple end-->
    <div class="text_writer">?????????</div><!--//text_writer end-->
</li><!--//list_box ends-->
			
            </ul><!--listFreeBoardBox end -->

            <ul id="listHotTalkBox" class="list_communication_box">
                <li class="mTitle_communication">Hot ??????</li><!--//mTitle_communication end-->
                <li class = " list_box_one">
                    <div class="list_elements">?????????</div><!--list_elements-->
                    <div class="list_game_name">????????????</div><!--// list_game_name-->
                    
                    	<%for(Reply list : replyList){ %>
                    	<li class = "list_box">
        					<div class="list_elements"><%=list.getGameTitle() %></div><!--list_elements-->
        					<div class="list_game_name"><%=list.getTitle() %></div><!--// list_game_name-->
    					</li><!--//list_box end-->
    				<%} %>
    
    
                </li><!--//list_box end-->



            </ul><!--listHotTalkBox end-->

            <ul id="listHelpBox" class="list_communication_box">
                <li class="mTitle_communication">HELP</li><!--// mTitle_communication end-->
                <li class = " list_box_one">
                    <div  class="list_elements">????????? ???</div><!--// list_elements end-->
                    <div class="list_game_name">????????? ??????</div><!--// list_game_name-->
                </li><!--// list_box end-->
                
                  	<%for(Idea list : ideaList){ %>
                    	<li class = "list_box">
        					<div class="list_elements"><%=list.typeReturn() %></div><!--list_elements-->
        					<div class="list_game_name"><%=list.getTitle() %></div><!--// list_game_name-->
    					</li><!--//list_box end-->
    				<%} %>
    				
    				
    				
            </ul><!--listHelpBox end-->


        </div><!--CommunicationBox end-->
    </div><!--// contents box  -->
  
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script type="text/template" id="listHotTalkCard">
    <li class = "list_box">
        <div class="list_elements">NBA2K19</div><!--list_elements-->
        <div class="list_game_name">???????????? ?????????????</div><!--// list_game_name-->
    </li><!--//list_box end-->
</script><!--//listFreeBoardCard end-->

<script type="text/template" id="listHelpCard">
    <li class = "list_box">
        <div  class="list_elements">????????????</div><!--// list_elements end-->
        <div class="list_game_name">NBA2k19 ???????????????</div><!--// list_game_name-->
    </li><!--// list_box end-->
</script><!--//listFreeBoardCard end-->



<script src="js/underscore-min.js"></script>
<script>


    //????????????
    var moveCtrl ;
    /*setInterval(testMove, 1000);*/
    $('.box_banner').mouseover(function () {
        clearInterval(moveCtrl);
    });
    $(document).ready(function () {
        moveCtrl = setInterval(Move, 5000);
    })
    $('.box_banner').mouseout(function () {
        moveCtrl = setInterval(Move, 5000);
    });
    
    //?????? ?????? ?????????
    var banerPos = 0;
    $("#leftArrowBtn").click(function ()
    {
        console.log(banerPos);
        if(banerPos >=0){
            banerPos = 0
        }else {
            banerPos += 1004;
            $(".box_banner_contents").css("left", banerPos);
        }
    });//leftArrowBtn end

    $("#rightArrowBtn").click(function ()
    {
        console.log(banerPos);

        if(banerPos <= -2900){
            banerPos = -3000;
        }else {
            banerPos -=1004;
            $(".box_banner_contents").css("left", banerPos);
        }

    });//rightArrowBtn end

    //???????????? ??????
    function Move() {
        if (banerPos <= -2900) {
            banerPos = 1000;
            console.log(banerPos)
        }
        else {
            banerPos -= 1004;
            $(".box_banner_contents").css("left", banerPos);
            console.log(banerPos)
        }
    }//Move end


    //??? ?????????
    $(".btn_tap").on("click",function () {
        var tapIndex = $(this).index();

        $(".click").removeClass("click");
        $(".tap").find(".btn_tap:nth-child("+(tapIndex+1)+")").addClass("click");
        tapIndex = tapIndex+2
        $(".on_index").removeClass("on_index");
        $(".tap:nth-child("+tapIndex+")").addClass("on_index");

    });//.btn_tap click end

    //????????? ?????? ??????
    $(".title_writing_inder").hover(function () {
        var img = $(this).data("parent");
        $(this).parent().parent().parent().prev().children(1).attr("src", "img/game/" + img);
        // $(".box_inder .img_game_attack").attr("src", "img/game/" + img);
    });

</script>

</body>
</html>