//onload




$(document).ready(function() {
	console.log(zsffor);
	
	var xufy=0; //------其他费用
	var xufymc;
	
	var subxf; //学费
	var subxfmc; //学费名称
	
	var subsf;  
	var subsfmc;
	
	var subzf;
	var subzfmc;
	
	var subzsf;
	var subzfmc;
	var fytjinfo="";
	var xgfycount=0;
	
	var cc0=[]; //全局形载指代cc[]
	var arr=[];
	
	
	$.ajax({
		type : "post",
		dataType : "json",
		url : "mobileStudentController.do?getQFxx",
		success : function(data) {
			var obj = $.parseJSON(data.msg);
			arr=obj;
			console.log(arr);
			if((arr==null||arr==""||arr.length==0)){
				//---选购页面其他费用---获取不到设定的应交款时隐藏---显示
				if(sfjzsf!="Y"){
					$(".arrnull").hide();
					$(".zhusufei").append('<li class="feiyong-xq" style="text-align: center;font-size:10pt;line-height:40px;color:red">无法获取数据，请联系管理员解决！</li>')
					$("#tjxgnext").removeClass("subbut").unbind().addClass("subbut-visited");
				}
			
				//----缴学费页面
				if(sfjf!="Y"){
					$(".feiyongxinxi ul li").hide();
					$(".feiyongxinxi ul").append('<li class="feiyong-xq" style="text-align: center;font-size:10pt;line-height:40px;color:red">无法获取数据，请联系管理员解决！</li>');
					$("#xuefeizhifubut").removeClass("subbut").unbind().addClass("subbut-visited");
					$("#xuefeitip").hide();
				}
				
				
			}else{
				arract(arr);
			}
				
			
			
		}
	});
	
	
	//------解析数组 为六个一组 begin-----
	var xfcode;
	
	function arract(arr){
		var n=6;  //控制每N个元素一组，n的整数倍数应该是输入数组的长度
		var b=[]; //中间件
		var cc=[];//最终输出数组
		for(var i=1;i<=arr.length;i++){
			if(i%n==0){
				b.push(i);
			}
		}
		for(var i=0;i<b.length;i++){
			cc[i]=arr.slice(b[i]-n,b[i]);
			cc0[i]=arr.slice(b[i]-n,b[i]);
		}
		
		
		for(var i=0;i<cc0.length;i++){
			if(cc0[i][0]=="01"){
				cc0.splice(i,1);
				console.log(cc0.length);
				
			}
		}
		console.log(cc0[1][0].indexOf("B"));
		for(var i=0;i<cc0.length;i++){
			console.log(cc[i][0]);
			if(cc0[i][0].indexOf("B")>=0){
				console.log(i);
				cc0.splice(i,1);
			}
		}
		
		console.log(cc0);
		console.log(cc);
		for (var i=0;i<cc.length;i++){
			cc[i][3]=cc[i][3]*0.01;
			
		}
		for (var i=0;i<cc0.length;i++){
			cc0[i][3]=cc0[i][3]*0.01;
			
		}
		
		//-----------住宿费---------
	
		if(zsffor!="0"){
			zsffor=zsffor*1;
			subzsf=zsffor;
			for(var i=0;i<cc0.length;i++){
				if(cc0[i][0]=="03"){
					cc0[i][3]=zsffor;
					console.log(cc0+"//***--");
					//alert(cc0);
				}
				
			}
		}
		//-----------住宿费---------
		for(var i=0;i<cc0.length;i++){
			fytjinfo +=cc0[i][0]+"$"+cc0[i][1]+"$"+cc0[i][3]+",";//拼接字符串$01$..$...
			var qyfylist = '<li class="xinxi-list"><span class="xinxi-title">'+cc0[i][1]+'</span><span class="xinxi-con">￥<span>'+cc0[i][3]+'</span>元</span></li>';
			$("#qtfylist").append(qyfylist);
			xgfycount+=cc0[i][3];
		}
		
		fytjinfo=fytjinfo.substring(0,fytjinfo.length-1);
		
		console.log(fytjinfo);
		console.log(xgfycount+"****---****");
		 $(".querenxinxi span").text(xgfycount);
		
		//--------------学费-----------
		for (var i=0;i<cc.length;i++){
			if(cc[i][0]=="01"){
				subxf=cc[i][3];
				subxfmc=cc[i][1];
			}
			
		}
		$("#xf").text(subxf);     	//填充学费
		$("#xfcount").text(subxf);	//填充学费总计
		//------------学费 end----------
		
		
		
		
		//---------床上用品----
		for (var i=0;i<cc.length;i++){
				if(cc[i][0]=="B1"){
					xufy=cc[i][3];
					xufymc=cc[i][1];
				}
			}
			$("#xgcsypjg").text(xufy);//--------选购床上用品费
			console.log(xufy+"***********");
		
		}
		
		console.log(xgfycount+"****---****");
			
		
		//-------床上用品end-------------
	
	
    var xh; // 流程序号
    var n; // 当前点击流程
    var liucheng;// 后端获取01234567对应12345678获取流程
    var benciliucheng; // 本次流程
    benciliucheng = liucheng ;
    var buttn = benciliucheng - 1;
    var isn1;
    
   console.log(subxf);
   
    
    // 获取流程
    $.ajax({
        type: "post",
        dataType: "json",
        url: "mobileStudentController.do?getProcess",
        success: function(data) {
            var obj = $.parseJSON(data.msg);
            for (var i = 0; i < obj.length; i++) {
                console.log("ok");
                console.log("流程ID：" + obj[i].id + "流程名称：" + obj[i].process_name);
                var liuchengName = obj[i].process_name;
                // var liuchengXH=obj[i].process_step;
                // console.log(liuchengXH);
                var liuchengTOU = '<li><span class="step">' + (i + 1) + '</span><span class="title">' + liuchengName + '</span></li>';
                $(".wizard-steps").append(liuchengTOU);
                if (grlc != "" && grlc != null && grlc != undefined && grlc != "null") {
                    if (obj[i].id == grlc) {
                        console.log("个人流程" + grlc);
                        console.log("I=" + i);
                        liucheng = i + 1;
                        console.log("流程" + liucheng);
                        var screenWidth= window.screen.width;
                    	var scrollwidth=screenWidth/3;
                    	$('#ctrlpoint').animate({
                    			scrollLeft:scrollwidth*liucheng-scrollwidth
                    	});
                        var oron = obj[i].endbs;
                        console.log(oron);
                        if (oron == "on") {
                            $("#page6").show().siblings().hide();

                        }
                    }
                } else {
                    liucheng = 0;
                    console.log(liucheng + "//////");
                }

            }
            benciliucheng = liucheng; // 流程控制
            // 默认状态 默认头部本步骤高亮 默认所获取的状态之前的页面不可见
            // 默认显示本次流程状态页面
            // 将按钮样式变化以及切换div封装为函数//初始状态下按钮
            function buttonclick(buttn) {
                buttn = benciliucheng - 1;
                if (buttn <= 0) {
                    buttn = 0;
                } else {
                    $(".spage").eq(buttn).find(".subbut").removeClass("subbut").addClass("subbut-visited").hide().next(".sub-non").show();
                    $(".spage").eq(benciliucheng).show().siblings().hide();
                    $(".spage").eq(buttn).prevAll().find(".subbut").removeClass("subbut").addClass("subbut-visited").hide().next(".sub-non").show();
                }
            }
            buttonclick(buttn); // 默认执行初始按钮状态；
            $(".spage").eq(liucheng).show().siblings().hide();

            // 定义顶部高亮封装为函数
            function gaoliangtop(n) {
                $('.wizard-steps li').eq(n).children().first().css("border-color", "#1296DB").css("background", "#1296DB").css("color", "#fff").parent().siblings().children(".step").css("background-color", "#CED1D6").css("border-color", "#CED1D6").css("color", "black");
                $(".wizard-steps  li").eq(n).children().last().css("color", "#1296DB").parent().siblings().children(".title").css("color", "#333");
                $(".wizard-steps li").eq(n).removeClass().addClass('wizard-steps li ' + "gaoliang").siblings().removeClass('wizard-steps li ' + "gaoliang");
                
                var screenWidth= window.screen.width;
        		var scrollwidth=screenWidth/3;
        		$('#ctrlpoint').animate({
        			scrollLeft:scrollwidth*n-scrollwidth
        		});

            
            
            }
            // 顶部左右滚动点击高亮代码 开始 默认状态
            // morenliucheng=liucheng
            var morenliucheng = liucheng; //
            // console.log(n);
            $('.wizard-steps li').eq(morenliucheng).children().first().css("border-color", "#1296DB").css("background", "#1296DB").css("color", "#fff").parent().siblings().children(".step").css("background-color", "#CED1D6").css("border-color", "#CED1D6").css("color", "black");
            $(".wizard-steps li").eq(morenliucheng).children().last().css("color", "#1296DB").parent().siblings().children(".title").css("color", "#333");
            $(".wizard-steps li").eq(morenliucheng).removeClass().addClass('wizard-steps li ' + "gaoliang").siblings().removeClass('wizard-steps li ' + "gaoliang");

            $(".wizard-steps li").click(function() {
                n = $(this).index();
                console.log(n + "n");
                console.log(liucheng + "liucheng");
                console.log(benciliucheng + "benciliucheng");
                if (n <= benciliucheng && n >= liucheng) {
                    $('.wizard-steps  li').eq(n).children().first().css("border-color", "#1296DB").css("background", "#1296DB").css("color", "#fff").parent().siblings().children(".step").css("background-color", "#CED1D6").css("border-color", "#CED1D6").css("color", "black");
                    $(".wizard-steps  li").eq(n).children().last().css("color", "#1296DB").parent().siblings().children(".title").css("color", "#333");
                    $(".wizard-steps  li").eq(n).removeClass().addClass('wizard-steps li ' + "gaoliang").siblings().removeClass('wizard-steps li ' + "gaoliang");
                    $(".spage").eq(n).show().siblings().hide();
                }

            });
         // 点击底部按钮 提交数据 跳转下一页 并禁用事件
            // page1
            $("#gerenxinxibut").unbind("click").on("click",function() {

            	 // 判断必填项是否为空
                    // 定义变量
                    var stmobile1 = $("#inputout p").html();
                    console.log(stmobile1);
                    if (stmobile1 == "null" || stmobile1 == "" || stmobile1 == undefined || stmobile1 == null) {
                        var mobile = $("#stMobile").val(); // 手机号
                        $("#inputout p").html("请输入手机号");
                    } else {
                        var mobile = sjh; // 手机号
                    }

                    var stmail = $("#inputout2 input").val();
                    console.log(stmail);
                    if (stmail == "null" || stmail == "" || stmail == undefined || stmail == null) {
                        var youxiang = $("#stmail").val();

                        $("#stmail").attr('placeholder', ' 请重新输入');
                    } else {
                        var youxiang = stmail;
                    }

                    console.log(mobile);
                    var syd = $("#stShengyuan").val(); // 生源地
                    var jtdz = $("#jiatingzhuzhi").val(); // 家庭住址
                    var jtmc1 = $("#jzxm1").val(); // 家长姓名123
                    var jtmc2 = $("#jzxm2").val();
                    var jtmc3 = $("#jzxm3").val();
                    var jtdh1 = $("#jzdh1").val(); // 电话123
                    var jtdh2 = $("#jzdh2").val();
                    var jtdh3 = $("#jzdh3").val();

                    var jtgx1 = $("#jzgx1").val(); // 关系123
                    var jtgx2 = $("#jzgx2").val();
                    var jtgx3 = $("#jzgx3").val();
                    var xssg = $("#stshengao").val(); // 身高
                    var xstz = $("#sttizhong").val(); // 体重
                    var fzcc = $("#fuzhuangchima").val(); // 服装尺码
                    var xzcc = $("#xiezichima").val(); // 鞋子尺码
                    
                    var grinfo = [{
                        "mobile": mobile,
                        "syd": syd,
                        "jtdz": jtdz

                    }];

                    var jtinfo = [{
                        "email": stmail,
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
                        "jtrks": 0,
                        "rjnsr": 0,
                        "gwbs": 0,
                        "jtlx": 0

                    }];

                    var otjt1;
                    if (jtmc1 != "" && jtdh1 != "" && jtgx1 != "") {
                        otjt1 = true;
                    } else {
                        otjt1 = false;
                        // alert("nono");
                    }

                    var otjt2;
                    if (jtmc2 != "" && jtdh2 != "" && jtgx2 != "") {
                        otjt2 = true;
                    } else {
                        otjt2 = false;
                        // alert("nono");
                    }

                    var otjt3;
                    if (jtmc3 != "" && jtdh3 != "" && jtgx3 != "") {
                        otjt3 = true;
                    } else {
                        otjt3 = false;
                        // alert("nono");
                    }
                    console.log(mobile);

                    if (stmail == "" || mobile == "" || syd == "" || jtdz == "" || xssg == "" || xstz == "" || fzcc == "none" || xzcc == "none") {
                        alert('带"*"的为必填项');
                    } else {
                        if (otjt1 == true || otjt2 == true || otjt2 == true) {
                        	$("#PAGE1zhezhao").stop().fadeIn();
			                $("#PAGE1main-quxiao").show();
			                $("#PAGE1main-querenbut").show();
			                $("#PAGE1main-quxiao").unbind().click(function() {
			                    $("#PAGE1zhezhao").stop().fadeOut();
			                    $("#PAGE1main-quxiao").hide();
			                    $("#PAGE1main-querenbut").hide();
			                });
			                $(".queren-wenzi p").text("是否确认提交？提交后不可更改！").css("margin-top", "10px").css("padding-left", "10px");
			                $("#PAGE1main-querenbut").unbind().click(function() {
			                   $(".jiazai").stop().fadeIn(1000);
                            // 报名，保存信息
                            // 报名方法AJAx
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
                                    if (bmsu == true) {
                                        // 显示加载
                                        $(".jiazai").stop().fadeOut(1000);
                                        // 隐藏遮罩层
                                        $("#PAGE1zhezhao").stop().fadeOut();
                                        $("#PAGE1main-quxiao").hide();
                                        $("#PAGE1main-querenbut").hide();
                                        // 跳转和样式
                                        // 开始
                                        $("#page1").stop().fadeOut();
                                        $("#page2").stop().fadeIn();
                                        $(".jiazai").stop().fadeOut(1000);
                                        n = 1;
                                        isn1 = n;
                                        gaoliangtop(n);

                                        benciliucheng++;
                                        buttonclick(buttn);
                                        $("#gerenxinxibut").removeClass("subbut").unbind().addClass("subbut-visited");
                                        // 跳转和样式
                                        // 结束
                                    } else {
                                        $(".jiazai").stop().fadeOut(1000);
                                        $('#fbbm-queren').stop().fadeIn();
                                        // $("#wenzi-con").text(obj);
                                        $("#baoming-fbbut").show();
                                        console.log("nono11");
                                        $("#wenzi-con p").text(data.msg);
                                        $("#baoming-fbbut").click(function() {
                                            $("#fbbm-queren").stop().fadeOut();
                                        });
                                    }
                                },
                                /** success * END */
                                error: function() {
                                    $(".jiazai").stop().fadeOut(1000);
                                    $('#fbbm-queren').stop().fadeIn();
                                    // $("#wenzi-con").text(obj);
                                    $("#baoming-fbbut").show();
                                    console.log("nono11");
                                    $("#wenzi-con p").text("连接超时！请稍后重试！");
                                    $("#baoming-fbbut").click(function() {
                                        $("#fbbm-queren").stop().fadeOut();
                                    });
                                }
                            });
                            // b报名方法end
			                });
                            

                        } else {
                            alert("请至少填写完整一位家长或监护人的信息！");

                        }
                    }
            });

            // page2缴费
            // 线下已缴费，线上不缴费直接下一步
            $("#xuefeinext").unbind().click(function() {
                // 显示加载动画
                $('.jiazai').stop().fadeIn();
                // ajax...
                // 学费缴费
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: "mobileStudentController.do?doSaveJF",
                    async: true,
                    success: function(data) {
                        console.log("点击缴费");
                        if (data.success == true) {

                            console.log(data.obj);
                            // 给后续的几个页面班级赋值
                            var banjimcORIGN = data.obj;
                            var bjmcORIGN = banjimcORIGN.split("-");
                            var bjmc = bjmcORIGN[1];
                            $(".bjmctop").text(bjmc);

                            // 跳转和样式
                            // 开始
                            $("#page2").stop().fadeOut();
                            $("#page3").stop().fadeIn();
                            $(".jiazai").stop().fadeOut(1000);
                            n = 2;
                            isn1 = n;
                            gaoliangtop(n);
                            $(this).removeClass("subbut").addClass("subbut-visited");
                            benciliucheng++;
                            buttonclick(buttn);
                            $("#xuefeizhifubut").unbind().addClass("subbut-visited");
                            // 跳转和样式
                            // 结束
                            // 获取宿舍信息
                            $.ajax({
                                type: "post",
                                dataType: "json",
                                url: "mobileStudentController.do?generatingDrom",
                                async: true,
                                success: function(data) {

                                    console.log(data);
                                    if (data.success == true) {
                                        console.log(typeof data.msg);
                                        var sshparse = JSON.parse(data.msg);
                                        console.log(sshparse[0].ssh);
                                        // ---0725
                                        // zhai
                                        // add
                                        var sshOrign = sshparse[0].ssh;
                                        var ssharr = sshOrign.split("-");
                                        console.log(ssharr);
                                        console.log(ssharr.length);
                                        var ssh = ssharr[0] + "-";
                                        for (var i = 1; i <= ssharr.length - 2; i++) {
                                            ssh += ssharr[i] + "-";
                                        }
                                        ssh = ssh.substring(0, ssh.length - 1);
                                        console.log(ssh);
                                        $("#ssh").text(ssh);
                                        $("#ssh0").text(ssh);

                                        // 关闭遮罩层
                                        $(".zhezhao-queren").stop().fadeOut();
                                        // 关闭加载动画】
                                        $('.jiazai').stop().fadeOut();
                                    } else {
                                        // 关闭遮罩层
                                        $(".zhezhao-queren").stop().fadeOut();
                                        // 关闭加载动画】
                                        $('.jiazai').stop().fadeOut();
                                        // 打开遮罩层
                                        // 提示失败
                                        $(".zhezhao-queren").stop().fadeIn();
                                        $("#querenbut-main").show();
                                        $("#main-quxiao").hide();
                                        $("#main-querenbut").hide();
                                        $("#querenbut-main").click(function() {
                                            $(".zhezhao-queren").stop().fadeOut();
                                        });
                                        $(".queren-wenzi p").text(data.msg).css("margin-top", "20px").css("padding-left", "10px");
                                        // 填充msg
                                        $("#ssh").text(data.msg);
                                        // 下一页按钮灰色
                                        $("#xuansushe").hide().next().show();
                                    }
                                },
                                error: function(data) {
                                    console.log(data);
                                }

                            });
                            // 获取宿舍信息end
                        } else {
                            // 关闭遮罩层
                            $(".zhezhao-queren").stop().fadeOut();
                            // 关闭加载动画】
                            $('.jiazai').stop().fadeOut();
                            // 打开遮罩层
                            // 提示失败
                            $(".zhezhao-queren").stop().fadeIn();
                            $("#querenbut-main").show();
                            $("#main-quxiao").hide();
                            $("#main-querenbut").hide();
                            $("#querenbut-main").click(function() {
                                $(".zhezhao-queren").stop().fadeOut();
                            });
                            $(".queren-wenzi p").text(data.msg).css("margin-top", "20px").css("padding-left", "10px");
                        }
                    },
                    error: function() {
                        // 关闭遮罩层
                        $(".zhezhao-queren").stop().fadeOut();
                        // 关闭加载动画】
                        $('.jiazai').stop().fadeOut();
                        // 打开遮罩层
                        // 提示失败
                        $(".zhezhao-queren").stop().fadeIn();
                        $("#querenbut-main").show();
                        $("#main-quxiao").hide();
                        $("#main-querenbut").hide();
                        $("#querenbut-main").click(function() {
                            $(".zhezhao-queren").stop().fadeOut();
                        });
                        $(".queren-wenzi p").text(data.msg).css("margin-top", "20px").css("padding-left", "10px");

                    }
                });

            });

            // 线下未交费，线上缴费
            $("#xuefeizhifubut").unbind('click').click(function() {
                // 显示遮罩层
                $(".zhezhao-queren").stop().fadeIn();
                $("#main-quxiao").show();
                $("#main-querenbut").show();
                $("#querenbut-main").hide();
                $("#main-quxiao").click(function() {
                    $(".zhezhao-queren").stop().fadeOut();
                });
                $(".queren-wenzi p").text("请点击确定按钮进行支付！").css("margin-top", "20px").css("padding-left", "10px");
                $("#main-querenbut").unbind('click').click(function() {
                    // 显示加载动画
                    $('.jiazai').stop().fadeIn();
                    // ajax...
                    // 学费缴费
                    var xutjinfo = "01"+"$"+subxfmc+"$"+subxf;
                   // alert(xutjinfo);
                    var pagetitle = "学费";
                    var xfcount=subxf;
                    //page href缴费跳转
                    window.location.href="mobileStudentController.do?getOrderCode&orderCode="+base64(xutjinfo)+"&title="+base64(pagetitle)+"&sumCount="+base64(xfcount)+"&type=1";
              });
            });

            // page3 跳转下一步
            $("#xuansushe").click(function() {
                // 下一步
                // 跳转和样式 开始
                $("#page3").stop().fadeOut();
                $("#page4").stop().fadeIn();
                $(".jiazai").stop().fadeOut(1000);
                n = 3;
                isn1 = n;
                gaoliangtop(n);
                $(this).removeClass("subbut").addClass("subbut-visited");
                benciliucheng++;
                buttonclick(buttn);
                $("#xuefeizhifubut").unbind().addClass("subbut-visited");
                // 跳转和样式 结束
            });

            // page4 自选床上用品 保险 并缴费
            // 下一步
            $("#tjxg1").unbind().click(function() {
            	 // 跳转和样式
                // 开始
                $("#page4").stop().fadeOut();
                $("#page5").stop().fadeIn();
                $(".jiazai").stop().fadeOut(1000);
                n = 4;
                isn1 = n;
                gaoliangtop(n);
                $("#tjxgnext").removeClass("subbut").addClass("subbut-visited").unbind();
                benciliucheng++;
                buttonclick(buttn);

                // 跳转和样式
                // 结束
            });
            
            $("#tjxgnext").unbind().click(function() { //缴费动作
                // 显示遮罩层
                $(".zhezhao-queren").stop().fadeIn();
                $("#main-quxiao0").show();
                $("#querenzhifu").show();
                $("#main-quxiao0").click(function() {
                    $(".zhezhao-queren").stop().fadeOut();
                });
                $(".queren-wenzi p").text("确认提交请点击确认按钮！").css("margin-top", "20px").css("padding-left", "10px");
                //给data赋值
               
                var xgtjinfo=fytjinfo;
                var pagetitle="其他缴费项目";
                var xgcount;
                xgcount=$("#xgcount").text();
                
                if(sfxgcsyp=="Y"){  //sfxgcsyp==Y就是有选购N是没有选购
                	xgtjinfo=fytjinfo+","+"B1"+"$"+xufymc+"$"+xufy; //选购
    			}else if(sfxgcsyp=="N"){  //没有选购
    				xgtjinfo=fytjinfo;
    			}


                
                $("#querenzhifu").unbind().click(function() {
                	
                	 if(sfxgcsyp=="Y"){  //sfxgcsyp==Y就是有选购N是没有选购
                		//如果全交了走下面
                		 window.location.href="mobileStudentController.do?getOrderCode&orderCode="+base64(xgtjinfo)+"&title="+base64(pagetitle)+"&sumCount="+base64(xgcount)+"&type=2";
                     	
         			}else if(sfxgcsyp=="N"){  //没有选购
         				//如果没有全交走这里
         				window.location.href="mobileStudentController.do?getOrderCode&orderCode="+base64(xgtjinfo)+"&title="+base64(pagetitle)+"&sumCount="+base64(xgcount)+"&type=3";
         	              
         			}//--end--

                 });
            });


            // 如果流程等于第一步则获取宿舍信息
            if (liucheng == 2) {
                // ajax
                // 获取宿舍信息
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: "mobileStudentController.do?generatingDrom",
                    async: true,
                    success: function(data) {

                        console.log(data);
                        if (data.success == true) {
                            console.log(typeof data.msg);
                            var sshparse = JSON.parse(data.msg);
                            console.log(sshparse[0].ssh);
                            // ---0725
                            // zhai
                            // add
                            var sshOrign = sshparse[0].ssh;
                            var ssharr = sshOrign.split("-");
                            console.log(ssharr);
                            console.log(ssharr.length);
                            var ssh = ssharr[0] + "-";
                            for (var i = 1; i <= ssharr.length - 2; i++) {
                                ssh += ssharr[i] + "-";
                            }
                            ssh = ssh.substring(0, ssh.length - 1);
                            console.log(ssh);
                            $("#ssh").text(ssh);
                            $("#ssh0").text(ssh);
                            // 关闭遮罩层
                            $(".zhezhao-queren").stop().fadeOut();
                            // 关闭加载动画】
                            $('.jiazai').stop().fadeOut();
                        } else {
                            // 关闭遮罩层
                            $(".zhezhao-queren").stop().fadeOut();
                            // 关闭加载动画】
                            $('.jiazai').stop().fadeOut();
                            // 打开遮罩层 提示失败
                            $(".zhezhao-queren").stop().fadeIn();
                            $("#querenbut-main").show();
                            $("#main-quxiao").hide();
                            $("#main-querenbut").hide();
                            $("#querenbut-main").click(function() {
                                $(".zhezhao-queren").stop().fadeOut();
                            });
                            $(".queren-wenzi p").text(data.msg).css("margin-top", "20px").css("padding-left", "10px");
                            // 填充msg
                            $("#ssh").text(data.msg);
                            // 下一页按钮灰色
                            $("#xuansushe").hide().next().show();
                        }
                    },
                    error: function(data) {
                        console.log(data);
                    }

                });
                // 获取宿舍信息end
            }
            // 如果流程等于第五步则加载第六步骤信息
            if (liucheng == 5 || liucheng == 3) {
                // 为下一页准备
                $.ajax({
                    type: "post",
                    dataType: "json",
                    timeout: 5000,
                    url: "mobileStudentController.do?getSSxx",
                    success: function(data) {
                        if (data.success == true) {
                            var obj = $.parseJSON(data.msg);
                            if (obj.bzr == "null" || obj.bzr == null) {
                                $("#bzr").html("—");
                            } else {
                                $("#bzr").html(obj.bzr);
                            }
                            if (obj.bzrdh == "null" || obj.bzrdh == null) {
                                $("#bzrdh").html("—");
                            } else {
                                $("#bzrdh").html(obj.bzrdh);
                            }
                            $("#bjmc").html(obj.bjmc);
                            // $("#bzr").html(obj.bzr);
                            // $("#bzrdh").html(obj.bzrdh);

                            // 第三流程给宿舍赋值
                            // ---0725
                            // zhai
                            // add
                            var sshOrign = obj.ssmc;
                            var ssharr = sshOrign.split("-");
                            console.log(ssharr);
                            console.log(ssharr.length);
                            var ssh = ssharr[0] + "-";
                            for (var i = 1; i <= ssharr.length - 2; i++) {
                                ssh += ssharr[i] + "-";
                            }
                            ssh = ssh.substring(0, ssh.length - 1);
                            console.log(ssh);
                            $("#ssmc").text(ssh);
                            $("#ssh0").text(ssh); //给流程四宿舍赋值 liucheng==4

                            // 栋
                            // var ssmcstr =
                            // obj.ssmc;
                            // if(ssmcstr !=
                            // null && ssmcstr
                            // != "null" &&
                            // ssmcstr != "" &&
                            // ssmcstr !=
                            // undefined &&
                            // ssmcstr !=
                            // "undefined") {
                            // var ldmcLocation
                            // =
                            // ssmcstr.indexOf("栋")
                            // + 1;
                            // var xbbldmc =
                            // ssmcstr.substring(0,
                            // ldmcLocation);
                            // var xbbLocation =
                            // ssmcstr.indexOf("-")
                            // + 1;
                            //
                            // var xbbLength =
                            // ssmcstr.length;
                            // var ldmc =
                            // xbbldmc.substring(xbbLocation,
                            // xbbLength);
                            // console.log(ldmc);
                            // $("#ldmc").html(ldmc);
                            // }
                            var ifyaoshi = obj.yslq;
                            if (ifyaoshi == "N") {
                                $("#yaoshi").html("否");
                            } else {
                                $("#yaoshi").html("是");
                            }

                        } else {
                            // alert("数据异常");
                        }
                    },
                    error: function(msg) {
                        // alert("error:" +
                        // msg);
                        alert("刷新频率过快！");
                    },
                    complete: function(XMLHttpRequest, status) { // 请求完成后最终执行参数
                        if (status == 'timeout') { // 超时,status还有success,error等值的情况
                            // alert("连接超时");
                        }
                    }
                });

            }

            // page5 到校登记
            // 抵校信息页 radio样式控制 赋值
            $(".radio-wrap").click(function() {
                $(this).siblings().children(".radio-button").removeClass("radio-but-on");
                $(this).children(".radio-button").addClass("radio-but-on");
            });
            // baodao
            var baodao = $('input:radio[name="baodao"]:checked').val();
            $("#baodao1").click(function() {
                baodao = "准时到校";
            });
            $("#baodao2").click(function() {
                baodao = "延迟到校";
            });
            // 到校时间
            // jiaotong
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
            // peitong
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
            // dixiao butpage7
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
            // 提交信息
            $("#dixiaobut").click(function() {
                $(".jiazai").stop().fadeIn(800);
                // 为下一页准备 获取信息
                $.ajax({
                    type: "post",
                    dataType: "json",
                    timeout: 5000,
                    url: "mobileStudentController.do?getSSxx",
                    success: function(data) {
                        if (data.success == true) {
                            var obj = $.parseJSON(data.msg);
                            if (obj.bzr == "null" || obj.bzr == null) {
                                $("#bzr").html("—");
                            } else {
                                $("#bzr").html(obj.bzr);
                            }
                            if (obj.bzrdh == "null" || obj.bzrdh == null) {
                                $("#bzrdh").html("—");
                            } else {
                                $("#bzrdh").html(obj.bzrdh);
                            }
                            $("#bjmc").html(obj.bjmc);
                            // $("#bzr").html(obj.bzr);
                            // $("#bzrdh").html(obj.bzrdh);
                            // ---0725
                            // zhai
                            // add
                            var sshOrign = obj.ssmc;
                            var ssharr = sshOrign.split("-");
                            console.log(ssharr);
                            console.log(ssharr.length);
                            var ssh = ssharr[0] + "-";
                            for (var i = 1; i <= ssharr.length - 2; i++) {
                                ssh += ssharr[i] + "-";
                            }
                            ssh = ssh.substring(0, ssh.length - 1);
                            console.log(ssh);
                            $("#ssmc").html(ssh);
                            var ssmcstr = obj.ssmc;
                            if (ssmcstr != null && ssmcstr != "null" && ssmcstr != "" && ssmcstr != undefined && ssmcstr != "undefined") {
                                var ldmcLocation = ssmcstr.indexOf("栋") + 1;
                                var xbbldmc = ssmcstr.substring(0, ldmcLocation);
                                var xbbLocation = ssmcstr.indexOf("-") + 1;
                                var xbbLength = ssmcstr.length;
                                var ldmc = xbbldmc.substring(xbbLocation, xbbLength);
                                console.log(ldmc);
                                $("#ldmc").html(ldmc);
                            }

                            var ifyaoshi = obj.yslq;
                            if (ifyaoshi == "N") {
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
                        // alert("error:"
                        // +
                        // msg);
                        alert("刷新频率过快！");
                    },
                    complete: function(XMLHttpRequest, status) { // 请求完成后最终执行参数
                        if (status == 'timeout') { // 超时,status还有success,error等值的情况
                            alert("连接超时");
                        }
                    }
                });

                console.log(chezhan);
                // 判断非空
                if (baodao != null && dixiaoTime != undefined && jiaotong != null && peitong != null && chezhan != "" && chezhan != "none" && chezhan != undefined) {
                    // ajax
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
                    }];
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
                            n = 5;
                            gaoliangtop(n);
                            benciliucheng++;
                            $(".jiazai").stop().fadeOut(800);
                            $("#dixiaobut").removeClass("subbut").addClass("subbut-visited").unbind();

                            $("#page5").stop().fadeOut();
                            $("#page6").stop().fadeIn();
                        },
                        error: function(data) {
                            console.log(data.msg);
                        }
                    });

                } else {
                    $(".jiazai").stop().fadeOut(800);
                    $('#Xqueren').stop().fadeIn();
                    $("#wenzi-con p").text("有未作答的项！");
                    $("#Xbbut").show();
                    // $("#wenzi-con
                    // p").text("分班失败！请联系xxx后继续进行报道流程");
                    $("#Xbbut").click(function() {
                        $("#Xqueren").stop().fadeOut();
                    });
                }

            });
        },
        error: function(msg) {
            // alert("error:" + msg);
            alert("刷新频率过快！");
        },
        complete: function(XMLHttpRequest, status) { // 请求完成后最终执行参数
            if (status == 'timeout') { // 超时,status还有success,error等值的情况
                alert("连接超时");
            }
        }
    });

    // 判断性别
    if (xb == 1) {
        $("#xb").text("男");
    } else {
        $("#xb").text("女");
    }

    // 判断是否单招
    if (dz == "N") {
        $("#dz").text("否");
    } else {
        $("#dz").text("是");
    }

    // 判断是否领钥匙
    if (isbddone == "N") {
        $("#yuanxi").text("否");
    } else {
        $("#yuanxi").text("是");
    }

    // 基本信息填手机号隐藏显示
    var shoujihao;
    $("#inputout").click(function() {
        $("#inputout p").hide().parent().children().last().show().css("border", "0").css("text-align", "right").css("color", "#555");
    });
    if (stmobile != "null" && stmobile != "") {
        shoujihao = stmobile;
        $("#inputout p").html(shoujihao);
    }

    $("#inputout input").blur(function() {
        shoujihao = $("#inputout input").val();

        console.log(shoujihao);
        if (shoujihao != "") {
            // alert("ok");
            $("#inputout p").html(shoujihao);
        } else {
            // alert("no");
            shoujihao = sjh;
            $("#inputout p").html(shoujihao);
        }

        $("#inputout input").hide().prev().show().css("color", "#555");

    });

    /*
					 * //新增内容2017-06-21---------start
					 * 
					 * //家庭信息四项控制 家庭人口数 人均年收入 过往病史 家庭类型 //家庭人口数 if(jtrks1 == "" ||
					 * jtrks1 == null || jtrks1 == "null") {
					 * $(".jtrks").prev().text("请输入家庭人口数"); } else {
					 * $(".jtrks").prev().text(jtrks1); $(".jtrks").val(jtrks1); };
					 * 
					 * $(".inputprks").click(function() {
					 * $(this).hide().next().show().focus().css("border",
					 * "0").css("text-align", "right").css("color", "#555");;
					 * });
					 * 
					 * $(".jtrks").blur(function() { var jtrksval =
					 * $(this).val(); if(jtrksval == "" || isNaN(jtrksval) ==
					 * true) { $(this).hide().prev().show().text("请输入家庭人口数");
					 * $(".jtrks").val(""); } else {
					 * $(this).hide().prev().show().text(jtrksval); }
					 * 
					 * }); //人均年收入 if(rjnsr1 == "" || rjnsr1 == null || rjnsr1 ==
					 * "null") { $(".rjnsr").prev().text("请输入人均年收入"); } else {
					 * $(".rjnsr").prev().text(rjnsr1); $(".rjnsr").val(rjnsr1); };
					 * 
					 * $(".inputpnsr").click(function() {
					 * $(this).hide().next().show().focus().css("border",
					 * "0").css("text-align", "right").css("color", "#555");;
					 * });
					 * 
					 * $(".rjnsr").blur(function() { var jtnsrval =
					 * $(this).val(); if(jtnsrval == "" || isNaN(jtnsrval) ==
					 * true) { $(this).hide().prev().show().text("请输入人均年收入");
					 * $(".rjnsr").val(""); } else {
					 * $(this).hide().prev().show().text(jtnsrval); }
					 * 
					 * }); //过往病史 if(gwbs1 == "" || gwbs1 == null || gwbs1 ==
					 * "null") { $(".gwbs").prev().text("请输入过往病史"); } else {
					 * $(".gwbs").prev().text(gwbs1); $(".gwbs").val(gwbs1); };
					 * 
					 * $(".inputpbs").click(function() {
					 * $(this).hide().next().show().focus().css("border",
					 * "0").css("text-align", "right").css("color", "#555");;
					 * });
					 * 
					 * $(".gwbs").blur(function() { var jtgwbsval =
					 * $(this).val(); if(jtgwbsval == "") {
					 * $(this).hide().prev().show().text("请输入过往病史"); } else {
					 * $(this).hide().prev().show().text(jtgwbsval); }
					 * 
					 * });
					 */
    // 基本信息填QQ邮箱QQmail隐藏显示 财经
    // 邮箱二次赋值
    var stmail = email // fuzhi
    if (stmail != "" && stmail != "null" && stmail != undefined) {
        $("#inputout2 p").text(stmail);
        $(".youxiang").val(stmail);

    } else {
        $("#inputout2 p").text("请输入邮箱");
        $(".youxiang").val();
    }

    var youxiang;
    $("#inputout2").click(function() {
        $("#stMail").focus();
        $("#inputout2 p").hide().parent().children().last().show().css("border", "0").css("text-align", "right").css("color", "#555");
    });

    $("#stMail").blur(function() {
        $("#inputout2 p").text("");
        youxiang = $("#inputout2 input").val();

        if (!youxiang.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {

            $("#stMail").val("").attr('placeholder', '邮箱格式不正确 请重新输入');
        }

        /*
										 * console.log(youxiang); if(youxiang !=
										 * "") { //alert("ok"); $("#inputout2
										 * p").html(youxiang); } else {
										 * //alert("no"); youxiang = "请输入邮箱";
										 * $("#inputout2 p").html(youxiang); }
										 */

    });

    // select默认加载
    /*
					 * if(jtlx1 != "" && jtlx1 != "null" && jtlx1 != null &&
					 * jtlx1 != undefined && jtlx1 != "undefined") {
					 * 
					 * var jtlxi for(jtlxi = 0; jtlxi < 9; jtlxi++) { var xxxs =
					 * $("#jtlxselect option").eq(jtlxi).text(); if(jtlx1 ==
					 * xxxs) { console.log(jtlxi + "now");
					 * document.getElementById("jtlxselect")[jtlxi].selected =
					 * true; $("#jtlxselect").val(jtlx1); }; }; };
					 */
    // end
    // 生源地
    $("#inputout1").click(function() {
        $("#inputout1 p").hide().parent().children().last().show().css("border", "0").css("text-align", "right").css("color", "#555");
    });

    $("#inputout1 input").blur(function() {
        var shengyuandi = $("#inputout1 input").val();
        console.log(shengyuandi);
        if (shengyuandi != "") {
            // alert("ok");
            $("#inputout1 p").html(shengyuandi);
        } else {
            // alert("no");
            $("#inputout1 p").html("请输入");
        }

        $("#inputout1 input").hide().prev().show().css("color", "#555");

    });
    
   
    
    
    
    // 贷款选项卡高亮
    $(".daikuan-left").click(function() {
        $(".daikuan-left").removeClass("daikuan-gaoliang-no").addClass("daikuan-gaoliang").next().addClass("daikuan-gaoliang-no");
        $("#daikuan1").next().stop().fadeOut(200).prev().stop().fadeIn(200);
    });

    $(".daikuan-right").click(function() {
        $(".daikuan-right").removeClass("daikuan-gaoliang-no").addClass("daikuan-gaoliang").prev().addClass("daikuan-gaoliang-no");
        $("#daikuan2").prev().stop().fadeOut(200).next().stop().fadeIn(200);
    });

    // 个人信息展开隐藏
    $(".zhankai").children(".jiantou-geren").addClass("xiala-down");
    $(".zhankai").click(function() {
        $(this).prev().stop().slideToggle();
        $(this).children(".jiantou-geren").toggleClass("xiala-down").toggleClass("xiala-up");
    });

    // 绿色通道 缴费下拉箭头
    $(".feiyongxinxi li").children(".feiyong-list-wrap").children(".feiyong-con").children(".xiala").addClass("xiala-down");
    $(".feiyongxinxi li").click(function() {
        $(this).children(".feiyongxiangqing").stop().slideToggle(200);
        $(this).children(".feiyong-list-wrap").children(".feiyong-con").children(".xiala").toggleClass("xiala-down").toggleClass("xiala-up");
    });

    // 控制贷款申请文字在200字以内
    $("#shenqing-shuoming").bind('input propertychange',
    function() {
        var curLength = $("#shenqing-shuoming").val().length;

        if (curLength > 200) {
            var num = $("#shenqing-shuoming").val().substr(0, 200);
            $("#shenqing-shuoming").val(num);
            alert("已超过限制字数（200字）！");
        }

    });

    // 控制家庭住址在50字
    $("#jiatingzhuzhi").bind('input propertychange',
    function() {
        var curLength = $("#jiatingzhuzhi").val().length;

        if (curLength > 50) {
            var num = $("#jiatingzhuzhi").val().substr(0, 50);
            $("#jiatingzhuzhi").val(num);
            alert("已超过限制字数（50字）！");
        }

    });

    // 是否购买单选框样式切换
    $(".radio-but").click(function() {
        $(this).parent().siblings().children(".radio-but").removeClass("radio-but-on").parent().siblings().children(".radio-but").addClass("radio-but-on");
    });

    // 是否选购页面切换 给假的radio赋值 改变假的radio样式
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
    //---控制‘我已线下缴费按钮’显示隐藏
    if(liucheng!=1&&liucheng!=3){
    	console.log(liucheng+"***///***");
    	$(".yanzheng-zhifu").hide();
    }
    
    //---验证是否缴费，若已缴费则刷新页面，若无则提示
    $("#jfconfirm").unbind().click(function(){
    	if(sfjf=="Y"){
    		alert("你已缴费！无需该操作")
    	}else{
    		$.ajax({
       		 type: "post",
                url: "mobileStudentController.do?delsebs",
                async: true,
                dataType:'json',
                success:function(data){
               	 console.log(typeof data);
               	 
               	 if(data.success==true){
               		reloadout();
               	 }else{
               		 alert(data.msg);
               		 console.log(data.msg);
               	 }
                }
                
       	});
    	}
    	
    });
    // 刷新方法
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
    // 点击刷新，刷新按钮旋转
    $(".shuaxin").toggle(function() {
        $(".shuaxin-tubiao").removeClass("xuanzhuan1").addClass("xuanzhuan0");
        setTimeout(reloadout(), 900);
    },
    function() {
        $(".shuaxin-tubiao").removeClass("xuanzhuan0").addClass("xuanzhuan1");
        setTimeout(reloadout(), 900);
    });

    // 个人信息页面家庭成员
    $(".jiating-list-wrap").children(".jiating-con").children(".xiala").addClass("xiala-down");
    $(".jiating-list-wrap").click(function() {
        $(this).next(".jiatingxiangqing").stop().slideToggle(200);
        $(this).children(".jiating-con").children(".xiala").toggleClass("xiala-down").toggleClass("xiala-up");
    });
    // append服装尺码
    for (var chima = 140; chima <= 200; chima = chima + 5) {
        // console.log(chima);
        var fzcmsel = '<option value="' + chima + '">' + chima + '</option>';
        $("#fuzhuangchima").append(fzcmsel);
    }

    // append鞋子尺码
    for (var chima = 34; chima <= 50; chima = chima + 1) {
        // console.log(chima);
        var xzcmsel = '<option value="' + chima + '">' + chima + '</option>';
        $("#xiezichima").append(xzcmsel);
    }

    // 验证家长信息输入INPUT格式是否正确 (控制长度在20以内)
    $(".inputjzxm").change(function() {
        var inputlen = $(this).val().length;
        if (inputlen >= 20) {
            $(this).val("").attr('placeholder', '姓名格式不正确 请重新输入').addClass("invalid");
        }
    })

    // 判断手机号是否是11位并且是否是数字并且是否是1开头的数字
    $(".inputjzdh").change(function() {
        var inputlen = $(this).val().length;
        var inputcon = $(this).val();

        var firststr = inputcon.substr(0, 1); // 获取手机号的第一位，判断是否是1
        if (isNaN(inputcon) == true || inputlen > 11 || firststr != 1) {
            $(this).val("").attr('placeholder', '手机号格式不正确 请重新输入').addClass("invalid");

        }
    });
    // 判断亲属关系最长输入5个字
    $(".inputjzgx").change(function() {
        var inputlen = $(this).val().length;
        if (inputlen > 5) {
            $(this).val("").attr('placeholder', '亲属关系格式不正确 请重新输入').addClass("invalid");
        }
    })

    // 判断身高体重最长3位数 必须为数字 不能0开头
    $(".sgtz").change(function() {
        var inputlen = $(this).val().length;
        var inputcon = $(this).val();
        var firststr = inputcon.substr(0, 1);
        if (isNaN(inputcon) == true || inputlen > 3 || firststr == 0) {
            $(this).val("").attr('placeholder', '输入格式不正确 请重新输入').addClass("invalid");

        }
    });

    // 个人信息中头像变大
    $(".tobig").click(function() {
        // alert(imgpath5);
        // $(this).attr("style","background:url('"+imgpath5+"'");
        $(this).stop().animate({
            height: '0px',
        },
        300);
        $(this).parent().prev().show().stop().animate({
            height: '200px'
        },
        300);
        $(".upicon").show().stop().animate({
            right: '30px'
        },
        300);
    });
    // 个人信息头像变小
    $(".bigTouxiang").click(function() {
        // $(this).attr("style","background:url('"+imgpath5+"');width:130px;height:180px;");
        $(this).stop().animate({
            height: '0px'
        },
        300);
        $(this).next().children(".tobig").stop().animate({
            height: '45px'
        },
        300);
        $(".upicon").stop().animate({
            right: '-30px'
        },
        300);
        setTimeout('$(".upicon").hide();', 300);

    })

    // 是否选购床上用品动画控制
    $(".sfxuangouyp").click(function() {
        $(this).children(".duigou").show().prev().css("color", "#1296DB").css("font-weight", "bloder").parent().siblings().children(".duigou").hide().prev().css("color", "#555").css("font-weight", "normal");
    });

    // --0725 zhai add change
   
   

    $(document).ready(function() {

        sfxgcsyp = $('input:radio[name="xgcsyp"]:checked').val();
        sfxgcsyp = "N";
        sfxgbx = $('input:radio[name="xgbx"]:checked').val();
        sfxgbx = "N";
        $("#bxgcsyp").click(function() {
            sfxgcsyp = "N";
            csypf = 0;
            console.log(csypf);
            zjje =  csypf +xgfycount;
            $(".querenxinxi span").text(zjje);
            if (zjje == 0) {
                console.log("总计金额为0");

                
            } else {
                console.log("总计金额不为0");

               
            }
        });
        $("#xgcsyp").click(function() {
            sfxgcsyp = "Y";
            csypf = xufy;;
            console.log(csypf);
            zjje =  csypf +xgfycount;
            $(".querenxinxi span").text(zjje);
            if (zjje == 0) {
                console.log("总计金额为0");

                
            } else {
                console.log("总计金额不为0");

               
            }
        });
        $("#bxgbx").click(function() {
            sfxgbx = "N";
            bxf = 0;
            console.log(bxf);
            zjje = zsf + csypf + bxf + jxf + sbf + tjf;
            $(".querenxinxi span").text(zjje);
            if (zjje == 0) {
                console.log("总计金额为0");

                $("#tjxg").hide();
                $("#tjxgnext").show();
            } else {
                console.log("总计金额不为0");

                $("#tjxg").show();
                $("#tjxgnext").hide();
            }
        });
        $("#xgbx").click(function() {
            sfxgbx = "Y";
            bxf = 120;
            console.log(bxf);
            zjje = zsf + csypf + bxf + jxf + sbf + tjf;
            $(".querenxinxi span").text(zjje);
            if (zjje == 0) {
                console.log("总计金额为0");

                $("#tjxg").hide();
                $("#tjxgnext").show();
            } else {
                console.log("总计金额不为0");

                $("#tjxg").show();
                $("#tjxgnext").hide();
            }
        });
    });

    if (zjje == 0) {
        console.log("总计金额为0");

        $("#tjxg").hide();
        $("#tjxgnext").show();
    } else {
        console.log("总计金额不为0");

        $("#tjxg").show();
        $("#tjxgnext").hide();
    }

    $("#tjxg").click(function() {
        console.log(zsf + csypf + bxf + jxf + sbf + tjf);

    });

});
function base64(input)
{
	
	var rv;
	rv = encodeURIComponent(input);
	rv = unescape(rv);
	rv = window.btoa(rv);
	return rv;
}
