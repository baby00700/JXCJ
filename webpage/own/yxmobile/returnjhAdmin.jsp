<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<style type="text/css">
*{
	margin:0px;
	padding:0px;
}
html,body{
	height:100%;
	width:100%;
}
.wrap{
	width:100%;
	height:100%;
}
.top{
	width:100%;
	height:100%;
	
   
   
	position:relative;
}

.topdh{
	 -webkit-animation: jb 3s infinite; 
}

.topdh2{
	 -webkit-animation: jb2 3s infinite; 
}
@-webkit-keyframes jb{
	0%{ background-color: rgba(0, 163, 17,0.6)}
	40%{ background:  rgba(0, 163, 17,1)}
	60%{ background:  rgba(0, 169, 17,1)}
	100%{ background-color: rgba(0, 163, 17,0.6)}
}

@-webkit-keyframes jb2{
	0%{ background-color: rgba(44, 110, 203,1)}
	40%{ background:  rgba(81, 137, 217,1)}
	60%{ background:  rgba(81, 137, 217,1)}
	100%{ background-color: rgba(44, 110, 203,1)}
}

.tupian{
	width:110px;
	height:110px;
	margin:0 auto;
	position:relative;
	top:90px;
	background-size:100% 100%;
	
}
.tupian2{
	width:120px;
	height:120px;
	margin:0 auto;
	position:relative;
	top:90px;
	background-size:100% 100%;
	
}

.tupiandh{
	 -webkit-animation: tudh 1.5s ; 
}
.tupiandh2{
	 -webkit-animation: tudh2 1.5s ; 
}

@-webkit-keyframes tudh{
	0%{ width:10px;height:10px;}
	40%{width:160px;height:160px;}
	50%{width:160px;height:160px;}
	60%{width:160px;height:160px;}
	70%{width:160px;height:160px;}
	80%{width:160px;height:160px;}
	100%{width:110px;height:110px;}
}

@-webkit-keyframes tudh2{
	0%{ width:10px;height:10px;}
	40%{width:160px;height:160px;}
	50%{width:160px;height:160px;}
	60%{width:160px;height:160px;}
	70%{width:160px;height:160px;}
	80%{width:160px;height:160px;}
	100%{width:120px;height:120px;}
}



@-webkit-keyframes wendh{
	0%{  -webkit-filter: blur(10px);font-size:100px;color:rgba(0,0,0,0.1);}
	100%{ -webkit-filter: blur(0px);font-size:18px;color:rgba(255,255,255,1);}
}


.wenzi{
	width:100%;
	height:20px;
	font-size:18px;
	white-space : nowrap ;
	margin-top:110px;
	top:110px;
	color:rgba(255,255,255,1);
	font-weight: 500;
	text-align: center;
	line-height: 20px;
	 -webkit-animation: wendh 1.5s ;
 
}
.tip{
	width:100%;
	position:fixed;
	bottom:25%;
	text-align: center;
	color:#fff;
	font-size: 18px;
	font-weight: bolder;
}

#count{
	color:#FF0000;
	font-size:25px;
}

.but{
	width:90%;
	height:36px;
	border:1px solid rgba(0, 0, 0,0.1);
	position:fixed;
	bottom:20%;
	left:5%;
	border-radius:18px;
 	 background: -webkit-linear-gradient(left, #F79856 , #F7D756);
	-webkit-box-shadow:1px 1px 2px 1px rgba(0, 0, 0,0.4);
	text-align: center;
	line-height: 36px;
	color:rgba(44, 110, 203,1);
	font-weight:100;
	font-size:16px;
}

</style>	
	
<script src="http://welcome.jxvc.jx.cn/swm-wx/plug-in/weixin/yx/js/jquery-1.8.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<title>支付完成</title>
</head>

<body>
	<div class="wrap">
		<div class="top">
			<div class="tupian">
				
			</div>
			<div class="wenzi">
				
			</div>
			<div class="tip" style="display: none;">
				<span id="tztip"></span>即将跳转&nbsp;<span id="count">3</span>&nbsp;s
			</div>
			<div class="but" style="display:none" onclick="autotz()">
				点此重新支付
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function autotz(){
		window.location.href="http://welcome.jxvc.jx.cn/swm-wx/mobileStudentController.do?goLogin";
	}
	
	$(document).ready(function(){
		var istrue="${strRet}"; //是否支付成功
		if(istrue=="Y"){
			$(".tip").show();
			$(".tupian").css("background-image","url(http://welcome.jxvc.jx.cn/swm-wx/plug-in/weixin/yx/images/succ.png)").addClass("tupiandh");
			$(".top").addClass("topdh");
			$(".wenzi").text("支付成功");
			setTimeout('$("#count").text(3);',1000);
			setTimeout('$("#count").text(2);',2000);
			setTimeout('$("#count").text(1);',3000);
			setTimeout('window.location.href="http://welcome.jxvc.jx.cn/swm-wx/mobileStudentController.do?goLogin"',3001);
			
		}else if(istrue=="N"){
			$(".tupian").css("background-image","url(http://welcome.jxvc.jx.cn/swm-wx/plug-in/weixin/yx/images/false.png)").css("height","120px").css("width","120px").addClass("tupiandh2");
			$(".top").addClass("topdh2");
			$(".wenzi").text("支付失败");
			$(".but").show();
		}
	});
</script>
</html>