<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />
<title>新生入口</title>
<script src="plug-in/weixin/yx/js/jquery-1.8.3.min.js"></script>
<link href="plug-in/weixin/yx/css/global.css" rel="stylesheet"
	type="text/css">
<link href="plug-in/weixin/yx/css/login.css" rel="stylesheet"
	type="text/css">

	<link href="plug-in/weixin/yx/css/loading.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

	function doSubmit() {

		$(".jiazai").stop().fadeIn();
		$(".warp").addClass("maoboli");
		var ksh = $("#ksh").val();
		var sfzh = $("#sfzh").val();
		
		$.ajax({
			type : "post",
			dataType : "json",
			url : "mobileStudentController.do?doLogin",
			data : {
				sfzh : sfzh,
				ksh : ksh
			},
			timeout:3000,
			success : function(data) {
				if(data==false)
				{
						$(".jiazai").stop().fadeOut();
						$(".warp").removeClass("maoboli");
						alert("请输入正确的考生号或身份证号后六位！");
						$("#button2").hide().prev().show().parent().css("background-color","#00aced").css("color","#fff");
						
				}
				else
				{
					
					window.location.href="mobileStudentController.do?goLogin";
				}
			},
			error : function(msg) {
				alert("网络不好，请稍后再试！");
				$("#button2").hide().prev().show().parent().css("background-color","#00aced").css("color","#fff");
			},
			complete:function(XMLHttpRequest,status){ //请求完成后最终执行参数
			　　　　if(status=='timeout'){//超时,status还有success,error等值的情况
			　　　　　 $(".jiazai").stop().fadeOut();
						$(".warp").removeClass("maoboli");
						alert("网络不好，请稍后再试！");
						$("#button2").hide().prev().show().parent().css("background-color","#00aced").css("color","#fff");
			　　　　}
			}

			
		});
	}

	
</script>

	<style>
	/*加载 开始*/
	.jiazai{
	width:100%;
	height:100%;
	position:fixed;
	top:0px;
	left:0px;
	z-index:1000;
	display:none;
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
	<%--加载结束--%>

	.maoboli{
	-webkit-filter: blur(10px);
	}
	</style>





</head>

<body>


	<!--加载动画-->
	<div class="jiazai">
	<div id="spinner"></div>
	</div>
	<!--加载动画-->

	<div class="main">
  <div class="header">
        <p>用户登录</p>
    </div>
		   <div class="login">
        <div class="user">
            <div class="userName"> <div class="inp">
						<input type="tel" id="ksh" name="ksh" placeholder="请输入考生号"
							class="txt" />
					</div>
			  </div>
        </div>
        <div class="user">
            <div class="userPwd">
                <div class="inp">
						<input type="password" id="sfzh" name="sfzh" placeholder="请输入身份证号后六位"
							class="txt" />
					  </div>
        </div>
    </div>
    <div class="box">
        <div class="btn">
				<input type="submit" id="button" name="button"  value="登录" class="sub" />
				<input type="submit" id="button2" name="button"  value="登录中..." class="sub" style="display: none" />
			</div>
			<%--<div class="link">--%>
				<%--<span class="one"><a href="#">用户注册</a></span> <span class="two"><a--%>
					<%--href="#">忘记密码？</a></span>--%>
			<%--</div>--%>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#button").unbind().click(function(){
		var inputksh=$("#ksh").val();
		var inputsfzh=$("#sfzh").val();
		if(inputksh==""||inputsfzh==""){
			alert("请输入正确的考生号和身份证号后六位！");
		}else{
			doSubmit();
			$(this).hide().next().show().parent().css("background-color","#ccc").css("color","#555");
		}
		
		
		
	});
</script>
</html>
