<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/reset.css" />
<link rel="icon" href="img/favicon.png" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link rel="stylesheet" href="css/join_membership_Form.css">
</head>
<body>
	<div id="wrap">
		<div class="content">
			<div>
				<img class="img_logo" src="img/logo.png">
			</div>
			<!-- .img_logo end -->
			<form class="form_content" method="post" action="join_membership.jsp">
				<div>
					<input class="inp_id" autocomplete="off" name="id"
						placeholder="아이디">
						<div class="msg_inp_id">영어,숫자 4~20글자로 입력해주세요.</div>
				</div>
				<!-- .inp_id end -->

				<div>
					<input class="inp_pwd" autocomplete="off" name="pwd"
						type="password" placeholder="비밀번호">
				</div>
				<!-- .inp_pwd end -->
				<div class="content_inp">영어,숫자 4~32글자로 입력해주세요.</div>
				<!-- .content_inp end -->
				<div>
					<input class="inp_pwd2" autocomplete="off" type="password"
						placeholder="비밀번호 재확인">
				</div>
				<!-- .inp_pwd2 end -->
				<div class="content_inp2">비밀번호를 한번더 입력해주세요.</div>
				<!-- .content_inp2 end -->
				<div>
					<input class="inp_nickname" autocomplete="off" name="nickName"
						placeholder="닉네임">
						<div class="msg_inp_nickname">한글로 1~10글자로 입력해주세요.</div>
				</div>
				<!-- .inp_nickname end -->
				<div>
					<input class=inp_mail type="text" name="email" value="" />
					<!-- .inp_mail end -->
					<div class="mail_icon">@</div>
					<input class="inp_mail2" type="text" name="email2" value=""
						ReadOnly="true" />
					<!-- .inp_mail2 end -->
					<select class="select_mail" name="emailCheck"
						onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
						<option value="notSelected">::선택하세요::</option>
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
					</select>
					<!-- .select_mail end -->
				</div>
				<div class="btn_join">
					<button type="submit" class="btn_small2">가입하기</button>
				</div>
				<!-- .btn_join end -->
			</form>
			<!-- .form_content end -->
		</div>
		<!-- .content end -->
	</div>
	<!-- #wrap end -->
	<div id="popup">
		<div class="popup_content">
			<div class="popup_title">회원가입이 완료 되었습니다.</div>
			<!-- .popup_title end -->
			<div class="btn_ok">
				<button class="btn_small" onclick="location.href = '#' ">확인</button>
			</div>
			<!-- .btn_ok end -->
		</div>
		<!-- .popup_content end -->
	</div>
	<!-- #popup end -->
	<script src="js/jquery.js"></script>
	<script>
	
	

	//form
	var $joinForm = $(".content>form");

	/* 정규 표현식 */

	//아이디가 영어와 숫자로 4~20글자까지라면
	var idReg = /^[\w]{3,19}$/;
	//비밀번호가 4~32자로 영어, 숫자
	var pwdReg = /^[\w]{4,32}$/;
	//닉네임 정규표현식
	var nicknameReg = /^[ㄱ-힣|0-9]{1,10}$/;

	//id
	var $id = $(".inp_id");
	//id msg
	var $idMsg = $(".msg_inp_id");

	//nickname
	var $nickname = $(".inp_nickname");
	//nickname msg
	var $nicknameMsg = $(".msg_inp_nickname");

	//pwd
	var $pwd = $(".inp_pwd");
	//pwd msg
	var $pwdMsg = $(".content_inp");

	//confirm
	var $confirm = $(".inp_pwd2");
	//confirm msg
	var $confirmMsg = $(".content_inp2");




	//유저가 이전에 입력한 값(ajax경우 중복 요청을 막기 위해서)
	var oldId = null;
	var oldNickname = null;
	var oldProfile = null;

	//유효성검사가 되었는지 확인하는 변수
	var isValidId = false;
	var isValidNickname = false;
	var isValidPwd = false;
	var isConfirmPwd = false;
	var isValidBirth = false;

	/*유효성검사 함수들 */

	function checkConfirmPwd() {
		
		var value = $confirm.val();
		
		if(value.length!=0 && value==$pwd.val()) {
			isConfirmPwd = true;
			$confirmMsg.addClass("ok")
			           .text("비밀번호가 일치합니다.");
		}else {
			isConfirmPwd = false;
			$confirmMsg.removeClass("ok")
	        .text("비밀번호가 일치하지 않습니다.");
			//$confirm.val("").focus();
		}//if else end
		
	}//checkConfirmPwd() end

	//비밀번호 유효성검사하는 함수
	function checkPwd() {
		
		if(pwdReg.test($pwd.val())) {
			$pwdMsg.addClass("ok").text("사용 가능한 비밀번호 입니다.");
			isValidPwd = true;
		}else {
			$pwdMsg.removeClass("ok").text("영어,숫자 4~32글자로 입력해주세요.");
			isValidPwd = false;
		}//if~else end
		
		checkConfirmPwd();
		
	}//checkPwd() end

	function checkNickname() {
		
	    //유저가 입력한 값을 얻어옴
	   var value = $nickname.val();
	    
	    //이전 글자와 현재 글자가 같지 않을때만
	   if(oldNickname!=value) { 
		   //현재 글자를 이전글자로 업데이트
		   oldNickname = value;
	   
		   if(nicknameReg.test(value)) {
			   
			 	//체크를 다시 시작하니까 무조건 false로
				isValidNickname = false;
			   
			   //ajax작동시작
			   $nicknameMsg.removeClass("ok")
			         .text("확인중...");
			   
			   //application/x-www-form-urlencoded
			   $.ajax({
				   url:"/ajax/checkNickname.jsp",
				   dataType:"json",
				   data:{"nick_name":value},
				   error:function() {
					   
					  alert("서버 점검중!");
					  
				   },
				   success:function(json) {
					   
					   if(json.count==0) {
						   isValidNickname = true;
						   $nicknameMsg.addClass("ok").text("사용 가능한 닉네임 입니다.");
					   }else {
						   isValidNickname = false;
						   $nicknameMsg.removeClass("ok").text("중복된 닉네임 입니다.");
					   }//if~else end
					   
				   }//success end
			   });//$.ajax() end
		        
		   }else {
		        $nicknameMsg.removeClass("ok").text("한글로 1~10글자로 입력해주세요.");
		   }//if~else end
	   
	   }//if end
		
	}//checkNickname() end

	//아이디 유효성검사용 함수
	function checkId() {
		
	    //유저가 입력한 값을 얻어옴
	   var value = $id.val();
	    
	    //이전 글자와 현재 글자가 같지 않을때만
	   if(oldId!=value) { 
		   //현재 글자를 이전글자로 업데이트
		   oldId = value;
	   
		   if(idReg.test(value)) {
			   
			 	//체크를 다시 시작하니까 무조건 false로
				isValidId = false;
			   
			   //ajax작동시작
			   $idMsg.removeClass("ok")
			         .text("확인중...");
			   
			   //application/x-www-form-urlencoded
			   $.ajax({
				   url:"/ajax/checkId.jsp",
				   dataType:"json",
				   data:{"id":value},
				   error:function() {
					   
					  alert("서버 점검중!");
					  
				   },
				   success:function(json) {
					   
					   if(json.count==0) {
						   isValidId = true;
						   $idMsg.addClass("ok").text("사용할 수 있는 아이디 입니다.");
					   }else {
						   isValidId = false;
						   $idMsg.removeClass("ok").text("중복된 아이디 입니다.");
					   }//if~else end
					   
				   }//success end
			   });//$.ajax() end
		        
		   }else {
		        $idMsg.removeClass("ok").text("영어,숫자 4~20글자로 입력해주세요.");
		   }//if~else end
	   
	   }//if end

	}//checkId end

	$id.keyup(checkId)
	   .blur(checkId)
	   .focus();//id에 포커스 지정
	   
	$nickname.keyup(checkNickname)
	         .blur(checkNickname);
	   
	$pwd.keyup(checkPwd);
	   
	$confirm.keyup(checkConfirmPwd);  
	   
	//profile사진이 변경되면
	$profile.change(checkProfile);//change() end

	//사진 x버튼 눌렀을때 사진 초기화
	$(".delete").click(function() {
		$profile.val("");
		$profileName.val("");
		$profileBox.addClass("no_image");
	});//click() end

	//form submit
	$joinForm.submit(function() {

		checkNickname();
		checkPwd();
		checkBirthDate();
		checkProfile();
		
		/*
		console.log("submit 할때");
		console.log(isValidId);
		console.log(isValidNickname);
		console.log(isValidPwd);
		console.log(isConfirmPwd);
		console.log(isValidBirth);
		console.log(!$profileBox.hasClass("no_image"));
		*/
		
		if(!isValidId ||
		   !isValidPwd ||
		   !isConfirmPwd ||
		   !isValidNickname ||
		   !isValidBirth ||
		   $profileBox.hasClass("no_image")
		   ) {
			//console.log("서브밋 안됨");
			return false;
		}//if end
		
	});//submit() end

	
	
	
	
	
	
	
	
	
	


    //회원가입 완료 팝업
    $(".btn_join").click(function () {

        $("#popup").show();

    });//btn_join click() end

    $(".btn_ok").click(function () {

        $("#popup").hide();

    });//btn_ok click()



    //이메일 셀렉-직접입력
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