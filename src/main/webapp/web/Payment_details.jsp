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
<title>支付详细</title>
</head>

<body>
<div class="margin clearfix">
 <div class="Payment_details">
    <div class="brand_detailed">
  <div class="brand_info clearfix">
   <div class="title_brand">支付信息</div>
   <form>
    <ul class="Info_style clearfix">
     <li><label class="label_name">支付名称：</label> <span class="name">银联支付</span></li>
      <li><label class="label_name">开通时间：</label><span class="name">2016-7-1</span></li>
       <li><label class="label_name">结束时间：</label><span class="name">2020-6-21</span></li>
      <li><label class="label_name">所属国家：</label><span class="name">中国</span></li>
      <li><label class="label_name">交易类型：</label><span class="name">人名币</span></li>
      <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="name">启用</span></li>
      <li class="b_Introduce"><label class="label_name">支付介绍：</label><span class="name">中国银联是中国银行卡联合组织，通过银联跨行交易清算系统，实现商业银行系统间的互联互通和资源共享，保证银行卡跨行、跨地区和跨境的使用。银联网络遍布中国城乡，并已延伸至亚洲、欧洲、美洲、大洋洲、非洲等境外150个国家和地区(截至2015年1月20日)。</span></li>
    </ul>
    <div class="brand_logo">
      <img src="products/black/yinglian.jpg" width="120px" height="60px">
      <p class="name">中国银联</p>
    </div>
   </form>
   </div>
 </div>
   <div class="bank_style clearfix" id="Bank_operations">
      <div class="title_name">支持银行</div>
      <div class="operating">
      <a href="javascript:ovid()" onclick="modify()" class="btn btn-danger btn_delete"><i class="fa fa-trash"></i>&nbsp;删除操作</a>
      <a href="javascript:ovid()" onclick="Add_Bank()" class="btn btn-primary"><i class="fa fa-credit-card"></i>&nbsp;添加银行</a></div>
      <div class="bank_list clearfix">
        <ul class="bank_logo clearfix">
         <li>
          <div class="delete_bank"><a href="javascript:ovid()"  onclick="bank_del(this,'123')"class="fa fa-remove"></a></div>
          <label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black1.png" width="160px;"/></span></label>
         </li>
         <li>
          <div class="delete_bank"><a href="javascript:ovid()"  onclick="bank_del(this,'124')"class="fa fa-remove"></a></div>
          <label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black2.png" width="160px;"/></span></label>
         </li>
         <li>
          <div class="delete_bank"><a href="javascript:ovid()"  onclick="bank_del(this,'125')"class="fa fa-remove"></a></div>
          <label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black3.png" width="160px;"/></span></label>
         </li>
         <li>
          <div class="delete_bank"><a href="javascript:ovid()"  onclick="bank_del(this,'126')"class="fa fa-remove"></a></div>
          <label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black4.png" width="160px;"/></span></label>
         </li>
         <li>
          <div class="delete_bank"><a href="javascript:ovid()"  onclick="bank_del(this,'127')"class="fa fa-remove"></a></div>
          <label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black5.png" width="160px;"/></span></label>
         </li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black6.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black7.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black8.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black9.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black10.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black11.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black12.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black13.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black14.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black15.png" width="160px;"/></span></label></li>
        </ul>
        <div class="Push_button">
        </div>
      </div>
   </div>
 </div>
</div>
<!--添加银行-->
<div id="add_bankstyle" style=" display:none">
<div class="prompt">请确保你开通了该银行的付款业务，如果未开通，可能造成用户付款失败。</div>
  <div class="add_bank_list margin">
   <ul>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black6.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black7.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black8.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black9.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black10.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black11.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black12.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black13.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black14.png" width="160px;"/></span></label></li>
         <li><label><input name="form-field-checkbox" type="checkbox" class="ace"><span class="lbl"><img src="products/black/black15.png" width="160px;"/></span></label></li>
   </ul>
  </div>
</div>
</body>
</html>
<script>
  //按钮点击事件
function modify(){
	 $('.ace').attr("disabled", false);
	 $('.ace').addClass("add");
	  $('#Bank_operations').find('.bank_logo').addClass("delete");
	  $('#Bank_operations').find('.Push_button').addClass("btn_delete");
	  $('#Bank_operations').find('.operating .btn_delete').hide();
	  $('#Bank_operations').find('.Push_button').prepend('<span class="Button"><a style="text-decoration:none" class="btn btn-success" onClick="bank_complete(this,id)" href="javascript:;" title="启用"><i class=""></i>确认操作</a></span>');
	};
	 $('#Bank_operations').find('.Push_button').html('<label><input name="checkbox" type="checkbox" class="ace" id="select_all"><span class="lbl">全选</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
	/**全选**/
$('#select_all').on('click' , function(){
					var that = this;
					$(this).closest('.bank_list').find('li input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('li').toggleClass('selected');
					});
						
				});

/*确认操作*/	
function bank_complete(obj,id){
	var checkbox=$('input[name="form-field-checkbox"]');
	if(checkbox.length){
			 for(var i=0; i<checkbox.length; i++){ 
			   if(checkbox[i].checked){
					layer.alert('删除成功！',{
                    title: '提示框',				
			        icon:0,		
			        }) 
			         break;					
				}
		
				
					else{
				 $('.ace').removeClass("add");
				 $('#Bank_operations').find('.Push_button').removeClass("btn_delete");
				 $('#Bank_operations').find('.bank_logo').removeClass("delete");
				 $('#Bank_operations').find('.Push_button .Button').empty();
				 $('#Bank_operations').find('.operating .btn_delete').show();
				
				}
			 }	 		
		  }		
		  if($('input[name="checkbox"]').prop("checked")){ 
		  layer.alert('是否删除全部银行！',{
               title: '提示框',				
			  icon:0,
			   btn:['确定','取消'],	
				   yes: function(index){
					    $('#Bank_operations').find('.bank_logo').empty();
						$('#Bank_operations').find('.Push_button').empty();					   
					    layer.close(index);  
					   }		
			  }) 			  
		  	}		
	  
			
				 
	}	
/**添加银行操作**/
function Add_Bank(index){
	var index = layer.open({
        type: 1,
        title: '添加银行',
		maxmin: true, 
		shadeClose:false,
        area : ['830px' , ''],
        content:$('#add_bankstyle'),
		btn:['确定','取消'],
		yes:function(index, layero){
		var checkbox=$('input[name="form-field-checkbox"]');
	         if(checkbox.length){
			 for(var i=0; i<checkbox.length; i++){ 
			   if(checkbox[i].checked){
					layer.alert('添加成功！',{
                    title: '提示框',				
			        icon:0,		
			        }) 
					 layer.close(index); 
			         break;					
				}
		     else{
			layer.alert('请选择银行！',{
               title: '提示框',				
			  icon:0,		
			  });
			 }
		   }
		} 
	 }			  
})		
}
/*银行-删除*/
function bank_del(obj,id){
	layer.confirm('确认要删除该银行吗？',function(index){
		$(obj).parents("li").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>
