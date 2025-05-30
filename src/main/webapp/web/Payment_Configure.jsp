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
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>支付配置</title>
</head>

<body>
<div class="margin clearfix">
 <div class="Configure_style">
    <div class="manner">
      <div class="title_name">商城用户支付配置</div>
      <div class="info clearfix">
      <table class="table table-bordered">
        <thead>
         <th  width="150px">支付名称</th>
         <th width="150px">状态</th>
         <th>描述</th>
         <th width="100px">操作</th>
        </thead>
        <tbody>
       <tr>
       <td>在线支付（银联）</td>
       <td>
       <label><input name="form-field-radio" type="radio" class="ace" checked="checked" onclick="Enable(this,'123')"><span class="lbl">启用</span></label>
       <label><input name="form-field-radio" type="radio" class="ace" onclick="closes(this,'213')"><span class="lbl">关闭</span></label>     
       </td>      
       <td>在线支付是指卖方与买方通过因特网上的电子商务网站进行交易时，银行为其提供网上资金结算服务的一种业务。它为企业和个人提供了一个安全、快捷、方便的电... </td>
        <td><a href="javascript:ovid()" name="" title="在线支付配置">配置</a></td>
       </tr>
       <tr>
       <td>在线支付（预存）</td>
       <td>
       <label><input name="form-field-radio4" type="radio" class="ace" checked="checked" onclick="Enable(this,'124')"><span class="lbl">启用</span></label>
       <label><input name="form-field-radio4" type="radio" class="ace" onclick="closes(this,'214')"><span class="lbl">关闭</span></label>     
       </td>      
       <td>在线支付是指卖方与买方通过因特网上的电子商务网站进行交易时，银行为其提供网上资金结算服务的一种业务。它为企业和个人提供了一个安全、快捷、方便的电... </td>
        <td><a href="javascript:ovid()" name="" title="在线支付配置">配置</a></td>
       </tr>
       <tr><td>货到付款</td>
       <td>
       <label><input name="form-field-radio1" type="radio" class="ace" checked="checked" onclick="Enable(this,'125')"><span class="lbl">启用</span></label>
       <label><input name="form-field-radio1" type="radio" class="ace" onclick="closes(this,'215')"><span class="lbl">关闭</span></label>     
       </td>
       
       <td>在线支付是指卖方与买方通过因特网上的电子商务网站进行交易时，银行为其提供网上资金结算服务的一种业务。它为企业和个人提供了一个安全、快捷、方便的电... </td>
        <td><a href="javascript:ovid()" name="" title="在线支付配置">配置</a></td>
       </tr>
       <tr>
       <td>第三方在线支付</td>
       <td>
       <label><input name="form-field-radio2" type="radio" class="ace" checked="checked" onclick="Enable(this,'126')"><span class="lbl">启用</span></label>
       <label><input name="form-field-radio2" type="radio" class="ace" onclick="closes(this,'216')"><span class="lbl">关闭</span></label>     
       </td>       
       <td>所谓第三方支付，就是一些和产品所在国家以及国内外各大银行签约、并具备一定实力和信誉保障的第三方独立机构提供的交易支持平台。在通过第三方支付平台的... </td>
        <td><a href="javascript:ovid()" name="" title="在线支付配置">配置</a></td>
       </tr>
        <tr>
       <td>线下支付</td>
       <td>
       <label><input name="form-field-radio3" type="radio" class="ace" checked="checked" onclick="Enable(this,'126')"><span class="lbl">启用</span></label>
       <label><input name="form-field-radio3" type="radio" class="ace" onclick="closes(this,'217')"><span class="lbl">关闭</span></label>     
       </td>       
       <td>所谓第三方支付，就是一些和产品所在国家以及国内外各大银行签约、并具备一定实力和信誉保障的第三方独立机构提供的交易支持平台。在通过第三方支付平台的... </td>
        <td><a href="javascript:ovid()" name="" title="在线支付配置">配置</a></td>
       </tr>
       </tbody>
      </table>
      </div>
    </div><!--其他配置-->
  <div class="Other_style">
    <div class="title_name">其他配置信息</div>
    <div style="margin:5px;">
     <ul class="invoice deploy">
      <li class="name">发票</li>
      <li class="operating">  
       <span class=""><label><input name="radio" type="radio" class="ace" onclick="Enable()"><span class="lbl">启用</span></label>&nbsp;&nbsp;&nbsp;&nbsp;
       <label><input name="radio" type="radio" class="ace" onclick="closes()"><span class="lbl">关闭</span></label></span>   
        <div class="Reply_style">
          <span class="title">选择发票类型</span>
         <p><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl">普通纸质发票</span></label></p>
          <p><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl">增值税发票</span></label></p>
          <p><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl">电子发票</span></label></p>
        </div>
         </li>
      <li class="info">发票是指一切单位和个人在购销商品、提供或接受服务以及从事其他经营活动中，所开具和收取的业务凭证，是会计核算的原始依据，也是审计机关、税务机关执法     </li>
     </ul>
      <ul class="invoice deploy">
      <li class="name">优惠劵</li>
      <li class="operating">  
       <span class="">
       <label><input name="radio1" type="radio" class="ace" ><span class="lbl">启用</span></label>&nbsp;&nbsp;&nbsp;&nbsp;
       <label><input name="radio1" type="radio" class="ace" ><span class="lbl">关闭</span></label></span>          
         </li>
      <li class="info">发票是指一切单位和个人在购销商品、提供或接受服务以及从事其他经营活动中，所开具和收取的业务凭证，是会计核算的原始依据，也是审计机关、税务机关执法     </li>
     </ul>
     <ul class="invoice deploy">
      <li class="name">代收人</li>
      <li class="operating">  
       <span class="">
       <label><input name="radio2" type="radio" class="ace" title="启用"><span class="lbl">启用</span></label>&nbsp;&nbsp;&nbsp;&nbsp;
       <label><input name="radio2" type="radio" class="ace" title="关闭"><span class="lbl">关闭</span></label></span>          
         </li>
      <li class="info">是否启用代收人操作，一次只能填写一次。如不在家可填写代收人的地址作为收货地址</li>
     </ul>
  </div>
  </div>
 </div>
 
</div>
</body>
</html>
<script>
 /*radio激发事件*/
function Enable(){ $('.Reply_style').css('display','block');}
function closes(){$('.Reply_style').css('display','none')}
/* function Enable(ojb,id){
	 layer.confirm('确认要开启吗？',function(index){
		layer.msg('开启成功!',{icon:1,time:1000});
	});
 }
 function closes(ojb,id){
	  layer.confirm('确认要关闭该支付功能吗？',function(index){
		layer.msg('以关闭!',{icon:1,time:1000});
		})
}*/
	

</script>
