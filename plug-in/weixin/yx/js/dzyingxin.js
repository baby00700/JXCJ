$(document).ready(function(){
	
});

//个人信息展开隐藏
$(".zhankai").children(".jiantou-geren").addClass("xiala-down"); $(".zhankai").click(function() {
	$(this).prev().stop().slideToggle();
	$(this).children(".jiantou-geren").toggleClass("xiala-down").toggleClass("xiala-up");
});