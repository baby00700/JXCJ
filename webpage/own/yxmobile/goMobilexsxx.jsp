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

		<link href="plug-in/weixin/yx/css/yingxin.css" rel="stylesheet" type="text/css">
		<link href="plug-in/weixin/yx/css/mui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="plug-in/weixin/yx/css/mui.picker.min.css" />
		<link href="plug-in/weixin/yx/css/loading.css" rel="stylesheet" type="text/css">

		<script src="plug-in/weixin/yx/js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="plug-in/weixin/yx/js/jquery.qrcode.js"></script>

		<title>学生信息</title>

		<script type="text/javascript">
			//全局变量
			var sfzh = "${xsjbxx.sfzh}";
			var xb = "${xsjbxx.xb}";
			var grlc = "${xsjbxx.mobileSetid}";
			var sjh = "${xsjbxx.mobile}";
			var ksh = "${xsjbxx.ksh}";
			var dz = "${xsjbxx.sfdz}";
			var csrq = "${xsjbxx.csrq}";
			var dixiaoTime;
			var sfjf = "${xsjbxx.sfjf}";
			var sfcollar_key = "${xsjbxx.sfcollar_key}";
		</script>
		<style type="text/css">
		.jiazai {
				width: 100%;
				height: 100%;
				position: fixed;
				top: 0px;
				left: 0px;
				z-index: 888;
			}
			
			#spinner {
				position: fixed;
				left: 0;
				right: 0;
				top: 0;
				bottom: 0;
				margin: auto;
			}
			</style>
	</head>

	<body>
		<div class="jiazai" style="display:none">
			<div id="spinner"></div>
		</div>
		<div class="wrap">
			
			


			<div class="xinxibiaoti" style="border:1px solid #eee;margin-top:0px;">
				<div class="xinxi-tubiao" ></div>
				<div class="xinxi-wenzi">我的信息</div>
			</div>
			<div class="biao-con">
				<ul>
					<li class="xinxi-list"><span class="xinxi-title">考生号</span><span class="xinxi-con">${xsjbxx.ksh}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">姓名</span><span class="xinxi-con">${xsjbxx.xm}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">性别</span><span class="xinxi-con" id="xb">${xsjbxx.xb}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">民族</span><span class="xinxi-con">${xsjbxx.mzmc }</span></li>
					<li class="xinxi-list" id="sf"><span class="xinxi-title">籍贯</span><span class="xinxi-con">${xsjbxx.sfmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">身高(cm)</span><span class="xinxi-con">${xsjbxx.xssg}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">体重(kg)</span><span class="xinxi-con">${xsjbxx.xstz}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">高考分数</span><span class="xinxi-con">${xsjbxx.cj}</span></li>
	
					<li class="xinxi-list"><span class="xinxi-title">毕业学校</span><span class="xinxi-con">${xsjbxx.byxx}</span></li>
					<li class="xinxi-list" id="lqxy"><span class="xinxi-title">录取学院</span><span class="xinxi-con">${xsjbxx.xymc }</span></li>
					<li class="xinxi-list" id="lqzy"><span class="xinxi-title">录取专业</span><span class="xinxi-con">${xsjbxx.zymc }</span></li>
					<li class="xinxi-list"><span class="xinxi-title">身份证号</span><span class="xinxi-con">${xsjbxx.sfzh}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">出生日期</span><span class="xinxi-con" id="csrq">${xsjbxx.csrq}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">政治面貌</span><span class="xinxi-con">${xsjbxx.zzmm}</span></li>

					<li class="xinxi-list"><span class="xinxi-title">生源类别</span><span class="xinxi-con">${xsjbxx.klmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">手机号码</span><span class="xinxi-con">${xsjbxx.mobile}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">班级名称</span><span class="xinxi-con">${xsjbxx.bjmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">宿舍名称</span><span class="xinxi-con">${xsjbxx.ssmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">班主任</span><span class="xinxi-con">${xsjbxx.fdyxm}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">班主任电话</span><span class="xinxi-con">${xsjbxx.yddh}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">是否领取钥匙</span><span class="xinxi-con" id="yaoshi">${xsjbxx.sfcollar_key}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">是否缴费</span><span class="xinxi-con" id="sfjf">${xsjbxx.sfjf}</span></li>
					
					

				</ul>
				
			</div>
		
			<div class="subbut" id="goMain">返回</div> 
		</div>
	</body>
	<script src="plug-in/weixin/yx/js/mui.js" type="text/javascript" charset="utf-8"></script>
	<script src="plug-in/weixin/yx/js/mui.picker.min.js"></script>
	<script type="text/javascript" src="plug-in/weixin/yx/js/jquery.qrcode.js"></script>
	<script src="plug-in/weixin/yx/js/JsBarcode.all.min.js" type="text/javascript" charset="utf-8"></script>
	
	<script>
		(function($) {
			$.init();
			var result = $('#SelDate')[0];
			var btns = $('.btn');
			btns.each(function(i, btn) {
				btn.addEventListener('tap', function() {
					var optionsJson = this.getAttribute('data-options') || '{}';
					var options = JSON.parse(optionsJson);
					var id = this.getAttribute('id');
					/*
					 * 首次显示时实例化组件
					 * 示例为了简洁，将 options 放在了按钮的 dom 上
					 * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
					 */
					var picker = new $.DtPicker(options);
					picker.show(function(rs) {
						/*
						 * rs.value 拼合后的 value
						 * rs.text 拼合后的 text
						 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
						 * rs.m 月，用法同年
						 * rs.d 日，用法同年
						 * rs.h 时，用法同年
						 * rs.i 分（minutes 的第二个字母），用法同年
						 */
						result.innerText = rs.text;
						dixiaoTime = rs.text;
						/* 
						 * 返回 false 可以阻止选择框的关闭
						 * return false;
						 */
						/*
						 * 释放组件资源，释放后将将不能再操作组件
						 * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
						 * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
						 * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
						 */
						picker.dispose();
					});
				}, false);
			});
		})(mui);

		$(document).ready(function() {
			//返回主页跳转
			$("#goMain").click(function(){
				$(".jiazai").stop().fadeIn(800);
				window.location.href="mobileStudentController.do?goLogintofdy";
			});
			//判断xinxi-con是否为null
			var ornull = $(".biao-con li").length;
			for(var i = 1; i <= ornull; i++) {
				//console.log(i);
				var ornulltext = $(".xinxi-list").eq(i).children(".xinxi-con").text();
				//console.log(ornulltext);
				if(ornulltext == "null" || ornulltext == "" || ornulltext == "undefind") {
					console.log(i);
					$(".xinxi-list").eq(i).children(".xinxi-con").text("—");
				}
			}
			//判断性别
			
			if(xb == '1') {
				$("#xb").text("男");
			} else {
				$("#xb").text("女");
			}

			//判断单招
			if(dz == "N") {
				$("#dz").text("否");
			} else {
				$("#dz").text("是");
			}

			//判断是否领钥匙

			if(sfcollar_key == "N") {
				$("#yaoshi").text("否");
			} else {
				$("#yaoshi").text("是");
			}

			//判断是否缴费
			if(sfjf == "N") {
				$("#sfjf").text("否");
			} else {
				$("#sfjf").text("是");
			}
			//二维码
			var saomaurl = ksh;
			$("#2dcode").qrcode({
				width: 250,
				height: 250,
				text: saomaurl
			});

			//条形码
			var barcode = document.getElementById('barcode'),
				str = ksh,
				options = {
					format: "CODE128",
					displayValue: true,
					fontSize: 18,
					height: 60
				};
			$('#barcode').JsBarcode(str, options); //jQuery

		});

	
	</script>

</html>