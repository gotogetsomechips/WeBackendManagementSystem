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
        <script src="js/jquery.SuperSlide.2.1.1.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>           	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script> 
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>     
        <script src="js/lrtk.js" type="text/javascript" ></script>
<title>详细</title>
</head>

<body>
<div class="margin clearfix">
<div class="Account_style">
<!--账户基本信息-->
 <div class="Manager_style clearfix">
    <span class="title_name">账户基本信息</span>
    <div class="Account_Balance">
     <h4>账户余额(￥)</h4>
     <h2>32345.67</h2>
     <h6>2016-7-21</h6>
    </div>
    <ul class="Account_info">
     <li><label class="label_name">账户名（用户名）：</label><span class="content">化海天堂</span></li>
     <li><label class="label_name">用户注册时间：</label><span class="content">2016-3-12</span></li>
     <li><label class="label_name">账户开通时间：</label><span class="content">2016-4-12</span></li>
     <li><label class="label_name">账户状态：</label><span class="content">启用</span></li>
    </ul>
 
 </div>
 <!--记录-->
 <div class="recording_style">
  <div id="recording">
  <div class="hd"><ul><li>充值记录</li><li>消费记录</li></ul></div>
   <div class="bd">
    <ul class="">
       <div class="Records"><span>共345条记录</span></div>
       <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
		 <tr>
          <th width=""><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="">充值序号</th>
          <th width="">充值金额</th>
          <th width="">充值方式</th>
          <th width="">充值时间</th> 
          <th width="">状态</th> 
          <th>备注</th>                    
          </tr>
      </thead>
	<tbody>
		<tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值成功</td>
        <td></td>
        </tr>
        	<tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-7-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>100.00</td>
        <td>支付宝</td>
        <td>2016-4-21</td>
        <td>充值成功</td>
        <td></td>
        </tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>5667675756756</td>
        <td>200.00</td>
        <td>支付宝</td>
        <td>2016-4-21</td>
        <td>充值失败</td>
        <td>充值发生异常，无法完成充值。</td>
        </tr>
        </tbody>
        </table>
    </ul>
    <ul class="">
       <div class="Records"><span>共345条记录</span></div>
       <table class="table table-striped table-bordered table-hover" id="sconsumption-table">
      <thead>
		 <tr>
          <th width=""><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="">订单编号</th>
          <th width="">订单名称</th>
          <th width="">商品数量</th>
          <th width="">消费金额</th> 
          <th width="">消费时间</th> 
          <th width="">状态</th> 
          <th>备注</th>                    
          </tr>
      </thead>
	<tbody>
		<tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>手机数码消费</td>
        <td>3</td>
        <td>231.90</td>
        <td>2016-7-21</td>
        <td>成功</td>
        <td></td>
        </tr>
        	<tr>
        <tr>
        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
        <td>4546464654654</td>
        <td>手机数码消费</td>
        <td>3</td>
        <td>231.90</td>
        <td>2016-7-21</td>
        <td>失败</td>
        <td>订单过期</td>
        </tr>
        </tbody>
        </table>
    </ul>
   </div>
  </div>
 </div>
 <script type="text/javascript">jQuery("#recording").slide({trigger:"click" });</script>
</div>
</div>
</body>
</html>

<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"bAutoWidth":true,
		"bFilter":false,
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,5,6]}// 制定列不参与排序
		] } );
		var recording = $('#sconsumption-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"bAutoWidth":true,
		"bFilter":false,
		"aoColumnDefs": [
		  {"orderable":false,"aTargets":[0,1,2,3,5,6,7,8]}// 制定列不参与排序
		] } );
		
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});	
});

</script>