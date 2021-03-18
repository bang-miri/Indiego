<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>로그인/ID&PWD찾기/회원가입</title>
<link rel="stylesheet" href="css/login_id_pwd.css">
<%@include file="/WEB-INF/template/link.jsp" %>
</head>
<body>

	<div id="loginBodyMask"></div>
	<button class="openbodyMask">로그인 버튼</button>


	<div class="login_background_window">
		<!-- 로그인폼 -->
		<div id="loginWrap">
			<img class="img_logo" src="img/logo.png">
			<!-- .img_logo end -->
			<div class="content">
				<form>
					<div>
						<input class="inp_id" name="" placeholder="아이디">
					</div>
					<!-- .inp_id end -->
					<div>
						<input class="inp_pwd" name="" type="password" placeholder="비밀번호">
					</div>
					<!-- .inp_pwd end -->
					<div class="btn_login">
						<button class="btn_small">로그인</button>
					</div>
					<!-- .btn_login end -->
				</form>
			</div>
			<!-- .content end -->
			<div class="content_menu">아이디 찾기 |</div>
			<!-- .content_menu end -->
			<div class="content_menu2">비밀번호 찾기 |</div>
			<!-- .content_menu2 end -->
			<div class="content_menu3">회원가입</div>
			<!-- .content_menu3 end -->
		</div>
		<!-- #loginWrap end -->


		<!-- 아이디 및 비밀번호 찾기 상단 탭 -->
		<div id="idPwdWrap">
			<ul class="tabs">
				<li class="active btn_big find" rel="tab1">아이디 찾기</li>
				<!-- .tab-link current end -->
				<li class="btn_big find" rel="tab2">비밀번호 찾기</li>
				<!-- .tab-link end -->
			</ul>
			<!-- .tabs end -->


			<!-- 아이디 찾기 탭 -->
			<div id="tab1" class="tab_content current">
				<form class="content_form">
					<div>
						<input class="inp_nickname" name="" placeholder="닉네임">
					</div>
					<!-- .inp_nickname end -->
					<div>
						<input class="inp_mail" type="text" name="email1" value=""
							placeholder="이메일" />
						<!-- .inp_mail end -->
						@ <input class="inp_mail2" type="text" name="email2" value=""
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
					<div class="btn_mail">
						<button class="btn_small1">이메일로 아이디 전송</button>
					</div>
					<!-- .btn_mail end -->
				</form>
				<!-- .content_form end -->
			</div>
			<!-- #tab1 .tab_content current end -->


			<!-- 비밀번호 찾기 탭 -->
			<div id="tab2" class="tab_content current2">
				<form class="content_form2">
					<div>
						<input class="inp_id2" name="" placeholder="아이디">
					</div>
					<!-- .inp_id2 end -->
					<div>
						<input class="inp_nickname2" name="" placeholder="닉네임">
					</div>
					<!-- .inp_nickname2 end -->
					<div>
						<input class="inp_mail3" type="text" name="email3" value=""
							placeholder="이메일" />
						<!-- inp_mai3 end -->
						@ <input class="inp_mail4" type="text" name="email4" value=""
							ReadOnly="true" />
						<!-- inp_mail4 end -->
						<select class="select_mail2" name="emailCheck"
							onchange="SetEmailTail2(emailCheck.options[this.selectedIndex].value)">
							<option value="notSelected2">::선택하세요::</option>
							<option value="etc2">직접입력</option>
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
						<!-- .select_mail2 end -->
					</div>
					<div class="btn_mail2">
						<button class="btn_small1">이메일로 비밀번호 전송</button>
					</div>
					<!-- .btn_mail2 end -->
				</form>
				<!-- .content_form2 end -->
			</div>
			<!-- #tab2 .tab_content current2 end -->
		</div>
		<!-- #idPwdWrap end -->
	</div>

	<script src="js/jquery.js"></script>
	<script>
		function wrapWindowBybodyMask() {
			//화면의 높이와 너비를 구한다.
			var bodyMaskHeight = $(document).height();
			var bodyMaskWidth = $(window).width();

			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
			$('#loginBodyMask').css({
				'width' : bodyMaskWidth,
				'height' : bodyMaskHeight
			});

			//애니메이션 효과 - 70% 불투명
			$('#loginBodyMask').fadeTo("slow", 0.7);

			//클래스명이 윈도우인 창을 띄운다.
			$('.login_background_window').show();
		}

		$(document).ready(function() {
			//검은 막 띄우기
			$('.openbodyMask').click(function(e) {
				e.preventDefault();
				wrapWindowBybodyMask();
			});

			//검은 막을 눌렀을 때
			$('#loginBodyMask').click(function() {
				$(this).hide();
				$('.login_background_window').hide();
			});
		});

		$(".content_menu").click(function() {
			$("#loginWrap").hide();
			$("#idPwdWrap").show();
		});//click() end

		$(".content_menu2").click(function() {
			$("#loginWrap").hide();
			$("#idPwdWrap").show();
		});//click() end

		$(".btn_mail").click(function() {
			$("#idPwdWrap").hide();
			$("#loginWrap").show();
		});//click() end

		$(".btn_mail2").click(function() {
			$("#idPwdWrap").hide();
			$("#loginWrap").show();
		});//click() end

		//아이디 탭 이메일 직접입력
		function SetEmailTail(emailValue) {
			var email = document.all("email"); // 사용자 입력
			var emailTail = document.all("email2"); // Select box

			if (emailValue == "notSelected")
				return;
			else if (emailValue == "etc") {
				emailTail.readOnly = false;
				emailTail.value = "";
				emailTail.focus();
			} else {
				emailTail.readOnly = true;
				emailTail.value = emailValue;
			}
		}

		//비밀번호 탭 이메일 직접입력
		function SetEmailTail2(emailValue2) {
			var email2 = document.all("email3"); // 사용자 입력
			var emailTail2 = document.all("email4"); // Select box

			if (emailValue2 == "notSelected2")
				return;
			else if (emailValue2 == "etc2") {
				emailTail2.readOnly = false;
				emailTail2.value = "";
				emailTail2.focus();
			} else {
				emailTail2.readOnly = true;
				emailTail2.value = emailValue2;
			}
		}

		//아이디 찾기 클릭시 아이디 찾기 탭부터 보여짐
		$(".content_menu").click(function() {

			$(".tab_content").hide();
			$(".tab_content:first").show();

			$("ul.tabs li").click(function() {
				$("ul.tabs li").removeClass("active");
				//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
				$(this).addClass("active");
				$(".tab_content").hide()
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn()
			});

		});

		//비밀번호 찾기 클릭시 비밀번호 찾기 탭부터 보여짐
		$(".content_menu2").click(function() {

			$(".tab_content").hide();
			$(".tab_content:last").show();

			$("ul.tabs li").click(function() {
				$("ul.tabs li").removeClass("active");
				//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
				$(this).addClass("active");
				$(".tab_content").hide()
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn()
			});

		});
	</script>
</body>
</html>