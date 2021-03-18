<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>런칭이후 문의탭</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="icon" href="img/favicon.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="css/project_Inquiry.css">
</head>
<body>
<div id="wrap">
    <button class="tab_project">프로젝트일지</button><!-- .tab_project end -->
    <button class="tab_launching">런칭이후</button><!-- .tab_launching end -->
    <div class="border_tap">
        <button class="tab_update">업데이트일지</button><!-- .tab_update end -->
        <button class="tab_inquiry">문의</button><!-- .tab_inquiry end -->
    </div><!-- .border_tap end -->
    <div class="box_content">
        <script type="text/template" id="listTmp">
            <@ _.each(lists,function(list) {@>
            <div class="border_content">
                <div class="content_title fas fa-lock"></div><!-- .content_title end -->
            </div><!-- .border_content end -->
            <div class="content_details"></div><!-- .content_details end -->
            <@})@>
        </script><!-- template script end -->
    </div><!-- .box_content end -->
    <div id="paging"></div><!-- #paging end -->
</div><!-- #wrap end -->
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

    //템플릿
    var tmp = _.template($("#listTmp").html());

    $.ajax({
        url:"ajax/list.json",
        type:"get",
        dateType:"json",
        error:function () {
            alert("error");
        },
        success:function (json) {
            $("#wrap").append(tmp({lists:json}))
        }
    });

    //페이징
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