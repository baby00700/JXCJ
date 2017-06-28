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

		<script src="plug-in/weixin/yx/js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="plug-in/weixin/yx/js/jquery.qrcode.js"></script>

		<title>用户登录信息</title>

		<script type="text/javascript">
			//全局变量
			var sfzh = "${studentInfo.sfzh}";
			var xb = "${studentInfo.xb}";
			var grlc = "${studentInfo.mobileSetid}";
			var sjh = "${studentInfo.mobile}";
			var ksh = "${studentInfo.ksh}";
			var dz = "${studentInfo.sfdz}";
			var csrq = "${studentInfo.csrq}";
			var dixiaoTime;
			var sfjf = "${studentInfo.sfjf}";
			var sfcollar_key = "${studentInfo.sfcollar_key}";
		</script>
	</head>

	<body>
		<div class="wrap">
			
			<div class="wrap-tiaoma" style="margin-top:0px">
					<div class="tiaoma-biaoti">
						<div class="tiaoma-tubiao"></div>
						<div class="tiaoma-wenzi">条形码</div>
					</div>
					<div class="tiaoma-img" style="width:260px;margin:0 auto">
						<img id="barcode" width="260px" />
					</div>

					<!--<div id="2dcode" style="width:250px;margin:0 auto;position:relative;top:40px;"></div>-->
			</div>


			<div class="xinxibiaoti" style="margin-top:0px;margin-top:15px;border:1px solid #eee;">
				<div class="xinxi-tubiao" ></div>
				<div class="xinxi-wenzi">我的信息</div>
			</div>
			<div class="biao-con">
				<ul>
					<li class="xinxi-list"><span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">性别</span><span class="xinxi-con" id="xb">${studentInfo.xb}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">民族</span><span class="xinxi-con">${studentInfo.mzmc }</span></li>
					<li class="xinxi-list" id="sf"><span class="xinxi-title">籍贯</span><span class="xinxi-con">${studentInfo.sfmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">身高(cm)</span><span class="xinxi-con">${studentInfo.xssg}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">体重(kg)</span><span class="xinxi-con">${studentInfo.xstz}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">高考分数</span><span class="xinxi-con">${studentInfo.cj}</span></li>
	
					<li class="xinxi-list"><span class="xinxi-title">毕业学校</span><span class="xinxi-con">${studentInfo.byxx}</span></li>
					<li class="xinxi-list" id="lqxy"><span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc }</span></li>
					<li class="xinxi-list" id="lqzy"><span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc }</span></li>
					<li class="xinxi-list"><span class="xinxi-title">身份证号</span><span class="xinxi-con">${studentInfo.sfzh}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">出生日期</span><span class="xinxi-con" id="csrq">${studentInfo.csrq}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">政治面貌</span><span class="xinxi-con">${studentInfo.zzmm}</span></li>

					<li class="xinxi-list"><span class="xinxi-title">生源类别</span><span class="xinxi-con">${studentInfo.klmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">手机号码</span><span class="xinxi-con">${studentInfo.mobile}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">班级名称</span><span class="xinxi-con">${studentInfo.bjmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">宿舍名称</span><span class="xinxi-con">${studentInfo.ssmc}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">班主任</span><span class="xinxi-con">${studentInfo.fdyxm}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">班主任电话</span><span class="xinxi-con">${studentInfo.yddh}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">是否领取钥匙</span><span class="xinxi-con" id="yaoshi">${studentInfo.sfcollar_key}</span></li>
					<li class="xinxi-list"><span class="xinxi-title">是否缴费</span><span class="xinxi-con" id="sfjf">${studentInfo.sfjf}</span></li>
					
					

				</ul>
				
			</div>
		
			<div class="subbut" id="goMain">返回主页</div> 
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
				window.location.href="mobileStudentController.do?goMain";
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