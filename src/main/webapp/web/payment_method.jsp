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
		<script src="assets/layer/layer.js" type="text/javascript" ></script>   
        <script src="assets/js/ace-extra.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>  
        <script src="assets/dist/echarts.js"></script>		 
        <script type="text/javascript" src="js/H-ui.js"></script>          	
              
<title>支付方式</title>
</head>

<body>
<div class="margin clearfix">
 <div class="defray_style">
  <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert"><i class="fa fa-remove"></i></button>注：该支付方式启用并不能正常使用，需要开通支付功能才能使用相应的支付方式，</div>
    <div class="border clearfix">
     <span class="l_f">
        <a href="javascript:ovid()" onclick="add_payment()" class="btn btn-primary Pay_add"><i class="fa fa-credit-card"></i>&nbsp;添加支付方式</a>
       </span>
    </div>
    <!--支付列表-->
    <div class="defray_list cover_style clearfix" >
     <div class="type_title">支付方式</div>
      <div class="defray_content clearfix">
       <ul class="defray_info">
       <li class="defray_name">支付宝</li>
        <li class="name_logo"><img src="products/black/zhifb.jpg"  width="100%" height="150px;" /> </li>
        <li class="description">支付宝（中国）网络技术有限公司是国内领先的第三方支付平台，致力于提供“简单、安全、快速”的支付解决方案</li>
        <li class="select">
        <label><input name="form-field-radio" type="radio" class="ace" checked="checked"><span class="lbl">启用</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">关闭</span></label>
        </li>
        <li class="operating">
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;删除</a>
         <a href="javascript:ovid()" class="btn btn-success"><i class="fa  fa-edit "></i>&nbsp;设置</a>
        </li>
       </ul>
       <ul class="defray_info">
       <li class="defray_name">微信支付</li>
        <li class="name_logo"><img src="products/black/weixin.jpg"  width="100%" height="150px;" /> </li>
        <li class="description">微信支付是集成在微信客户端的支付功能，用户可以通过手机完成快速的支付流程。</li>
        <li class="select">
        <label><input name="form-field-radio1" type="radio" class="ace" checked="checked"><span class="lbl">启用</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <label><input name="form-field-radio1" type="radio" class="ace"><span class="lbl">关闭</span></label>
        </li>
        <li class="operating">
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;删除</a>
       <!-- <a href="javascript:ovid()" class="btn btn-success details_btn"><i class="fa  fa-newspaper-o "></i>&nbsp;详细</a>-->
        </li>
       </ul>
       <ul class="defray_info">
       <li class="defray_name">银联</li>
        <li class="name_logo"><img src="products/black/yinglian.jpg"  width="100%" height="150px;" /> </li>
        <li class="description">中国银联是中国银行卡联合组织，通过银联跨行交易清算系统，实现商业银行系统间的互联互通和资源共享，保证银行卡跨行、跨地区和跨境的使用。</li>
        <li class="select">
        <label><input name="form-field-radio2" type="radio" class="ace" checked="checked"><span class="lbl">启用</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <label><input name="form-field-radio2" type="radio" class="ace"><span class="lbl">关闭</span></label>
        </li>
        <li class="operating">
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;删除</a>
        <a href="javascript:ovid()" name="Payment_details.html" title="银联支付详细" onclick="Paymentdetails('134')" class="btn btn-success details_btn"><i class="fa  fa-newspaper-o "></i>&nbsp;详细</a>
        </li>
       </ul>
        <ul class="defray_info">
       <li class="defray_name">怡宝支付</li>
        <li class="name_logo"><img src="products/black/yozhif.jpg"  width="100%" height="150px;" /> </li>
        <li class="description">中国银联是中国银行卡联合组织，通过银联跨行交易清算系统，实现商业银行系统间的互联互通和资源共享，保证银行卡跨行、跨地区和跨境的使用。</li>
        <li class="select">
        <label><input name="form-field-radio3" type="radio" class="ace" checked="checked"><span class="lbl">启用</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <label><input name="form-field-radio3" type="radio" class="ace"><span class="lbl">关闭</span></label>
        </li>
        <li class="operating">
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;删除</a>
       <!-- <a href="javascript:ovid()" name="Payment_details.html" title="怡宝支付详细" onclick="Paymentdetails('234')" class="btn btn-success details_btn"><i class="fa  fa-newspaper-o "></i>&nbsp;详细</a>-->
        </li>
       </ul>
      </div>
    </div>
 </div>
</div>
<!--添加支付方式-->
<div id="add_payment_style" style="display:none">
<form id="payment_checkbox">
 <ul class="margin payment_list  clearfix">
  <li>
  <label><input name="checkbox" type="checkbox" class="ace" id="checkbox" onclick="select_payment(this,'123')"><span class="lbl"><img src="products/black/yinglian.jpg"  width="120px" height="100%" /> </span></label>
  </li>
  <li>
  <label><input name="checkbox" type="checkbox" class="ace" id="checkbox" onclick="select_payment(this,'125')"><span class="lbl"><img src="products/black/yozhif.jpg"  width="120px" height="100%" /></label>
  </li>
  <li>
  <label><input name="checkbox" type="checkbox" class="ace" id="checkbox" onclick="select_payment(this,'126')"><span class="lbl"><img src="products/black/caifut.jpg"  width="120px" height="100%" /></label>
  </li>
  <li>
  <label><input name="checkbox" type="checkbox" class="ace" id="checkbox" onclick="select_payment(this,'127')"><span class="lbl"><img src="products/black/weixin.jpg"  width="120px" height="100%" /></label>
  </li>
   <li>
  <label><input name="checkbox" type="checkbox" class="ace" id="checkbox" onclick="select_payment(this,'127')"><span class="lbl"><img src="products/black/zhifb.jpg"  width="120px" height="100%" /></label>
  </li>
 </ul>
 <div class="add_content clearfix">
   <ul>
    <li class=" clearfix"><label class="label_name">支付方式名称</label><span><input name="支付方式名称" type="text" /></span></li>
    <li  class=" clearfix"><label class="label_name">支持交易货币</label><span style=" margin-left:10px;">人民币</span></li>
    <li  class=" clearfix"><label class="label_name">合作者身份</label><span><input name="合作者身份" type="text" /></span></li>
    <li  class=" clearfix"><label class="label_name">交易安全校验码</label><span><input name="交易安全校验码" type="text" /></span></li>
    <li  class=" clearfix">
     <label class="label_name">选择接口类型</label>
      <span>
        <select class="form-control" id="form-field-select-1">
          <option value="">--选择接口类型--</option>
          <option value="1">使用标准双接口</option>
          <option value="2">使用担保交易接口</option>
          <option value="3">使用即时到帐交易接口</option>
       </select>
      </span>
    </li>  
    <li  class=" clearfix"><label class="label_name">支付费率</label><span><input name="支付费率" type="text" />%</span></li> 
    <li  class=" clearfix"><label class="label_name">排序</label><span><input name="" type="text"  value="0" style="width:80px;"/></span></li> 
    <li  class=" clearfix"><label class="label_name">说明</label><span><textarea name="说明" class="form-textarea" id="form_textarea" placeholder="" onkeyup="checkLength(this);"></textarea><span style=" margin-left:10px;">剩余字数：<em id="sy" style="color:Red;">200</em>字</span></span></li>
   </ul>
 </div>
 </form>
</div>
</body>
</html>
<script>
function select_payment(ojb,id){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.add_content').css('display','block');
		/*  var num=0;
		var str="";
		  $(".add_content input[type$='text']").each(function(n){
          if($(this).val()=="")
          { 
			layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
            title: '提示框',				
		    icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	*/
		}
	else{
		
		 $('.add_content').css('display','none');
		}
}
/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
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
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
/**添加支付方式0**/
function add_payment(index ){
        layer.open({
        type: 1,
        title: '添加支付方式',
		maxmin: true, 
		shadeClose:false,
        area : ['830px' , ''],
        content:$('#add_payment_style'),
		btn:['确定','取消'],
		yes: function(index){
			var checkbox=$('input[name="checkbox"]');		    			
			if(checkbox.length){
			 var b = false;				
			 for(var i=0; i<checkbox.length; i++){
				if(checkbox[i].checked){
					b = true;
					layer.alert('添加成功！',{
               title: '提示框',				
			  icon:0,		
			  })  
			  layer.close(index);
			   break;	
				}
 		
			 }
			 if(!b){
				   layer.alert('请选择所需要的支付方式！',{
               title: '提示框',				
			icon:0,		
			  }); 

			 }
		  }
			else{
							
			}
			
		}
	})
	
	}
/**面包屑**/
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.details_btn').on('click', function(){
	var cname = $(this).attr("title");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe span').html(cname);
	parent.$('#parentIframe').css("display","inline-block");
    parent.$('.Current_page').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
    parent.layer.close(index);
	
});
function Paymentdetails(id){
	window.location.href = "Payment_details.html?="+id;
};

</script>
