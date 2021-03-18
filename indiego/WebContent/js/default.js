var $header_menu = $('.header_menu li'),
    $contents = $('#contents')
$dropDownBtn = $('#dropDownBtn');

$header_menu.on("click",function () {
    $('.on').removeClass('on');
    $(this).addClass('on');
    $contents.css({"border-top":"3px solid #fdd734"});
});

$dropDownBtn.on("click",function () {
    $(this).next().slideToggle(200);
});


$('#A').click(function() {
	alert("크리에이터 모드로 전환되었습니다.!!");
	$(this).html("유저 모드");
	$dropDownBtn.next().css('display','none');
});