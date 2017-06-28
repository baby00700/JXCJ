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
			if(xb == 1) {
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

		function formatDate(date, format) {
			var paddNum = function(num) {
				num += "";
				return num.replace(/^(\d)$/, "0$1");
			}
			//指定格式字符时间
			var cfg = {
				yyyy: date.getFullYear() //年 : 4位
					,
				yy: date.getFullYear().toString().substring(2) //年 : 2位
					,
				M: date.getMonth() + 1 //月 : 如果1位的时候不补0
					,
				MM: paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
					,
				d: date.getDate() //日 : 如果1位的时候不补0
					,
				dd: paddNum(date.getDate()) //日 : 如果1位的时候补0
					,
				hh: date.getHours() //时
					,
				mm: date.getMinutes() //分
					,
				ss: date.getSeconds() //秒
			}
			format || (format = "yyyy-MM-dd hh:mm:ss");
			return format.replace(/([a-z])(\1)*/ig, function(m) {
				return cfg[m];
			});
		}

		var curTime = formatDate(new Date(csrq), "yyyy-MM-dd");
		console.log(curTime);
		$("#csrq").text(curTime);