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
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>交易金额</title>
</head>

<body>
<div class="margin clearfix">
 <div class="detailed_style clearfix">
 <em class="type"></em>
  <div class="shop_logo"><img src="images/detailnoimg.png" /></div>
   <ul class="shop_content clearfix">
    <li class="shop_name"><label class="label_name">店铺名称：</label><span class="info">天上人间服饰专卖店</span> 
    <div class="Authenticate"><i class="icon-yxrz"></i><i class="icon-yhk"></i><i class="icon-sjrz"></i><i class="icon-grxx"></i></div></li>
    <li><label class="label_name">店铺类型：</label><span class="info">个人店铺</span></li>
    <li><label class="label_name">店铺分类：</label><span class="info">服饰</span></li>
    <li><label class="label_name">申请时间：</label><span class="info">2016-4-3</span></li>
    <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="info">待审核</span></li>
    <li><label class="label_name">申请人姓名：</label><span class="info">张小泉</span></li>
    <li><label class="label_name">移动电话：</label><span class="info">13567678987</span></li>
    <li><label class="label_name">电子邮箱：</label><span class="info"></span></li>
    <li><label class="label_name">固定电话：</label><span class="info">025-56787876</span></li>
    <li><label class="label_name">身份证号：</label><span class="info">320568656465342423</span></li>
   </ul>
 </div>
 <div class="Store_Introduction">
  <div class="title_name">店铺介绍</div>
   <div class="info">
   淘宝店铺介绍怎么写，只写上一句话或一段话，再加上淘宝平台默认名片式的基本信息，和联系方式。简单明了。例如：
1、欢迎光临本店，本店新开张，诚信经营，只赚信誉不赚钱，谢谢。
2、本店商品均属正品，假一罚十信誉保证。欢迎广大顾客前来放心选购，我们将竭诚为您服务!
3、本店专门营销什么什么商品，假一罚十信誉保证。本店的服务宗旨是用心服务，以诚待人!
二、消息型的淘宝店铺介绍书写方式：
淘宝店铺介绍怎么写，就是将店铺最新的优惠活动发布在淘宝店铺介绍里，这种类型不但能吸引喜欢优惠活动的新买家，如果是时间段优惠更能促使买家下定决心，尽快购买。
   <br />
   四、详细型的淘宝店铺介绍书写方式：
淘宝店铺介绍怎么写，你不可能知道每个买家到你的淘宝店铺介绍页面里想了解什么，可以考虑把所有的都写进去。另外，还有购物流程、联系方式、物流方式、售后服务、温馨提示等等都统统写上去。但是一定要花时间好好排版。内容多，字体不能太大，正常就可以了，然后一段内容的标题要加粗或者加上颜色，比如给售后服务加粗，然后售后服务的内容则用正常字体，这样每段内容配上一个加粗标题，买家一点进淘宝店铺介绍，第一眼明显看到的都是几个加粗标题，能很快找到自己想了解的就有耐心看下去。就像本篇文章一样，没有一些加粗的字体，读者不从头读起，就找不到各段内容的主要针对点。
   </div>
 </div>
 <div class="Store_Introduction">
  <div class="title_name">其他认证</div>
  <div class="info">
   
  </div>
 </div>
 <div class="At_button">
				<button onclick="through_save('this','123');" class="btn btn-primary radius" type="submit">通  过</button>
				<button onclick="cancel_save();" class="btn btn-danger  btn-warning" type="button">拒  绝</button>
				<button onclick="return_close();" class="btn btn-default radius" type="button">返回上一步</button>
 </div>
</div>
</body>
</html>
<script>
//通过
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
 function through_save(obj,id){
	 layer.confirm('确认要开通该店铺吗？',function(index){
		layer.msg('已开通!',{icon:1,time:1000});
		location.href="Shops_Audit.html";
		parent.$('#parentIframe').css("display","none");
		parent.$('.Current_page').css({"color":"#333333"});
	});
	 
	 
	 }
	 
	 //返回操作
function return_close(){
	location.href="Shops_Audit.html";
	parent.$('#parentIframe').css("display","none");
	parent.$('.Current_page').css({"color":"#333333"});
	
	}
	 //拒绝
function cancel_save(){	
	var index = layer.open({
        type: 1,
        title: '内容',
		maxmin: true, 
		shadeClose:false,
        area : ['600px' , ''],
        content:('<div class="shop_reason"><span class="content">请说明拒绝该申请人申请店铺的理由，以便下次在申请时做好准备。</span><textarea name="请填写拒绝理由" class="form-control" id="form_textarea" placeholder="请填写拒绝理由" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">500</span>字</span></div>'),
		btn:['确定','取消'],
		yes: function(index, layero){	
		if($('.form-control').val()==""){
				layer.alert('回复内容不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			 }else{
				 layer.msg('提交成功!',{icon:1,time:1000});
				 layer.close(index);  
				 
				 }
		}
	})
	
	}
		/*字数限制*/
function checkLength(which) {
	var maxChars = 500; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //减去当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
</script>
