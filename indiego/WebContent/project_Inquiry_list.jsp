<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>런칭이후 문의탭</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="icon" href="img/favicon.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="css/project_Inquiry_list.css">
</head>
<body>
<div id="wrap">
    <button class="tab_project">프로젝트일지</button><!-- .btn_project end -->
    <button class="tab_launching">런칭이후</button><!-- .btn_launching end -->
    <div class="border_tap">
        <button class="tab_update">업데이트일지</button><!-- .btn_update end -->
        <button class="tab_inquiry">문의</button><!-- .btn_inquiry end -->
    </div><!-- .border_tap end -->
    <div class="wrap_debate">
        <div class="wrap_debate_mTitle ">
            <div class="icon_mTitle_size fas fa-lock"></div><!--//icon_mTitle_size end-->
            <div class="mTitle_font_size">여기가 제목</div><!--// mTitle_font_size end-->
        </div><!--//wrap_debate_mTitle end-->
        <div class="wrap_debate_sTitle sTitle_debate_pos">
            <div class="img_card_profile stitle_debate_pos"></div><!--//img_card_profile end-->
            <div class="text_small_size stitle_debate_pos text_profile_pos"> 홍길동XX</div><!--//text_small_size end-->
            <div class="text_middle_size stitle_debate_pos view_debate_pos">조회수 : XXXX</div>
            <div class="text_big_size stitle_debate_pos  pos_date_write">XXXX년XX월XX일</div>
        </div><!--//wrap_debate_sTitle end-->
        <div class="wrap_debate_contents">
            여기가 문의 상세글
        </div><!-- .wrap_debate_contents end -->
        <div class="wrap_btn_btn">
            <div class="btn_  btn_pos_debate btn_debate_pos_modified">
            <button class="btn_small">수정</button>
            </div><!--//btn_delete end-->
            <div class="btn_  btn_pos_debate btn_debate_pos_delete">
            <button class="btn_small">삭제</button>
            </div><!--//btn_delete end-->
        </div><!-- .wrap_btn_btn end -->
    </div><!-- .wrap_debate end -->
    <input class="inp_comment" name="" placeholder="댓글을 남겨주세요."><!-- .inp_comment end -->
    <div class="btn_send">
    <button class="btn_small2">보내기</button>
    </div><!-- .btn_send end -->
    <div class="content_comment">
        <div class="fa_content_comment">
            <i class="fas fa-user-circle"></i><!-- 프로필 이미지 -->
            <div class="profile_nickname">닉네임</div><!-- .profile_nickname end -->
        </div><!-- .fa_content_comment end -->
        <div class="btn_change">
        <button class="btn_small">수정</button>
        </div><!-- .btn_change end -->
        <div class="btn_delete">
        <button class="btn_small">삭제</button>
        </div><!-- .bnt_delete end -->
        무한한 가치를 가진 것이다.
        사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게
        살 수 있는 것이다. 석가는 무엇을 위하여 설산에서 고행을
        하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는
        무엇을 위하여 천하를 철환하였는가?
    </div><!-- .content_comment end -->
</div><!-- #wrap end -->
</body>
</html>