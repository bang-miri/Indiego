<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게임 공략 상세페이지</title>
    <%@include file="WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="css/attack_Details.css">
</head>
<body>
<%@include file="WEB-INF/template/header.jsp" %>
<div id="contents">
    <div class="box_image"><img class="image_call" src="img/call%20of%20duty.jpg"></div><!-- .box_image end -->
    <div class="box_image_title">call of duty</div><!-- .box_image_title end -->
    <div class="title">제목</div><!-- .title end -->
    <div class="title_details">제목이 표시됩니다. 인풋아님!</div><!-- .title_details end -->
    <div><i class="fas fa-user-circle"></i></div><!-- 프로필이미지 폰트어썸 end -->
    <div class="nick">닉네임</div><!-- .nick end -->
    <div class="bat_img">뱃지</div><!-- .bat_img end -->
    <div class="num_views">조회수:??</div><!-- .num_views end -->
    <div class="creation_time">작성시간:YYYY.MM.DD / 17:29</div><!-- .creation_time end -->
    <div class="fa_bookmark">
        <i class="far fa-bookmark"></i>
    </div><!-- 북마크 폰트어썸 클릭 안햇을시 end -->
    <div class="fa_bookmark2">
        <i class="fas fa-bookmark"></i>
    </div><!-- 북마크 폰트어썸 클릭했을시 end -->
    <div class="content_details">여기는 게임에 대한 공략과 이미지가 들어 갑니다아아아아아아아아아아</div><!-- .content_details end -->
    <div class="btn_like">
        <button class="btn_small2">109 좋아요<i class="far fa-thumbs-up"></i></button>
    </div><!-- .btn_like end -->
    <div class="btn_report">
        <button class="btn_small">신고<i class="fas fa-bullhorn"></i></button>
    </div><!-- .btn_report end -->
    <div class="btn_change0">
        <button class="btn_small">수정</button>
    </div><!-- .btn_change0 end -->
    <div class="btn_delete0">
        <button class="btn_small">삭제</button>
    </div><!-- .btn_delete0 end -->
    <div class="list_content">댓글 쓰기</div><!-- .list_content end -->
    <div>
        <form class="form_leave">
            <textarea class="inp_content"></textarea><!-- .inp_content end -->
            <div class="btn_registration">
                <button class="btn_small3" type="button">등록</button>
            </div><!-- .btn_registration end -->
        </form><!-- .form_leave end -->
    </div> <!-- 방명록남기기 end -->
    <div class="list_content2">댓글 리스트 [댓글 수]</div><!-- .list_content2 end -->
    <div>
        <form class="form_leave2">
            <div class="write_none1">
                <div class="list_content3">내용이 표시되지요</div><!-- list_content3 end -->
                <div class="btn_change">
                    <button class="btn_small">수정</button>
                </div><!-- .btn_change end -->
                <div class="btn_delete">
                    <button class="btn_small">삭제</button>
                </div><!-- .btn_delete end -->
                <div class="btn_registration2">
                    <button class="btn_small3" type="button">답변달기</button>
                </div><!-- .btn_registration2 end -->
                <div class="fa_profile"><i class="fas fa-user-circle"></i></div><!-- .fa_profile end -->
                <div class="list_nick">닉네임</div><!-- .list_nick end -->
            </div><!-- .write_none1 end -->
            <div class="write_none2">
                <textarea class="inp_content4" placeholder="대댓글 입력"></textarea><!-- .inp_content4 end -->
                <div class="btn_change2">
                    <button class="btn_small">수정</button>
                </div><!-- .btn_change2 end -->
                <div class="btn_delete2">
                    <button class="btn_small">삭제</button>
                </div><!-- .btn_delete2 end -->
                <div class="btn_registration3">
                    <button class="btn_small3" type="button">등록</button>
                </div><!-- .btn_registration3 end -->
                <div class="fa_profile2"><i class="fas fa-user-circle"></i></div><!-- .fa_profile2 end -->
                <div class="list_nick2">닉네임</div><!-- .list_nick2 end -->
            </div><!-- .write_none2 end -->
            <div class="write_none3">
                <div class="list_content5">대댓글에 대한 내용이 표시되지요</div><!-- .list_content5 end -->
                <div class="btn_change3">
                    <button class="btn_small">수정</button>
                </div><!-- .btn_change3 end -->
                <div class="btn_delete3">
                    <button class="btn_small">삭제</button>
                </div><!-- .btn_delete3 end -->
                <div class="btn_registration4">
                    <button class="btn_small3" type="button">답변달기</button>
                </div><!-- .btn_registration4 end -->
                <div class="fa_profile3"><i class="fas fa-user-circle"></i></div><!-- .fa_profile3 end -->
                <div class="list_nick3">닉네임</div><!-- .list_nick3 end -->
            </div><!-- .write_none end -->
            <div id="paging"></div><!-- #paging end -->
        </form><!-- .form_leave2 end -->
    </div><!-- 방명록리스트 end -->
    <div class="content_next_form">
        <ul class="next_link_list">
            <li>
            	<a class="link_no_next"  href="#">
            	이전글:ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ..
            	</a>
            </li>
            <li>
            	<a class="link_next"  href="#">
            		다음글:ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ..
            	</a>		
            </li>
        </ul>
    </div><!-- .content_next_form -->
</div><!-- #contents end -->
<%@include file="WEB-INF/template/footer.jsp" %>
<script>

    //북마크
    $(".fa_bookmark").click(function () {
        $(".fa_bookmark").hide();
        $(".fa_bookmark2").show();
    });

    $(".fa_bookmark2").click(function () {
        $(".fa_bookmark2").hide();
        $(".fa_bookmark").show();
    });




    //댓글
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






    //페이징 처리
    //paging start
    var totalData = 1000;    // 총 데이터 수
    var dataPerPage = 20;    // 한 페이지에 나타낼 데이터 수
    var pageCount = 5;        // 한 화면에 나타낼 페이지 수

    function paging(totalData, dataPerPage, pageCount, currentPage){

        console.log("currentPage : " + currentPage);

        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹

        console.log("pageGroup : " + pageGroup);

        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
        if(last > totalPage)
            last = totalPage;
        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
        var next = last+1;
        var prev = first-1;

        console.log("last : " + last);
        console.log("first : " + first);
        console.log("next : " + next);
        console.log("prev : " + prev);

        var $pingingView = $("#paging");

        var html = "";

        if(prev > 0)
            html += "<a href=# id='prev'><</a> ";

        for(var i=first; i <= last; i++){
            html += "<a href='#' id=" + i + ">" + i + "</a> ";
        }

        if(last < totalPage)
            html += "<a href=# id='next'>></a>";

        $("#paging").html(html);    // 페이지 목록 생성
        $("#paging a").css("color", "#0e47a1");
        $("#paging a#" + currentPage).css({"text-decoration":"none",
            "color":"#fdd734",
            "font-weight":"bold"});    // 현재 페이지 표시

        $("#paging a").click(function(){

            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();

            if($id == "next")    selectedPage = next;
            if($id == "prev")    selectedPage = prev;

            paging(totalData, dataPerPage, pageCount, selectedPage);
        });
    }

    $("document").ready(function(){
        paging(totalData, dataPerPage, pageCount, 1);
    });//paging end
</script>
</body>
</html>