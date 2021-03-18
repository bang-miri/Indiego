<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>팔로워</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/reset.css" />
<link rel="icon" href="img/favicon.png" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link rel="stylesheet" href="css/follower_following.css">
</head>
<body>
	<div id="wrap">
		<ul class="tabs">
			<li class="active btn_tap_follower btn_big" rel="tab1">팔로워</li>
			<li class="btn_tap_following btn_big" rel="tab2">팔로잉</li>
		</ul>
		<!-- .tabs end -->


		<div class="tab_container">
			<div id="tab1" class="tab_content">
				<div class="content_tap_border"></div>
				<div class="title_follower">팔로워</div>
				<!-- .title_follower end -->
				<ul class="content_list">
					<li class="content_list_li1">

						<div class="fa_profile">
							<i class="fas fa-user-circle"></i>
						</div>
						<!-- .fa_profile end -->
						<div class="content_nickname">111</div>
						<!-- .content_nickname end -->
						<div class="btn_following">
							<button class="btn_small">팔로잉</button>
						</div>
						<!-- .btn_following end -->

					</li>
					<!-- .list_li end -->
				</ul>
				<!-- .content end -->
			</div>
			<!-- #tab1 .tab_content end -->
			<div id="tab2" class="tab_content">
				<div class="content_tap_border"></div>
				<!-- .content_tap_border end -->
				<div class="title_follower">팔로잉</div>
				<!-- .title_follower end -->
				<ul class="content_list">
					<li class="content_list_li2">

						<div class="fa_profile">
							<i class="fas fa-user-circle"></i>
						</div>
						<!-- .fa_profile end -->
						<div class="content_nickname">닉네임</div>
						<!-- .content_nickname end -->
						<div class="btn_following">
							<button class="btn_small">팔로잉</button>
						</div>
						<!-- .btn_following end -->

					</li>
					<!-- .content_list_li2 end -->
				</ul>
				<!-- .content_list end -->
			</div>
			<!-- #tab2 .tab_content end -->
		</div>
		<!-- .tab_container end -->

	</div>
	<!-- #wrap end -->





	<script src="js/jquery.js"></script>
	<script src="js/underscore-min.js"></script>
	<script>

    //탭
    $(function () {

        $(".tab_content").hide();
        $(".tab_content:first").show();

        $("ul.tabs li").click(function () {
            $("ul.tabs li").removeClass("active");
            $(this).addClass("active");
            $(".tab_content").hide();
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn()
        });
    });


</script>
</body>
</html>