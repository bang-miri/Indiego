<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>계정정보 변경</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="icon" href="img/favicon.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="css/modify_account_information.css">
</head>
<body>
<div id="wrap">
<h1 class="title">계정정보 변경</h1>
    <div class="content">
        <form>
            <div>
                <h3 class="list_content">계정정보 변경을 위해 아이디와 비밀번호를 한번 더 입력해주세요.</h3><!-- .list_content end -->
            </div><!-- .list_content end -->
            <div class="fa_id_border"></div><!-- .fa_id_border end -->
            <div class="fa_id">
                <i class="fas fa-user"></i>
            </div><!-- .fa_id end -->
            <div>
                <input class="inp_id" name="" placeholder="아이디를 입력해 주세요."><!-- .inp_id end -->
            </div>
            <div class="fa_pwd_border"></div><!-- .fa_pwd_border end -->
            <div class="fa_pwd">
                <i class="fas fa-key"></i>
            </div><!-- .fa_pwd end -->
            <div>
                <input class="inp_pwd" name="" type="password" placeholder="비밀번호를 입력해 주세요.">
            </div>
            <div>
                <button class="btn_big">계정정보 확인</button><!-- .btn_big end -->
            </div><!-- .btn_check end -->
        </form><!-- form end -->
    </div><!-- .content end -->
</div><!-- #wrap end -->
</body>
</html>