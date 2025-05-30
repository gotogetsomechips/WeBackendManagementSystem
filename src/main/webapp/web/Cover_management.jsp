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
        <script src="js/lrtk.js" type="text/javascript" ></script>	
<title>个人账户</title>
</head>

<body>
<div class="margin clearfix">
 <div class="cover_style" id="cover_style">
     <div class="search_style">
     
      <ul class="search_content clearfix">
       <li><label class="l_f">用户</label><input name="" type="text" class="text_add" placeholder="用户名称" style=" width:250px"></li>
       <li style="width:90px;"><button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
      </ul>
    </div>
    <!--操作--> 
     <div class="border clearfix">
       <span class="l_f">
       <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-bar-chart"></i>&nbsp;图表展示</a>
       </span>
       <span class="r_f">共：<b>2334</b>个账户</span>
     </div>
     <!--账户管理-->
      <div class="">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
		 <tr>
          <th width=""><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="">ID</th>
          <th width="">用户名</th>
          <th width="">账户余额</th>
          <th width="">最新充值</th>
          <th width="">充值时间</th>  
          <th width="">最新消费</th>
          <th width="">消费时间</th>       
          <th width="">账户状态</th>                
          <th width="">操作</th>
          </tr>
      </thead>
	<tbody>
		<tr>
          <td> <label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>1</td>
          <td><u style="cursor:pointer"  class="text-primary" onclick="member_show('张小泉','member-show.html','1031','500','400')">张奶奶</u></td>
          <td>345.2</td>          
          <td>0.00</td>
          <td>无</td>
          <td>购买商品消费122元</td>
          <td>2016-7-21 12:45</td>
          <td class="td-status"><span class="label label-success radius">启用</span></td>
          <td class="td-manage">
           <a onClick="member_stop(this,'10001')"  href="javascript:;" title="启用"  class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>  
          <a href="javascript:ovid()" name="Account_Details.html" class="btn btn-xs  btn-warning Account_Details" onclick="generateOrders('511');" title="张奶奶账户详细" >
          <i class="fa fa-list-ul bigger-120"></i></a>     
          </td>
        </tr>
        <tr>
          <td> <label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>12</td>
          <td><u style="cursor:pointer"  class="text-primary" onclick="member_show('张小泉','member-show.html','1031','500','400')">张小泉</u></td>
          <td>345.2</td>          
          <td>120.00</td>
          <td>2016-7-10 23:23</td>
          <td>购买商品消费122元</td>
          <td>2016-7-21 12:45</td>
          <td class="td-status"><span class="label label-success radius">启用</span></td>
          <td class="td-manage">
           <a onClick="member_stop(this,'10001')"  href="javascript:;" title="启用"  class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>   
           <a href="javascript:ovid()" name="Account_Details.html" class="btn btn-xs  btn-warning Account_Details" onclick="generateOrders('561');" title="张小泉账户详细" >
           <i class="fa fa-list-ul bigger-120"></i></a>   
          </td>
        </tr>
        </tbody>
      </table>
      </div>
     
</div>
</div>
</body>
</html>
<script type="text/javascript">
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用该账户吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">停用</span>');
		$(obj).remove();
		layer.msg('停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用该账户吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">启用</span>');
		$(obj).remove();
		layer.msg('启用!',{icon: 6,time:1000});
	});
}
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"bAutoWidth":true,
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,6,7,8,9]}// 制定列不参与排序
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
			//面包屑返回值
//var index = parent.layer.getFrameIndex(window.name);
//parent.layer.iframeAuto(index);
//$('.Order_form ,.Account_Details').on('click', function(){
//	var cname = $(this).attr("title");
//	var chref = $(this).attr("href");
//	var cnames = parent.$('.Current_page').html();
//	var herf = parent.$("#iframe").attr("src");
//    parent.$('#parentIfour').html(cname);
//    parent.$('#iframe').attr("src",chref).ready();;
//	parent.$('#parentIfour').css("display","inline-block");
//    parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
//	parent.$('.parentIframe').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});
//	parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
//    parent.layer.close(index);
//	
//});
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form ,.Account_Details').on('click', function(){
	var cname = $(this).attr("title");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe span').html(cname);
	parent.$('#parentIframe').css("display","inline-block");
    parent.$('.Current_page').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
    parent.layer.close(index);
	
});
function generateOrders(id){
	window.location.href = "Account_Details.html?="+id;
};
</script>