<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>

	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="format-detection" content="telephone=no">
		<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes">
		<title>迎新报名</title>
		<link href="plug-in/weixin/yx/css/global.css" rel="stylesheet" type="text/css">
		<link href="plug-in/weixin/yx/css/index.css" rel="stylesheet" type="text/css">
		<link href="plug-in/weixin/yx/css/owl.css" rel="stylesheet" type="text/css">
		<link href="plug-in/weixin/yx/css/yingxin.css" rel="stylesheet" type="text/css">
		<script src="plug-in/weixin/yx/js/jquery-1.8.3.min.js"></script>
		<script src="plug-in/weixin/yx/js/owl.carousel.min.js"></script>
	</head>
	<style>

	</style>

	<script type="text/javascript">
	var ksh = "${studentInfo.ksh}";
	var imgpath1 = 'http://218.95.46.79/photo/photo/' + ksh + '.JPG';
	var imgpath2 = 'http://218.95.46.79/photo/photo/' + ksh + '.jpg';
	var imgpath3 = 'http://218.95.46.79/photo/photo/' + ksh + '.BMP';
	var imgpath4 = 'http://218.95.46.79/photo/photo/' + ksh + '.bmp';
	var imgpath5="";
	
	function notfound() {
		var img = event.srcElement;
		// alert("非JPG");
		img.src = imgpath2;
		$(".yicun").css('background-image','url('+imgpath2+')');

		img.onerror = function() {
			// alert("非jpg");
			img.src = imgpath3;
			$(".yicun").css('background-image','url('+imgpath3+')');
			img.onerror = function() {
				// alert("非BMP");
				img.src = imgpath4;
				$(".yicun").css('background-image','url('+imgpath4+')');
				// 这里可以设置为默认的--null是终止onerror--
				img.onerror = function() {
					img.src = "plug-in/weixin/yx/images/head.png";
					$(".yicun").css('background-image','url('+img.src+')');
					img.onerror = null;
				}
			}
		}
		imgpath5=img.src;
	}
	
	$(document).ready(function(){
		$(".imagebox").attr("src", imgpath1);
	});
	
		var stuaddr = "${studentInfo.address }";

		var rows = 3; //每页显示记录数
		var page = 1; //当前页
		var total = 0; //总记录数
		var field = "id,title,columnId,summary,createDate,imageName,imageHref,accountid,"; //字段
		var sort = "createDate";
		var order = "desc";
		var columnId = "402881e44695183a01469522f7d20019"; //当前栏目id//
		var $moreBtn = $("#j-viewmore"); //显示更多按钮
		//数据加载
		function loadData() {
			if($("#j-viewmore").hasClass("disabled")) {
				return;
			}
			$("#j-viewmore").html("努力加载中…").addClass("disabled");
			$.ajax({
				type: "GET",
				url: "cmsController.do?getMenuList",
				data: {
					columnid: columnId,
					field: field,
					rows: rows,
					page: page,
					sort: sort,
					order: order
				},
				dataType: "json",
				success: function(data) {
					$.each(data, function(key, value) {
						if(key == "rows") {
							for(var i = 1; i < value.length; i++) {
								//	console.log("article",value[i]);
								var title1 = value[0].title;
								if(title1.length > 18) {
									title1 = title1.substr(0, 18) + "...";
								}
								var imageHref1 = value[0].imageHref;
								var id1 = value[0].id;
								var idurl1 = "cmsController.do?goPage&page=article&articleid=" + id1;
								var title = value[i].title;
								if(title.length > 12) {
									title = title.substr(0, 12) + "...";
								}

								var imageHref = value[i].imageHref;
								var id = value[i].id;
								var summary = value[i].summary;
								if(summary.length > 16) {
									summary = summary.substr(0, 16) + "...";
								}
								var createDate = value[i].createDate;
								var idurl = "cmsController.do?goPage&page=article&articleid=" + id;
								var datecon = createDate.substr(0, 10);
								//console.log(imageHref);
								//console.log(title);
								//console.log(id);
								//console.log(summary);
								//setData(value[i]);
								var htmlcon = '<div class="list"><a href=' + idurl + '><div class="box"><div class="left"><img src=' + imageHref + '></div><div class="right"><h1>' + title + '</h1><p class="summary"><font>' + summary + '</font></p><span>' + datecon + '</span></p></div></div></a></div>';
								$("#list").append(htmlcon);
							}
							var htmlcon1 = '<a href=' + idurl1 + '><div class="tp" id="tp">' + '<img src=' + imageHref1 + '><span>' + title1 + '</span>' + '</div></a>'
							$("#tp").html(htmlcon1);
							//console.log(imageHref1);
							// console.log(title1);
							//	 console.log(id1);
						}
						if(key == "total") {
							total = value;
						}
					});
					if((page * rows) >= total) {
						$("#j-viewmore").html("已显示全部").addClass("disabled");
						$moreBtn.off('click');
					} else {
						page++;
						$("#j-viewmore").html("查看更多").removeClass("disabled");
					}
				}
			});
		}
		loadData();
	</script>

	<body>
		<div class="zhezhao-queren">
			<div class="querenkuang">
				<div class="queren-wenzi">
					<p></p>
				</div>
				<div class="conbut" id="querenbut-main" style="width:100%;text-align: center;line-height: 47px;display:none">确定</div>
				<div class="conbut" id="main-quxiao" style="display:none;box-sizing: border-box;border-right:1px solid #ccc">取消</div>
				<div class="conbut" id="main-querenbut" style="display:none;">确定</div>
			</div>
		</div>
		<div class="stuinfo">
			<div class="jibenxinxi">
				<div class="touxiang">
					<img class="imagebox" onerror="notfound()" style="width:63px;height:77px;border-radius:7px;" />
				</div>
				<div class="loginout">注销</div>

				<div class="wenzi">
					<div class="xingming">
						录取姓名：
						<span class="shuju" id="mingzi">${studentInfo.xm}</span>
						<a href="mobileStudentController.do?myinfo#sf"><span id="laizi">来自 <span id="diqu">${studentInfo.sfmc }</span>
							</span>
						</a>
					</div>
					<div class="luquxibu">
						录取院系：
						<a href="mobileStudentController.do?myinfo#lqxy"><span class="shuju" id="luqubuxi">${studentInfo.xymc }</span></a>
					</div>
					<div class="luquzhuanye">
						录取专业：
						<a href="mobileStudentController.do?myinfo#lqzy"><span class="shuju" id="luquzhuanye">${studentInfo.zymc }</span></a>
					</div>
					<div class="zt" style="position:relative">
						当前状态：
						<span class="zhuangtaicon" id="bddone" style="color:red;white-space: nowrap;">
							已完成报名！
							</span>
						<span class="shuaxinmain"></span>

					</div>
				</div>

			</div>
			<div class="xiaoyouxinxi">
				<div class="xiaoyouxinxilan">
					<div class="tubiao"></div>
					<div class="wenzibiaoti">&nbsp;您的本届校友信息</div>
				</div>
				<div class="xiaoyouxiangqing">

					<div class="xiangqingshu" id="tongzhuanye">
						<div class="tongzhuanye-s"></div>
						<div class="tongzhuanye-z">专业人数</div>
					</div>
					<div class="xiangqingshu" id="tongbanji">
						<div class="tongbanji-s"></div>
						<div class="tongbanji-z">班级人数</div>
					</div>
					<div class="xiangqingshu" id="tongxueyuan">
						<div class="tongsushe-s"></div>
						<div class="tongsushe-z">宿舍类型</div>
					</div>
				</div>
			</div>
		</div>

		<div class="view">
			<div class="daohanglan">
				<div class="tubiao"></div>
				<div class="wenzibiaoti">&nbsp;导航栏</div>
			</div>
			<ul>
				<li>
					<a href="cmsController.do?goPage&page=article&articleid=4028811f5b8fbe52015b8fcdbd07000b "><img src="plug-in/weixin/yx/images/01.png"><br>报到须知</a>
				</li>
				<!--<li><a href="#"><img src="plug-in/weixin/yx/images/02.png"><br>新闻公告</a></li>-->
				<li id="zizhubaodao">
					<a href="#"><img src="plug-in/weixin/yx/images/03.png"><br>自助报到</a>
				</li>
				<li>
					<a href="mobileStudentController.do?myinfo"><img src="plug-in/weixin/yx/images/04.png"><br>我的信息</a>
				</li>
				<!--<li><a href="#"><img src="plug-in/weixin/yx/images/05.png"><br>我的班级</a></li>-->
				<li>
					<a href="mobileStudentController.do?goMyDrom"><img src="plug-in/weixin/yx/images/06.png"><br>我的宿舍</a>
				</li>
				<!--<li><a href="#"><img src="plug-in/weixin/yx/images/07.png"><br>我要咨询</a></li>
	<li><a
	href="#"><img src="plug-in/weixin/yx/images/08.png"><br>更多</a></li>-->
			</ul>
		</div>

		<div class="news">
			<div class="zixunlan">
				<div class="tubiao"></div>
				<div class="wenzibiaoti">&nbsp;校内资讯</div>
			</div>

			<div class="news_img" style="margin-top:8px;">
				<a href="#">
					<div class="tp" id="tp">

					</div>
				</a>
			</div>
		</div>
		<div id="list">

		</div>
		<div class="more" style="width:100%;background-color: #fff;">
			<a href="cmsController.do?goPage&page=menu&id=402881e44695183a01469522f7d20019">加载更多</a>
		</div>

	</body>

	<script>
		//function shuxinX(){
		//刷新方法
		var sfjf;

		function reloadout() {

			$.ajax({
				type: "post",
				timeout: 5000,
				url: "mobileStudentController.do?refresh",
				async: true,
				success: function(data) {

					sfjf = "${studentInfo.sfjf}";
					window.location.href = "mobileStudentController.do?goLogin&" + new Date();

				},
				complete: function(XMLHttpRequest, status) { //请求完成后最终执行参数
					if(status == 'timeout') { //超时,status还有success,error等值的情况
						alert("连接超时");
					}
				}
			});
		}

		var throttle = function(fn, delay, atleast) {
			var timer = null;
			var previous = null;
			return function() {
				var now = +new Date();
				if(!previous) previous = now;
				if(now - previous > atleast) {

					fn();
					previous = now;
				} else {
					clearTimeout(timer);
					timer = setTimeout(function() {
						fn();
					}, delay);
				}
			}
		};

		var f = throttle(reloadout, 500, 2000);

		$(".shuaxinmain").toggle(function() {
				$(this).removeClass("xuanzhuan1").addClass("xuanzhuan0");

				setTimeout(f(), 100);
			},
			function() {
				$(this).removeClass("xuanzhuan0").addClass("xuanzhuan1");
				setTimeout(f(), 100);
			}
		);

		$(document).ready(function() {

			var countAjax = null;
			countAjax = $.ajax({
				type: "post",
				dataType: "json",
				url: "mobileStudentController.do?getSumCount",
				async: true,

				success: function(data) {
					var obj = $.parseJSON(data.msg);
					//alert(obj.bjcount+"**" + obj.zycount +"**"+ obj.sscount);
					var bjcount = obj.bjcount;
					var zycount = obj.zycount;
					var sscount = obj.sscount;
					$(".tongbanji-s").html(bjcount);
					$(".tongzhuanye-s").html(zycount);
					$(".tongsushe-s").html(sscount);

				},

				error: function(msg) {
					countAjax.abort();

				}
			});

			$(".loginout").click(function() {
				countAjax.abort();
				$("#querenbut-main").hide();
				$(".zhezhao-queren").stop().fadeIn();
				$("#main-quxiao").show();
				$("#main-querenbut").show();
				$("#main-quxiao").click(function() {
					$(".zhezhao-queren").stop().fadeOut();
				});
				$("#main-querenbut").click(function() {
					$.ajax({
						type: "post",
						url: "mobileStudentController.do?cancelUser",
						async: true,
						dataType: "json",
						success: function(data) {
							if(data.success == true) {
								window.location.href = "mobileStudentController.do?goLogin";

							} else {
								alert("注销失败！");
							}

						},
						complete: function(XMLHttpRequest, status) { //请求完成后最终执行参数
							if(status == 'timeout') { //超时,status还有success,error等值的情况
								alert("连接超时");
							}
						}
					});
				});
				$(".queren-wenzi p").text("是否确认注销本帐号？");

			});

			var isbddone = "${studentInfo.sfyx}";

			var sfjf = "${studentInfo.sfjf}";
			if(sfjf == "N") {
				$("#bddone").show().html("未缴费！").next().show().next().show();
			} else {
				$("#bddone").show().html("已缴费！").next().show().next().show();
			}

			//当前状态

			//验证是否院系报到

			if(isbddone == "N") {
				//是否领取钥匙
				//验证电脑端是否有数据
				var flowname = "${studentInfo.flowname}";


				if(flowname == "" || flowname == "null") {

					$.ajax({
						type: "post",
						dataType: "json",
						timeout: 5000, //超时5秒
						url: "mobileStudentController.do?isRegister",//判断是否在时间内
						success: function(data) {
							var su = data.success;
							var obj = data.msg;
							if(su == true) {


							} else {
								$(".zhezhao-queren").stop().fadeIn();
								$("#querenbut-main").click(function() {
									$(".zhezhao-queren").stop().fadeOut();
								});
								$("#querenbut-main").show();
								$(".queren-wenzi p").text(obj);
								//alert(obj);
							}
						},
						error: function(msg) {
							alert("error:" + msg);
						},
						complete: function(XMLHttpRequest, status) { //请求完成后最终执行参数
							if(status == 'timeout') { //超时,status还有success,error等值的情况

								alert("连接超时");
							}
						}
					});

				}

			} else {
				$("#bddone").show().html("已完成报道！").next().hide().next().hide();
			}

			$("#zizhubaodao").click(function() {
				if(isbddone == "N") {
					if(flowname == "" || flowname == "null") {

						$.ajax({
							type: "post",
							dataType: "json",
							url: "mobileStudentController.do?isRegister",
							timeout: 5000, //超时5秒
							success: function(data) {
								var su = data.success;
								var obj = data.msg;
								if(su == true) {
										$(".zhezhao-queren").stop().fadeIn();
										$("#main-quxiao").show();
										$("#main-querenbut").show();
										$("#main-quxiao").click(function() {
										$(".zhezhao-queren").stop().fadeOut();
										});
										$("#main-querenbut").click(function() {
										window.location.href = "mobileStudentController.do?index";
										});

										$(".queren-wenzi p").text("是否进入自助报道流程？");

								} else {
									$(".zhezhao-queren").stop().fadeIn();
									$("#querenbut-main").click(function() {
										$(".zhezhao-queren").stop().fadeOut();
									});
									$("#querenbut-main").show();
									$(".queren-wenzi p").text(obj);
									//alert(obj);
								}
							},
							error: function(msg) {
								alert("error:" + msg);
							},
							complete: function(XMLHttpRequest, status) { //请求完成后最终执行参数
								if(status == 'timeout') { //超时,status还有success,error等值的情况
									alert("连接超时");
								}
							}
						});

					} else {
						window.location.href = "mobileStudentController.do?myinfo";
					};
				} else {
					window.location.href = "mobileStudentController.do?myinfo";

				}

			});
		});
	</script>

</html>