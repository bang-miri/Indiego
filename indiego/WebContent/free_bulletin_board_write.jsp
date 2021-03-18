<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>자유게시판 글작성/수정</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/tui-editor.min.css">
    <link rel="stylesheet" href="css/tui-editor-contents.min.css" />
    <link rel="icon" href="img/favicon.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link rel="stylesheet" href="css/free_bulletin_board_write.css">
</head>
<body>
<div id="wrap">
    <div class="title">자유게시판</div><!-- .title end -->
    <input class="inp_title" name="" placeholder="제목"><!-- .inp_title end -->
    <div class="edit_border">
        <div id="editSection"></div><!-- #editSection end -->
    </div><!-- .edit_border end -->
    <div class="btn_wrap">
    <button class="btn_small2">등록</button><!-- .btn_register end -->
    <button class="btn_small">취소</button><!-- .btn_cancell end -->
    </div><!-- .btn_wrap end -->
</div><!-- #wrap end -->
<script src="js/jquery.js"></script>
<script src="js/tui-code-snippet.min.js"></script>
<script src='js/markdown-it.js'></script>
<script src="js/to-mark.min.js"></script>
<script src="js/codemirror.js"></script>
<script src="js/highlight.js"></script>
<script src="js/squire-raw.js"></script>
<script src="js/tui-editor-Editor.js"></script>
<script>

    //에디터
    //edit start
    $('#editSection').tuiEditor({
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: 600,
        language:"ko_KR"
    });

    $("#getBtn").click(function () {
        var value = $('#editSection').tuiEditor("getValue");
        $("#getDiv").html(value);
    });
    //edit end

</script>
</body>
</html>