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
		<script src="plug-in/weixin/yx/js/yingxin.js" type="text/javascript" charset="utf-8"></script>

		<title>新生报名</title>

		<script type="text/javascript">
			function reloadout() {

				$.ajax({
					type: "post",
					url: "mobileStudentController.do?refresh",

					async: true,
					success: function(data) {
						console.log(data);
						//全局变量
						var sfzh = "${studentInfo.sfzh}";
						var xb = "${stuIdentInfo.xb}";
						var grlc = "${studentInfo.mobileSetid}";
						var sjh = "${studentInfo.mobile}";
						var ksh = "${studentInfo.ksh}";
						var dz = "${studentInfo.sfdz}";
						var csrq = "${studentInfo.csrq}";
						var dixiaoTime;
						var sfjf = "${studentInfo.sfjf}";
						var sfcollar_key = "${studentInfo.sfcollar_key}";
						var stmobile = "${studentInfo.mobile}";
						var bjmc = "${studentInfo.bjmc}";
						var fdyxm = "${studentInfo.fdyxm}";
						var yddh = "${studentInfo.yddh}";

					}

				});
			}
			//全局变量
			var kssj = "${studentInfo.startDate}";
			var jssj = "${studentInfo.endDate}";

			//新增内容20170621
			var jtrks1 = "${studentInfo.jtrks}";
			var rjnsr1 = "${studentInfo.rjnsr}";
			var gwbs1 = "${studentInfo.gwbs}";
			var jtlx1 = "${studentInfo.jtlx}";

			var sfzh = "${studentInfo.sfzh}";

			//家长身份证号
			var jzsfzh1 = "${studentInfo.sfzh1}";
			var jzsfzh2 = "${studentInfo.sfzh2}";
			var jzsfzh3 = "${studentInfo.sfzh3}";

			var xb = "${studentInfo.xb}";
			var grlc = "${studentInfo.mobileSetid}";
			var sjh = "${studentInfo.mobile}";
			var ksh = "${studentInfo.ksh}";
			var dz = "${studentInfo.sfdz}";
			var csrq = "${studentInfo.csrq}";
			var dixiaoTime;
			var sfjf = "${studentInfo.sfjf}";
			var sfdz = "${studentInfo.sfdz}";

			var sfcollar_key = "${studentInfo.sfcollar_key}";
			var stmobile = "${studentInfo.mobile}";
			var bjmc = "${studentInfo.bjmc}";
			var fdyxm = "${studentInfo.fdyxm}";
			var yddh = "${studentInfo.yddh}";
			var jzxm1 = "${studentInfo.jtmc1}";
			var jzxm2 = "${studentInfo.jtmc2}";
			var jzxm3 = "${studentInfo.jtmc3}";
			var jzdh1 = "${studentInfo.jtdh1}";
			var jzdh2 = "${studentInfo.jtdh2}";
			var jzdh3 = "${studentInfo.jtdh3}";
			var jzgx1 = "${studentInfo.jtgx1}";
			var jzgx2 = "${studentInfo.jtgx2}";
			var jzgx3 = "${studentInfo.jtgx3}";
			var xssg1 = "${studentInfo.xssg}";
			var xstz1 = "${studentInfo.xstz}";
			var fzcc1 = "${studentInfo.fzcc}";
			var xzcc1 = "${studentInfo.xzcc}";

			$(document).ready(function() {

				if(jzxm1 == null || jzxm1 == "null" || jzxm1 == "") {
					$("#jzxm1").val("");
				}
				if(jzxm2 == null || jzxm2 == "null" || jzxm2 == "") {
					$("#jzxm2").val("");
				}
				if(jzxm3 == null || jzxm3 == "null" || jzxm3 == "") {
					$("#jzxm3").val("");
				}
				if(jzdh1 == null || jzdh1 == "null" || jzdh1 == "") {
					$("#jzdh1").val("");
				}
				if(jzdh2 == null || jzdh2 == "null" || jzdh2 == "") {
					$("#jzdh2").val("");
				}
				if(jzdh3 == null || jzdh3 == "null" || jzdh3 == "") {
					$("#jzdh3").val("");
				}

				//家长身份证判断是否为空
				if(jzsfzh1 == null || jzsfzh1 == "null" || jzsfzh1 == "") {
					$("#jzsfzh1").val("");
				}
				if(jzsfzh2 == null || jzsfzh2 == "null" || jzsfzh2 == "") {
					$("#jzsfzh2").val("");
				}
				if(jzsfzh3 == null || jzsfzh3 == "null" || jzsfzh3 == "") {
					$("#jzsfzh3").val("");
				}

				if(jzgx1 == null || jzgx1 == "null" || jzgx1 == "") {
					$("#jzgx1").val("");
				}
				if(jzgx2 == null || jzgx2 == "null" || jzgx2 == "") {
					$("#jzgx2").val("");
				}
				if(jzgx3 == null || jzgx3 == "null" || jzgx3 == "") {
					$("#jzgx3").val("");
				}
				if(xssg1 == null || xssg1 == "null" || xssg1 == "") {
					$("#stshengao").val("");
				}
				if(xstz1 == null || xstz1 == "null" || xstz1 == "") {
					$("#sttizhong").val("");
				}

				if(fzcc1 == null || fzcc1 == "null" || fzcc1 == "") {
					$("#fzmoren").val("none");
					$("#fzmoren").text("请选择");

				} else {
					$("#fzmoren").val(fzcc1);
					$("#fzmoren").text(fzcc1);
				}

				if(xzcc1 == null || xzcc1 == "null" || xzcc1 == "") {
					$("#xzmoren").val("none");
					$("#xzmoren").text("请选择");

				} else {
					$("#xzmoren").val(xzcc1);
					$("#xzmoren").text(xzcc1);
				}

			});
		</script>

		<style>
			/*加载 开始*/
			
			.jiazai {
				width: 100%;
				height: 100%;
				position: fixed;
				top: 0px;
				left: 0px;
				z-index: 999;
			}
			
			#spinner {
				position: fixed;
				left: 0;
				right: 0;
				top: 0;
				bottom: 0;
				margin: auto;
			}
			
			.tip {
				height: 20px;
				line-height: 20px;
				width: 100%;
				position: fixed;
				left: 0;
				right: 0;
				top: 0;
				bottom: 0;
				margin: auto;
				text-align: center;
			}
			
			<%--加载结束--%>
		</style>
	</head>

	<body>

		<div class="tip" style="display:none"></div>
		<div class="jiazai" style="display:none;">
			<div id="spinner"></div>
		</div>

		<div class="wrap">
			<!--
       	作者：1014504021@qq.com
       	时间：2017-03-23
       	描述：顶部横向滚动 流程导航开始
       -->
			<div class="toubu">
				<div class="liucheng-biaoti">
					<div class="liucheng-tubiao"></div>
					<div class="liucheng-wenzi">自助报到流程</div>

					<div class="shuaxin">
						<div class="shuaxin-tubiao"></div>
						<div class="shuaxin-z">刷新</div>
					</div>

				</div>
				<div class="hengxiang">
					<div class="con">

						<div class="main">
							<div class="process">
								<ul class="wizard-steps">

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--
       	作者：1014504021@qq.com
       	时间：2017-03-23
       	描述：顶部横向导航结束
       -->
			<div class="dibu">

				<div class="spage" id="page1">

					<div class="biao-xinxi">
						<div class="grxx">

							<div class="xinxibiaoti" id="grxx" style="border-bottom: 1px solid #eee;">
								<div class="xinxi-tubiao"></div>
								<div class="xinxi-wenzi">完善个人信息</div>
							</div>
							<div class="biao-con">
								<ul>
									<li class="xinxi-list"><span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">性别</span><span class="xinxi-con" id="xb">${studentInfo.xb}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">民族</span><span class="xinxi-con">${studentInfo.mzmc }</span></li>
									<li class="xinxi-list"><span class="xinxi-title">录取院系</span><span class="xinxi-con">${studentInfo.xymc }</span></li>
									<li class="xinxi-list"><span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc }</span></li>
									<li class="xinxi-list"><span class="xinxi-title">身份证号</span><span class="xinxi-con">${studentInfo.sfzh}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">出生日期</span><span class="xinxi-con" id="csrq">${studentInfo.csrq}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">政治面貌</span><span class="xinxi-con">${studentInfo.zzmm}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">手机号码<span style="color:red">*</span></span><span class="xinxi-con" id="inputout"><p style="margin-bottom:0;color:#555"></p><input type="text" class="shoujihao" style="margin-bottom: 0px" autofocus="autofocus" id="stMobile"/></span></li>
									<li class="xinxi-list"><span class="xinxi-title">QQ邮箱<span style="color:red">*</span></span><span class="xinxi-con" id="inputout2"><p style="margin-bottom:0;color:#555">请输入邮箱</p><input type="text" class="youxiang" style="margin-bottom: 0px;" autofocus="autofocus"  id="stMail"/></span></li>
									<li class="xinxi-list"><span class="xinxi-title">生源类别</span><span class="xinxi-con">${studentInfo.klmc}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">籍贯</span><span class="xinxi-con">${studentInfo.sfmc}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">高考分数</span><span class="xinxi-con">${studentInfo.cj}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">生源所在地</span><span class="xinxi-con">${studentInfo.syd}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">毕业学校</span><span class="xinxi-con">${studentInfo.byxx}</span></li>

									<!-- 新增内容2017-06-21  start -->

									<!--
						<li class="xinxi-list"><span class="xinxi-title">家庭人口数<span style="color:red">*</span></span><span class="xinxi-con"><p style="margin-bottom:0;color:#555" class="inputprks">请输入家庭人口数</p><input type="text" maxlength="2" class="inputtext jtrks" style="margin-bottom: 0px" autofocus="autofocus" id="stMobile"/></span></li>
		                  <li class="xinxi-list"><span class="xinxi-title">人均年收入<span style="color:red">*</span></span><span class="xinxi-con" ><p style="margin-bottom:0;color:#555" class="inputpnsr">请输入人均年收入</p><input type="text" maxlength="10" class="rjnsr inputtext" style="margin-bottom: 0px" autofocus="autofocus" id="stMobile"/></span></li>
		                  <li class="xinxi-list"><span class="xinxi-title">过往病史</span><span class="xinxi-con" ><p style="margin-bottom:0;color:#555" class="inputpbs">请输入过往病史</p><input type="text" class="gwbs inputtext" style="margin-bottom: 0px" autofocus="autofocus" id="stMobile"/></span></li>


				                  <div class="radio-line" style="height:45px;">

				                    <div id="jtlxz" class="xuan-sushe">
				                      <div class="sushe-title" id="jtlxsel" style="left:10px;">家庭类型<span style="color:red">*</span></div>
				                      <div class="select-sushe" id="select-chezhan" style="width:70%">
				                        <select name="chezhan" class="select-sushe-class" id="jtlxselect">
				                          <option value="其他">其他</option>
				                          <option value="建档立卡贫困户">建档立卡贫困户</option>
				                          <option value="农村低保家庭学生">农村低保家庭学生</option>
				                          <option value="农村特困救助供养学生">农村特困救助供养学生</option>
				                          <option value="孤儿">孤儿</option>
				                          <option value="残疾">残疾</option>
				                          <option value="单亲">单亲</option>
				                          <option value="烈士子女或优抚对象子女">烈士子女或优抚对象子女</option>
				                          <option value="家庭遭受自然灾害或突发事件学生">家庭遭受自然灾害或突发事件学生</option>

				                        </select>
				                      </div>

				                      <div class="youjiantou"></div>
				                    </div>

				                  </div>
	-->
									<!-- end -->

									<li class="xinxi-list"><span class="xinxi-title">家庭住址<span style="color:red">*</span></span>
									</li>

									<form style="height:100px;">

										<textarea type="textarea" id="jiatingzhuzhi" placeholder="请填写家庭住址（快递可达详细地址）！（限50字）">${studentInfo.jtdz}</textarea>
									</form>
									<li class="xinxi-list"><span class="xinxi-title">邮政编码</span><span class="xinxi-con">${studentInfo.yzbm}</span></li>
								</ul>
							</div>

						</div>

						<div class="jtxx">

							<div class="xinxibiaoti" id="jtxx" style="border-bottom: 1px solid #eee;">
								<div class="xinxi-tubiao" style="background-image:url(plug-in/weixin/yx/images/jiazhang.png);"></div>
								<div class="xinxi-wenzi">完善家长信息<span>(至少填写一组)</span><span style="color:red">*</span></div>
							</div>
							<div class="biao-con">
								<div class="jiatingxx">
									<ul>

										<li clsss="jiating-list">
											<div class="jiating-list-wrap">
												<span class="jiating-title">家长1信息</span>
												<span class="jiating-con"><div class="xiala"></div></span>
											</div>

											<div class="jiatingxiangqing">
												<ul>
													<form class="mui-input-group" id="jiazhang1">
														<div class="mui-input-row">
															<label>家长姓名</label>
															<input type="text" placeholder="请输入姓名" id="jzxm1" class="inputjzxm" maxlength="20" value="${studentInfo.jtmc1}">
														</div>
														<div class="mui-input-row">
															<label>家长电话</label>
															<input type="text" placeholder="请输入手机号码" id="jzdh1" class="inputjzdh" maxlength="11" value="${studentInfo.jtdh1}">
														</div>

														<%--<div class="mui-input-row">--%>
														<%--<label>家长身份证号</label>--%>
														<%--<input type="text" placeholder="请输入身份证号" id="jzsfzh1" class="inputjzsfzh" maxlength="18" value="${studentInfo.sfzh1}">--%>
														<%--</div>--%>

														<%--<div class="mui-input-row">--%>
														<%--<label>亲属关系</label>--%>
														<%--<input type="text" placeholder="请输入与学生亲属关系" id="jzgx1" class="inputjzgx" maxlength="5" value="${studentInfo.jtgx1}">--%>
														<%--</div>--%>

														<div class="mui-input-row">
															<label>亲属关系</label>
															<input type="text" placeholder="请选择与学生亲属关系" id="jzgx1" class="inputjzgx" maxlength="5" value="${studentInfo.jtgx1}" style="text-align: right;height:40px;font-size:10pt" readonly="readonly">
														</div>
													</form>
												</ul>
											</div>
										</li>

										<li clsss="jiating-list">
											<div class="jiating-list-wrap">
												<span class="jiating-title">家长2信息</span>
												<span class="jiating-con"><div class="xiala"></div></span>
											</div>

											<div class="jiatingxiangqing">
												<ul>
													<form class="mui-input-group" id="jiazhang2">
														<div class="mui-input-row">
															<label>家长姓名</label>
															<input type="text" placeholder="请输入姓名" id="jzxm2" class="inputjzxm" maxlength="20" value="${studentInfo.jtmc2}">
														</div>
														<div class="mui-input-row">
															<label>家长电话</label>
															<input type="text" placeholder="请输入手机号码" id="jzdh2" class="inputjzdh" maxlength="11" value="${studentInfo.jtdh2}">
														</div>
														<%--<div class="mui-input-row">--%>
														<%--<label>家长身份证号</label>--%>
														<%--<input type="text" placeholder="请输入身份证号" id="jzsfzh2" class="inputjzsfzh" maxlength="18" value="${studentInfo.sfzh2}">--%>
														<%--</div>--%>

														<div class="mui-input-row ">
															<label>亲属关系</label>
															<input type="text" placeholder="请选择与学生亲属关系" id="jzgx2" class="inputjzgx" maxlength="5" value="${studentInfo.jtgx2}" readonly="readonly">
														</div>
													</form>
												</ul>
											</div>
										</li>

										<li clsss="jiating-list">
											<div class="jiating-list-wrap">
												<span class="jiating-title">其他监护人信息</span>
												<span class="jiating-con"><div class="xiala"></div></span>
											</div>

											<div class="jiatingxiangqing">
												<ul>
													<form class="mui-input-group" id="jiazhang3">
														<div class="mui-input-row">
															<label>监护人姓名</label>
															<input type="text" placeholder="请输入姓名" id="jzxm3" class="inputjzxm" maxlength="20" value="${studentInfo.jtmc3}">
														</div>
														<div class="mui-input-row">
															<label>监护人电话</label>
															<input type="text" placeholder="请输入手机号码" id="jzdh3" class="inputjzdh" maxlength="11" value="${studentInfo.jtdh3}">
														</div>

														<%--<div class="mui-input-row">--%>
														<%--<label>监护人身份证号</label>--%>
														<%--<input type="text" placeholder="请输入身份证号" id="jzsfzh3" class="inputjzsfzh" maxlength="18" value="${studentInfo.sfzh3}">--%>
														<%--</div>--%>
														<%----%>

														<div class="mui-input-row">
															<label>亲属关系</label>
															<input type="text" placeholder="请选择与学生亲属关系" id="jzgx3" class="inputjzgx" maxlength="5" value="${studentInfo.jtgx3}" readonly="readonly">
														</div>
													</form>
												</ul>
											</div>
										</li>

									</ul>
								</div>

							</div>

						</div>

						<div class="fzxx">
							<div class="xinxibiaoti" id="grxx" style="border-bottom: 1px solid #eee;">
								<div class="xinxi-tubiao" style="background-image:url(plug-in/weixin/yx/images/fuzhuang.png);"></div>
								<div class="xinxi-wenzi">完善服装信息</div>
							</div>
							<div class="biao-con">
								<div class="sgtz">
									<form class="mui-input-group" style="border:0px; position: static;">
										<div class="mui-input-row" style="border-bottom:1px solid #eee;height:45px; position: static;">
											<label>身高(cm)<span style="color:red">*</span></label>
											<input type="text" placeholder="请输入身高(cm)" style="border:0px" id="stshengao" class="sgtz" maxlength="3" value="${studentInfo.xssg}">
										</div>
										<div class="mui-input-row" style="border-bottom:1px solid #eee;height:45px; position: static;">
											<label>体重(kg)<span style="color:red">*</span></label>
											<input type="text" placeholder="请输入体重(kg)" id="sttizhong" class="sgtz" maxlength="3" value="${studentInfo.xstz}">
										</div>
									</form>
								</div>
								<div class="fuzhuangsel">
									<div class="xuan-fuzhuang">
										<div class="fuhzuang-title">服装尺码<span style="color:red">*</span></div>
										<div class="select-fuzhuang">
											<select name="fzcm" class="select-fz-class" id="fuzhuangchima">
												<option value="none" id="fzmoren">请选择</option>
											</select>
										</div>
										<div class="youjiantou"></div>
									</div>
								</div>
								<div class="fuzhuangsel">
									<div class="xuan-fuzhuang">
										<div class="fuhzuang-title">鞋子尺码<span style="color:red">*</span></div>
										<div class="select-fuzhuang">
											<select name="fzcm" class="select-fz-class" id="xiezichima">
												<option value="none" id="xzmoren">请选择</option>
											</select>
										</div>
										<div class="youjiantou"></div>
									</div>
								</div>

							</div>

						</div>

					</div>

					<div class="zhezhao-queren" id="fbbm-queren">
						<div class="querenkuang">
							<div class="queren-wenzi" id="wenzi-con">
								<p style="display: block;margin-left: 0;width:100%;text-align: center;margin-top:20px;"></p>
							</div>
							<!--提示分班不成功，请联系xxx...只有一个确认按钮，点击确认可以关闭遮罩层-->
							<div class="conbut" id="baoming-fbbut" style="display: none;width:100%">确定</div>

						</div>
					</div>

					<div class="subbut" id="gerenxinxibut">下一步</div>
					<!--<div class="sub-non subbut-visited">已提交</div>-->

				</div>

				<div class="spage" id="page2">

					<div class="gerenxinxi">
						<div class="gerenxinxi-biaoti">
							<div class="gerenbiaoti-tubiao"></div>
							<div class="gerenbiaoti-wenzi">个人信息</div>
						</div>

						<div class="gerenxinxi-con">

							<div class="bigTouxiang">
								<div class="upicon"></div>
								<div class="yicun"> </div>
								<div class="upyicun"></div>
							</div>
							<ul>
								<li class="xinxi-list tobig">
									<span class="xinxi-title">头像</span><span class="xinxi-con1"><div class="geren-touxiang"><img src="plug-in/weixin/yx/images/head.png"/></div></span>
									<div class="xiajiantou1"></div>
								</li>
								<li class="xinxi-list">
									<span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
								<li class="xinxi-list">
									<span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
								<div class="zhedie">
									<li class="xinxi-list">
										<span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">班级名称</span><span class="xinxi-con">${studentInfo.bjmc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">手机号码</span><span class="xinxi-con">${studentInfo.mobile}</span></li>
								</div>
								<div class="zhankai">
									<div class="jiantou-geren"></div>
								</div>
							</ul>
						</div>
					</div>

					<div class="zaixianjiaofei">
						<div class="jiaofei-biaoti">
							<div class="jiaofei-tubiao"></div>
							<div class="jiaofei-wenzi">在线缴费</div>
						</div>
						<div class="feiyongxinxi">
							<ul>
								<li clsss="feiyong-list">
									<div class="feiyong-list-wrap">
										<span class="feiyong-title">学费</span>
										<span class="feiyong-con"><div id="feiyongshuju">3600.00</div> <div class="xiala"></div></span>
									</div>

									<div class="feiyongxiangqing">
										<ul>
											<li class="feiyong-xq">
												<span class="xq-title">应交金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">已交金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">欠费金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">缓交金额</span>
												<span class="xq-con">0</span>
											</li>

										</ul>
									</div>
								</li>

								<li clsss="feiyong-list">
									<div class="feiyong-list-wrap">
										<span class="feiyong-title">学杂费</span>
										<span class="feiyong-con"><div id="feiyongshuju">3600.00</div> <div class="xiala"></div></span>
									</div>

									<div class="feiyongxiangqing">
										<ul>
											<li class="feiyong-xq">
												<span class="xq-title">应交金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">已交金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">欠费金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">缓交金额</span>
												<span class="xq-con">0</span>
											</li>
										</ul>
									</div>
								</li>

								<li clsss="feiyong-list">
									<div class="feiyong-list-wrap">
										<span class="feiyong-title">合计</span>
										<span class="feiyong-con">
											<div id="feiyongshuju">3600.00</div>
											<div class="xiala"></div>
										</span>
									</div>

									<div class="feiyongxiangqing">
										<ul>
											<li class="feiyong-xq">
												<span class="xq-title">应交金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">已交金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">欠费金额</span>
												<span class="xq-con">0</span>
											</li>
											<li class="feiyong-xq">
												<span class="xq-title">缓交金额</span>
												<span class="xq-con">0</span>
											</li>
										</ul>
									</div>
								</li>

							</ul>
						</div>
					</div>
					<div class="querenxinxi">认真核对个人信息，确保无误后点击在线支付</div>
					<div class="subbut" id="xuefeizhifubut">确认支付</div>
					<div class="sub-non subbut-visited">已支付</div>
				</div>

				<div class="spage" id="page3">

					<div class="gerenxinxi">
						<div class="gerenxinxi-biaoti">
							<div class="gerenbiaoti-tubiao"></div>
							<div class="gerenbiaoti-wenzi">个人信息</div>
						</div>

						<div class="gerenxinxi-con">

							<div class="bigTouxiang">
								<div class="upicon"></div>
								<div class="yicun"> </div>
								<div class="upyicun"></div>
							</div>
							<ul>
								<li class="xinxi-list tobig">
									<span class="xinxi-title">头像</span><span class="xinxi-con1"><div class="geren-touxiang"><img src="plug-in/weixin/yx/images/head.png"/></div></span>
									<div class="xiajiantou1"></div>
								</li>
								<li class="xinxi-list">
									<span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
								<li class="xinxi-list">
									<span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
								<div class="zhedie">
									<li class="xinxi-list">
										<span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">班级名称</span><span class="xinxi-con">${studentInfo.bjmc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">手机号码</span><span class="xinxi-con">${studentInfo.mobile}</span></li>
								</div>
								<div class="zhankai">
									<div class="jiantou-geren"></div>
								</div>
							</ul>
						</div>
					</div>

					<div class="sushefenpei">
						<div class="sushe-biaoti">
							<div class="sushe-tubiao"></div>
							<div class="sushe-wenzi">宿舍分配</div>
						</div>
					</div>
					<div class="sushe-fenpei">
						<div id="sushe-qinshi" class="xuan-sushe">
							<div class="sushe-title">寝室号</div>
							<div class="select-sushe" id="select-qinshi">
								<select name="qinshihao" class="select-sushe-class" id="qinshi00">
									<option value="none">请选择</option>
								</select>
							</div>
							<div class="jiazaitubiao" style="display: none;" id="qinshijiazai"></div>
							<div class="youjiantou"></div>
						</div>
						<div id="chuangwei" class="xuan-sushe">
							<div class="sushe-title">床位号</div>
							<div class="select-sushe" id="select-chuangwei">
								<select name="chuangweihao" class="select-sushe-class" id="chuangwei00">
									<option value="none">请选择</option>
								</select>
							</div>
							<div class="jiazaitubiao" style="display: none;" id="chuangweijiazai"></div>
							<div class="youjiantou"></div>
						</div>
					</div>

					<div class="zhezhao-queren" id="sushe-querenzz">
						<div class="querenkuang">
							<div class="queren-wenzi" id="sushe-queren-z">
								<p></p>
							</div>
							<div class="conbut" id="sushe-quxiao">取消</div>
							<div class="conbut" id="sushe-querenbut">确定分配</div>
							<div class="conbut" id="querenbut-sushe1" style="width:100%;text-align: center;line-height:47px;display:none">确定</div>
						</div>
					</div>

					<div class="subbut" id="xuansushe">确认分配</div>
					<!--<div class="sub-non subbut-visited">已提交</div>-->

				</div>

				<div class="spage" id="page4">

					<div class="gerenxinxi">
						<div class="gerenxinxi-biaoti">
							<div class="gerenbiaoti-tubiao"></div>
							<div class="gerenbiaoti-wenzi">个人信息</div>
						</div>

						<div class="gerenxinxi-con">

							<div class="bigTouxiang">
								<div class="upicon"></div>
								<div class="yicun"> </div>
								<div class="upyicun"></div>
							</div>
							<ul>
								<li class="xinxi-list tobig">
									<span class="xinxi-title">头像</span><span class="xinxi-con1"><div class="geren-touxiang"><img src="plug-in/weixin/yx/images/head.png"/></div></span>
									<div class="xiajiantou1"></div>
								</li>
								<li class="xinxi-list">
									<span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
								<li class="xinxi-list">
									<span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
								<div class="zhedie">
									<li class="xinxi-list">
										<span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">班级名称</span><span class="xinxi-con">${studentInfo.bjmc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">手机号码</span><span class="xinxi-con">${studentInfo.mobile}</span></li>
								</div>
								<div class="zhankai">
									<div class="jiantou-geren"></div>
								</div>
							</ul>
						</div>
					</div>
					<!--支付其他费用 begin-->
					<div class="zhusufei">
						<div class="zhusufei-biaoti">
							<div class="zhusufei-tubiao"></div>
							<div class="zhusufei-wenzi">住宿费</div>
						</div>
						<li class="xinxi-list">
							<span class="xinxi-title">住宿费</span><span class="xinxi-con">1000元</span></li>
					</div>
					<div class="xuangouyp">
						
						<div class="xuangouyp-biaoti">
							<div class="xuangouyp-tubiao"></div>
							<div class="xuangouyp-wenzi">选购床上用品</div>
						</div>
						
						
						<div class="sfxz">
							<div class="sfxuangouyp">
								<p>不选购床上用品</p>
								<div class="csypjg" style="display:  block;">￥0元</div>
								<div class="duigou"></div>
								<input type="radio" name="xgcsyp" id="xgcsyp" value="N" style="display: none;"/>
							</div>
							
							<div class="sfxuangouyp" >
								<p>选购床上用品</p>
								<div class="csypjg" style="display: none;">￥200元</div>
								<div class="duigou" style="display:none"></div>
								<input type="radio" name="xgcsyp" id="xgcsyp" value="Y" style="display: none;"/>
							</div>
							
						</div>

					</div>

					<div class="xuangoubx">
						<div class="xuangoubx-biaoti">
							<div class="xuangoubx-tubiao"></div>
							<div class="xuangoubx-wenzi">选购保险</div>
						</div>
						
						<div class="sfxz">
							<div class="sfxuangouyp">
								<p>不选购保险</p>
								<div class="csypjg" style="display:  block;">￥0元</div>
								<div class="duigou"></div>
								<input type="radio" name="xgbx" id="xgbx" value="N" style="display: none;"/>
							</div>
							
							<div class="sfxuangouyp" >
								<p>选购保险</p>
								<div class="csypjg" style="display: none;">￥500元</div>
								<div class="duigou" style="display:none"></div>
								<input type="radio" name="xgbx" id="bxgbx" value="Y" style="display: none;"/>
							</div>
							
						</div>
					</div>
					<div class="querenxinxi" style="text-align: right;padding-right:15px;font-size:14px;color:red;margin-top:5px;">总计<span>0</span>元</div>
					<div class="querenxinxi">请认真核对个人信息，确保无误后点击提交支付</div>
					<!--支付其他费用 end-->
					<div class="subbut" id="tjxg" style="margin-top:5px;">提交支付</div>
					

				</div>

				<div class="spage" id="page5">

					<div class="gerenxinxi">
						<div class="gerenxinxi-biaoti">
							<div class="gerenbiaoti-tubiao"></div>
							<div class="gerenbiaoti-wenzi">个人信息</div>
						</div>

						<div class="gerenxinxi-con">

							<div class="bigTouxiang">
								<div class="upicon"></div>
								<div class="yicun"> </div>
								<div class="upyicun"></div>
							</div>
							<ul>
								<li class="xinxi-list tobig">
									<span class="xinxi-title">头像</span><span class="xinxi-con1"><div class="geren-touxiang"><img src="plug-in/weixin/yx/images/head.png"/></div></span>
									<div class="xiajiantou1"></div>
								</li>
								<li class="xinxi-list">
									<span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
								<li class="xinxi-list">
									<span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
								<div class="zhedie">
									<li class="xinxi-list">
										<span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">班级名称</span><span class="xinxi-con">${studentInfo.bjmc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">手机号码</span><span class="xinxi-con">${studentInfo.mobile}</span></li>
								</div>
								<div class="zhankai">
									<div class="jiantou-geren"></div>
								</div>
							</ul>
						</div>
					</div>

					<div class="dixiaoxinxi">
						<div class="dixiao-biaoti">
							<div class="dixiao-tubiao"></div>
							<div class="dixiao-wenzi">到校情况</div>
						</div>
						<div class="dixiao-radio">
							<div class="radio-line">
								<div class="dixiao-wenti">
									<p id="wenti1">1、您会按时报到吗？<span style="color:red">*</span></p>
								</div>
								<div class="dixiao-daan">
									<div class="radio-wrap" id="baodao1">
										<div class="radio-button">
											<input type="radio" name="baodao" id="baodao01" />
										</div>
										<div class="radio-z">准时报到</div>
									</div>
									<div class="radio-wrap" id="baodao2">
										<div class="radio-button">
											<input type="radio" name="baodao" id="baodao02" />
										</div>
										<div class="radio-z">延迟报到</div>
									</div>
								</div>
							</div>
							<!--<div class="radio-line">
	<div class="dixiao-wenti">
	<p id="wenti2">2、您需要接站吗？</p>
	</div>
	<div class="dixiao-daan">
	<div class="radio-wrap" id="jiezhan1">
	<div class="radio-button">
	<input type="radio" name="jiezhan" />
	</div>
	<div class="radio-z">需要</div>
	</div>
	<div class="radio-wrap" id="jiezhan2">
	<div class="radio-button">
	<input type="radio" name="jiezhan" />
	</div>
	<div class="radio-z">不需要</div>
	</div>
	</div>
	</div>-->
							<div class="radio-line">
								<div class="dixiao-wenti">
									<p id="wenti2">2、您乘坐什么交通工具？<span style="color:red">*</span></p>
								</div>
								<div class="dixiao-daan">
									<div class="radio-wrap" id="jiaotong1">
										<div class="radio-button">
											<input type="radio" name="jiaotong" />
										</div>
										<div class="radio-z">火车</div>
									</div>
									<div class="radio-wrap" id="jiaotong2">
										<div class="radio-button">
											<input type="radio" name="jiaotong" />
										</div>
										<div class="radio-z">汽车</div>
									</div>
									<div class="radio-wrap" id="jiaotong3">
										<div class="radio-button">
											<input type="radio" name="jiaotong" />
										</div>
										<div class="radio-z">校车</div>
									</div>
								</div>
							</div>
							<div class="radio-line">
								<div class="dixiao-wenti">
									<p id="wenti3">3、您的陪同人数？<span style="color:red">*</span></p>
								</div>
								<div class="dixiao-daan">
									<div class="radio-wrap" id="peitong1">
										<div class="radio-button">
											<input type="radio" name="peitong" />
										</div>
										<div class="radio-z">无</div>
									</div>
									<div class="radio-wrap" id="peitong2">
										<div class="radio-button">
											<input type="radio" name="peitong" />
										</div>
										<div class="radio-z">1</div>
									</div>
									<div class="radio-wrap" id="peitong3">
										<div class="radio-button">
											<input type="radio" name="peitong" />
										</div>
										<div class="radio-z">2</div>
									</div>
									<div class="radio-wrap" id="peitong4">
										<div class="radio-button">
											<input type="radio" name="peitong" />
										</div>
										<div class="radio-z">3</div>
									</div>
									<div class="radio-wrap" id="peitong5">
										<div class="radio-button">
											<input type="radio" name="peitong" />
										</div>
										<div class="radio-z">4</div>
									</div>
									<div class="radio-wrap" id="peitong6">
										<div class="radio-button">
											<input type="radio" name="peitong" />
										</div>
										<div class="radio-z">5个以上</div>
									</div>
								</div>
							</div>

							<div class="radio-line" style="height:45px;">
								<div class="dixiao-wenti">
									<p id="wenti4">4、您的到校时间？<span style="color:red">*</span></p>
									<button id='SelDate' data-options='{"type":"date"}' class="btn mui-btn mui-btn-block" style="position:absolute;right:30px;height:43px;line-height:43px;border:0px;font-size:14px;padding:0;width:auto;color:#555;">选择日期 </button>
									<div class="youjiantou"></div>
								</div>

								<div id='result' class="ui-alert"></div>

							</div>

							<div class="radio-line" style="height:45px;">
								<!--<div class="dixiao-wenti">
	<p id="wenti4">5、您下车车站？</p>

	</div>-->

								<div id="chezhan" class="xuan-sushe">
									<div class="sushe-title" id="wenti5">5、您下车车站？<span style="color:red">*</span></div>
									<div class="select-sushe" id="select-chezhan">
										<select name="chezhan" class="select-sushe-class" id="chezhan">
											<option value="none">请选择</option>
											<option value="南昌长途汽车站">南昌长途汽车站</option>
											<option value="南昌昌南客运站">南昌昌南客运站</option>
											<option value="南昌洪城汽车站">南昌洪城汽车站</option>
											<option value="南昌青山客运站">南昌青山客运站</option>
											<option value="南昌徐坊客运站">南昌徐坊客运站</option>
											<option value="南昌站">南昌站</option>
											<option value="南昌西站">南昌西站</option>
										</select>
									</div>

									<div class="youjiantou"></div>
								</div>

							</div>

						</div>
					</div>

					<div class="subbut" id="dixiaobut">确定</div>
					<div class="zhezhao-queren" id="Xqueren">
						<div class="querenkuang">
							<div class="queren-wenzi" id="wenzi-con">
								<p style="display: block;margin-left: 0;width:100%;text-align: center;margin-top:20px;"></p>
							</div>
							<!--提示分班不成功，请联系xxx...只有一个确认按钮，点击确认可以关闭遮罩层-->
							<div class="conbut" id="Xbbut" style="display: none;width:100%">确定</div>

						</div>
					</div>

				</div>

				<div class="spage" id="page6" style="position:relative">

					<div class="gerenxinxi">
						<div class="gerenxinxi-biaoti">
							<div class="gerenbiaoti-tubiao"></div>
							<div class="gerenbiaoti-wenzi">个人信息</div>
						</div>

						<div class="gerenxinxi-con">

							<div class="bigTouxiang">
								<div class="upicon"></div>
								<div class="yicun"> </div>
								<div class="upyicun"></div>
							</div>
							<ul>
								<li class="xinxi-list tobig">
									<span class="xinxi-title">头像</span><span class="xinxi-con1"><div class="geren-touxiang"><img src="plug-in/weixin/yx/images/head.png"/></div></span>
									<div class="xiajiantou1"></div>
								</li>
								<li class="xinxi-list">
									<span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
								<li class="xinxi-list">
									<span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
								<div class="zhedie">
									<li class="xinxi-list">
										<span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">班级名称</span><span class="xinxi-con">${studentInfo.bjmc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">手机号码</span><span class="xinxi-con">${studentInfo.mobile}</span></li>
								</div>
								<div class="zhankai">
									<div class="jiantou-geren"></div>
								</div>
							</ul>
						</div>
					</div>

					<div class="banzhuren">
						<div class="banzhuren-biaoti">
							<div class="banzhuren-tubiao"></div>
							<div class="banzhuren-wenzi">更多信息</div>
						</div>
						<div class="banji-info">
							<ul>
								<li class="list-info">
									<span class="info-title">班级名称</span>
									<span class="info-con" id="bjmc"></span>
								</li>
								<li class="list-info">
									<span class="info-title">班主任姓名</span>
									<span class="info-con" id="bzr"></span>
								</li>
								<li class="list-info">
									<span class="info-title">班主任手机号</span>
									<span class="info-con" id="bzrdh"></span>
								</li>
								<li class="list-info">
									<span class="info-title">宿舍名称</span>
									<span class="info-con" id="ssmc"></span>
								</li>
								<li class="list-info">
									<span class="info-title">是否领取钥匙</span>
									<span class="info-con" id="yaoshi"></span>
								</li>
							</ul>
						</div>

					</div>

					<div class="subbut" id="goMain">返回主页</div>

				</div>
				<!--
				
			<div>
				<div id="pagepcState" style="width:100%;height:100%;position:fixed;top:0px;left:0px;background-color:rgba(0,0,0,0.5);z-index:1000">	 
					
					<div class="gerenxinxi" >
						<div class="gerenxinxi-biaoti" style="margin-top:0px;">
							<div class="gerenbiaoti-tubiao"></div>
							<div class="gerenbiaoti-wenzi">个人信息</div>
						</div>
						<div class="gerenxinxi-con">
							<ul>
								<li class="xinxi-list">
									<span class="xinxi-title">头像</span><span class="xinxi-con"><div class="geren-touxiang"><img src="plug-in/weixin/yx/images/head.png"/></div></span></li>
								<li class="xinxi-list">
									<span class="xinxi-title">考生号</span><span class="xinxi-con">${studentInfo.ksh}</span></li>
								<li class="xinxi-list">
									<span class="xinxi-title">姓名</span><span class="xinxi-con">${studentInfo.xm}</span></li>
								
									<li class="xinxi-list">
										<span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">手机号码</span><span class="xinxi-con">${studentInfo.mobile}</span></li>
								
							</ul>
						</div>
					</div>
					
					<div class="daoxiangxq">
						<div class="daoxiaoxq-biaoti">
							<div class="daoxiaoxq-tubiao"></div>
							<div class="daoxiaoxq-wenzi">报道详情</div>
						</div>
					</div>
				</div>
			</div>
	
		-->
			</div>

	</body>
	<script src="plug-in/weixin/yx/js/mui.js" type="text/javascript" charset="utf-8"></script>
	<script src="plug-in/weixin/yx/js/mui.picker.min.js"></script>
	<script type="text/javascript" src="plug-in/weixin/yx/js/jquery.qrcode.js"></script>
	<script src="plug-in/weixin/yx/js/JsBarcode.all.min.js" type="text/javascript" charset="utf-8"></script>
	<script>
		
		
		
		(function($, doc) {
			$.init();
			$.ready(function() {
				//普通示例
				var userPicker = new $.PopPicker();
				userPicker.setData([

					{
						value: '母子',
						text: '母子'
					},
					{
						value: '母女',
						text: '母女'
					},
					{
						value: '父子',
						text: '父子'
					},
					{
						value: '父女',
						text: '父女'
					},
					{
						value: '其他',
						text: '其他'
					}

				]);
				var showUserPickerButton = doc.getElementById('jzgx1');

				showUserPickerButton.addEventListener('tap', function(event) {
					userPicker.show(function(items) {
						showUserPickerButton.value = items[0].text;
						//返回 false 可以阻止选择框的关闭
						//return false;
					});
				}, false);

			});
		})(mui, document);

		(function($, doc) {
			$.init();
			$.ready(function() {
				//普通示例
				var userPicker = new $.PopPicker();
				userPicker.setData([

					{
						value: '母子',
						text: '母子'
					},
					{
						value: '母女',
						text: '母女'
					},
					{
						value: '父子',
						text: '父子'
					},
					{
						value: '父女',
						text: '父女'
					},
					{
						value: '其他',
						text: '其他'
					}

				]);
				var showUserPickerButton = doc.getElementById('jzgx2');

				showUserPickerButton.addEventListener('tap', function(event) {
					userPicker.show(function(items) {
						showUserPickerButton.value = items[0].text;
						//返回 false 可以阻止选择框的关闭
						//return false;
					});
				}, false);

			});
		})(mui, document);

		(function($, doc) {
			$.init();
			$.ready(function() {
				//普通示例
				var userPicker = new $.PopPicker();
				userPicker.setData([

					{
						value: '母子',
						text: '母子'
					},
					{
						value: '母女',
						text: '母女'
					},
					{
						value: '父子',
						text: '父子'
					},
					{
						value: '父女',
						text: '父女'
					},
					{
						value: '其他',
						text: '其他'
					}

				]);
				var showUserPickerButton = doc.getElementById('jzgx3');

				showUserPickerButton.addEventListener('tap', function(event) {
					userPicker.show(function(items) {
						showUserPickerButton.value = items[0].text;
						//返回 false 可以阻止选择框的关闭
						//return false;
					});
				}, false);

			});
		})(mui, document);

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
			//返回主页
			$("#goMain").click(function() {
				window.location.href = "mobileStudentController.do?goMain";
			});
			//判断字段为空显示-
			var xinxilen = $(".biao-con ul li").length;
			for(var i = 1; i <= xinxilen; i++) {
				var xinxicon = $(".xinxi-con").eq(i).text();
				if(xinxicon == "null" || xinxicon == "" || xinxicon == "undefind") {
					$(".xinxi-con").eq(i).text("-");

				}
				//console.log(xinxicon);
				//console.log(xinxilen);
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