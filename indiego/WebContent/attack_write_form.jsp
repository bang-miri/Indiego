<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게임공략 작성</title>
    <link rel="stylesheet" href="css/tui-editor.min.css">
    <link rel="stylesheet" href="css/tui-editor-contents.min.css" />
    <link rel="stylesheet" href="css/reset.css">
    <link rel="icon" href="img/favicon.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link rel="stylesheet" href="css/attack_write_form.css">
    <link rel="stylesheet" href="css/game_search_popup.css"/>
</head>
<body>
<div id="wrap">
    <div class="box_image_title"></div><!-- box_image_title end -->
    <div class="fa_search"><i class="fas fa-search"></i></div><!-- .fa_search end -->
    <div class="title">
        제목<input class="inp_title" name="" placeholder="제목을 입력해주세요"><!-- .inp_title end -->
    </div><!-- .title end -->
    <div class="content">내용</div><!-- .content end -->
    <div id="editSection"></div><!-- #editSection end -->
    <div class="btn_small_wrap">
    <button class="btn_small2">등록</button><!-- .btn_small end -->
    </div><!-- btn_small_wrap end -->




    <!-- 게임서치 팝업 -->
    <div class="popup_search_game">

        <div class="box_search_input">
            <input class="input_game_title" type="text"/>

            <i class="fas fa-search search_icon"></i>

        </div>
        <div class="box_game_list">

        </div>
    </div>
    <script type="text/template" id="searchGameTmp">

        <div class="card_search_game">
            <div class="img_game">
                <img src="img/game/game1.jpg" width="100px" height="100px" alt="게임이미지" data-parent="게임명"/>
                <div class="text_game_title">
                    게임타이틀
                </div>
            </div>
            <div class="text_genre card_text">
                장르 : 액션
            </div>
            <div class="text_price card_text">
                <i class="fas fa-won-sign"></i> 50,000
            </div>
        </div>
    </script><!--//cardTmp end-->

</div><!-- #wrap end -->

<script src="js/jquery.js"></script>
<script src="js/tui-code-snippet.min.js"></script>
<script src='js/markdown-it.js'></script>
<script src="js/to-mark.min.js"></script>
<script src="js/codemirror.js"></script>
<script src="js/highlight.js"></script>
<script src="js/squire-raw.js"></script>
<script src="js/tui-editor-Editor.js"></script>
<script src="js/underscore-min.js"></script>
<script>

    //게임서치 팝업 폰트어썸 클릭시 팝업창 띄우기
    $(".fa_search").click(function () {
        $(".popup_search_game").show();
    });

    $(".box_game_list").click(function () {
        $(".popup_search_game").hide();
    });


    //에디터
    $('#editSection').tuiEditor({
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: 600,
        language:"ko_KR"
    });

    $("#getBtn").click(function () {
        var value = $('#editSection').tuiEditor("getValue");
        $("#getDiv").html(value);
    });<!-- edit end -->



    //게임서치 템플릿
    var searchGameCard=_.template($("#searchGameTmp").html());
    for(var i=0; i<50;i++){
        $(".box_game_list").append(searchGameCard);
    };

</script>
</body>
</html>