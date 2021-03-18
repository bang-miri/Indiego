<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>계정정보 수정</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="icon" href="img/favicon.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="css/modify_account_information2.css">
</head>
<body>
<div id="wrap">
    <h1 class="title">계정정보 수정</h1>
    <div class="content">
        <div class="content_form">
            <form>
                <div>아이디</div>
                <div>
                    계정 본인 아이디 표시
                </div>
                <div>
                    변경할 비밀번호
                </div>
                <div>
                    <input class="inp_pwd" name="" type="password" placeholder="비밀번호를 입력해 주세요."><!-- inp_pwd end -->
                </div>
                <div>
                    비밀번호
                </div>
                <div>
                    <input class="inp_pwd2" name="" type="password" placeholder="비밀번호를 입력해 주세요."><!-- inp_pwd2 end -->
                </div>
                <div>
                    이메일
                </div>
                <div>
                    <input class="inp_mail" type="text" name="email1" value="" /><!-- .inp_mail end -->
                    @
                    <input class="inp_mail2" type="text" name="email2" value="" ReadOnly="true"/><!-- inp_mail2 end -->
                    <select class="select_mail" name="emailCheck"
                            onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
                        <option value="notSelected" >::선택하세요::</option>
                        <option value="etc">직접입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="empal.com">empal.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="lycos.co.kr">lycos.co.kr</option>
                        <option value="msn.com">msn.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="yahoo.com">yahoo.com</option>
                        <option value="korea.com">korea.com</option>
                        <option value="kornet.net">kornet.net</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                        <option value="kebi.com">kebi.com</option>
                        <option value="orgio.net">orgio.net</option>
                        <option value="paran.com">paran.com</option>
                        <option value="gmail.com">gmail.com</option>
                    </select><!--select end-->
                </div>
            </form><!-- form1 end -->
            <form>
                <div class="choice_border">
                    추가입력사항.(선택)
                </div>
                <div>
                    휴대전화
                </div>
                <div>
                    <input class="inp_phone" name="" placeholder="000-0000-0000"><!-- inp_phone end -->
                    <button class="btn_small1" type="button"><!-- btn_small1 end -->
                        승인번호 받기
                    </button>
                    <input name="phone" type="radio" checked>공개<!-- radio 공개 end -->
                    <input name="phone" type="radio">비공개<!-- radio 비공개 end -->
                </div>
                <div class="inp_confirm_wrap">
                    승인번호
                    <input class="inp_confirm" name="" type="text"><!-- inp_confirm end -->
                    <button class="btn_small2" type="button">번호인증</button><!-- btn_small2 end -->
                </div><!-- .inp_confirm_wrap end -->
                <div class="text_ok">
                    핸드폰 번호가 인증 되었습니다.
                </div><!-- .text_ok end -->
                <div>
                    주소
                </div>
                <div>
                    <input class="inp_address" name="" type="text" placeholder="ex) 인천광역시 (시 도)"><!-- inp_search end -->
                </div>
                <div>
                    <input class="inp_address2" name="" placeholder="ex) 남동구 (구 군)"><!-- .inp_address_detail end -->
                </div>
                <div>
                    <input class="inp_address3" name="" placeholder="ex) 구월동 (동)">
                    <input name="street" type="radio" checked>공개<!-- radio 공개 end -->
                    <input name="street" type="radio">비공개<!-- radio 비공개 end -->
                </div>
                <button class="btn_small3" type="button">변경하기</button><!-- .btn_small3 end -->
            </form><!-- form2 end -->
        </div><!-- .content_form end -->
    </div><!-- .content end -->
    <div id="popup">
        승인번호를 전송하였습니다.
        <div class="btn_popup_ok">
            <button class="btn_small" type="button">확인</button>
        </div><!-- .btn_popup_ok -->
    </div><!-- #popup end -->

    <div id="popup2">
        계정정보가 변경 되었습니다.
        <div class="btn_popup_ok">
            <button class="btn_small" type="button">확인</button>
        </div><!-- .btn_popup_ok -->
    </div><!-- #popup2 end -->

</div><!-- #wrap end -->
<script src="js/jquery.js"></script>
<script>



    //팝업
    $(".btn_small1").click(function () {
        $("#popup").show();
    });

    $(".btn_popup_ok").click(function () {
        $("#popup").hide();
    });

    $(".btn_small2").click(function () {
        $(".text_ok").show();
    });

    $(".btn_small3").click(function () {
        $("#popup2").show();
    });

    $(".btn_small").click(function () {
        $("#popup2").hide();
    });








    //이메일 직접입력
    function SetEmailTail(emailValue) {
        var email = document.all("email");    // 사용자 입력
        var emailTail = document.all("email2"); // Select box

        if ( emailValue == "notSelected" )
            return;
        else if ( emailValue == "etc" ) {
            emailTail.readOnly = false;
            emailTail.value = "";
            emailTail.focus();
        } else {
            emailTail.readOnly = true;
            emailTail.value = emailValue;
        }
    }
</script>
</body>
</html>