<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script> 
        <script type="text/javascript" src="js/H-ui.js"></script>      	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="js/lrtk.js" type="text/javascript" ></script>
<title>订单详细</title>
</head>

<body>
<div class="margin clearfix">
<div class="Order_Details_style">
<div class="Numbering">订单编号:<b>NJHDXJ201509-001</b></div></div>
 <div class="detailed_style">
 <!--收件人信息-->
    <div class="Receiver_style">
     <div class="title_name">收件人信息</div>
     <div class="Info_style clearfix">
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 收件人姓名： </label>
         <div class="o_content">张孝全</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 收件人电话： </label>
         <div class="o_content">16543432343</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 收件地邮编： </label>
         <div class="o_content">104545</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 收件地址： </label>
         <div class="o_content">江苏南京市雨花台区郁金香软件大厦3懂3单元302室</div>
        </div>
     </div>
    </div>
    <!--订单信息-->
    <div class="product_style">
    <div class="title_name">产品信息</div>
    <div class="Info_style clearfix">
      <div class="product_info clearfix">
      <a href="#" class="img_link"><img src="products/p_3.jpg" /></a>
      <span>
      <a href="#" class="name_link">美果汇 美国进口嘎啦果苹果6粒装 加力果 姬娜果 伽利果 新鲜应季水果</a>
      <b>也称为姬娜果，饱满色艳，个头小</b>
      <p>规格：500g/斤</p>
      <p>数量：2kg</p>
      <p>价格：<b class="price"><i>￥</i>56</b></p>  
      <p>状态：<i class="label label-success radius">有货</i></p>   
      </span>
      </div>
      <div class="product_info clearfix">
      <a href="#" class="img_link"><img src="products/p_5.jpg" /></a>
      <span>
      <a href="#" class="name_link">美果汇 美国进口嘎啦果苹果6粒装 加力果 姬娜果 伽利果 新鲜应季水果</a>
      <b>也称为姬娜果，饱满色艳，个头小</b>
      <p>规格：39.9/5kg</p>
      <p>数量：2</p>
      <p>价格：<b class="price"><i>￥</i>69.9</b></p>  
      <p>状态：<i class="label label-success radius">有货</i></p>   
      </span>
      </div>
       <div class="product_info clearfix">
      <a href="#" class="img_link"><img src="products/p_8.jpg"/></a>
      <span>
      <a href="#" class="name_link">美果汇 美国进口嘎啦果苹果6粒装 加力果 姬娜果 伽利果 新鲜应季水果</a>
      <b>也称为姬娜果，饱满色艳，个头小</b>
      <p>规格：500g/斤</p>
      <p>数量：2kg</p>
      <p>价格：<b class="price"><i>￥</i>56</b></p>  
      <p>状态：<i class="label label-success radius">有货</i></p>   
      </span>
      </div>
    </div>
    </div>
    <!--总价-->
    <div class="Total_style">
     <div class="Info_style clearfix">
      <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 支付方式： </label>
         <div class="o_content">在线支付</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 支付状态： </label>
         <div class="o_content">等待付款</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 订单生成日期： </label>
         <div class="o_content">2016-7-5</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 快递名称： </label>
         <div class="o_content">中通快递</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 发货日期： </label>
         <div class="o_content">2016-7-19</div>
        </div>
        </div>
      <div class="Total_m_style"><span class="Total">总数：<b>10</b></span><span class="Total_price">总价：<b>345</b>元</span></div>
    </div>
    
    <!--物流信息-->
    <div class="Logistics_style clearfix">
     <div class="title_name">物流信息</div>
      <!--<div class="prompt"><img src="images/meiyou.png" /><p>暂无物流信息！</p></div>-->
       <div data-mohe-type="kuaidi_new" class="g-mohe " id="mohe-kuaidi_new">
        <div id="mohe-kuaidi_new_nucom">
            <div class="mohe-wrap mh-wrap">
                <div class="mh-cont mh-list-wrap mh-unfold">
                    <div class="mh-list">
                        <ul>
                            <li class="first">
                                <p>2015-04-28 11:23:28</p>
                                <p>妥投投递并签收，签收人：他人收 他人收</p>
                                <span class="before"></span><span class="after"></span><i class="mh-icon mh-icon-new"></i></li>
                            <li>
                                <p>2015-04-28 07:38:44</p>
                                <p>深圳市南油速递营销部安排投递（投递员姓名：蔡远发<a href="tel:18718860573">18718860573</a>;联系电话：）</p>
                                <span class="before"></span><span class="after"></span></li>
                            <li>
                                <p>2015-04-28 05:08:00</p>
                                <p>到达广东省邮政速递物流有限公司深圳航空邮件处理中心处理中心（经转）</p>
                                <span class="before"></span><span class="after"></span></li>
                            <li>
                                <p>2015-04-28 00:00:00</p>
                                <p>离开中山市 发往深圳市（经转）</p>
                                <span class="before"></span><span class="after"></span></li>
                            <li>
                                <p>2015-04-27 15:00:00</p>
                                <p>到达广东省邮政速递物流有限公司中山三角邮件处理中心处理中心（经转）</p>
                                <span class="before"></span><span class="after"></span></li>
                            <li>
                                <p>2015-04-27 08:46:00</p>
                                <p>离开泉州市 发往中山市</p>
                                <span class="before"></span><span class="after"></span></li>
                            <li>
                                <p>2015-04-26 17:12:00</p>
                                <p>泉州市速递物流分公司南区电子商务业务部已收件，（揽投员姓名：王晨光;联系电话：<a href="tel:13774826403">13774826403</a>）</p>
                                <span class="before"></span><span class="after"></span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
<div class="Button_operation">
				<button onclick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>返回上一步</button>
				
				<button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
            
            
 </div>
</div>
</body>
</html>
