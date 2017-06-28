    <%@ page language="java" import="java.util.*"
             contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@include file="/context/mytags.jsp" %>
        <!DOCTYPE HTML>
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="format-detection" content="telephone=no" />
        <meta name="viewport"
        content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />
        <title>我的宿舍</title>
        <script src="plug-in/weixin/yx/js/jquery-1.8.3.min.js"></script>
        <link href="plug-in/weixin/yx/css/mui.css" rel="stylesheet"
        type="text/css">
        <link href="plug-in/weixin/yx/css/yingxin.css" rel="stylesheet"
        type="text/css">
        <link href="plug-in/weixin/yx/css/loading.css" rel="stylesheet" type="text/css">
        <style type="text/css">
        * {
        margin: 0;
        padding: 0;
        }

        .wrap {
        width: 100%;
        border-bottom: 1px solid #eee;
        font-size: 11pt;
        line-height: 40px;
        }

        .chuangcon {
        width: 44%;
        height: auto;
        border-top: 5px solid #1296DB;
        border-radius: 6px;
        margin-left: 4%;
        margin-top: 15px;
        background-color: #fff;
        float: left;
        font-size: 10pt;
        -webkit-box-shadow: 1px 1px 0px 1px #e1e1e1;
        }

        .chuanghao {
        width: 96%;
        height: 40px;
        border-bottom: 1px solid #eee;
        margin: 0 auto;
        line-height: 40px;
        }

        .ownername, .chuangshoujihao {
        width: 96%;
        height: 40px;
        margin: 0 auto;
        line-height: 40px;
        border-bottom: 1px solid #eee;
        color: #555;
        }

        .ownername span, .chuangshoujihao span {
        color: #000;
        margin-left: 8px;
        }

        /*.dot{
        width:8px;
        height:8px;
        border-radius:4px;
        background: #1296DB;
        display: inline-block;
        margin-left: 5px;
        margin-right: 4px;
        line-height: 40px;
        }*/
        .sushecon1 {
        margin-bottom: 20px;
        height: auto;
        display: block;
        clear: both;
        }
        </style>
        <script type="text/javascript">
        $(document).ready(function() {
        $(".wrap").addClass("maoboli");
        $.ajax({
        type : "post",
        dataType : "json",
        async:false,
        timeout:5000,
        url : "mobileStudentController.do?doMyDrom",
        success : function(data) {
        if (data.success == true) {
        var strHtml = "";
        var obj = $.parseJSON(data.msg);
        for (var i = 0; i < obj.length; i++) {
        var xm=obj[i].xm+"";
        if(xm=="null")
        {

        strHtml += '<div class="chuangcon"><div class="chuanghao">'
        + obj[i].unitname
        + '</div><div style="height:80px;padding:15px; line-height:38px;">暂无入住'
        + '</div></div>';
        }
        else
        {
        strHtml += '<div class="chuangcon"><div class="chuanghao">'
        + obj[i].unitname
        + '</div><div class="ownername"><span class="dot"></span>姓名<span>'
        + obj[i].xm
        + '<span></div><div class="chuangshoujihao"><span class="dot"></span>手机号<span>'
        + obj[i].lxdh
        + '</span></div></div>';
        }
        }
        $(".sushecon1").html(strHtml);
        $(".jiazai").stop().fadeOut();
        $(".wrap").removeClass("maoboli");

        } else {

        //alert(data.success);
        $(".jiazai").stop().fadeOut();
        $(".tip").stop().fadeIn().html("暂无宿舍信息<br><br><a href='mobileStudentController.do?goMain'>返回主页</a>")
        }
        },
        complete:function(XMLHttpRequest,status){ //请求完成后最终执行参数
        　　　　if(status=='timeout'){//超时,status还有success,error等值的情况
        　　　　　
        　　　　　 alert("连接超时");
        　　　　}
        },
        error : function(msg) {
        alert("error:" + msg);
        console.log(msg);

        }
        });
        })
        </script>
        </head>
        <style>
        /*加载*/
        .jiazai{
        width:100%;
        height:100%;
        position:fixed;
        top:0px;
        left:0px;
        z-index:888;
        }

        #spinner{
        position:fixed;
        left:0;
        right:0;
        top:0;
        bottom:0;
        margin:auto;
        }
            .tip{
            height:20px;
            line-height:20px;
            width:100%;
            position:fixed;
            left:0;
            right:0;
            top:0;
            bottom:0;
            margin:auto;
            text-align:center;

            }

        .maoboli{
        -webkit-filter: blur(10px);
        }
        </style>

        <body>
        <div class="tip" style="display:none"></div>
        <div class="jiazai">
        <div id="spinner"></div>
        </div>
        <div class="wrap">
        <div class="top">
        <div class="sushe-biaoti" style="margin-top: 0px;">
        <div class="sushe-tubiao"></div>
        <div class="sushe-wenzi">我的宿舍</div>
        </div>
        </div>

        <div class="sushecon1"></div>
        <div style="clear: both;"></div>
        <div class="subbut" style="clear: both;" id="goMain">返回主页</div>
        </div>
        </body>
        <script>
        //返回主页跳转
        $("#goMain").click(function(){
        window.location.href="mobileStudentController.do?goMain";
        });
        </script>
        </html>
