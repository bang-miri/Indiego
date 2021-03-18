<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>projextMainPage</title>
	<%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/projectMainPage.css"/>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>

<div id="contents">


    <div class="box_banner">
        <div class="box_banner_contents">
        		 <img class="img_banner" src="img/banner/banner1.png">
                <img class="img_banner" src="img/banner/banner2.png">
                <img class="img_banner" src="img/banner/banner3.png">
                <img class="img_banner" src="img/banner/banner4.png">
        </div><!--// box_banner_contents end-->
        <div class="btn_banner" id="rightArrowBtn"><i class="fas fa-angle-right"></i></div>
        <div class="btn_banner" id="leftArrowBtn"><i class="fas fa-angle-left" ></i></div>
    </div><!--#box_banner end-->


    <div id="listBox">
        <div class="box_tap tap">
            <div class="btn_tap click">Hot 프로젝트</div><!--//btn_tap end-->
            <div class="btn_tap">SOS 프로젝트</div><!--//btn_tap end-->
            <div class="btn_tap">아이디어</div><!--//btn_tap end-->
        </div><!-- #tapBox end-->

        <div id="hotProjectList" class="box_project_list tap on_projectMain">
        </div><!--//box_project_list end-->

        <div id="sosListWrap" class=" box_project_list tap">
        </div><!--//box_project_list end-->

        <ul id="ideaListWrap" class="box_project_list tap ">
           <ul class="list_content_idea">
  			<li class="idea_writing idea_writing_pos">
       			 <div class="no_idea list_one">1</div>
       			 <div class="title_idea list_one"><a href="idea_detail_page.html">ㅌㅌㅌㅌㅌㅌㅌ</a></div>
        		 <div class="writer_idea list_one">ㅌㅌㅌ</div>
        		 <div class="time_idea list_one">ㅌㅌㅌ</div>
        	     <div class="hits_idea list_one">ㅌㅌㅌ</div>
       			 <div class="like_idea list_one">ㅌㅌㅌ</div>
   			 </li>
   			 
           </ul>
            <!-- <div class="paging">페이징 구간</div>//paging end -->

        </ul><!--//box_project_list end-->


    </div><!-- //box_project_list end-->

	<div class="wrap_search">
            <div class="box_search"><div class="btn_search"><i class="fas fa-search"></i> 프로젝트 검색</div></div><!--//box_search end-->
    </div><!-- wrap_search end-->



    <div id="filterWrap">
        <div id="filter">
            <ul class="wrap_sTitle_filter pos_system">
                <li class="size_sTitle_filter pos_sTitle_fiter">시스템</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> PC</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 모바일</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->

            <ul class="wrap_sTitle_filter pos_genre">
                <li class="size_sTitle_filter pos_sTitle_fiter">장르</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/>액션</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 캐쥬얼</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 전략</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 어드벤처</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 싱글플레이</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 롤플레이</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->

            <ul class="wrap_sTitle_filter pos_state">
                <li class="size_sTitle_filter pos_sTitle_fiter">상태</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 모집중</li>
                </label></label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 진행중</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 런칭</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->

            <ul class="wrap_sTitle_filter pos_team">
                <li class="size_sTitle_filter pos_sTitle_fiter">인원</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 1명</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 2인 ~ 5인</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 6인 이상</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->
        </div><!--// filter end-->

        <div class="wrap_btn_more">
            <div id="filterMoreBtn" class="btn_more fas fa-sort-down"></div><!--//moreBtn end-->
        </div><!--//wrap_btn_more end-->
    </div><!--// filterWrap end-->

    <div class="wrap_list_project">
        <div class="wrap_select">
            <div class="btn_select click_two">최신순</div><!--//btn_select end-->
            <div class="btn_select">인기순</div><!--//btn_select end-->
        </div><!--//wrap_select end-->

        <div id="projectList"></div><!--projectList end-->
        <div class="paging"></div><!--//paging end-->

    </div><!--//wrap_list_project end-->


</div><!--// contents end-->


<div class="popup_search"></div><!--//popup_search end-->
<div class="popup_search_game">

    <div class="box_search_input">
        <input class="input_game_title" type="text"/>

        <i class="fas fa-search search_icon"></i>

    </div><!--//box_search_input end-->
    <div class="box_game_list">

	</div><!--//box_game_list end-->
	
</div><!--//popup_search_game end-->


<%@ include file="/WEB-INF/template/footer.jsp" %>


<script type="text/template" id="listProjectCard">
    <div class="box_card_project">
        <img class="img_thumbnail_project" src="img/projectImgtest.jpg"/>
        <div class="box_state">모집중</div><!--//box_state end-->
        <div class="box_state_sos">SOS</div>
        <div class="text_name_project">NBA2K19</div><!-- //text_name end-->
        <div class="text_genre_project">스포츠</div><!--//text_genre end-->
    </div><!--//box_card_project end-->
</script><!--//listFreeBoardCard end-->


<script type="text/template" id="sosListCard">
    <div class="box_card_sos">
        <img class="img_thumbnail_project" src="img/projectImgtest.jpg"/>
        <div class="box_state">모집중</div><!--//box_state end-->
        <div class="box_state_sos">SOS</div>
        <div class="text_name_project">NBA2K19</div><!-- //text_name end-->
        <div class="text_genre_project">스포츠</div><!--//text_genre end-->
        <div class="view_sos">SOS 단계 표시</div><!--//view_sos end-->
        <div class="text_sos_view">SOS 사유 표시</div><!--//text_sos_view end -->
    </div><!--//box_card_sos end-->
</script><!--//listFreeBoardCard end-->



<script type="text/template" id="searchGameTmp">
    <div class="card_search_game">
        <div class="img_game">
            <img src="img/game/game1.jpg" width="100px" height="100px" alt="게임이미지" data-parent="게임명"/>
            <div class="text_game_title_search">
                게임타이틀
            </div>
        </div>
        <div class="text_genre_search card_text">
            장르 : 액션
        </div>
        <div class="text_pric_search card_text">
            <i class="fas fa-won-sign"></i> 50,000
        </div>
    </div>
</script><!--//cardTmp end-->


<script type="text/template" id="gameTmp">
<@ _.each(game,function(game){ @>
	<div class="card_search_game">
				<div class="img_game">
					<img src="img/game/<@= game.image@>" width="100px" height="100px"alt="<@= game.image@>" data-parent="<@= game.gameName@>" />
					<div class="text_game_title_pop"><@= game.gameName@></div>
					<!--//text_game_title_pop end-->
				</div><!--//img_game end -->
				<div class="text_genre_pop card_text">장르 : <@= game.genre@></div><!--// text_genre_pop-->
				<div class="text_price_pop card_text">
					<i class="fas fa-won-sign"></i> <@= game.price@>
				</div><!--//text_price_pop end-->
			</div><!--///card_search_game -->
<@}) @>
</script>



<script src="js/underscore-min.js"></script>
<script>
_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
var gameTmpl = _.template($("#gameTmp").html());



    //자동롤링
    var moveCtrl ;
    $('.box_banner').mouseover(function () {
        clearInterval(moveCtrl);
    });
    $(document).ready(function () {
        moveCtrl = setInterval(Move, 5000);
    })
    $('.box_banner').mouseout(function () {
        moveCtrl = setInterval(Move, 5000);
    });
    //자동롤링 함수
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



    var listProjectCard = _.template($("#listProjectCard").html());
    var sosListCard = _.template($("#sosListCard").html());
 

    for (var i = 0 ; i < 5 ; i++){
        $("#hotProjectList").append(listProjectCard());
    }// template end

    for (var i = 0 ; i < 5 ; i++){
        $("#sosListWrap").append(sosListCard());
    }// template end


    for (var i = 0 ; i < 15 ; i++){
        $("#projectList").append(listProjectCard());
    }// template2 end


    //필터 이벤트
    $('#filterMoreBtn').on('click',function () {
        var check = $(this).attr('class');

        if(check == 'btn_more fas fa-sort-down'){
            $(this).attr('class','btn_more fas fa-sort-up')
            $("#filter").css('height','350px');
        }else{
            $(this).attr('class','btn_more fas fa-sort-down')
            $("#filter").css('height','40px');
        }
    })//.btn_more end




    //배너 버튼 이벤트
    var banerPos = 0;
    $("#leftArrowBtn").click(function ()
    {
        console.log(banerPos);
        if(banerPos >=0){
            banerPos = 0
        }else {
            banerPos += 1006;
            $(".box_banner_contents").css("left", banerPos);
        }
    });//leftArrowBtn end

    $("#rightArrowBtn").click(function ()
    {
        console.log(banerPos);

        if(banerPos <= -2900){
            banerPos = -3000;
        }else {
            banerPos -=1006;
            $(".box_banner_contents").css("left", banerPos);
        }

    });//rightArrowBtn end


    //텝 이벤트
    $(".btn_tap").on("click",function () {
        var tapIndex = $(this).index();

        $(".click").removeClass("click");
        $(".tap").find(".btn_tap:nth-child("+(tapIndex+1)+")").addClass("click");
        tapIndex = tapIndex+2
        $(".on_projectMain").removeClass("on_projectMain");
        $(".tap:nth-child("+tapIndex+")").addClass("on_projectMain");

    });//.btn_tap click end

    //최신순 , 인기순 클릭 이벤트
    $(".btn_select").on("click",function () {

        var tapIndex = $(this).index();
        $(".click_two").removeClass("click_two");
        $(".btn_select:nth-child("+(tapIndex+1)+")").addClass("click_two");
    });


    /*// 게임 서치*/
    
    $('.btn_search').on('click',function () {
        $('.popup_search').show();
        $('.popup_search_game').show();
        $(".input_game_title").focus();
    })
    $('.popup_search').on('click',function () {

        $(this).css('display','none');
        $(".popup_search_game").css('display','none');
    })
    
   
    $(".search_icon").on('click',function(){
    	searchGame();
    });
    
    $(".input_game_title").keyup(function (key) {
    	 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	searchGame();
        }
 
    }); 
    
    
    
    function searchGame() {
     	var gameName = $('.input_game_title').val();
        	
        	if(gameName.length == 0){
    			alert('다시입력하세요');
        	}else{
        		
        		 $.ajax({
         	    	url:"ajax/selectGameList.jsp",
         	    	type: "post",
         	    	data:{
         	    		"gameName" : gameName
         	    	},
         	    	dataType : "json",
         	    	  error:function(){
         	              alert("서버 정검중!")
         	          },
         	          success:function(json){
         	        	  $(".box_game_list").html(gameTmpl({game:json}));
         	          }
         	    });//ajaxList end
        	}
    	}// 함수 end
    
 
</script>


</body>
</html>