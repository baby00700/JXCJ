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
	<title>管理员入口</title>
<script src="plug-in/weixin/yx/js/jquery-1.8.3.min.js"></script>
<link href="plug-in/weixin/yx/css/global.css" rel="stylesheet"
	type="text/css">
<link href="plug-in/weixin/yx/css/login.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript">
	function doSubmit() {
		var ksh = $("#ksh").val();
		var sfzh = $("#sfzh").val();
		$.ajax({
			type : "post",
			dataType : "json",
			url : "mobileStudentController.do?doLogintofdy",
			data : {
				sfzh : sfzh,
				ksh : ksh
			},
			success : function(data) {
				if(data==false)
				{
						alert("账号名或身份证号有误！");
						$("#button2").hide().prev().show().parent().css("background-color","#00aced").css("color","#fff");
				}
				else
				{
					location.href="mobileStudentController.do?goMobileyld";
				}
			},
			error : function(msg) {
				alert("error:" + msg);
				$("#button2").hide().prev().show().parent().css("background-color","#00aced").css("color","#fff");
			}

			
		});
	}
</script>
</head>

<body>
		<div class="header">
			<div class="img">
				<div class="photo">
					<img src="plug-in/weixin/yx/images/head.png" />
				</div>
			</div>
		</div>
		<div class="login">
			<div class="user">
				<div class="userName">
					<div class="inp">
						<input type="text" id="ksh" name="ksh" placeholder="请输入工号"
							class="txt" />
					</div>
				</div>
			</div>
			<div class="user">
				<div class="userPwd">
					<div class="inp">
						<input type="password" id="sfzh" name="sfzh" placeholder="请输入密码"
							class="txt" />
					</div>
				</div>
			</div>
		</div>
		<div class="box">
			<div class="btn">
				<input type="submit" id="button" name="button"  value="登录" class="sub" />
				<input type="submit" id="button2" name="button"  value="登录中..." class="sub" style="display: none" />
			</div>
			
		</div>
</body>
<script type="text/javascript">
	$("#button").unbind().click(function(){
		var inputksh=$("#ksh").val();
		var inputsfzh=$("#sfzh").val();
		if(inputksh==""||inputsfzh==""){
				alert("请输入正确的工号和密码！");
		}else{
			doSubmit();
			$(this).hide().next().show().parent().css("background-color","#ccc").css("color","#555");
		}
		
		
		
	});
</script>
