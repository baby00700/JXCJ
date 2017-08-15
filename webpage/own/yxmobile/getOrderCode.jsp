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
<title>确认订单</title>
<link href="plug-in/weixin/yx/css/order.css" rel="stylesheet"
	type="text/css">
<script src="plug-in/weixin/yx/js/md5.js"></script>
<script>
	function orderCode() {
		//必填参数
		var MERCHANTID = "${jhzfEntity.MERCHANTID}";
		var POSID = "${jhzfEntity.POSID}";
		var BRANCHID = "${jhzfEntity.BRANCHID}";
		var ORDERID = "${jhzfEntity.ORDERID}";
		var PAYMENT = "${jhzfEntity.PAYMENT}";
		var CURCODE = "${jhzfEntity.CURCODE}";
		var TXCODE = "${jhzfEntity.TXCODE}";
		var REMARK1 = "${jhzfEntity.REMARK1}";
		var REMARK2 = "${jhzfEntity.REMARK2}";
		var bankURL = "${jhzfEntity.bankURL}";

		var PUB = "${jhzfEntity.PUB}";
		var GATEWAY = "${jhzfEntity.GATEWAY}";
		var CLIENTIP = "${jhzfEntity.CLIENTIP}";
		var REGINFO = "${jhzfEntity.REGINFO}";
		var PROINFO = "${jhzfEntity.PROINFO}";
		var REFERER = "${jhzfEntity.REFERER}";

		//须填参数
		var url0 = 'MERCHANTID=' + MERCHANTID + '&POSID=' + POSID
				+ '&BRANCHID=' + BRANCHID + '&ORDERID=' + ORDERID + '&PAYMENT='
				+ PAYMENT + '&CURCODE=' + CURCODE + '&TXCODE=' + TXCODE
				+ '&REMARK1=' + escape(REMARK1) + '&REMARK2=' + escape(REMARK2);
		var url1 = url0 + '&TYPE=1&PUB=' + PUB + '&GATEWAY=' + GATEWAY
				+ '&CLIENTIP=' + CLIENTIP + '&REGINFO=' + escape(REGINFO)
				+ '&PROINFO=' + escape(PROINFO) + '&REFERER=' + REFERER;
		var url2= url0 + '&TYPE=1&GATEWAY=' + GATEWAY
		+ '&CLIENTIP=' + CLIENTIP + '&REGINFO=' + escape(REGINFO)
		+ '&PROINFO=' + escape(PROINFO) + '&REFERER=' + REFERER;
		
		strMD5 = hex_md5(url1);
		URL = bankURL + '?' + url2 + '&MAC=' + strMD5;

		var objMD5form = document.getElementById("MD5form");
		objMD5form.method = "post";
		objMD5form.action = URL;
		objMD5form.submit();

	}
</script>
</head>

<body>
	<form action="" id="MD5form">
		<div class="title">
			<p>确认订单</p>
		</div>
		<div class="main">
			<div class="name">
				<h1>商品名称</h1>
				<p>${jhzfEntity.PROINFO}</p>
			</div>
			<div class="line">
				<span class="line_left">商品编号</span> <span class="line_right">${jhzfEntity.ORDERID}</span>
			</div>
			<div class="line">
				<span class="line_left">缴费单位</span> <span class="line_right">江西财经职业学院</span>
			</div>
			<div class="line">
				<span class="line_left">订单时间</span> <span class="line_right">${orderDate }</span>
			</div>
			<div class="line line1">
				<span class="line_left">总计金额</span> <span class="line_right"><em>¥</em><strong>${jhzfEntity.PAYMENT}</strong></span>
			</div>
		</div>
		<div class="inp">
			<input type="button" class="btn" onClick="orderCode()" value="提交订单" />
		</div>
	</form>
</body>
</html>