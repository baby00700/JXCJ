mobileStudentController.do?goLogin
C:\xampp\tomcat\webapps\jeewx\plug-in\weixin\yx\js
C:\xampp\tomcat\webapps\jeewx\webpage\own\yxmobile

plug-in/weixin/yx/css/login.css


wc_import_studentinfo //表名

//姓名
  private String xm;
  
//性别
  private String xb;
  
//出生日期
  private String csrq;
  
//是否报名
  private String sfbm;
  
//是否缴费
  private String sfjf;
  
//毕业中学
  private String byxx;
  
//班级名称
  private String bjmc;
  
//专业名称
  private String zymc;
  
//专业代码
  private String zydm;
  
//批次名称
  private String pcmc;
  
//年级
  private String year;
  
//准考证号
  private String zkzh;
  
//当前报名状态【电脑端】
  private String flowname;
  
//当前报名状态【手机端】
  private String mobileSetid;
  
//宿舍名称
  private String ssmc;
  
//宿舍ID
  private String ssid;
  
//流水号
  private String lsh;
  
//学号
  private String xh;
  
//身份证号
  private String sfzh;
  
//培养层次
  private String pycc;
 
 //省份名称
  private String sfmc;
 
 //报名日期
  private String bmrq;
  
//录取状态
  private String rqzt;
  
//是否绿色通道
  private String sflstd;
获取流程集合的方法 获取json集合方式 --------data.msg 
【调用方式与班级调用一致 可参考班级】
mobileStudentController.do?getProcess


//获取流程ID
 id

//获取流程名称
process_name

//流程 序号
process_step


是否缴费： sfjf    班主任电话：yddh
是否领取钥匙：sfcollar_key
辅导员：fdyxm