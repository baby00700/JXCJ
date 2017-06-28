//时间判断时间段内
var isTimeIn;

function isTime() {
	var beginDate = new Date(kssj);
	var endDate = new Date(jssj);
	var date = new Date();
	var nowStr = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
	var nowDate = new Date(nowStr);
	if(beginDate < nowDate && nowDate < endDate) {
		console.log("在范围内");
		isTimeIn = true;
	} else {
		console.log("不在范围内");
		isTimeIn = false;
	}

}

$(document).ready(function() {

	var xh; //流程序号
	var n; //当前点击流程
	var liucheng //后端获取01234567对应12345678获取流程
	var benciliucheng; //本次流程
	benciliucheng = liucheng;
	var buttn = benciliucheng - 1;
	var isn1;
	//liucheng
	$.ajax({
		type: "post",
		dataType: "json",
		url: "mobileStudentController.do?getProcess",
		success: function(data) {
			var obj = $.parseJSON(data.msg);
			for(var i = 0; i < obj.length; i++) {
				console.log("ok");
				console.log("流程ID：" + obj[i].id + "流程名称：" + obj[i].process_name);
				var liuchengName = obj[i].process_name;
				//var liuchengXH=obj[i].process_step;
				//console.log(liuchengXH);
				var liuchengTOU = '<li><span class="step">' + (i + 1) + '</span><span class="title">' + liuchengName + '</span></li>';
				$(".wizard-steps").append(liuchengTOU);
				if(grlc != "" && grlc != null && grlc != undefined && grlc != "null") {
					if(obj[i].id == grlc) {
						console.log("个人流程" + grlc);
						console.log("I=" + i);
						liucheng = i + 1;
						console.log("流程" + liucheng);
						var oron = obj[i].endbs;
						console.log(oron);
						if(oron == "on") {
							$("#page4").show().siblings().hide();

						}
					}
				} else {
					liucheng = 0;
					console.log(liucheng + "//////");
				}

			}
			benciliucheng = liucheng = 3; //流程控制
			//默认状态	默认头部本步骤高亮 默认所获取的状态之前的页面不可见 默认显示本次流程状态页面
			//将按钮样式变化以及切换div封装为函数//初始状态下按钮
			function buttonclick(buttn) {
				buttn = benciliucheng - 1;
				if(buttn <= 0) {
					buttn = 0;
				} else {
					$(".spage").eq(buttn).find(".subbut").removeClass("subbut").addClass("subbut-visited").hide().next(".sub-non").show();
					$(".spage").eq(benciliucheng).show().siblings().hide();
					$(".spage").eq(buttn).prevAll().find(".subbut").removeClass("subbut").addClass("subbut-visited").hide().next(".sub-non").show();
				}
			}
			buttonclick(buttn); //默认执行初始按钮状态；

			$(".spage").eq(liucheng).show().siblings().hide();

			//定义顶部高亮封装为函数
			function gaoliangtop(n) {
				$('.wizard-steps li').eq(n).children().first().css("border-color", "#1296DB").css("background", "#1296DB").css("color", "#fff").parent().siblings().children(".step").css("background-color", "#CED1D6").css("border-color", "#CED1D6").css("color", "black");
				$(".wizard-steps  li").eq(n).children().last().css("color", "#1296DB").parent().siblings().children(".title").css("color", "#333");
				$(".wizard-steps li").eq(n).removeClass().addClass('wizard-steps li ' + "gaoliang").siblings().removeClass('wizard-steps li ' + "gaoliang");
			}
			//顶部左右滚动点击高亮代码 开始 默认状态 morenliucheng=liucheng
			var morenliucheng = liucheng; //
			//console.log(n);
			$('.wizard-steps li').eq(morenliucheng).children().first().css("border-color", "#1296DB").css("background", "#1296DB").css("color", "#fff").parent().siblings().children(".step").css("background-color", "#CED1D6").css("border-color", "#CED1D6").css("color", "black");
			$(".wizard-steps li").eq(morenliucheng).children().last().css("color", "#1296DB").parent().siblings().children(".title").css("color", "#333");
			$(".wizard-steps li").eq(morenliucheng).removeClass().addClass('wizard-steps li ' + "gaoliang").siblings().removeClass('wizard-steps li ' + "gaoliang");

			$(".wizard-steps li").click(function() {
				n = $(this).index();
				console.log(n + "n");
				console.log(liucheng + "liucheng");
				console.log(benciliucheng + "benciliucheng");
				if(n <= benciliucheng && n >= liucheng) {
					$('.wizard-steps  li').eq(n).children().first().css("border-color", "#1296DB").css("background", "#1296DB").css("color", "#fff").parent().siblings().children(".step").css("background-color", "#CED1D6").css("border-color", "#CED1D6").css("color", "black");
					$(".wizard-steps  li").eq(n).children().last().css("color", "#1296DB").parent().siblings().children(".title").css("color", "#333");
					$(".wizard-steps  li").eq(n).removeClass().addClass('wizard-steps li ' + "gaoliang").siblings().removeClass('wizard-steps li ' + "gaoliang");
					$(".spage").eq(n).show().siblings().hide();
				}

			});

			//点击底部按钮 提交数据 跳转下一页 并禁用事件
			//page1

			$("#gerenxinxibut").unbind("click").on("click", function() {

				//判断必填项是否为空
				//定义变量
				var stmobile1 = $("#inputout p").html();
				console.log(stmobile1);
				if(stmobile1 == "null" || stmobile1 == "" || stmobile1 == undefined || stmobile1 == null) {
					var mobile = $("#stMobile").val(); //手机号
					$("#inputout p").html("请输入手机号");
				} else {
					var mobile = sjh; //手机号
				}

				var stmail = $("#inputout2 input").val();
				console.log(stmail);
				if(stmail == "null" || stmail == "" || stmail == undefined || stmail == null) {
					var youxiang = $("#stmail").val();

					$("#stmail").attr('placeholder', ' 请重新输入');
				} else {
					var youxiang = stmail;
				}

				console.log(mobile);
				var syd = $("#stShengyuan").val(); //生源地
				var jtdz = $("#jiatingzhuzhi").val(); //家庭住址

				var jtmc1 = $("#jzxm1").val(); //家长姓名123
				var jtmc2 = $("#jzxm2").val();
				var jtmc3 = $("#jzxm3").val();
				var jtdh1 = $("#jzdh1").val(); //电话123
				var jtdh2 = $("#jzdh2").val();
				var jtdh3 = $("#jzdh3").val();

				var jtgx1 = $("#jzgx1").val(); //关系123
				var jtgx2 = $("#jzgx2").val();
				var jtgx3 = $("#jzgx3").val();
				var xssg = $("#stshengao").val(); //身高
				var xstz = $("#sttizhong").val(); //体重
				var fzcc = $("#fuzhuangchima").val(); //服装尺码
				var xzcc = $("#xiezichima").val(); //鞋子尺码

				var jtrksval = $(".jtrks").val();
				var jtnsrval = $(".rjnsr").val();
				var jtgwbsval = $(".gwbs").val();
				var jtlxval = $("#jtlxselect").val();

				var grinfo = [{
					"mobile": mobile,
					"syd": syd,
					"jtdz": jtdz,
					"mail": stmail
				}, ];

				var jtinfo = [{
					"jtmc1": jtmc1,
					"jtmc2": jtmc2,
					"jtmc3": jtmc3,
					"jtdh1": jtdh1,
					"jtdh2": jtdh2,
					"jtdh3": jtdh3,

					"jtgx1": jtgx1,
					"jtgx2": jtgx2,
					"jtgx3": jtgx3,
					"xssg": xssg,
					"xstz": xstz,
					"fzcc": fzcc,
					"xzcc": xzcc,
					"jtrks": jtrksval,
					"rjnsr": jtnsrval,
					"gwbs": jtgwbsval,
					"jtlx": jtlxval
				}];

				var otjt1;
				if(jtmc1 != "" && jtdh1 != "" && jtgx1 != "") {
					otjt1 = true;
				} else {
					otjt1 = false;
					//	alert("nono");
				}

				var otjt2;
				if(jtmc2 != "" && jtdh2 != "" && jtgx2 != "") {
					otjt2 = true;
				} else {
					otjt2 = false;
					//alert("nono");
				}

				var otjt3;
				if(jtmc3 != "" && jtdh3 != "" && jtgx3 != "") {
					otjt3 = true;
				} else {
					otjt3 = false;
					//alert("nono");
				}
				console.log(mobile);

				if(stmail == "" || mobile == "" || syd == "" || jtdz == "" || xssg == "" || xstz == "" || fzcc == "none" || xzcc == "none") {
					alert('带"*"的为必填项');
				} else {

					if(otjt1 == true || otjt2 == true || otjt2 == true) {

						$(".jiazai").stop().fadeIn(1000);
						//报名，保存信息
						//报名方法AJAx
						$.ajax({
							type: "post",
							dataType: "json",
							url: "mobileStudentController.do?doSignUp",
							data: {
								grinfo: JSON.stringify(grinfo),
								jtinfo: JSON.stringify(jtinfo)
							},
							async: true,
							success: function(data) {
								var bmsu = data.success;
								var bmobj = data.msg;
								if(bmsu == true) {

									$(".jiazai").stop().fadeOut(1000);

									//获取宿舍信息
									var dropid = "";
									var susheOBJmc;
									var susheOBJid;
									$("#qinshi00").css("width", "0");

									$("#qinshijiazai").show();
									$.ajax({
										type: "post",
										dataType: "json",
										url: "mobileStudentController.do?getDromList",
										data: {

											pid: dropid
										},
										success: function(data) {
											//	alert("jiazai");
											//console.log(data);
											var end = data.obj;
											console.log(data.msg);
											var obj = $.parseJSON(data.msg);

											if(obj.length != 0) { //判断是否有床位
												if(end != null && end == "end") { //判断是否为END
													//	alert(end);
													for(var i = 0; i < obj.length; i++) {
														alert("名称：" + obj[i].cname + "ID：" + obj[i].cc);
													}
												} else {
													for(var i = 0; i < obj.length; i++) {
														//alert("名称：" + obj[i].cname + "ID：" + obj[i].BS);
														susheOBJmc = obj[i].cname;
														susheOBJid = obj[i].BS;
														var susheSEL = '<option value=' + susheOBJid + '>' + susheOBJmc + '</option>';
														$("#qinshi00").append(susheSEL);
														var selsize = $("#qinshi00 option").size();
														if(selsize >= 2) {
															console.log(selsize);
															$("#qinshijiazai").hide();
															$("#qinshi00").css("width", "auto");
														}
													}

												}

											} else {
												//alert("无可用床位！");
												$("#qinshijiazai").hide();
												$("#qinshi00").css("width", "auto");
												$("#qinshi00 option").remove();
												$("#qinshi00").append('<option value="none">无</option>');
												$("#chuangwei00 option").remove();
												$("#chuangwei00").append('<option value="none">无</option>');
											}

										},
										error: function(msg) {
											//alert("error:" + msg);
											alert("刷新频率过快！");
										}
									});
									//select change事件 选宿舍 每一次change就给下面的option赋值
									$("#qinshi00").change(function() {
										$("#chuangwei00").css("width", "0");
										$("#chuangweijiazai").show();
										$("#chuangwei00 option").remove();
										$("#chuangwei00").append('<option value="none">请选择</option>');
										var val00 = $("#qinshi00").val();
										if(val00 == "none") {
											$("#chuangwei00").css("width", "auto");
											$("#chuangweijiazai").hide();
										}
										dropid = val00;
										$.ajax({
											type: "post",
											dataType: "json",
											url: "mobileStudentController.do?getDromList",
											data: {
												sfzh: sfzh,
												pid: dropid
											},
											success: function(data) {
												var end = data.obj;

												var obj = $.parseJSON(data.msg);
												if(end != null && end == "end") {
													//alert(end);
													for(var i = 0; i < obj.length; i++) {
														//alert("名称：" + obj[i].cname + "ID：" + obj[i].cc);
														susheOBJmc = obj[i].cname;
														susheOBJid = obj[i].cc;
														var susheSEL = '<option value=' + susheOBJid + '>' + susheOBJmc + '</option>';
														$("#chuangwei00").append(susheSEL);

														var selsize = $("#chuangwei00 option").size();
														if(selsize >= 2) {
															console.log(selsize);
															$("#chuangweijiazai").hide();
															$("#chuangwei00").css("width", "auto");
														}
														susheOBJid = val00;
													}
												} else {
													for(var i = 0; i < obj.length; i++) {
														//alert("名称：" + obj[i].cname + "ID：" + obj[i].BS);

													}

												}
											},
											error: function(msg) {
												//alert("error:" + msg);
												alert("刷新频率过快！");
											}
										});
									});

									//跳转和样式 开始
									$("#page1").stop().fadeOut();
									$("#page2").stop().fadeIn();
									$(".jiazai").stop().fadeOut(1000);
									n = 1;
									isn1 = n;
									gaoliangtop(n);
									$(this).removeClass("subbut").addClass("subbut-visited");
									benciliucheng++;
									buttonclick(buttn);
									$("#gerenxinxibut").unbind();
									//跳转和样式 结束
								} else {
									$(".jiazai").stop().fadeOut(1000);
									$('#fbbm-queren').stop().fadeIn();
									//$("#wenzi-con").text(obj);
									$("#baoming-fbbut").show();
									console.log("nono11");
									$("#wenzi-con p").text(data.msg);
									$("#baoming-fbbut").click(function() {
										$("#fbbm-queren").stop().fadeOut();
									});

								}

							},
							/*success END*/
							error: function() {
								$(".jiazai").stop().fadeOut(1000);
								$('#fbbm-queren').stop().fadeIn();
								//$("#wenzi-con").text(obj);
								$("#baoming-fbbut").show();
								console.log("nono11");
								$("#wenzi-con p").text("连接超时！请稍后重试！");
								$("#baoming-fbbut").click(function() {
									$("#fbbm-queren").stop().fadeOut();
								});
							}
						});
						//b报名方法end

					} else {
						alert("请至少填写完整一位家长或监护人的信息！");

					}
				}

			});

			isTime();

			if(sfdz == "Y") {
				if(isTimeIn == false) { //如果单招学生不在时间内选宿舍
					$("#qinshi00 option").remove();
					$("#chuangwei00 option").remove();

					$("#qinshi00").append('<option value="none">当前暂无可用宿舍</option>');

					$("#chuangwei00").append('<option value="none">当前暂无可用宿舍</option>');
				} else { //单招学生在时间内选宿舍
					if(liucheng == 1) {
						//获取宿舍信息
						var dropid = "";
						var susheOBJmc;
						var susheOBJid;
						$("#qinshi00").css("width", "0");
						$("#qinshijiazai").show();
						$.ajax({
							type: "post",
							dataType: "json",
							url: "mobileStudentController.do?getDromList",
							data: {

								pid: dropid
							},
							success: function(data) {
								//	alert("jiazai");
								//console.log(data);
								var end = data.obj;
								console.log(data.msg);
								var obj = $.parseJSON(data.msg);

								if(obj.length != 0) { //判断是否有床位
									if(end != null && end == "end") { //判断是否为END
										//	alert(end);
										for(var i = 0; i < obj.length; i++) {
											alert("名称：" + obj[i].cname + "ID：" + obj[i].cc);
										}
									} else {
										for(var i = 0; i < obj.length; i++) {
											//alert("名称：" + obj[i].cname + "ID：" + obj[i].BS);
											susheOBJmc = obj[i].cname;
											susheOBJid = obj[i].BS;
											var susheSEL = '<option value=' + susheOBJid + '>' + susheOBJmc + '</option>';
											$("#qinshi00").append(susheSEL);
											var selsize = $("#qinshi00 option").size();
											if(selsize >= 2) {
												console.log(selsize);
												$("#qinshijiazai").hide();
												$("#qinshi00").css("width", "auto");
											}
										}

									}

								} else {
									//alert("无可用床位！");
									$("#qinshijiazai").hide();
									$("#qinshi00").css("width", "auto");
									$("#qinshi00 option").remove();
									$("#qinshi00").append('<option value="none">无</option>');
									$("#chuangwei00 option").remove();
									$("#chuangwei00").append('<option value="none">无</option>');
								}

							},
							error: function(msg) {
								//alert("error:" + msg);
								alert("刷新频率过快！");
							}
						});

						//select change事件 选宿舍 每一次change就给下面的option赋值
						$("#qinshi00").change(function() {
							$("#chuangwei00").css("width", "0");
							$("#chuangweijiazai").show();
							$("#chuangwei00 option").remove();
							$("#chuangwei00").append('<option value="none">请选择</option>');
							var val00 = $("#qinshi00").val();
							if(val00 == "none") {
								$("#chuangwei00").css("width", "auto");
								$("#chuangweijiazai").hide();
							}
							dropid = val00;
							$.ajax({
								type: "post",
								dataType: "json",
								url: "mobileStudentController.do?getDromList",
								data: {
									sfzh: sfzh,
									pid: dropid
								},
								success: function(data) {
									var end = data.obj;

									var obj = $.parseJSON(data.msg);
									if(end != null && end == "end") {
										//alert(end);
										for(var i = 0; i < obj.length; i++) {
											//alert("名称：" + obj[i].cname + "ID：" + obj[i].cc);
											susheOBJmc = obj[i].cname;
											susheOBJid = obj[i].cc;
											var susheSEL = '<option value=' + susheOBJid + '>' + susheOBJmc + '</option>';
											$("#chuangwei00").append(susheSEL);

											var selsize = $("#chuangwei00 option").size();
											if(selsize >= 2) {
												console.log(selsize);
												$("#chuangweijiazai").hide();
												$("#chuangwei00").css("width", "auto");
											}
											susheOBJid = val00;
										}
									} else {
										for(var i = 0; i < obj.length; i++) {
											//alert("名称：" + obj[i].cname + "ID：" + obj[i].BS);

										}

									}
								},
								error: function(msg) {
									//alert("error:" + msg);
									alert("刷新频率过快！");
								}
							});
						});

					}
				}

			} else { //非单招学生正常流程选宿舍
				if(liucheng == 1) {
					//获取宿舍信息
					var dropid = "";
					var susheOBJmc;
					var susheOBJid;
					$("#qinshi00").css("width", "0");
					$("#qinshijiazai").show();
					$.ajax({
						type: "post",
						dataType: "json",
						url: "mobileStudentController.do?getDromList",
						data: {

							pid: dropid
						},
						success: function(data) {
							//	alert("jiazai");
							//console.log(data);
							var end = data.obj;
							console.log(data.msg);
							var obj = $.parseJSON(data.msg);

							if(obj.length != 0) { //判断是否有床位
								if(end != null && end == "end") { //判断是否为END
									//	alert(end);
									for(var i = 0; i < obj.length; i++) {
										alert("名称：" + obj[i].cname + "ID：" + obj[i].cc);
									}
								} else {
									for(var i = 0; i < obj.length; i++) {
										//alert("名称：" + obj[i].cname + "ID：" + obj[i].BS);
										susheOBJmc = obj[i].cname;
										susheOBJid = obj[i].BS;
										var susheSEL = '<option value=' + susheOBJid + '>' + susheOBJmc + '</option>';
										$("#qinshi00").append(susheSEL);
										var selsize = $("#qinshi00 option").size();
										if(selsize >= 2) {
											console.log(selsize);
											$("#qinshijiazai").hide();
											$("#qinshi00").css("width", "auto");
										}
									}

								}

							} else {
								//alert("无可用床位！");
								$("#qinshijiazai").hide();
								$("#qinshi00").css("width", "auto");
								$("#qinshi00 option").remove();
								$("#qinshi00").append('<option value="none">无</option>');
								$("#chuangwei00 option").remove();
								$("#chuangwei00").append('<option value="none">无</option>');
							}

						},
						error: function(msg) {
							//alert("error:" + msg);
							alert("刷新频率过快！");
						}
					});
					//select change事件 选宿舍 每一次change就给下面的option赋值
					$("#qinshi00").change(function() {
						$("#chuangwei00").css("width", "0");
						$("#chuangweijiazai").show();
						$("#chuangwei00 option").remove();
						$("#chuangwei00").append('<option value="none">请选择</option>');
						var val00 = $("#qinshi00").val();
						if(val00 == "none") {
							$("#chuangwei00").css("width", "auto");
							$("#chuangweijiazai").hide();
						}
						dropid = val00;
						$.ajax({
							type: "post",
							dataType: "json",
							url: "mobileStudentController.do?getDromList",
							data: {
								sfzh: sfzh,
								pid: dropid
							},
							success: function(data) {
								var end = data.obj;

								var obj = $.parseJSON(data.msg);
								if(end != null && end == "end") {
									//alert(end);
									for(var i = 0; i < obj.length; i++) {
										//alert("名称：" + obj[i].cname + "ID：" + obj[i].cc);
										susheOBJmc = obj[i].cname;
										susheOBJid = obj[i].cc;
										var susheSEL = '<option value=' + susheOBJid + '>' + susheOBJmc + '</option>';
										$("#chuangwei00").append(susheSEL);

										var selsize = $("#chuangwei00 option").size();
										if(selsize >= 2) {
											console.log(selsize);
											$("#chuangweijiazai").hide();
											$("#chuangwei00").css("width", "auto");
										}
										susheOBJid = val00;
									}
								} else {
									for(var i = 0; i < obj.length; i++) {
										//alert("名称：" + obj[i].cname + "ID：" + obj[i].BS);

									}

								}
							},
							error: function(msg) {
								//alert("error:" + msg);
								alert("刷新频率过快！");
							}
						});
					});

				}
			}

			//page5

			//是否确认分配宿舍并验证是否为空 并跳转下一步
			$("#xuansushe").click(function() {

				var qinshi00 = $("#qinshi00").val();
				var chuangwei00 = $("#chuangwei00").val();
				var chuangwei01 = $("#chuangwei00").find("option:selected").text();

				var qxz = "none";
				console.log(qinshi00 + chuangwei00);
				if(qinshi00 != qxz && chuangwei00 != qxz) {
					$("#sushe-quxiao").show();
					$("#sushe-querenbut").show();
					$("#querenbut-sushe1").hide();
					$("#sushe-querenzz").stop().fadeIn();
					$("#sushe-queren-z p").text("您被分配到" + chuangwei01 + "，确认分配宿舍吗？");
					$("#sushe-quxiao").click(function() {
						$("#sushe-querenzz").stop().fadeOut();
					});
					//确认并跳转
					var info = [{
						"chmc": chuangwei01,
						"chbm": chuangwei00
					}];

					// $("#sushe-querenbut").on("click", function () {
					$("#sushe-querenbut").unbind("click").click(function() {
						$("#sushe-querenzz").stop().fadeOut();
						$(".jiazai").stop().fadeIn(800);
						//ajax
						$.ajax({
							type: "post",
							url: "mobileStudentController.do?dosaveDrom",
							dataType: "json",
							data: {
								info: JSON.stringify(info)
							},
							async: false,
							success: function(data) {
								console.log('success');

								if(data.success == true) {

									$(".jiazai").stop().fadeOut(800);
									//alert(data.msg);
									$("#page2").stop().fadeOut();
									$("#page3").stop().fadeIn();
									n = 2;
									gaoliangtop(n);
									$("#xuansushe").removeClass("subbut").addClass("subbut-visited").unbind("click");
									benciliucheng++;
									buttonclick(buttn);
								} else {

									$(".jiazai").stop().fadeOut(800);
									//alert(data.msg);
									$("#sushe-querenzz").stop().fadeIn();
									$("#sushe-queren-z p").text(data.msg);
									$("#sushe-quxiao").hide();
									$("#sushe-querenbut").hide();
									$("#querenbut-sushe1").show().click(function() {
										$("#chuangwei00 option").remove();
										$("#sushe-querenzz").stop().fadeOut();

										//获取宿舍信息
										var dropid = "";
										var susheOBJmc;
										var susheOBJid;
										$("#qinshi00 option").remove();
										$("#qinshi00").css("width", "0");
										$("#qinshijiazai").show();
										$("#qinshi00").append('<option value="none">请选择</option>');
										$.ajax({
											type: "post",
											dataType: "json",
											url: "mobileStudentController.do?getDromList",
											data: {

												pid: dropid
											},
											success: function(data) {
												//	alert("jiazai");
												//console.log(data);
												var end = data.obj;
												console.log(data.msg);
												var obj = $.parseJSON(data.msg);

												if(obj.length != 0) { //判断是否有床位
													if(end != null && end == "end") { //判断是否为END
														//	alert(end);
														for(var i = 0; i < obj.length; i++) {
															alert("名称：" + obj[i].cname + "ID：" + obj[i].cc);
														}
													} else {
														for(var i = 0; i < obj.length; i++) {
															//alert("名称：" + obj[i].cname + "ID：" + obj[i].BS);
															susheOBJmc = obj[i].cname;
															susheOBJid = obj[i].BS;
															var susheSEL = '<option value=' + susheOBJid + '>' + susheOBJmc + '</option>';
															$("#qinshi00").append(susheSEL);
															var selsize = $("#qinshi00 option").size();
															if(selsize >= 2) {
																console.log(selsize);
																$("#qinshijiazai").hide();
																$("#qinshi00").css("width", "auto");
															}
														}

													}

												} else {
													//alert("无可用床位！");
													$("#qinshijiazai").hide();
													$("#qinshi00").css("width", "auto");
													$("#qinshi00 option").remove();
													$("#qinshi00").append('<option value="none">无</option>');
													$("#chuangwei00 option").remove();
													$("#chuangwei00").append('<option value="none">无</option>');
												}

											},
											error: function(msg) {
												//alert("error:" + msg);
												alert("刷新频率过快！");
											}
										});
										$("#chuangwei00").append('<option value="none">请选择</option>');
										//select change事件 选宿舍 每一次change就给下面的option赋值

									});

								}

							},
							error: function() {
								//console.log(data.msg);
								alert("刷新频率过快！");
							}

						});

					});

				} else {
					alert("请选择完整！");
				}

			});

			if(liucheng == 3) {
				//为下一页准备
				$.ajax({
					type: "post",
					dataType: "json",
					timeout: 5000,
					url: "mobileStudentController.do?getSSxx",
					success: function(data) {
						if(data.success == true) {
							var obj = $.parseJSON(data.msg);

							$("#bjmc").html(obj.bjmc);
							$("#bzr").html(obj.bzr);
							$("#bzrdh").html(obj.bzrdh);
							$("#ssmc").html(obj.ssmc);

							var ssmcstr = obj.ssmc;
							if(ssmcstr != null && ssmcstr != "null" && ssmcstr != "" && ssmcstr != undefined && ssmcstr != "undefined") {
								var ldmcLocation = ssmcstr.indexOf("栋") + 1;
								var xbbldmc = ssmcstr.substring(0, ldmcLocation);
								var xbbLocation = ssmcstr.indexOf("-") + 1;

								var xbbLength = ssmcstr.length;
								var ldmc = xbbldmc.substring(xbbLocation, xbbLength);
								console.log(ldmc);
								$("#ldmc").html(ldmc);
							}

							var ifyaoshi = obj.yslq;
							if(ifyaoshi == "N") {
								$("#yaoshi").html("否");
							} else {
								$("#yaoshi").html("是");
							}

						} else {
							// alert("数据异常");
						}
					},
					error: function(msg) {
						// alert("error:" + msg);
						alert("刷新频率过快！");
					},
					complete: function(XMLHttpRequest, status) { //请求完成后最终执行参数
						if(status == 'timeout') { //超时,status还有success,error等值的情况

							// alert("连接超时");
						}
					}
				});

			}

			//page7
			//抵校信息页 radio  赋值
			$(".radio-wrap").click(function() {
				$(this).siblings().children(".radio-button").removeClass("radio-but-on");
				$(this).children(".radio-button").addClass("radio-but-on");
			});
			//baodao
			var baodao = $('input:radio[name="baodao"]:checked').val();
			$("#baodao1").click(function() {
				baodao = "准时到校";
			});
			$("#baodao2").click(function() {
				baodao = "延迟到校";
			});
			//到校时间

			//jiaotong
			var jiaotong = $('input:radio[name="jiaotong"]:checked').val();
			$("#jiaotong1").click(function() {
				jiaotong = "火车";
			});
			$("#jiaotong2").click(function() {
				jiaotong = "汽车";
			});
			$("#jiaotong3").click(function() {
				jiaotong = "校车";
			});
			//peitong
			var peitong = $('input:radio[name="peitong"]:checked').val();
			$("#peitong1").click(function() {
				peitong = "无";
			});
			$("#peitong2").click(function() {
				peitong = "1";
			});
			$("#peitong3").click(function() {
				peitong = "2";
			});
			$("#peitong4").click(function() {
				peitong = "3";
			});
			$("#peitong5").click(function() {
				peitong = "4";
			});
			$("#peitong6").click(function() {
				peitong = "5+";
			});
			var chezhan;
			//dixiao butpage7
			$("#chezhan").change(function() {
				chezhan = $("#chezhan").find("option:selected").text();
			});

			var wenti1 = $("#wenti1").text();
			var wenti2 = $("#wenti2").text();
			var wenti3 = $("#wenti3").text();
			var wenti4 = $("#wenti4").text();
			var wenti5 = $("#wenti5").text();
			console.log(wenti1);
			console.log(wenti2);
			console.log(wenti3);
			console.log(wenti4);
			console.log(wenti5);
			$("#dixiaobut").click(function() {
				$(".jiazai").stop().fadeIn(800);
				//为下一页准备
				$.ajax({
					type: "post",
					dataType: "json",
					timeout: 5000,
					url: "mobileStudentController.do?getSSxx",
					success: function(data) {
						if(data.success == true) {
							var obj = $.parseJSON(data.msg);
							$("#bjmc").html(obj.bjmc);
							$("#bzr").html(obj.bzr);
							$("#bzrdh").html(obj.bzrdh);
							$("#ssmc").html(obj.ssmc);

							var ssmcstr = obj.ssmc;
							if(ssmcstr != null && ssmcstr != "null" && ssmcstr != "" && ssmcstr != undefined && ssmcstr != "undefined") {
								var ldmcLocation = ssmcstr.indexOf("栋") + 1;
								var xbbldmc = ssmcstr.substring(0, ldmcLocation);
								var xbbLocation = ssmcstr.indexOf("-") + 1;

								var xbbLength = ssmcstr.length;
								var ldmc = xbbldmc.substring(xbbLocation, xbbLength);
								console.log(ldmc);
								$("#ldmc").html(ldmc);
							}

							var ifyaoshi = obj.yslq;
							if(ifyaoshi == "N") {
								$("#yaoshi").html("否");
							} else {
								$("#yaoshi").html("是");
							}

						} else {
							$(".jiazai").stop().fadeOut(800);
							alert("数据异常");
						}
					},
					error: function(msg) {
						//  alert("error:" + msg);
						alert("刷新频率过快！");
					},
					complete: function(XMLHttpRequest, status) { //请求完成后最终执行参数
						if(status == 'timeout') { //超时,status还有success,error等值的情况

							alert("连接超时");
						}
					}
				});

				//				if(dixiaoTime==undefined){
				//					alert('khfsdviwf');
				//				}

				console.log(chezhan);
				if(baodao != null && dixiaoTime != undefined && jiaotong != null && peitong != null && chezhan != "" && chezhan != "none" && chezhan != undefined) {
					//	ajax
					var info = [{
							"title": wenti1,
							"answer": baodao
						},
						{
							"title": wenti2,
							"answer": jiaotong
						},
						{
							"title": wenti3,
							"answer": peitong
						},
						{
							"title": wenti4,
							"answer": dixiaoTime
						},
						{
							"title": wenti5,
							"answer": chezhan
						}
					];
					console.log(info);
					$.ajax({
						type: "post",
						url: "mobileStudentController.do?dosaveSchoolReport",
						dataType: "json",
						timeout: 5000,
						data: {
							info: JSON.stringify(info)
						},
						async: true,
						success: function(data) {
							console.log(data.msg);
							n = 3;
							gaoliangtop(n);
							benciliucheng++;
							$(".jiazai").stop().fadeOut(800);
							$(this).removeClass("subbut").addClass("subbut-visited");

							$("#page3").stop().fadeOut();
							$("#page4").stop().fadeIn();
						},
						error: function(data) {
							console.log(data.msg);
						}
					});

					//$("#banji").html(bjmc);
					//$("#yddh").html(yddh);
					//$("#fdyxm").html(fdyxm);

				} else {
					$(".jiazai").stop().fadeOut(800);
					$('#Xqueren').stop().fadeIn();
					$("#wenzi-con p").text("有未作答的项！");
					$("#Xbbut").show();
					//$("#wenzi-con p").text("分班失败！请联系xxx后继续进行报道流程");
					$("#Xbbut").click(function() {
						$("#Xqueren").stop().fadeOut();
					});
				}

			});
		},
		error: function(msg) {
			//alert("error:" + msg);
			alert("刷新频率过快！");
		},
		complete: function(XMLHttpRequest, status) { //请求完成后最终执行参数
			if(status == 'timeout') { //超时,status还有success,error等值的情况

				alert("连接超时");
			}
		}
	});

	//判断性别
	if(xb == 1) {
		$("#xb").text("男");
	} else {
		$("#xb").text("女");
	}

	//判断是否单招

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

	//基本信息填手机号隐藏显示
	var shoujihao
	$("#inputout").click(function() {
		$("#inputout p").hide().parent().children().last().show().css("border", "0").css("text-align", "right").css("color", "#555");
	});
	if(stmobile != "null" && stmobile != "") {
		shoujihao = stmobile;
		$("#inputout p").html(shoujihao);
	}

	$("#inputout input").blur(function() {
		shoujihao = $("#inputout input").val();

		console.log(shoujihao);
		if(shoujihao != "") {
			//alert("ok");
			$("#inputout p").html(shoujihao);
		} else {
			//alert("no");
			shoujihao = sjh;
			$("#inputout p").html(shoujihao);
		}

		$("#inputout input").hide().prev().show().css("color", "#555");

	});

	//新增内容2017-06-21---------start

	//家庭信息四项控制 家庭人口数 人均年收入 过往病史 家庭类型 
	//家庭人口数
	if(jtrks1 == "" || jtrks1 == null || jtrks1 == "null") {
		$(".jtrks").prev().text("请输入家庭人口数");
	} else {
		$(".jtrks").prev().text(jtrks1);
		$(".jtrks").val(jtrks1);
	};

	$(".inputprks").click(function() {
		$(this).hide().next().show().focus().css("border", "0").css("text-align", "right").css("color", "#555");;
	});

	$(".jtrks").blur(function() {
		var jtrksval = $(this).val();
		if(jtrksval == "" || isNaN(jtrksval) == true) {
			$(this).hide().prev().show().text("请输入家庭人口数");
			$(".jtrks").val("");
		} else {
			$(this).hide().prev().show().text(jtrksval);
		}

	});
	//人均年收入
	if(rjnsr1 == "" || rjnsr1 == null || rjnsr1 == "null") {
		$(".rjnsr").prev().text("请输入人均年收入");
	} else {
		$(".rjnsr").prev().text(rjnsr1);
		$(".rjnsr").val(rjnsr1);
	};

	$(".inputpnsr").click(function() {
		$(this).hide().next().show().focus().css("border", "0").css("text-align", "right").css("color", "#555");;
	});

	$(".rjnsr").blur(function() {
		var jtnsrval = $(this).val();
		if(jtnsrval == "" || isNaN(jtnsrval) == true) {
			$(this).hide().prev().show().text("请输入人均年收入");
			$(".rjnsr").val("");
		} else {
			$(this).hide().prev().show().text(jtnsrval);
		}

	});
	//过往病史
	if(gwbs1 == "" || gwbs1 == null || gwbs1 == "null") {
		$(".gwbs").prev().text("请输入过往病史");
	} else {
		$(".gwbs").prev().text(gwbs1);
		$(".gwbs").val(gwbs1);
	};

	$(".inputpbs").click(function() {
		$(this).hide().next().show().focus().css("border", "0").css("text-align", "right").css("color", "#555");;
	});

	$(".gwbs").blur(function() {
		var jtgwbsval = $(this).val();
		if(jtgwbsval == "") {
			$(this).hide().prev().show().text("请输入过往病史");
		} else {
			$(this).hide().prev().show().text(jtgwbsval);
		}

	});

	//基本信息填QQ邮箱QQmail隐藏显示  caijing财经
	var youxiang
	$("#inputout2").click(function() {
		$("#stMail").focus();
		$("#inputout2 p").hide().parent().children().last().show().css("border", "0").css("text-align", "right").css("color", "#555");
	});

	$("#stMail").blur(function() {
		$("#inputout2 p").text("");
		youxiang = $("#inputout2 input").val();

		if(!youxiang.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {

			$("#stMail").val("").attr('placeholder', '邮箱格式不正确 请重新输入');
		}

		/*console.log(youxiang);
		 if(youxiang != "") {
		 //alert("ok");
		 $("#inputout2 p").html(youxiang);
		 } else {
		 //alert("no");
		 youxiang = "请输入邮箱";
		 $("#inputout2 p").html(youxiang);
		 }*/

	});

	//select默认加载 
	if(jtlx1 != "" && jtlx1 != "null" && jtlx1 != null && jtlx1 != undefined && jtlx1 != "undefined") {

		var jtlxi
		for(jtlxi = 0; jtlxi < 9; jtlxi++) {
			var xxxs = $("#jtlxselect option").eq(jtlxi).text();
			if(jtlx1 == xxxs) {
				console.log(jtlxi + "now");
				document.getElementById("jtlxselect")[jtlxi].selected = true;
				$("#jtlxselect").val(jtlx1);
			};
		};
	};
	//end

	//生源地
	$("#inputout1").click(function() {
		$("#inputout1 p").hide().parent().children().last().show().css("border", "0").css("text-align", "right").css("color", "#555");
	});

	$("#inputout1 input").blur(function() {
		var shengyuandi = $("#inputout1 input").val();
		console.log(shengyuandi);
		if(shengyuandi != "") {
			//alert("ok");
			$("#inputout1 p").html(shengyuandi);
		} else {
			//alert("no");

			$("#inputout1 p").html("请输入");
		}

		$("#inputout1 input").hide().prev().show().css("color", "#555");

	});

	//贷款选项卡高亮
	$(".daikuan-left").click(function() {
		$(".daikuan-left").removeClass("daikuan-gaoliang-no").addClass("daikuan-gaoliang").next().addClass("daikuan-gaoliang-no");
		$("#daikuan1").next().stop().fadeOut(200).prev().stop().fadeIn(200);
	});

	$(".daikuan-right").click(function() {
		$(".daikuan-right").removeClass("daikuan-gaoliang-no").addClass("daikuan-gaoliang").prev().addClass("daikuan-gaoliang-no");
		$("#daikuan2").prev().stop().fadeOut(200).next().stop().fadeIn(200);
	});

	//个人信息展开隐藏
	$(".zhankai").children(".jiantou-geren").addClass("xiala-down");
	$(".zhankai").click(function() {
		$(this).prev().stop().slideToggle();
		$(this).children(".jiantou-geren").toggleClass("xiala-down").toggleClass("xiala-up");
	});

	//绿色通道 缴费下拉箭头
	$(".feiyongxinxi li").children(".feiyong-list-wrap").children(".feiyong-con").children(".xiala").addClass("xiala-down");
	$(".feiyongxinxi li").click(function() {
		$(this).children(".feiyongxiangqing").stop().slideToggle(200);
		$(this).children(".feiyong-list-wrap").children(".feiyong-con").children(".xiala").toggleClass("xiala-down").toggleClass("xiala-up");
	});

	//控制贷款申请文字在200字以内
	$("#shenqing-shuoming").bind('input propertychange', function() {
		var curLength = $("#shenqing-shuoming").val().length;

		if(curLength > 200) {
			var num = $("#shenqing-shuoming").val().substr(0, 200);
			$("#shenqing-shuoming").val(num);
			alert("已超过限制字数（200字）！");
		}

	});

	//控制家庭住址在50字

	$("#jiatingzhuzhi").bind('input propertychange', function() {
		var curLength = $("#jiatingzhuzhi").val().length;

		if(curLength > 50) {
			var num = $("#jiatingzhuzhi").val().substr(0, 50);
			$("#jiatingzhuzhi").val(num);
			alert("已超过限制字数（50字）！");
		}

	});

	//是否购买单选框样式切换
	$(".radio-but").click(function() {
		$(this).parent().siblings().children(".radio-but").removeClass("radio-but-on").parent().siblings().children(".radio-but").addClass("radio-but-on");
	});

	//是否选购页面切换 给假的radio赋值 改变假的radio样式
	var val = $('input:radio[name="chuang"]:checked').val();
	$(".shi-chuang").children(".radio-but").addClass("radio-but-on");
	$(".shi-chuang").click(function() {
		$("#radiotrue").attr("checked", true);
		$(".fou-chuang").children(".radio-but").removeClass("radio-but-on");
		$(this).children(".radio-but").addClass("radio-but-on");
		val = "true";
		chuangshangmoney = 300;
		$(".buxuan-chuangshang").hide().prev().stop().fadeIn();
		console.log(chuangshangmoney);
		zongjine = junxunmoney + chuangshangmoney;

	});
	$(".fou-chuang").click(function() {
		$("#radiofalse").attr("checked", true);
		$(".shi-chuang").children(".radio-but").removeClass("radio-but-on");
		$(this).children(".radio-but").addClass("radio-but-on");
		val = "false";
		chuangshangmoney = 0;
		$(".xuan-chuangshang").hide().next().stop().fadeIn();
		console.log(chuangshangmoney);
		zongjine = junxunmoney + chuangshangmoney;
	});

	//刷新方法
	function reloadout() {

		$.ajax({
			type: "post",
			url: "mobileStudentController.do?refresh",

			async: true,
			success: function(data) {
				console.log(data);
				window.location.href = "mobileStudentController.do?goLogin&" + new Date();

			}

		});
	}
	//点击刷新，刷新按钮旋转
	$(".shuaxin").toggle(function() {
			$(".shuaxin-tubiao").removeClass("xuanzhuan1").addClass("xuanzhuan0");
			setTimeout(reloadout(), 900);
		},
		function() {
			$(".shuaxin-tubiao").removeClass("xuanzhuan0").addClass("xuanzhuan1");
			setTimeout(reloadout(), 900);
		}
	);

	//个人信息页面家庭成员
	$(".jiating-list-wrap").children(".jiating-con").children(".xiala").addClass("xiala-down");
	$(".jiating-list-wrap").click(function() {
		$(this).next(".jiatingxiangqing").stop().slideToggle(200);
		$(this).children(".jiating-con").children(".xiala").toggleClass("xiala-down").toggleClass("xiala-up");
	});
	//append服装尺码
	for(var chima = 140; chima <= 200; chima = chima + 5) {
		//console.log(chima);
		var fzcmsel = '<option value="' + chima + '">' + chima + '</option>';
		$("#fuzhuangchima").append(fzcmsel);
	}

	//append鞋子尺码
	for(var chima = 34; chima <= 50; chima = chima + 1) {
		//	console.log(chima);
		var xzcmsel = '<option value="' + chima + '">' + chima + '</option>';
		$("#xiezichima").append(xzcmsel);
	}

	//验证家长信息输入INPUT格式是否正确 (控制长度在20以内)
	$(".inputjzxm").change(function() {
		var inputlen = $(this).val().length;
		if(inputlen >= 20) {
			$(this).val("").attr('placeholder', '姓名格式不正确 请重新输入').addClass("invalid");
		}
	})

	//判断手机号是否是11位并且是否是数字并且是否是1开头的数字
	$(".inputjzdh").change(function() {
		var inputlen = $(this).val().length;
		var inputcon = $(this).val();

		var firststr = inputcon.substr(0, 1); //获取手机号的第一位，判断是否是1

		if(isNaN(inputcon) == true || inputlen > 11 || firststr != 1) {
			$(this).val("").attr('placeholder', '手机号格式不正确 请重新输入').addClass("invalid");

		}
	});
	//判断亲属关系最长输入5个字
	$(".inputjzgx").change(function() {
		var inputlen = $(this).val().length;
		if(inputlen > 5) {
			$(this).val("").attr('placeholder', '亲属关系格式不正确 请重新输入').addClass("invalid");
		}
	})

	//判断身高体重最长3位数 必须为数字 不能0开头
	$(".sgtz").change(function() {
		var inputlen = $(this).val().length;
		var inputcon = $(this).val();
		var firststr = inputcon.substr(0, 1);
		if(isNaN(inputcon) == true || inputlen > 3 || firststr == 0) {
			$(this).val("").attr('placeholder', '输入格式不正确 请重新输入').addClass("invalid");

		}
	});

	//个人信息中头像变大

	$(".tobig").click(function() {
		$(this).stop().animate({
			height: '0px',
		}, 300);
		$(this).parent().prev().show().stop().animate({
			height: '200px'
		}, 300);
		$(".upicon").show().stop().animate({
			right: '30px'
		}, 300);
	});
	//个人信息头像变小

	$(".bigTouxiang").click(function() {
		$(this).stop().animate({
			height: '0px'
		}, 300);
		$(this).next().children(".tobig").stop().animate({
			height: '45px'
		}, 300);
		$(".upicon").stop().animate({
			right: '-30px'
		}, 300);
		setTimeout('$(".upicon").hide();', 300);

	})

	//设置头像
	$(".geren-touxiang img").attr('src', "plug-in/weixin/yx/images/yicun.png");

	//是否选购床上用品动画控制
	$(".sfxuangouyp").click(function(){
		$(this).children(".duigou").show().prev().show().parent().siblings().children(".duigou").hide().prev().hide();
	});

	$("#tjxg").click(function(){
		var zsf=1000;
		var csypf;
		var bxf;
		
		var sfxgcsyp= $('input:radio[name="xgcsyp"]:checked').val();
		var sfxgbx= $('input:radio[name="xgbx"]:checked').val();
		console.log(sfxgcsyp+sfxgbx);
		
	});

});