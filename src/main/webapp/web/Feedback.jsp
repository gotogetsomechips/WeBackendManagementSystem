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
		<script src="js/displayPart.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>           	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
		  
<title>意见反馈</title>
</head>

<body>
<div class="margin clearfix">
 <div class="Feedback_style">
   <div class="search_style">
     
      <ul class="search_content clearfix">
       <li><label class="l_f">留言</label><input name="" type="text" class="text_add" placeholder="输入留言信息" style=" width:250px"></li>
       <li><label class="l_f">时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="button" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
  <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
        <a href="javascript:ovid()" class="btn btn-sm btn-primary"><i class="fa fa-check"></i>&nbsp;已浏览</a>
        <a href="javascript:ovid()" class="btn btn-yellow"><i class="fa fa-times"></i>&nbsp;未浏览</a>
        <a href="javascript:ovid()" class="btn btn-success"><i class="fa fa-feed"></i>&nbsp;建议</a>
        <a href="javascript:ovid()" class="btn btn-success"><i class="fa fa-feed"></i>&nbsp;投诉</a>
       </span>
       <span class="r_f">共：<b>2334</b>条</span>
     </div>
    <div class="feedback">
      <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
		 <tr>
          <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="80">ID</th>
          <th width="100px">姓名</th>
          <th width="100px">电话</th>
          <th width="160px">邮箱</th>
          <th width="">留言内容</th>
          <th width="180px">时间</th>
          <th width="60px">状态</th>
          <th width="70px">类型</th>                
          <th width="180px">操作</th>
          </tr>
      </thead>
	<tbody>
		<tr>
     <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>1</td>
          <td>张小泉</td>
          <td>13333333333</td>
          <td>56564653@qq.com</td>
          <td class="text-l displayPart" displayLength="90">
          <a href="javascript:;" onclick="Guestbook_iew('12')">“第二届中国无锡水蜜桃开摘节”同时开幕，为期三个月的蜜桃季全面启动。值此京东“618品质狂欢节”之际，中国特产无锡馆限量上线618份8只装精品水蜜桃，61.8元全国包邮限时抢购。为了保证水蜜桃从枝头到达您的手中依旧鲜甜如初，京东采用递送升级服务，从下单到包装全程冷链运输。</a>
          <td>2016-6-11 11:11:42</td>
          <td class="td-status"><span class="label label-success radius">已浏览</span></td>
          <td>投诉</td>
          <td class="td-manage">    
        <a  href="javascript:;"  onclick="member_del(this,'1')" title="删除" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
        <a  href="javascript:;"  onclick="member_Reply(this,'1')" title="回复" class="btn btn-xs btn-pink" ><i class="fa fa-envelope-o  bigger-120"></i></a>
          </td>
        </tr>
		<tr>
     <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>1</td>
          <td>张小泉</td>
          <td>13333333333</td>
          <td>56564653@qq.com</td>
          <td class="text-l displayPart" displayLength="90">
          <a href="javascript:;"  style="display: block;" onclick="Guestbook_iew('12')" >“第二届中国无锡水蜜桃开摘节”同时开幕，为期三个月的蜜桃季全面启动。值此京东“618品质狂欢节”之际，中国特产无锡馆限量上线618份8只装精品水蜜桃，61.8元全国包邮限时抢购。为了保证水蜜桃从枝头到达您的手中依旧鲜甜如初，京东采用递送升级服务，从下单到包装全程冷链运输。</a>
          <td>2016-6-11 11:11:42</td>
          <td class="td-status"><span class="label label-success radius">已浏览</span></td>
          <td>投诉</td>
          <td class="td-manage">    
        <a  href="javascript:;"  onclick="member_del(this,'1')" title="删除" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
        <a  href="javascript:;"  onclick="member_Reply(this,'1')" title="回复" class="btn btn-xs btn-pink" ><i class="fa fa-envelope-o  bigger-120"></i></a>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
 </div>
</div>
<!--留言详细-->
<div id="Guestbook" style="display:none">
 <div class="content_style">
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">留言用户 </label>
       <div class="col-sm-9">胡海天堂</div>
	</div>
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">联系电话 </label>
       <div class="col-sm-9">1234567787</div>
	</div>
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">联系邮箱 </label>
       <div class="col-sm-9">344665@qq.com</div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 留言内容 </label>
       <div class="col-sm-9">三年同窗，一起沐浴了一片金色的阳光，一起度过了一千个日夜，我们共同谱写了多少友谊的篇章?愿逝去的那些闪亮的日子，都化作美好的记忆，永远留在心房。认识您，不论是生命中的一段插曲，还是永久的知已，我都会珍惜，当我疲倦或老去，不再拥有青春的时候，这段旋律会滋润我生命的每一刻。在此我只想说：有您真好!无论你身在何方，我的祝福永远在您身边!</div>
	</div>
   
 </div>
</div>
</body>
</html>
<script type="text/javascript">
/*留言查看*/
function Guestbook_iew(id){
	var index = layer.open({
        type: 1,
        title: '反馈信息',
		maxmin: true, 
		shadeClose:false,
        area : ['600px' , ''],
        content:$('#Guestbook'),
		btn:['确定','取消'],
	})	
};
/*留言-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});	
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			})
</script>