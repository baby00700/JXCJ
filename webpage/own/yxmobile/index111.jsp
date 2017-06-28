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
						var xb = "${studentInfo.xb}";
						var grlc = "${studentInfo.mobileSetid}";
						var sjh = "${studentInfo.mobile}";
						var ksh = "${studentInfo.ksh}";
						var dz = "${studentInfo.sfdz}";
						var csrq = "${studentInfo.csrq}";
						var dixiaoTime;
						var sfjf = "${studentInfo.sfjf}";
						var sfcollar_key = "${studentInfo.sfcollar_key}";
						var stmobile="${studentInfo.mobile}";
						var bjmc = "${studentInfo.bjmc}";
						var fdyxm = "${studentInfo.fdyxm}";
						var yddh = "${studentInfo.yddh}";
					
					}

				});
			}
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
			var stmobile="${studentInfo.mobile}";
			var bjmc = "${studentInfo.bjmc}";
			var fdyxm = "${studentInfo.fdyxm}";
			var yddh = "${studentInfo.yddh}";
		</script>


		<style>

			/*加载 开始*/
			.jiazai{
			width:100%;
			height:100%;
			position:fixed;
			top:0px;
			left:0px;
			z-index:999;
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
									<li class="xinxi-list"><span class="xinxi-title">生源类别</span><span class="xinxi-con">${studentInfo.klmc}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">籍贯</span><span class="xinxi-con">${studentInfo.sfmc}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">高考分数</span><span class="xinxi-con">${studentInfo.cj}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">生源所在地</span><span class="xinxi-con">${studentInfo.syd}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">毕业学校</span><span class="xinxi-con">${studentInfo.byxx}</span></li>
									<li class="xinxi-list"><span class="xinxi-title">家庭住址<span style="color:red">*</span></span></li>
									
									<form style="height:100px;">
									
									<textarea type="textarea"  id="jiatingzhuzhi" placeholder="请填写家庭住址（快递可达详细地址）！（限50字）" >${studentInfo.jtdz}</textarea>
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

											<div class="jiatingxiangqing" >
												<ul>
													<form class="mui-input-group" id="jiazhang1">
														<div class="mui-input-row">
															<label>家长姓名</label>
															<input type="text" placeholder="请输入姓名" id="jzxm1" class="inputjzxm" maxlength="20" >
														</div>
														<div class="mui-input-row">
															<label>家长电话</label>
															<input type="text" placeholder="请输入手机号码" id="jzdh1" class="inputjzdh" maxlength="11">
														</div>
														<div class="mui-input-row">
															<label>亲属关系</label>
															<input type="text" placeholder="请输入与学生亲属关系" id="jzgx1" class="inputjzgx" maxlength="5">
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
															<input type="text" placeholder="请输入姓名" id="jzxm2" class="inputjzxm" maxlength="20">
														</div>
														<div class="mui-input-row">
															<label>家长电话</label>
															<input type="text" placeholder="请输入手机号码" id="jzdh2" class="inputjzdh" maxlength="11">
														</div>
														<div class="mui-input-row">
															<label>亲属关系</label>
															<input type="text" placeholder="请输入与学生亲属关系" id="jzgx2" class="inputjzgx" maxlength="5">
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
															<input type="text" placeholder="请输入姓名" id="jzxm3" class="inputjzxm" maxlength="20">
														</div>
														<div class="mui-input-row">
															<label>监护人电话</label>
															<input type="text" placeholder="请输入手机号码" id="jzdh3" class="inputjzdh" maxlength="11">
														</div>
														<div class="mui-input-row">
															<label>亲属关系</label>
															<input type="text" placeholder="请输入与学生亲属关系" id="jzgx3" class="inputjzgx" maxlength="5">
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
											<input type="text" placeholder="请输入身高(cm)" style="border:0px" id="stshengao" class="sgtz" maxlength="3">
										</div>
										<div class="mui-input-row" style="border-bottom:1px solid #eee;height:45px; position: static;">
											<label>体重(kg)<span style="color:red">*</span></label>
											<input type="text" placeholder="请输入体重(kg)" id="sttizhong" class="sgtz" maxlength="3">
										</div>
									</form>
								</div>
								<div class="fuzhuangsel">
									<div class="xuan-fuzhuang">
										<div class="fuhzuang-title">服装尺码<span style="color:red">*</span></div>
										<div class="select-fuzhuang" >
											<select name="fzcm" class="select-fz-class" id="fuzhuangchima">
												<option value="none">请选择</option>
											</select>
										</div>
										<div class="youjiantou"></div>
									</div>
								</div>
								<div class="fuzhuangsel">
									<div class="xuan-fuzhuang">
										<div class="fuhzuang-title">鞋子尺码<span style="color:red">*</span></div>
										<div class="select-fuzhuang" >
											<select name="fzcm" class="select-fz-class" id="xiezichima">
												<option value="none">请选择</option>
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

					<div class="subbut" id="gerenxinxibut">确定</div>
					<!--<div class="sub-non subbut-visited">已提交</div>-->

				</div>
				<div class="spage" id="page2">
					<div class="gerenxinxi">
						<div class="gerenxinxi-biaoti">
							<div class="gerenbiaoti-tubiao"></div>
							<div class="gerenbiaoti-wenzi">个人信息</div>
						</div>
						<div class="gerenxinxi-con">
							<ul>
								<li class="xinxi-list">
									<span class="xinxi-title">头像</span><span class="xinxi-con1"><div class="geren-touxiang"><img src="plug-in/weixin/yx/images/head.png"/></div></span></li>
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
						<!--<div id="sushe-xiaoqu" class="xuan-sushe">
							<div class="sushe-title">校区</div>
							<div class="select-sushe" id="select-xiaoqu">
								<select name="xiaoqu" class="select-sushe-class" id="xiaoqu00">
									<option value="none">请选择</option>

								</select>
							</div>
							<div class="jiazaitubiao" style="display: none;" id="xiaoqujiazai"></div>
							<div class="youjiantou"></div>
						</div>
						<div id="sushe-loudong" class="xuan-sushe">
							<div class="sushe-title">楼栋</div>
							<div class="select-sushe" id="select-loudong">
								<select name="loudong" class="select-sushe-class" id="loudong00">
									<option value="none">请选择</option>
								</select>
							</div>
							<div class="jiazaitubiao" style="display: none;" id="loudongjiazai"></div>
							<div class="youjiantou"></div>
						</div>

						<div id="sushe-louceng" class="xuan-sushe">
							<div class="sushe-title">楼层</div>
							<div class="select-sushe" id="select-louceng">
								<select name="louceng" class="select-sushe-class" id="louceng00">
									<option value="none">请选择</option>
								</select>
							</div>
							<div class="jiazaitubiao" style="display: none;" id="loucengjiazai"></div>
							<div class="youjiantou"></div>
						</div>-->

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
	<div class="conbut" id="querenbut-sushe1" style="width:100%;text-align: center;line-height:
	47px;display:none">确定</div>
						</div>
					</div>

					<div class="subbut" id="xuansushe">确认分配</div>
					<!--<div class="sub-non subbut-visited">已提交</div>-->

				</div>
				<div class="spage" id="page3">

					<div class="gerenxinxi">
						<div class="gerenxinxi-biaoti">
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
								<div class="zhedie">
									<li class="xinxi-list">
										<span class="xinxi-title">录取学院</span><span class="xinxi-con">${studentInfo.xymc}</span></li>
									<li class="xinxi-list">
										<span class="xinxi-title">录取专业</span><span class="xinxi-con">${studentInfo.zymc}</span></li>
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
				<div class="spage" id="page4" style="position:relative">
					<div class="wrap-tiaoma">
						<div class="tiaoma-biaoti">
							<div class="tiaoma-tubiao"></div>
							<div class="tiaoma-wenzi">条形码</div>
						</div>
						<div class="tiaoma-img" style="width:260px;margin:0 auto">
							<img id="barcode" width="260px" />
						</div>

						<!--<div id="2dcode" style="width:250px;margin:0 auto;position:relative;top:40px;"></div>-->
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
			$("#goMain").click(function(){
				window.location.href="mobileStudentController.do?goMain";
			});
			//判断字段为空显示-
			var xinxilen=$(".biao-con ul li").length;
			for(var i=1;i<=xinxilen;i++){
			var xinxicon=$(".xinxi-con").eq(i).text();
			if(xinxicon=="null"||xinxicon==""||xinxicon=="undefind"){
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