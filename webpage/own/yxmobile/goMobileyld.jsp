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
<title>管理员</title>
<script src="plug-in/weixin/yx/js/jquery-1.8.3.min.js"></script>
<link href="plug-in/weixin/yx/css/mob_acehome.css" rel="stylesheet" type="text/css">
<link href="plug-in/weixin/yx/css/loading.css" rel="stylesheet" type="text/css">
<style>
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
	
	@-webkit-keyframes shuaxinrotate0/* Safari 鍜� Chrome */
	{
	from {-webkit-transform:rotate(0deg); }
	to {-webkit-transform:rotate(180deg); }
	}
	
	@-webkit-keyframes shuaxinrotate1/* Safari 鍜� Chrome */
	{
	from {-webkit-transform:rotate(180deg); }
	to {-webkit-transform:rotate(360deg); }
	}
	
	
	.xuanzhuan0{
		-webkit-animation:shuaxinrotate0 0.8s;
	}
	
	.xuanzhuan1{
		-webkit-animation:shuaxinrotate1 0.8s;
	}
</style>
<script type="text/javascript">
	function reload(){
		window.location.href="mobileStudentController.do?goLogintoyld&"+new Date();
	}

	$(document).ready(function() {

		$.ajax({
			type : "post",
			dataType : "json",
			url : "mobileStudentController.do?getMobleBbtj",
			success : function(data) {
				if (data.success == true) {
					 var obj1 = $.parseJSON(data.msg);
					 var obj2= $.parseJSON(data.obj);
					 var bdl="";
					 var tb="";
					 if (obj1.length != 0) {
						 var lqrs=parseFloat(obj1[0].lqrs);

						 var jfrs=parseFloat(obj1[0].sfjf);
						 var zjh=0;
						if(obj1[0].jszjh!="null"&&obj1[0].jszjh!="")
						{
							zjh=obj1[0].jszjh;
						}

						var yjqrs=parseInt(obj1[0].sfjf)-parseInt(obj1[0].jfrs);
						 var lql=Math.round(parseFloat((jfrs/lqrs)*100)*100)/100;
						 bdl+="<li><span class=\"num1\"><h1>"+ obj1[0].lqrs+"</h1><p>录取人数</p></span></li>";
						 bdl+="<li><span class=\"sign\"><h1>"+lql+"</h1><p>报到率</p></span></li>";
						 bdl+="<li><span class=\"num3\"><h1>"+ obj1[0].sfjf+"</h1><p>缴费人数</p></span></li>";
					
						 bdl+="<li><span class=\"num1\"><h1>"+yjqrs+"</h1><p>已缴清人数</p></span></li>";
						 bdl+="<li><span class=\"num3\"><h1>"+ obj1[0].jfrs+"</h1><p>未缴清人数</p></span></li>";
	 					 bdl+="<li><span class=\"num2\"><h1>"+ obj1[0].sfrz+"</h1><p>入住人数</p></span></li>";
						 if(obj2.length!=0)
						 {
							 tb+=" <tr bgcolor=\"#e5f6ff\"><th>院系名称</th><th>报到人数</th><th>报到率</th></tr>";
							 for(var t=0;t<obj2.length;t++)
							 {
								tb+=" <tr> <td>"+obj2[t].name+"</td> <td>"+obj2[t].value+"</td> <td>"+obj2[t].bl+"</td> </tr>"; 
							 }
						 }
					 }
					 $("#ulbdl").html(bdl);
					 $("#tb").html(tb);
					 $(".nav").stop().fadeIn();
					 $(".main").stop().fadeIn();
					 $(".jiazai").stop().fadeOut();
				}
				else
					{
					alert("数据获取失败！");
					
					}

			}

		});
		
		
		
		$(".header a").toggle(function(){
			$(this).removeClass("xuanzhuan1").addClass("xuanzhuan0");
			setTimeout("reload();",800);
		},function(){
			$(this).removeClass("xuanzhuan0").addClass("xuanzhuan1");
			setTimeout("reload();",800);
		});
		
	});
</script>
</head>

<body>
<div class="jiazai">
	<div id="spinner"></div>
	</div>
	<div class="header"><span><a href="#"></a></span><h1>学院报到情况</h1></div>
<div class="nav" style="display:none">
    <ul id="ulbdl">
       
       
    </ul>
</div>
<div class="main" style="display:none">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabs" id="tb" >
      
    </table>
</div>
</body>
</html>
