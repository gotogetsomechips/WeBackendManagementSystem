<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>
        	<link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link href="assets/css/codemirror.css" rel="stylesheet">
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
        		<!--[if !IE]> -->
		<script src="assets/js/jquery.min.js"></script>        
		<!-- <![endif]-->
           	<script src="assets/dist/echarts.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>            
       <title></title>
       </head>		
<body>
<div class="page-content clearfix">
 <div class="alert alert-block alert-success">
  <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
  <i class="icon-ok green"></i>欢迎使用<strong class="green">后台管理系统<small>(v1.2)</small></strong>,你本次登陆时间为2016年7月12日13时34分，登陆IP:192.168.1.110.	
 </div>
 <div class="state-overview clearfix">
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                      <a href="#" title="商城会员">
                          <div class="symbol terques">
                             <i class="icon-user"></i>
                          </div>
                          <div class="value">
                              <h1>34522</h1>
                              <p>商城用户</p>
                          </div>
                          </a>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol red">
                              <i class="icon-tags"></i>
                          </div>
                          <div class="value">
                              <h1>140</h1>
                              <p>分销记录</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol yellow">
                              <i class="icon-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <h1>345</h1>
                              <p>商城订单</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol blue">
                              <i class="icon-bar-chart"></i>
                          </div>
                          <div class="value">
                              <h1>￥34,500</h1>
                              <p>交易记录</p>
                          </div>
                      </section>
                  </div>
              </div>
             <!--实时交易记录-->
             <div class="clearfix">
              <div class="Order_Statistics ">
          <div class="title_name">订单统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">未处理订单：</td><td class="munber"><a href="#">0</a>&nbsp;个</td></tr>
           <tr><td class="name">待发货订单：</td><td class="munber"><a href="#">10</a>&nbsp;个</td></tr>
           <tr><td class="name">待结算订单：</td><td class="munber"><a href="#">13</a>&nbsp;个</td></tr>
           <tr><td class="name">已成交订单数：</td><td class="munber"><a href="#">26</a>&nbsp;个</td></tr>
           <tr><td class="name">交易失败：</td><td class="munber"><a href="#">26</a>&nbsp;个</td></tr>
           </tbody>
          </table>
         </div> 
         <div class="Order_Statistics">
          <div class="title_name">商品统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">商品总数：</td><td class="munber"><a href="#">340</a>&nbsp;个</td></tr>
           <tr><td class="name">回收站商品：</td><td class="munber"><a href="#">10</a>&nbsp;个</td></tr>
           <tr><td class="name">上架商品：</td><td class="munber"><a href="#">13</a>&nbsp;个</td></tr>
           <tr><td class="name">下架商品：</td><td class="munber"><a href="#">26</a>&nbsp;个</td></tr>
           <tr><td class="name">商品评论：</td><td class="munber"><a href="#">21s6</a>&nbsp;条</td></tr>

           </tbody>
          </table>
         </div> 
         <div class="Order_Statistics">
          <div class="title_name">会员登陆统计信息</div>
           <table class="table table-bordered">
           <tbody>
           <tr><td class="name">注册会员登陆：</td><td class="munber"><a href="#">3240</a>&nbsp;次</td></tr>
           <tr><td class="name">新浪会员登陆：</td><td class="munber"><a href="#">1130</a>&nbsp;次</td></tr>
           <tr><td class="name">支付宝登陆：</td><td class="munber"><a href="#">1130</a>&nbsp;次</td></tr>
           <tr><td class="name">QQ会员登陆：</td><td class="munber"><a href="#">1130</a>&nbsp;次</td></tr>
           </tbody>
          </table>
         </div> 
             <!--<div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div> -->
         <div class="news_style">
          <div class="title_name">最新消息</div>
          <ul class="list">
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">6月共处理订单3451比，作废为...</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
           <li><i class="icon-bell red"></i><a href="#">后台系统找那个是开通了。</a></li>
          </ul>
         </div> 
         </div>
 <!--记录-->
 <div class="clearfix">
  <div class="home_btn">
     <div>
     <a href="picture-add.jsp" title="添加商品" class="btn  btn-info btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-addp.png" /></i>
     <h5 class="margin-top">添加商品</h5>
     </a>
     <a href="Category_Manage.jsp" title="产品分类" class="btn  btn-primary btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-cpgl.png" /></i>
     <h5 class="margin-top">产品分类</h5>
     </a>
     <a href="admin_info.jsp" title="个人信息" class="btn  btn-success btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-grxx.png" /></i>
     <h5 class="margin-top">个人信息</h5>
     </a>
     <a href="Systems.jsp" title="系统设置" class="btn  btn-info btn-sm no-radius">
     <i class="bigger-200"><img src="images/xtsz.png" /></i>
     <h5 class="margin-top">系统设置</h5>
     </a>
     <a href="Order_handling.jsp" title="商品订单" class="btn  btn-purple btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-gwcc.png" /></i>
     <h5 class="margin-top">商品订单</h5>
     </a>
     <a href="picture-add.jsp" title="添加广告" class="btn  btn-pink btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-ad.png" /></i>
     <h5 class="margin-top">添加广告</h5>
     </a>
      <a href="article_add.jsp" title="添加文章" class="btn  btn-info btn-sm no-radius">
     <i class="bigger-200"><img src="images/icon-addwz.png" /></i>
     <h5 class="margin-top">添加文章</h5>
     </a>
     </div>
  </div>
 
 </div>
   
     </div>
</body>
</html>
<script type="text/javascript">
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.no-radius').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-640);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-640);
		});
 });
	 
	 
 </script>   