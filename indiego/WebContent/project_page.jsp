<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>project</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/default.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <!--<link rel="stylesheet" href="css/style.css">-->
    <link rel="stylesheet" href="css/codemirror.css">
    <link rel="stylesheet" href="css/github.css">
    <link rel="stylesheet" href="css/tui-editor.min.css">
    <link rel="stylesheet" href="css/tui-editor-contents.min.css">
    <link rel="stylesheet" href="css/tui-color-picker.min.css">
    <style>
        #popupBg{
            z-index: 5;
            width: 100%;
            height: 100%;
            background-color: rgba(000,000,000,.3);
            position: relative;
            left: 0;
            top: 0;
            overflow: auto;
        }
        body button{
            border-radius: 5px;
            border: none;
            outline: none;
            cursor: pointer;
            font-weight: bold;
        }
        * {
            box-sizing: border-box;
        }

        #gameSystemAera{
            position: absolute;
            top: -5px;
            left: 200px;
        }
        #gameGenreAera{
            position: absolute;
            top: -5px;
            left: 430px;
        }

        label.field {
            border-radius: 2px;
            color: #666;
            display: block;
            margin: 16px;
            max-width: 200px;
            padding: 8px;
            opacity: 0;
            position: relative;
            -webkit-transition-property: opacity;
            transition-property: opacity;
            z-index: 1;
        }
        label.field span {
            color: inherit;
            display: block;
            font-size: 16px;
            height: 20px;
            line-height: 20px;
            left: 9px;
            pointer-events: none;
            position: absolute;
            top: 32px;
            -webkit-transform: scale(1) translateY(0);
            transform: scale(1) translateY(0);
            -webkit-transition-property: color, font-size, top;
            transition-property: color, font-size, top;
            z-index: 1;
        }
        label.field span.required::after {
            color: inherit;
            content: "*";
            display: block;
            height: 20px;
            left: -20px;
            line-height: 20px;
            position: absolute;
            text-align: center;
            top: 0;
            width: 20px;
        }
        .error label.field span {
            color: #F02318;
        }
        label.field .psuedo_select {
            background: rgba(255, 255, 255, 0);
            position: relative;
            border-color: #666;
            border-style: solid;
            border-width: 0 0 2px 0;
            color: #0e47a1;
            cursor: pointer;
            font-size: 18px;
            height: 24px;
            line-height: 24px;
            margin: 24px 32px 0 0;
            min-width: 200px;
            padding-top: 24px;
            outline: 0;
            z-index: 1;
        }
        label.field .psuedo_select::after {
            background: url("data:image/svg+xml;utf8,<svg fill='#666' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'> <path d='M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z'/> <path d='M0-.75h24v24H0z' fill='none'/> </svg>"), no-repeat;
            content: "";
            height: 24px;
            width: 24px;
            position: absolute;
            top: 0;
            right: 0;
            -webkit-transition-property: background;
            transition-property: background;
        }
        label.field .psuedo_select .selected {
            height: 24px;
            left: 1px;
            line-height: 24px;
            opacity: 0;
            position: absolute;
            top: 0;
            -webkit-transform: translateY(24px);
            transform: translateY(24px);
            -webkit-transition-property: opacity, -webkit-transform;
            transition-property: opacity, -webkit-transform;
            transition-property: opacity, transform;
            transition-property: opacity, transform, -webkit-transform;
            will-change: transform;
        }
        label.field .psuedo_select ul {
            background: #fff;
            box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.14);
            display: block;
            min-height: 70px;
            list-style: none;
            margin-top: 2px;
            opacity: 0;
            overflow: hidden;
            padding: 0 1px;
            pointer-events: none;
            -webkit-transition-property: height, opacity;
            transition-property: height, opacity;
            width: 100%;
            z-index: 2;
        }
        .wirte_top_area #wirteSeletLabel #wirteSeletCategory ul{
            height: 250px;
        }

        label.field .psuedo_select #genreList{
            min-height: 265px;
        }


        label.field .psuedo_select ul li {
            height: 26px;
            padding: 8px 4px;
        }
        label.field .deselect {
            height: 100vh;
            left: 0;
            position: fixed;
            top: 0;
            width: 100vw;
            z-index: -1;
        }
        label.field.focused {
            color: #0e47a1;
        }
        label.field.focused .psuedo_select {
            border-color: #0e47a1;
        }
        label.field.focused .psuedo_select::after {
            background: url("data:image/svg+xml;utf8,<svg fill='#007BED' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'> <path d='M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z'/> <path d='M0-.75h24v24H0z' fill='none'/> </svg>"), no-repeat;
        }
        label.field.focused .psuedo_select ul {
            opacity: 1;
            pointer-events: all;
        }

        .inp {
            position: relative;
            margin: auto;
            width: 150px;
            max-width: 280px;
            cursor: pointer;
        }
        .inp .label {
            position: absolute;
            top: 20px;
            left: 10px;
            font-size: 20px;
            color: #666;
            font-weight: 500;
            transform-origin: 0 0;
            transition: all 0.2s ease;
            width: 100px;
            cursor: pointer;
        }
        .inp #personLabel{
            font-size: 12px;
            top: 8px;
        }

        #gameTitle{
            position: absolute;
            top: 20px;
        }
        #gameTitleLabel{
            position: absolute;
            top: 0px;
            left: 10px;
            font-size: 20px;
            color: #666;
            font-weight: 500;
            transform-origin: 0 0;
            transition: all 0.2s ease;
            width: 100px;
            cursor: pointer;
        }

        .inp .border {
            position: absolute;
            bottom: -14px;
            left: 0;
            height: 2px;
            width: 100%;
            background: #0e47a1;
            transform: scaleX(0);
            transform-origin: 0 0;
            transition: all 0.15s ease;
        }
        .inp #projectTitleInp,#gameTitleInp {
            -webkit-appearance: none;
            width: 190px;
            border: 0;
            font-family: inherit;
            /*padding: 12px 0;*/
            height: 50px;
            font-size: 18px;
            font-weight: 500;
            border-bottom: 2px solid #666;
            background: none;
            border-radius: 0;
            color: #223254;
            transition: all 0.15s ease;
            position: absolute;
            left: 10px;
        }
        .inp #personLimit{
            -webkit-appearance: none;
            width: 80px;
            border: 0;
            font-family: inherit;
            height: 50px;
            font-size: 25px;
            border-bottom: 2px solid #666;
            background: none;
            border-radius: 0;
            text-align: center;
            color: #223254;
            transition: all 0.15s ease;

        }
        .inp input:hover {
            background: rgba(34,50,84,0.03);
        }
        .inp input:not(:placeholder-shown) + span {
            color: #5a667f;
            transform: translateY(-26px) scale(0.75);
        }
        .inp input:focus {
            background: none;
            outline: none;
        }
        .inp input:focus + span {
            color: #0e47a1;
            transform: translateY(-26px) scale(0.75);
        }
        .inp input:focus + span + .border {
            transform: scaleX(1);
        }
        #projectTop .fas.fa-bookmark{
            font-size: 35px;
            cursor: pointer;
            position: absolute;
            top: 20px;
            left: 380px;
            display: block;
            color: #fdd734;
        }

        #projectTop .far.fa-bookmark {
            font-size: 35px;
            cursor: pointer;
            position: absolute;
            top: 20px;
            left: 380px;
            display: block;
            color: #0e47a1;

        }
        #projectTop .fa-bookmark.on_bookmark{
            display: none;
        }


        #projectTop .date_range,.wirte.area .date_range{
            background-image: url("img/calendar-with-a-clock-time-tools_icon-icons.com_56831.svg");
            background-size: cover;
            outline: none;
            border: none;
            height: 40px;
            min-width: 40px;
            font-size: 25px;
            background-color: #fff;
            font-family: "Noto Sans CJK KR Medium",sans-serif;
            position: absolute;
            left: 170px;
            top:80px
        }
        .wirte.area .date_range{
            background-color: #fff;

        }
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
            vertical-align:middle;
        }

        /* Hide default HTML checkbox */
        .switch input {display:none;}

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #0e47a1;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #666;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #666;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

        p {
            margin:0px;
            display:inline-block;
            font-size:12px;
            font-weight:bold;
        }

        #projectTop{
            height: 155px;
            width: 1000px;
            /*background: #F02318;*/
            margin-top: 30px;
            padding: 20px 0;
            position: relative;
            /*border-bottom: 2px solid #fdd734;*/
        }
        #projectTop #projectImgAera{
            height: 149px;
            width: 149px;
            position: relative;
            top: -20px;
            border: 1px solid #0e47a1;
        }

        #projectTop #projectImgAera .fa-plus{
            font-size: 70px;
            padding:40px 25px 25px 45px;
        }

        #projectImg{
            position: absolute;
            top: -1px;
            left: -1px;
        }

        #projectTop #projectImgAera #projectImgUpload{
            width: 150px;
            height: 150px;
            position: absolute;
            z-index: 3;
            top: 0px;
            left: 0px;
            opacity: 0;
            cursor: pointer;
        }
        #projectTop #projectTitleInpAera{
            position: absolute;
            top: 10px;
            left: 160px;
        }
        /*#projectTop .daterangepicker{*/
            /*top: -500px;*/
        /*}*/
        #projectTop #personLimitAera{
            position: absolute;
            top: 10px;
            left: 530px;
        }
        #projectTop #switchAera{
            position: absolute;
            top: 25px;
            left: 430px;
        }
        #projectTop #supportStatusBtn{
            background: #0e47a1;
            color: white;
            border-radius: 3px;
            position: absolute;
            right: 300px;
            top: 20px;
            width: 80px;
            height: 40px;
        }
         #projectPersonList{
             position: absolute;
             right: 0px;
             bottom: 0px;
            min-width: 100px;
            height: 50px;
             /*border-top:2px solid #0e47a1;*/
             /*border-bottom:2px solid #0e47a1;*/
            background: #d2d2d2;
            text-align: center;
             border-radius: 30px 0 0 30px;
             box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2), 0 3px 4px 0 rgba(0, 0, 0, 0.19);

        }
        #projectPersonList ul{
            margin-top: 5px;
            min-width: 100px;
            height: 45px;
        }


      #projectPersonList li{
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            float: right;
            background: #fdd734;
            color: #0e47a1;
            
            font-size: 35px;
    line-height: 35px;
            position: relative;
            margin:0 5px 0 5px;


        }
        #projectPersonList li>a{
            float: left;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            line-height: 35px;
            font-size: 30px;
            font-weight: bold;
            background-image: url("img/profile_default.png");
            background-size:contain; 
        }
        #projectPersonList li .person_info{
            display: none;
            width: 140px;
            height: 100px;
            position: absolute;
            z-index: 2;
            top: 30px;
            left: 0px;
            background: #0e47a1;
            font-size: 10px;
            border-radius: 5px;


        }
        #projectPersonList li .person_info div{
            width: 140px;
            height: 25px;
            font-size: 10px;
            color: #fff;
            line-height: 25px;
            text-align: left;
            text-indent: 10px;
        }
        #projectPersonList .person{
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;

        }

       #projectPersonList li:hover .person_info{
            display: block;
        }

        #projectRoadMapArea{
            min-width: 1000px;
            height: 500px;
            background: #fff;
            border-bottom:2px solid #d2d2d2;
            margin-top: 5px;
            position: relative;
        }
        #projectRoadMapArea #gameAttrArea{
            display: inline-block;
            width: 1000px;
            background: #fff;
            height: 80px;
            line-height:50px ;
        }
        #progressAera{
            display: inline-block;
            width: 250px;
            height: 80px;
            float: right;
            background: #fff;
        }

        #gameAttrArea #progress{
            display: inline-block;
            /*background: #0e47a1;*/
            height: 80px;
            width: 100px;
            font-weight: bold;
            line-height: 80px;
            font-size: 20px;
            text-align: right;

        }
        #gameAttrArea #progressPercent{
            display: inline-block;
            font-weight: bold;
            font-size: 80px;
            width:125px;
            height: 80px;
            line-height: 80px;
            text-align: left;
            float: right;
            color: #F02318;
        }
        #projectRoadMapArea #legend{
            width: 138px;
            height: 65px;
            position: absolute;
            top: 90px;
            left: 20px;
            background: #d2d2d2;
            text-align: right;
            line-height: 25px;
            border-radius: 4px;
            padding: 10px;
        }

        #projectRoadMapArea #legend .legend_icon{
            position: absolute;
            top: 5px;
            left: 4px;
            width: 30px;
            height: 30px;
            background-image: url("img/dino.png");
            background-size: cover;
            background-position: 0 0px;
            background-color: transparent;
        }
        #projectRoadMapArea #legend .legend_icon.plus{
            top: 30px;
            background-image: url("img/project_imgs.png");
            background-position: 0 -25px;
        }
        #projectRoadMapArea .milestone_btn{
            position:absolute;
            left: 0px;
            bottom: 5px;
            width: 120px;
            height: 40px;
            background: #0e47a1;
            color: #fff;
        }
        #projectRoadMapArea .check_btn{
            position:absolute;
            left: 123px;
            bottom: 5px;
            width: 120px;
            height: 40px;
            background: #0e47a1;
            color: #fff;
        }

        #projectRoadMapArea .title_aera {
            position: absolute;
            top: 200px;
            width: 1000px;
            height: 200px;
            display: inline-block;
            overflow: hidden;
            /*background: #F02318;*/
            transition: .5s ease;
        }
        #projectRoadMapArea .title_aera .road_map{
              min-width: 3000px;
              height: 150px;
            margin-left: 10px;
            position: relative;
              /*background: #d2d2d2;*/
              /*background: #F02318;*/
            transition: .5s ease;

          }
        #projectRoadMapArea .title_aera .upload_btn{
            height: 70px;
            width: 70px;
            border-radius: 50%;
            padding: 5px;
            position: absolute;
            top: -1px;
            left: -30px;
            background: #fdd734;
            color: #0e47a1;
            font-weight: bold;
            font-family: "Noto Sans CJK KR Medium",sans-serif;
            font-size: 18px;
            border: 1px solid #fff;
        }

        #projectRoadMapArea .title_aera li{
            width: 240px;
            height: 180px;
            float: left;
            position: relative;
            text-align: center;
            cursor: pointer;
            background-image: url("img/part_road2_grass2.png");
            background-size: contain;
            background-repeat: no-repeat;
            transition: .5s ease;

        }

        #projectRoadMapArea .title_aera li:last-child{
            background-image: none;

        }

        #projectRoadMapArea .road_map li .road_map_step:hover .btn_hover.area{
            display: block;
        }
        #projectRoadMapArea .road_map li .dino_area{
            position: absolute;
            top: 0px;
            left: -65px;
            display: inline-block;
            z-index: 4;
        }

        #projectRoadMapArea .title_aera li .btn_hover.area::before{
            content: "";
            width: 0px;
            height: 0px;
            border-bottom: 10px solid #d2d2d2;
            border-right: 10px solid transparent;
            border-left: 10px solid transparent;
            position: absolute;
            left: 0px;
            top: -10px;

        }

        #projectRoadMapArea .title_aera li .btn_hover.area,.btn_hover.area{
            z-index: 5;
            width: 80px;
            height: 55px;
            background: #d2d2d2;
            position: absolute;
            bottom: -50px;
            left: 65px;
            border-radius: 0 5px 5px 5px;
            display: none;

        }

        .project_write.popup .btn_hover.area{
            top: 25px;
            left: 0px;

        }
        #projectRoadMapArea .title_aera li .btn_hover.area button,.btn_hover.area button{
            display: -webkit-box;
            width: 80px;
            height: 25px;
            border-radius: 0px;
            background: #d2d2d2;
        }
        #projectRoadMapArea .title_aera li .btn_hover.area button:hover,#projectRoadMapArea .title_aera li .add_title:hover{
            background: #fff;
            color: #0e47a1;
        }
        #projectRoadMapArea .title_aera li .add_title,.add_title{
            background: #fdd734;
            color: #0e47a1;
            width: 25px;
            height: 25px;
            border-radius: 5px;
            position: relative;
            top: 115px;
            font-size: 20px;
            line-height: 25px;
            box-shadow: 0 3px 5px 0 rgba(0, 0, 0, 0.24), 0 10px 20px 0 rgba(0, 0, 0, 0.19);

        }

        .project_write.popup .add_title{
            top: -3px;
            border: none;
            outline: none;
            cursor: pointer;
        }




        #projectRoadMapArea .title_aera li span{
            display: inline-block;
            min-width: 100px;
            min-height: 70px;
            border-radius: 50%;
            background: #0e47a1;
            color: #fff;
            margin: auto;
            position: absolute;
            top: 25px;
            left: -80px;
            padding-top: 40px;
            text-shadow: 0 1px 1px #000000;
            box-shadow: 0 10px 5px 0 rgba(0, 0, 0, 0.24), 0 10px 20px 0 rgba(0, 0, 0, 0.19);
            font-size: 12px;
            border: 1px solid #fff;
        }


        #projectRoadMapArea .title_aera .move_btn{
            position: absolute;
            top: 50px;
            width: 50px;
            height: 80px;
            font-size: 80px;
            background: none;
            z-index: 5;
            display: none;
            opacity: .5;
        }
        #projectRoadMapArea .title_aera:hover .move_btn{
            display: block;
        }

        #projectRoadMapArea .title_aera .right.move_btn{
            right: 0px;

        }
        .title_inp{
            position: absolute;
            top: 20px;
            left: 5px;
            width: 90px;
            height: 23px;
            border: none;
            outline: none;
            background: #0e47a1;
            color: #fff;
            border-radius: 5px;
            padding: 5px;
        }


        #diaryArea{
            width: 1000px;
            min-height: 1000px;
            /*background: cadetblue;*/
        }
        #projectDiaryTap{
            display: inline-block;
            width: 120px;
            height: 40px;
            background: #fdd734;
            color: #0e47a1;
            line-height: 40px;
            text-align: center;
            cursor: pointer;
        }
        #projectDiary{
            width: 1000px;
            min-height: 1000px;
            border-top:5px solid #fdd734;
            /*background: #B39DDB;*/
            overflow: auto;
        }
        #projectDiary .show_step_area{
            width: 1000px;
            min-height: 700px;
            /*background: #F02318;*/
            border-bottom: 3px solid #fdd734;
            display: none;
        }
        #projectDiary .show_step_area .select_step{
            text-indent: 20px;
             min-width: 170px;
            height: 60px;
            background: #0e47a1;
            position: relative;
            border-radius: 15px 0 0 0;
            margin: 30px 0 0 0;
            color: #fff;
            line-height: 25px;
            display: inline-block;

        }

        #projectDiary .show_step_area .step_show{
            height: 400px;
            width: 800px;
            background: #fff;
            border: 3px solid #0e47a1;
            overflow: auto;
            float: right;
            margin: 30px 10px 0 0;


        }
        #projectDiary .show_step_area .attachment_show{
            height: 100px;
            width: 800px;
            overflow: auto;
            float: right;
            margin: 2px 10px 0 0;
            border-top: 2px solid #d2d2d2;
            border-bottom: 2px solid #d2d2d2;
            overflow: auto;

        }
        #projectDiary .show_step_area .attachment_show dl{
            height: 70px;
            min-width: 1000px;
            /*background: #B39DDB;*/
            float: left;
            text-align: center;
            padding: 10px;
        }

        #projectDiary .show_step_area .attachment_show dl dt{
            width: 50px;
            height: 50px;
           float: left;
            /*background: #fdd734;*/
            line-height: 50px;
            margin-left: 10px;
            border-right: 2px solid #d2d2d2;
        }
        #projectDiary .show_step_area .attachment_show dl dd{
            min-width: 100px;
            height: 50px;
            float: left;
            /*background: #F02318;*/
        }


        #projectDiary .show_step_area .attachment_show img{
            height: 30px;
            width: 30px;
            border-radius: 50%;

        }

        #projectDiary .show_step_area .step_re{
            min-height: 100px;
            width: 800px;
            /*background: #fdd734;*/
            overflow: auto;
            float: right;
            position: relative;
            margin: 5px 10px 0 0;


        }

        #projectDiary .show_step_area .select_step div{
             display: table;
             position: absolute;
         }
        #projectDiary .show_step_area .select_step div p{
            display: table-cell;
            vertical-align: center;
        }



        #projectDiary .show_step_area .step_progress{
            height: 20px;
            width: 100px;
            background: #fff;
            color: #0e47a1;
            font-size: 15px;
            top: 0px;
            left: 50px;
            line-height: 20px;
           }
        #projectDiary .show_step_area .select_step .sos_check{
            height: 20px;
            width: 50px;
            background: #F02318;
            border-radius: 15px 0 0 0 ;
            line-height: 20px;
            top: 0px;
            left: 0px;
            font-size: 15px;
        }
        #projectDiary .show_step_area .select_step .step_title{
            font-size: 20px;
           bottom: 10px;
            left: 0px;
            height: 30px;
            width:170px;
            vertical-align: center;
        /*background: #F02318;*/

        }







        #updateDiaryTap{
            display: inline-block;
            width: 120px;
            height: 40px;
            background: #d2d2d2;
            color: #000;
            line-height: 40px;
            text-align: center;
            cursor: pointer;
            display: none;
        }
        .add_diary{
            width: 50px;
            height: 50px;
            background: #fdd734;
            border-radius: 10px;
            border: none;
            color: #0e47a1;
            display: inline-block;
            margin:60px 470px;
            font-size: 50px;
            line-height: 50px;
            outline: none;
            cursor: pointer;
            box-shadow: 0 3px 5px 0 rgba(0, 0, 0, 0.24), 0 10px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .btn_registration {
            width: 80px;
            height: 30px;
            position: absolute;
            right: 0px;
            top: 0px;
        }
        .inp_content {
            width: 700px;
            height: 30px;
            resize: none;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
        }

        .form_leave {
            width: 800px;
            height: 40px;
        }
        .btn_small2{
            width: 80px;
            height: 28px;
            background-color: #fdd734;
            border: none;
            position: relative;
            font-size: 18px;
            cursor: pointer;
            transition: 800ms ease all;
            outline: none;
            line-height: 30px;
            text-align: center;
        }
        .btn_small2:hover{
            background:transparent;
            color:#0e47a1;
        }

        .btn_small2:before,.btn_small2:after{
            content:'';
            position:absolute;
            top:0;
            right:0;
            height:1px;
            width:0;
            background: #0e47a1;
            transition:400ms ease all;
        }

        .btn_small2:after{
            right:inherit;
            top:inherit;
            left:0;
            bottom:0;
        }

        .btn_small2:hover:before,.btn_small2:hover:after{
            width:100%;
            transition:800ms ease all;
        }
        #popupBg{
            display: none;
            z-index: 10;
            width: 100%;
            height: 100%;
            background-color: rgba(000,000,000,.3);
            position: fixed;
            left: 0;
            top: 0;
        }
        .status.popup,.support.popup,.milestone.popup,.project_write.popup,.check_list.popup,.sos_request.popup,.step_guide.popup,.sub_step_guide.popup{
            display: none;
            z-index: 20;
            width: 600px;
            height: 400px;
            background: #fff;
            position: fixed;
            top: 50%;
            left: 50%;
            margin: -200px 0 0 -300px;
            border-radius: 10px;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border: 1px solid #d2d2d2;
        }

        body .milestone.popup,.check_list.popup{
            width: 1000px;
            height: 600px;
            margin: -300px 0 0 -500px;
        }
        body .project_write.popup{
            width: 1000px;
            min-height: 800px;
            margin: -400px 0 0 -500px;
            overflow: auto;
            border-radius: 0px;
        }

        body .support.popup{
            width: 300px;
            height: 200px;
            margin: -200px 0 0 -150px;
        }

        body .sos_request.popup{
            width: 400px;
            height: 350px;
            margin: -200px 0 0 -200px;
        }
        body .step_guide.popup,body .sub_step_guide.popup{
            height: 700px;
            width: 800px;
            margin: -350px 0 0 -400px;

        }


        .support.popup .popup_title_area,.milestone.popup .popup_title_area,.check_list.popup .popup_title_area,.sos_request.popup .popup_title_area,.step_guide.popup .popup_title_area,.sub_step_guide.popup .popup_title_area{
            width: 160px;
            height: 40px;
            background: #0e47a1;
            color: #fff;
            line-height: 40px;
            text-align: center;
            font-weight: bold;
            margin: 20px 0px;
        }

        .step_guide.popup .popup_title_area,.sub_step_guide.popup .popup_title_area{
            display: inline-block;
        }
        .step_guide.popup button,.sub_step_guide.popup button{
            display: inline-block;
            width: 40px;
            height: 40px;
            border: none;
            background: #0e47a1;
            color: #fff;
            outline: none;
            font-size: 15px;
            float: right;
            margin-top: 20px;
            font-weight: bold;
            cursor: pointer;

        }
        .step_guide.popup dl, .sub_step_guide.popup dl{
            /*background: #F02318;*/
            height: 400px;
            width: 750px;
            margin: auto;
        }
        .step_guide.popup dt, .sub_step_guide.popup dt {
            height: 40px;
            width: 80px;
            color: #000;
            font-weight: bold;
            border-bottom: 3px solid #0e47a1;
            line-height: 40px;
        }
        .step_guide.popup dd,.sub_step_guide.popup dd {
            min-height: 50px;
            width: 750px;
            color: #000;
            /*background: #2196f3;*/
        }
        .sos_request.popup .popup_title_area{
            /*background: #F02318;*/
            display: inline-block;
        }

        .sos_request.popup select{
            display: inline-block;
        }
        .sos_request.popup textarea{
            width: 350px;
            height: 200px;
            margin-left: 25px;
            resize: none;
        }
        .sos_request.popup button{
            background: #F02318;
            color: #fff;
            float: right;
            border: none;
            outline: none;
            width: 100px;
            height: 30px;
            margin: 20px 25px 0 0;
            font-family: "Noto Sans CJK KR Medium",sans-serif;
            border-radius: 5px;
        }


        .milestone.popup #tableAera{
            margin-top: 50px;
            width: 1000px;
            height: 450px;
            border-top: 3px solid #d2d2d2;
            border-bottom: 3px solid #d2d2d2;
        }

        .popup_legend_area ul{
            position: absolute;
            right: 10px;
            top: 20px;
            width: 100px;
            height: 60px;
            /*background: #d2d2d2;*/
        }

        .milestone.popup .popup_legend_area li{
            /*background: #F02318;*/
            width: 100px;
            height: 20px;
            text-align: right;
        }
        .milestone.popup .popup_legend_area li .bar{
            display: inline-block;
            margin-right: 5px;
            background: #fdd734;
            width: 30px;
            height: 10px;
        }
        .milestone.popup .popup_legend_area li .sample_two.bar{
            background: #fd8d26;
        }
        .milestone.popup .popup_legend_area li .sample_three.bar{
            background: #27fd0d;
        }

        .milestone.popup table{
             border:2px solid #0e47a1;
            width: 900px;
            height: 400px;
            /*background: #F02318;*/
            margin:20px auto;
         }
        .milestone.popup table td{
            width: 20px;
            height: 15px;
        }
        .milestone.popup table tr,th{
            border: 2px solid #fff;
        }
        .milestone.popup table tr th{
            width: 50px;
            height: 10px;
            background: #0e47a1;
            color: #fff;
            text-align: center;
            vertical-align: middle;
            font-size: 10px;
        }

        .milestone.popup table .milestone_one_checkd{
            background: #fdd734;
        }
        .milestone.popup table .milestone_two_checkd{
            background: #fd8d26;
        }
        .milestone.popup table .milestone_three_checkd{
            background: #27fd0d;
        }


        .support.popup span{
            display: inline-block;
           font-weight: bold;
           text-indent: 20px;
        }
        .support.popup button{
            border-radius: 5px;
            border: none;
            width: 100px;
            height: 30px;
            color: #0e47a1;
            background: #fdd734;
            font-weight: bold;
            font-family: "Noto Sans CJK KR Medium",sans-serif;
            float: right;
            margin-right: 15px;
            outline: none;
        }

        .status .show_portfolio.area,.status .show_help.area{
            display: none;
            z-index: 30;
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -100px 0 0 -400px;
            z-index: 40;
            width: 800px;
            height: 200px;
            background: #B39DDB;
        }

        .popup .tap{
            width: 140px;
            height: 40px;
            background: #0e47a1;
            display: inline-block;
            text-align: center;
            color: #fff;
            line-height: 40px;
            border-radius: 5px;
            cursor: pointer;
        }

        .popup .sos_status.tap{
            background: #F02318;
        }

        .popup .project_status.area{
            border-top: 4px solid #0e47a1;
            width: 600px;
            height: 400px;


        }
        .popup .sos_status.area{
            border-top: 4px solid #F02318;
            width: 600px;
            height: 400px;

        }
        .show{
            display: none;
        }
        .status .profile{
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .status ul{
            width: 600px;
            height: 400px;
            /*background: #2196f3;*/
        }
        .status li{
            display: inline-block;
            position: relative;
            width: 550px;
            height: 50px;
            /*background: #2196f3;*/
            border-bottom: 2px solid #a3b0bf;
            margin: 20px 0 0 30px;
            padding-bottom: 5px;
            vertical-align: center;
        }


        .status ul span{
            position: absolute;
            font-size: 40px;
            left: 55px;
            bottom: 10px;
        }
        .status ul .status_date{
            position: absolute;
            font-size: 15px;
            bottom: 10px;
            left: 170px;
        }
        .status li button{
            position: absolute;
            font-family:"Noto Sans CJK KR Medium",sans-serif;
            border: none;
            border-radius: 5px;
            height: 30px;
            color: #fff;
            line-height: 30px;
            outline: none;
            cursor: pointer;
        }

        .status li .show_portfolio_btn,.show_help_btn{
            top: 15px;
            left: 285px;
            background-color: #0e47a1;
            width: 120px;
        }
        .status li .ok_btn{
            width: 50px;
            top: 15px;
            right: 80px;
            background-color: #fdd734;
            color: #0e47a1;
        }
        .status li .cancal_btn{
            width: 50px;
            top: 15px;
            right: 15px;
            background-color: #F02318;
            color: #fff;
        }

        .exit_btn{
            display: inline-block;
            float: right;
            width: 30px;
            height: 30px;
            color: #5a667f;
            font-size: 20px;
            line-height: 30px;
            font-weight: bold;
            cursor: pointer;
        }

        .project_write.popup .wirte_top_area{
            position: relative;
            display: inline-block;
            width: 1000px;
            height: 100px;
            border-bottom: 2px solid #d2d2d2;

        }

        .project_write.popup .sub_step.area{
            min-width: 1000px;
            height: 20px;
            /*background: #F02318;*/
            border-bottom: 2px solid #d2d2d2;
            display:inline-block;
            overflow: hidden;
            position:relative;
            transition: .3s ease;
        }
        .project_write.popup .sub_step.area #downBtn{
            width: 50px;
            height: 20px;
            background: #fdd734;
            color: #0e47a1;
            position:absolute;
            bottom:0px;
            left:450px;
            text-align: center;
            font-size: 20px;
        }
        .project_write.popup .sub_step.area ul{
            min-width: 1000px;
            height: 150px;
            /*background: #F02318;*/
            display: inline-block;
			margin-top:30px;
            top: 20px;
            overflow: auto;
        }
        .project_write.popup .sub_step.area ul li{
            float: left;
            width: auto;
            height: 30px;
            position: relative;
            margin:10px 0px 0px 5px;
        }


        .project_write.popup .sub_step.area .road_map_step{
            width: 130px;
            height: 30px;
            /*background: #F02318;*/
           background: #0e47a1;
            color: #fff;
            padding: 5px;
            margin-right: 10px;
            border-radius: 5px;
            cursor: pointer;
        }



        .project_write.popup .sub_step.area li:hover .btn_hover.area{
            display: block;
        }
        .definitione_btn{
            display: inline-block;
            width: 45px;
            height: 45px;
            border-radius:50%;
            background: #fdd734;
            color: #0e47a1;
            border: none;
            outline: none;
            font-size: 25px;
            font-weight: bold;
            font-family: "Noto Sans CJK KR Medium",sans-serif;
            cursor: pointer;
            line-height: 45px;
            position: absolute;
        }
        .project_write.popup .wirte_top_area .definitione_btn{
            top: 25px;
            left:240px;
        }
        .project_write.popup .wirte_top_area .date_range{
            top: 30px;
            left:300px;
        }
        .project_write.popup .edit.area{
            margin-top: 20px;
            display: inline-block;
            width: 1000px;
            height: 730px;
            border-bottom: 2px solid #fdd734;
            position: relative;
            display: none;

        }
        .edit.area .sub_step_title{
            background: #0e47a1;
            width: 112px;
            height: 30px;
            color: #fff;
            padding: 5px;
            margin-right: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;

        }
        .edit.area .definitione_btn{
            top: -7px;
            left: 125px;
        }
        .project_write.popup .edit.area input{
            margin-left: 100px;

        }
        .project_write.popup .edit.area .sub_step_wirte{
            width: 800px;
            height: 400px;
            border: 2px solid #0e47a1;
            margin: 20px auto;

        }
        .project_write.popup .edit.area .wirte_btn{
            width: 80px;
            height: 30px;
            background: #fdd734;
            color: #0e47a1;
            margin: 20px auto;
            float: right;
            margin: 0 100px 0 0;
            display: none;

        }

        .check_list.area .check_list_title{
            text-indent: 15px;
            display: inline-block;
            width: 250px;
            height: 50px;
            background: #0e47a1;
            font-size: 35px;
            line-height: 50px;
            color: #fff;
        }
        .check_list.area #checkMamber div{
            display: inline-block;
        }
        .check_list.area #checkMamber ul li{
            display: inline-block;
        }
        .check_list.area .check_list_up,.check_list.popup .check_list_up{
            width: 950px;
            height: 400px;
            margin: auto;
            /*background: #F02318;*/
        }

        .check_list.area .check_list_up th,.check_list.popup .check_list_up th{
            border: none;
          border-bottom: 2px solid #d2d2d2;
        }
        .check_list.area  .check_list_up td,.check_list.popup .check_list_up td{
            text-align: center;
            border-bottom: 1px solid #d2d2d2;
        }

        .check_list.popup button{
            width: 100px;
            height: 30px;
            background: #fdd734;
            color: #0e47a1;
            float: right;
            margin: 10px 20px;
            font-size: 20px;
        }
        .check_list.area  .check_list_up #checkTitleInp{
            border: 0;
            width: 500px;
            height: 20px;
            background: none;
        }

        .check_list.area  .check_list_up .label{
            width: 300px;
            font-size: 20px;
        }
        .check_list_up .border{
            bottom: -10px;
        }

        .check_list.area .check_list_up input:valid ~.label{
            color: #0e47a1;
            font-size: 10px;
            transform: translateY(-26px) scale(0);
        }

        .project_write.popup .check_list.area  .check_list_up button{
            width: 80px;
            height: 25px;
            background: #0e47a1;
            color: #fff;
            border-radius: 5px;
            border: none;
            font-family: "Noto Sans CJK KR Medium",sans-serif;
            margin-top: 5px;
        }
        .project_write_save_btn{
            width: 100px;
            height: 40px;
            border: none;
            background: #fdd734;
            color: #0e47a1;
            font-family: "Noto Sans CJK KR Medium",sans-serif;
            font-weight: bold;
            font-size: 20px;
            border-radius: 5px;
            float: right;
            margin: 30px;
            outline: none;

        }

        .check_list.profile{
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display:inline-block;
            background-image: url("img/profile_default.png");
            background-size: contain;
        }

    </style>
    <script src="js/markdown-it.js"></script>
</head>

<body>
<div id="wrap">
    <div id="header">
        <div id="headerArea">
            <a href=""><img class="header logo" src="img/logo.png" alt="???????????????"></a>
            <div id="loginBeforeArea" hidden>
                <button class="login btn">?????????</button>
                <button class="join btn">????????????</button>
            </div><!--btnArea -->
            <div id="loginAfterBtnArea">
                <i id="creatorHome" class="fas fa-desktop"><a href=""></a></i>
                <i id="newsPide" class="far fa-newspaper"><a href=""></a></i>
                <i id="bell" class="far fa-bell"><a href=""></a></i>
                <div id="bellDropDownBox">
                    <!--<ul>-->
                    <!--<li><a>1</a></li>-->
                    <!--<li><a>2</a></li>-->
                    <!--<li><a>3</a></li>-->
                    <!--<li><a>4</a></li>-->
                    <!--</ul>-->
                </div>
                <img id="headerProfile" src="img/profile_default.png" alt="??????????????????">
                <i id="dropDownBtn" class="fas fa-sort-down"></i>
                <div id="dropDownBox">
                    <ul>
                        <li><a>??????????????????</a></li>
                        <li><a>????????????</a></li>
                        <li><a>??????????????? ??????</a></li>
                        <!--<li><a>?????? ??????</a></li>-->
                        <li><a>????????????</a></li>
                    </ul>
                </div><!--dropDownBox-->
            </div><!--loginAfterBtnArea-->

            <ul class="header_menu">
                <li><a id="gameBtn" class="on">??????</a></li>
                <li><a id="attackBtn">??????</a></li>
                <li><a id="helpBtn">HELP</a></li>
                <li><a id="freeBoardBtn">???????????????</a></li>
                <li><a id="projectBtn">????????????</a></li>
            </ul><!--header_menu -->
        </div><!--headerArea-->
    </div> <!--header-->
    <div class="header_menu_back"></div>
<div id="contents">

    <div id="projectTop">
        <div id="projectImgAera"><i class="fas fa-plus"></i>
            <input id="projectImgUpload" type="file" title="???????????? ??????????????? ????????????"/>
            <canvas id="projectImg" width="150" height="150"></canvas>

        </div>

        <span id="projectTitleInpAera">
    <label for="projectTitleInp" class="inp">
        <input type="text" id="projectTitleInp" placeholder="&nbsp;">
        <span class="label">???????????????</span>
        <span class="border"></span>
    </label>
    </span>
    <span><i class="far fa-bookmark"></i><i class="fas fa-bookmark on_bookmark"></i></span>
    <input content="??????????????????" type="button" name="datefilter" value="" class="date_range"/>
    <span id="switchAera">
         <label class="switch">
         <input id="visibilityCheck" type="checkbox">
         <span class="slider round"></span>
     </label>
 <p class="project_visibility" style="display:none;">?????????</p><p class="project_visibility">??????</p></span>
        <span id="personLimitAera">
     <label for="personLimit" class="inp">
         <input type="number" id="personLimit" placeholder="&nbsp;">
         <span class="label" id="personLabel">??????????????????</span>
         <span class="border"></span>
     </label>
     </span>
        <span><button id="supportStatusBtn">????????????</button></span>

        <div id="projectPersonList">
            <ul>
                <li>
                    <a><!--<img class="project person" src="img/profile_default.png">--></a>
                    <!--<div class="person_info"><div>?????????: 010-4564-1232</div><div>?????????: kains@naver.com </div><div>???????????? </div><div>???????????? </div></div>-->
                </li>
                <li><!-- 
                <a class="add_person" title="???????????? ????????????"></a> -->+</li>
            </ul>
        </div><!--projectPersonList-->
    </div><!--projectTop-->

    <div id="projectRoadMapArea">

        <div id="gameAttrArea">
            <span id="gameTitle">
           <label for="gameTitleInp" class="inp">
         <input type="text" id="gameTitleInp" placeholder="&nbsp;">
         <span id="gameTitleLabel">?????????</span>
         <span class="border"></span>
     </label></span>
            <span id="gameSystemAera">
            <label id="gameSystemLabel"class="field"for="gameSystemCategory"data-value="">
                <span>?????????</span>
                <div id="gameSystemCategory"class="psuedo_select"name="imgCategory">
                    <span class="selected"></span>
                    <ul class="img_category_options"class="options">
                        <li class="option"data-value="PC">PC</li>
                        <li class="option"data-value="MOBILE">MOBILE</li>
                    </ul>
                </div>
            </label>
            </span>
            <span id="gameGenreAera">
            <label id="label"class="field"for="genreCategory"data-value="">
                <span>??????</span>
                <div id="genreCategory"class="psuedo_select"name="genreCategory">
                    <span class="selected"></span>
                    <ul class="img_category_options"class="options" id="genreList">
                        <li class="option"data-value="PC">??????</li>
                        <li class="option"data-value="MOBILE">?????????</li>
                        <li class="option"data-value="MOBILE">??????</li>
                        <li class="option"data-value="MOBILE">????????????</li>
                        <li class="option"data-value="MOBILE">??????????????????</li>
                        <li class="option"data-value="MOBILE">??????????????????</li>
                        <li class="option"data-value="MOBILE">????????????</li>
                        <li class="option"data-value="MOBILE">??????</li>
                        <li class="option"data-value="MOBILE">?????????</li>
                    </ul>
                </div>
            </label>
            </span>

            <div id="progressAera">
            <div id="progress">?????????</div>
            <div id="progressPercent">0%</div>
            </div>

            <div id="legend">
                <div><span class="legend_icon ing"></span>??????????????????</div>
                <div><span class="legend_icon plus"></span>??????????????????</div>
            </div>
        </div>
        <!--gameAttrArea-->

        <div class="title_aera">
            <button class="left move_btn"><i class="fas fa-angle-left"></i></button>
            <button class="right move_btn"><i class="fas fa-angle-right"></i></button>
            <ul class="road_map">
                <li><button class="add_title">+</button></li>
                <li><div class="dino_area"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">??????????????????<div class="progress_score">0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area" style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">??????????????? ??????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area" style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">??????????????????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area" style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">?????????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area"style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">UI??????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area"style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">????????? ?????? ??????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area"style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">?????????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area"style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">DB ??????&??????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><div class="dino_area"style="display: none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step">?????????<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span> <button class="add_title">+</button></li>
                <li><button class="upload_btn">?????????</button></li>
            </ul>
            </div><!--title aera-->

        <button class="milestone_btn">??????????????????</button>
        <button class="check_btn">?????????????????????</button>
    </div>
    <!--projectRoadMapArea-->
    <div id="diaryArea">
        <span id="projectDiaryTap">??????????????????</span>
        <span id="updateDiaryTap">????????????</span>
        <div id="projectDiary">
            <div class="show_step_area">
                <div class="select_step">
                    <!--<div class="sos_check"><p>SOS</p></div>-->
                    <div class="step_progress"><p>0%</p></div>
                    <div class="step_title">??????????????????</div>
                </div>
                <div class="step_show">
                    ????????? ??????????????? ????????? ???????????? ??????????????? ????????????????????? ????????? ????????????????????? ?????????????????????.??
                    <br>   <br>   <br>
                    ?????? ????????? ?????? ??????
                </div>
                <div class="attachment_show">
                   <dl>
                        <dt><img src="img/profile_default.png"></dt>
                        <dd>
                            <div> <em> ????????? ?????????.jpg</em></div>
                        </dd>
                    </dl>
                </div><!--attachment_show-->
                <div class="step_re">
                    <form class="form_leave">
                        <textarea class="inp_content"></textarea><!-- .inp_content end -->
                        <div class="btn_registration">
                            <button class="btn_small2" type="button">??????</button>
                        </div><!-- .btn_registration end -->
                    </form><!-- form end -->
                </div>
            </div><!--show_step_area-->
        <button class="add_diary">+</button>
    </div><!--diaryArea-->

</div><!--contents-->
    <div id="footer">
        <div id="footerArea">
            <a>????????????</a> ???<a>????????????????????????</a>???<a>????????????</a>???<a>????????????</a><br>
            ?????? : INDIEGO<br>
            ?????? : JMT<br>
            ?????? : ?????? ????????? ??????????????? 1820<br>
            <img class="footer logo" src="img/logo_gray.png" alt="????????????">
        </div><!--footerArea-->
    </div><!--footer-->
</div><!--wrap-->
<div class="status popup">
    <span class="project_status tap">???????????? ????????????</span>
    <span class="sos_status tap">SOS ????????????</span>
    <div class="project_status area">
        <ul>
            <li>
            <a href=""><img class="profile" src="img/profile_default.png"></a>
            <span>?????????<span><img  src=""></span></span>
            <span class="status_date">1110-12-03</span>
            <button class="show_portfolio_btn">??????????????? ??????</button>
            <button class="ok_btn">??????</button>
            <button class="cancal_btn">??????</button>
        </li>
            <li>
                <a href=""><img class="profile" src="img/profile_default.png"></a>
                <span>?????????<span><img  src=""></span></span>
                <span class="status_date">1110-12-03</span>
                <button class="show_portfolio_btn">??????????????? ??????</button>
                <button class="ok_btn">??????</button>
                <button class="cancal_btn">??????</button>
            </li>
            <li>
                <a href=""><img class="profile" src="img/profile_default.png"></a>
                <span>?????????<span><img  src=""></span></span>
                <span class="status_date">1110-12-03</span>
                <button class="show_portfolio_btn">??????????????? ??????</button>
                <button class="ok_btn">??????</button>
                <button class="cancal_btn">??????</button>
            </li>
            <li>
                <a href=""><img class="profile" src="img/profile_default.png"></a>
                <span>?????????<span><img  src=""></span></span>
                <span class="status_date">1110-12-03</span>
                <button class="show_portfolio_btn">??????????????? ??????</button>
                <button class="ok_btn">??????</button>
                <button class="cancal_btn">??????</button>
            </li>
        </ul>
    </div>
    <!--project_status area-->
    <div class="show_portfolio area">
        <div>
            <div class="exit_btn">X</div>
            <ul>
                <li>???????????????1</li>
            </ul>
        </div>
    </div>

    <div class="sos_status area show">
        <ul>
            <li>
                <img class="profile" src="img/profile_default.png">
                <span>?????????<span><img  src=""></span></span>
                <span class="status_date">1110-12-03</span>
                <button class="show_help_btn">???????????? ??????</button>
                <button class="ok_btn">??????</button>
                <button class="cancal_btn">??????</button>
            </li>
        </ul>
    </div>
    <div class="show_help area">
        <div> <div class="exit_btn">X</div>
            <ul>
                <li>???????????????1</li>
            </ul>
        </div>
    </div>
</div>
<!--status popup-->
<div class="support popup">
    <div class="popup_title_area">???????????? ????????????</div>

<form method="get" action="">
    <span>??????????????? ??????
         <label class="switch">
         <input id="portfolioCheck" type="checkbox">
         <span class="slider round"></span>
     </label>
     <p class="portfolio_visibility" style="display:none;">?????????</p><p class="portfolio_visibility">??????</p></span>
    </span>

    <div>
        <span>?????? ??????
         <label class="switch">
         <input id="careerCheck" type="checkbox">
             <span class="slider round"></span>
     </label>
     <p class="career_visibility" style="display:none;">?????????</p><p class="career_visibility">??????</p>
    </span>
    </div>

    <button class="support_btn">????????????</button>
</form>
</div>
<!--support popup-->
<div class="milestone popup">
    <div class="popup_title_area">??? ??? ??? ???</div>
    <div class="popup_legend_area">
        <ul>
            <li><div class="sample_one bar"></div><span>??????</span></li>
            <li><div class="sample_two bar"></div><span>??????</span></li>
            <li><div class="sample_three bar"></div><span>??????</span></li>
        </ul>
    </div>
    <div id="tableAera">
            <table>
                <tr>
                    <th>??? ???</th>
                    <th>1??????</th>
                    <th>2??????</th>
                    <th>3??????</th>
                    <th>4??????</th>
                    <th>5??????</th>
                    <th>6??????</th>
                    <th>7??????</th>
                    <th>8??????</th>
                    <th>9??????</th>
                    <th>10??????</th>
                    <th>11??????</th>
                    <th>12??????</th>

                </tr>
                <tr>
                <th><span>??????????????????</span></th>
                <td class="milestone_one_checkd"></td>
                <td colspan="11"></td>
            </tr>
                <tr>
                    <th><span>?????????????????????</span></th>
                    <td></td>
                    <td class="milestone_one_checkd"></td>
                    <td colspan="10"></td>
                </tr>
                <tr>
                    <th><span>????????? ?????????</span></th>
                    <td></td>
                    <td  colspan="2" class="milestone_one_checkd"></td>
                    <td colspan="9"></td>
                </tr>
                <tr>
                    <th><span>?????????</span></th>
                    <td colspan="2"></td>
                    <td colspan="8" class="milestone_two_checkd"></td>
                </tr>
                <tr>
                    <th><span>?????????</span></th>
                    <td colspan="8"></td>
                    <td colspan="3" class="milestone_two_checkd"></td>
                </tr>
                <tr>
                    <th><span>?????????????????????</span></th>
                    <td colspan="5"></td>
                    <td colspan="6" class="milestone_two_checkd"></td>
                </tr>
                <tr>
                    <th><span>UI??????</span></th>
                    <td colspan="6"></td>
                    <td colspan="3" class="milestone_two_checkd"></td>
                </tr>
                <tr>
                    <th><span>DB????????????</span></th>
                    <td colspan="6"></td>
                    <td colspan="3" class="milestone_two_checkd"></td>
                </tr>
                <tr>
                    <th><span>?????????</span></th>
                    <td colspan="9"></td>
                    <td colspan="2" class="milestone_two_checkd"></td>
                </tr>
                <tr>
                    <th><span>?????????</span></th>
                    <td colspan="11"></td>
                    <td class="milestone_three_checkd"></td>
                </tr>
            </table>
    </div>
</div>
<!--milestone popup-->
<div class="check_list popup">
    <div class="popup_title_area">???????????????</div>
    <table class="check_list_up">
        <thead>
        <tr>
            <th>??? ???</th>
            <th>??? ???</th>
            <th><a class="check_list profile"></a></th>
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td><div>?????????????????? ?????? ??? ???????????? ???????????????</div></td>
            <td> <input class="check_box" type="checkbox"></td>
        </tr>

        </tbody>
    </table>
    <button>????????????</button>
</div>

<div class="project_write popup">
 <div class="wirte area">
     <div class="wirte_top_area">
     <!--<form  id="" action="">-->
     <span class="wirte_selet_aera">
            <label id="wirteSeletLabel"class="field"for="wirteSeletCategory"data-value="">
                <span>?????????</span>
                <div id="wirteSeletCategory"class="psuedo_select"name="imgCategory">
                    <span class="selected">??????????????????</span>
                    <ul class="img_category_options"class="options">
                        <li class="option"data-value="PC">??????????????????</li>
                        <li class="option"data-value="MOBILE">?????????????????????</li>
                        <li class="option"data-value="MOBILE">??????????????????</li>
                        <li class="option"data-value="MOBILE">?????????</li>
                        <li class="option"data-value="MOBILE">?????????</li>
                        <li class="option"data-value="MOBILE">??????????????? ????????????</li>
                        <li class="option"data-value="MOBILE">UI??????</li>
                        <li class="option"data-value="MOBILE">DB ??????&??????</li>
                        <li class="option"data-value="MOBILE">?????????</li>
                    </ul>
                </div>
            </label>
            </span>
         <button class="definitione_btn" type="button">?</button>
     <input content="??????????????????" type="button" name="datefilter" value="" class="date_range"/>
     
     </div><!--wirte_top_area-->
     <div class="sub_step area">
         <ul>
             <li><button type="button" class="add_title">+</button></li>
             <li><span class="road_map_step">??????????????????</span><div class="btn_hover area"><button type="button" class="remove_btn">????????????</button><button type="button" class="sos_btn">sos??????</button></div></li>
             <li><span class="road_map_step">6-3-5??????</span><div class="btn_hover area"><button type="button" class="remove_btn">????????????</button><button type="button" class="sos_btn">sos??????</button></div></li>
             <li><span class="road_map_step">????????? ?????? ??????</span><div class="btn_hover area"><button type="button" class="remove_btn">????????????</button><button type="button" class="sos_btn">sos??????</button></div></li>
         </ul>
         <div id="downBtn" title="?????????????????? ??????"><i class="fas fa-angle-down"></i></div>
     </div>
     <div class="edit area">
         <form>
         <div class="sub_step_title">??????????????????</div>
         <button type="button" class="definitione_btn">?</button>
         <div class="sub_step_wirte" ></div>
         <input type="file">
         <button class="wirte_btn">????????????</button>
         </form>
     </div>
      <div class="check_list area">
          <div class="check_list_title">???????????????</div>
          <table class="check_list_up">
              <thead>
                    <tr>
                        <th>??? ???</th>
                        <th><a class="check_list profile"></a></th>
                        <th>&nbsp;</th>
                    </tr>
              </thead>
              <tbody>
              <tr>
                 <td>
                     <label for="checkTitleInp" class="inp">
                     <input type="text" id="checkTitleInp" placeholder="????????? ??????????????????." autocomplete="off">
                     <span class="label">????????? ??????????????????.</span>
                     <span class="border"></span>
                 </label>
                 </td>
                 <td> <input class="check_box" type="checkbox"></td>
                 <td> <button>??? ???</button></td>
              </tr>

              </tbody>
          </table>
      </div>
         <button type="button" class="project_write_save_btn">??????</button>
     <!--</form>-->
 </div> <!--wirte area-->
</div>
<!--project_write popup-->
<div class="sos_request popup">
    <form>
    <div class="popup_title_area">sos ????????????</div>
    <select>
        <option>1</option>
        <option>1</option>
        <option>1</option>
        <option>1</option>
        <option>1</option>
    </select>
    <textarea></textarea>
    <button>????????????</button>
    </form>
</div>
<div class="step_guide popup">
    <div class="popup_title_area">???????????? ??????</div>
    <button type="button">X</button>
    <div>
        <dl>
            <dt>????????????</dt>
            <dd>????????? ??????????????? ????????? ????????? ????????? ??????????????? ????????? ??????????????? ???????????? ?????? ???????????????.</dd>
            <dt>?????????</dt>
            <dd>????????????,????????? ??? ?????????????????? ?????????</dd>
            <dt>?????????</dt>
            <dd>??????????????????,6-3-5 ??????,????????? ?????? ?????? ???</dd>
            <dt>??? ???</dt>
            <dd>??? ???????????? ??????????????? ??????</dd>
        </dl>

    </div>

</div>
    <div class="sub_step_guide popup">
        <div class="popup_title_area">??????????????????</div>
        <button type="button">X</button>
        <div>
            <dl>
                <dt>????????????</dt>
                <dd>??????????????? Ideation??? ???????????? ?????? ?????? ????????? Brainstorming ????????? ???????????? ???.<br>
                    ???????????? ???????????? 4?????? ??????<br>
                   <p> 1. ??????????????? ?????? ???????????? ??????</p><br>
                    <p> 2. ????????? ??????</p><br>
                    <p>3. ?????? ???????????? ??????</p><br>
                    <p>4. ??????????????? ????????? ?????????.</p><br>
                </dd>
                <dt>?????????</dt>
                <dd>????????????,????????? ??? ?????????????????? ?????????</dd>
                <dt>?????????</dt>
                <dd>?????????,???????????? ???</dd>
                <dt>??? ???</dt>
                <dd><img src="img/Brainstorming.jpg" width="300"></dd>
            </dl>

        </div>

    </div>
<div id="popupBg"></div><!--popupBg-->
<script src="js/jquery.js"></script>
<script src="js/default.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.min.js"></script>
<script src="js/index.js"></script>
<script src="js/tui-code-snippet.min.js"></script>
<script src='js/markdown-it.js'></script>
<script src="js/to-mark.min.js"></script>
<script src="js/codemirror.js"></script>
<script src="js/highlight.js"></script>
<script src="js/squire-raw.js"></script>
<script src="js/tui-editor-Editor.js"></script>
<script src="js/underscore-min.js"></script>
<script>
    $(document).ready(function() {
        $('#projectTitleInp').val('UNTITLE');
        $('#personLimit').val('1');
        $('#wirteSeletCategory').val('??????????????????');
    });



    $(function() {

        $('input[name="datefilter"]').daterangepicker({
            autoUpdateInput: false,
            locale: {
                applyLabel:'????????????',
                cancelLabel: '??????'
            }
        });

        $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'))
                .css({"background-image":"none","border-bottom":"2px solid #c8ccd4"});
        });

        $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');
        });
    });
    //function() end

    var $addTitle = $('.add_title'),
        $popupBg = $('#popupBg'),
        $statusPopup = $('.status.popup'),
        $supportPopup  = $('.support.popup'),
        $milestonePopup = $('.milestone.popup'),
        $projectWritePopup = $('.project_write.popup'),
        $checkListPopup = $('.check_list.popup'),
        $sosRequestPopup = $('.sos_request.popup'),
        $visibilityCheck = $("#visibilityCheck"),
        $portfolioCheck = $("#portfolioCheck"),
        $careerCheck= $("#careerCheck");
    var addTitleInp = '<li><span><input style="margin-top: 4px" type="text" class="title_inp" data-value="title" placeholder="???????????????"/></span></li>';

    $('.sub_step_wirte').tuiEditor({
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: 600
    }); //tuiEditor end

    $("#form").submit(function() {

        //???????????? ????????? ?????? ????????? ?????????
        var contents =   $('.sub_step_wirte').tuiEditor("getValue");

        //????????? ???????????? ????????? ????????? textarea??? ????????? ????????? submit
        $("#contents").val(contents);

    });



    $visibilityCheck.click(function(){
        $(".project_visibility").toggle();
    });
    $portfolioCheck.click(function(){
        $(".portfolio_visibility").toggle();
    });
    $careerCheck.click(function(){
        $(".career_visibility").toggle();
    });


    function addStepTitle(){

        $(this).parents('li').after(addTitleInp);
        var $titleInp = $('.title_inp');
        $titleInp.focus();

        $titleInp.keyup(function (e) {
            var stepTitle =$titleInp.val();
            var addTitle ='<li><div class="dino_area" style="display:none"><img src="img/dino.png" width="65px"/></div><span class="road_map_step" style="top:30px">'+stepTitle+'<div>0%</div><div class="btn_hover area"><button class="remove_btn">????????????</button><button class="sos_btn">SOS??????</button></div></span></li>'

            if(e.keyCode==13){
                $(this).parents("li").after(addTitle)
                $(this).parents('li').before().remove();
                $(this).remove();
            }
            $('.remove_btn').click(function () {
                $(this).parents('li').remove();
            });

            $('.sos_btn').on('click', function () {
                $popupBg.css("display", "block");
                $sosRequestPopup.css("display", "block");
            });

        });


    } //addStepTitle() end

    $addTitle.on('click',addStepTitle);

    $('.remove_btn').click(function () {
        $(this).parents('li').remove();
    });

    $('.sos_btn').on('click', function () {
        $popupBg.css("display", "block");
        $sosRequestPopup.css("display", "block");
    });

    $('#projectTop i').click(function () {

        $('.on_bookmark').removeClass('on_bookmark');

        $(this).addClass("on_bookmark");
    });

    $('.project_write_save_btn').click(function () {
        alert("??????????????? ?????? ???????????????.")
        $('.project_write.popup').css('display','none');
        $popupBg.css("display","none");
    });

        $('.check_list.popup button').click(function () {
            alert("??????????????? ?????? ???????????????.")
            $('.check_list.popup').css('display','none');
            $popupBg.css("display","none");
            $('.progress_score').html("100%");
            $('.road_map li:eq(1) .dino_area').css('display','none');
            $('.road_map li:eq(2) .dino_area').css('display','block');
            $('#progressPercent').html("8%");
            $('.step_progress p').html("100%");

        });

$('#downBtn').click(function () {
    $('.sub_step.area').css({height:120});
});

var left = 0;
    var $road_map = $('.road_map');



$('.right.move_btn').click(function () {
    var stop = $road_map.css("left");
    if(stop=="-2000px"){
        $(this).hide();
    }else{
        $('.left.move_btn').show();
        left -=500;
        $road_map.css({
            left:left+"px"
        });
    }
});

    $('.left.move_btn').click(function () {
        var stop = $road_map.css("left");
        if(stop=="0px"){
            $(this).hide();
        }else{
            $('.right.move_btn').show();
            left +=500;
            $road_map.css({
                left:left+"px"
            });
        }
    });
    $('.sub_step.area li').click(function () {
        $('.edit.area').css("display","block");

    });

    $('.project_status.tap').on('click',function () {
        $('.show').removeClass('show');
        $('.sos_status').addClass('show');
    });

    $('.sos_status.tap').on('click',function () {
        $('.show').removeClass('show');
        $('.project_status').addClass('show');
    });

    $('#supportStatusBtn').on('click',function () {
        $statusPopup.css("display","block");
        $popupBg.css("display","block");

    });

    $('.show_portfolio_btn').on('click',function () {
        $popupBg.css("display","block");
        $('.show_portfolio').css("display","block");
    });
    $('.show_help_btn').on('click',function () {
        $popupBg.css("display","block");
        $('.show_help').css("display","block");
    });
    $('.exit_btn').on('click',function () {
        $('.show_portfolio').css("display","none");
        $('.show_help').css("display","none")
    });
    $popupBg.on('click',function () {
        $popupBg.css("display","none");
        $statusPopup.css("display","none");
        $supportPopup .css("display","none");
        $milestonePopup.css("display","none");
        $projectWritePopup.css("display","none");
        $checkListPopup.css("display","none");
        $sosRequestPopup.css("display","none");
        $('.step_guide.popup').css("display","none");
    });

    $('.add_person').on("click",function () {
        $popupBg.css("display","block");
        $supportPopup.css("display","block");
    });
    $('.milestone_btn').on("click",function () {
        $popupBg.css("display","block");
        $milestonePopup.css("display","block");
    });
    $('.add_diary').on('click',function () {
        $popupBg.css("display","block");
        $projectWritePopup.css("display","block");
        $('.show_step_area').css("display","block");
    });

    $('.check_btn').on('click',function () {
        $popupBg.css("display","block");
        $checkListPopup.css("display","block");
    });
    $('.wirte_top_area .definitione_btn').on('click',function () {
        $('.step_guide.popup').css("display","block");
    })
    $('.edit.area .definitione_btn').on('click',function () {
        $('.sub_step_guide.popup').css("display","block");
    });

    $('.sub_step_guide.popup button').click(function () {
        $('.sub_step_guide.popup').css("display","none");
    });

    $('.step_guide.popup button').click(function () {
        $('.step_guide.popup').css("display","none");
    });

    $('.check_list_up button').click(function () {
        alert("????????? ?????? ???????????????.!")
        $(this).css({background:"red",}).html("??????")
    })
    var $mainCanvas= $("#projectImg"),
        $main=$("#projectImgUpload"),
        mainCanvas = $mainCanvas.get(0),
        mainCtx = mainCanvas.getContext("2d"),
        width=0,height=0, x = 0,  y = 0;

    var img= null;



    $main.change(function() {

        var file = $main.get(0).files[0];

        //alert(file);

        var reg =  /^image\//;

        if(!reg.test(file.type)) {

            alert("???????????? ??????????????????~");

            $main.val("");

            return;
        }

        var reader = new FileReader();

        //????????? DataURL??? ???????????????.
        reader.readAsDataURL(file);


        //??? ???????????? onload ????????? ??????
        reader.onload = function() {
            //alert("??? ????????????!");

            //alert(reader.result);

            //$("img").attr("src",reader.result);

            //????????? ?????? ?????????

            img = new Image();
            img.src = reader.result;


            //????????? ?????????
            img.onload = function() {

                x = 0;
                y = 0;

                width = img.width;
                height = img.height;

                if(width<=150 || height<=150) {

                    mainCtx.clearRect(0,0,width,height);
                    $main.val("");
                    mainCtx.clearRect(0,0,200,200);

                    alert("??? ??? ???????????? ???????????????");

                    return;
                }

                console.log(width);
                console.log(height);

                // img Width??? 500px ?????? ??????
                var imgWidthPct = 150/img.width;
                // img Height??? 500px ?????? ??????
                var imgHeightPct =150/img.height;
                console.log(imgWidthPct);
                console.log(imgHeightPct);

                var rate = 0;

                if(imgWidthPct < 1 || imgHeightPct < 1){
                    if(imgWidthPct <= imgHeightPct){
                        width *= imgHeightPct;
                        height *= imgHeightPct;

                        rate = img.width * 150 / width;

                        x = (img.width-rate)/2;
                        console.log("????????? ??? ???");
                    } else {
                        width *= imgWidthPct;
                        height *= imgWidthPct;

                        rate = img.height * 150 / height;

                        y = (img.height-rate)/2;
                        console.log("????????? ??? ???");
                    }
                }//

                console.log(width);
                console.log(height);
                console.log(rate);
                console.log(x);
                console.log(y);

                // $imgCan.attr({width:imgW,height:imgH}).css({left:x,top:y});

                mainCtx.clearRect(0,0,150,150);
                // mainCtx.drawImage(img,0,0,width,height);

                mainCtx.drawImage(img,x,y,img.width,img.height,0,0,width,height);
            };
        };
    });

</script>
</body>