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
		<script src="assets/dist/echarts.js"></script>
<title>交易金额</title>
</head>

<body>
<div class="margin clearfix">
 <div class="amounts_style">
   <div class="transaction_Money clearfix">
      <div class="Money"><span >成交总额：1.2234.3456.00元</span><p>最新统计时间:2016-8-2</p></div>
       <div class="Money"><span ><em>￥</em>3456.00元</span><p>当天成交额</p></div>
       <div class="l_f Statistics_btn"> 
       <a href="javascript:ovid()" title="当月统计" onclick="Statistics_btn()" class="btn  btn-info btn-sm no-radius"><i class="bigger fa fa-bar-chart "></i><h5 class="margin-top">当月统计</h5></a>
     </div>
    </div>
    <div class="border clearfix">
      <span class="l_f">
      <a href="javascript:ovid()" class="btn btn-info">全部订单</a>
      <a href="javascript:ovid()" class="btn btn-danger">当天订单</a>
        <a href="javascript:ovid()" class="btn btn-danger">当月订单</a>
       </span>
       <span class="r_f">共：<b>2334</b>笔</span>
     </div>
   <div class="Record_list">
    <table class="table table-striped table-bordered table-hover" id="sample-table">
       <thead>
		 <tr>
            <th width="100px">序号</th> 
            <th width="200px">订单编号</th>
            <th width="180px">成交时间</th>
            <th width="120px">成交金额(元)</th>
            <th width="180px">状态</th>
                           
			</tr>
		</thead>
        <tbody> 
        <tr>
         <td>34</td>
         <td>HD2016061200456787</td>
         <td>2016-6-12</td>
         <td>234</td>
         <td>成功</td>         
        </tr>
        <tr>
         <td>24</td>
         <td>HD2016061200456787</td>
         <td>2016-6-12</td>
         <td>234</td>
         <td>成功</td>
         
        </tr>
        <tr>
         <td>34</td>
         <td>HD2016061200456787</td>
         <td>2016-6-12</td>
         <td>234</td>
         <td>成功</td>
         
        </tr>
        <tr>
         <td>14</td>
         <td>HD2016061200456787</td>
         <td>2016-6-12</td>
         <td>234</td>
         <td>成功</td>
         
        </tr>
        <tr>
         <td>44</td>
         <td>HD2016061200456787</td>
         <td>2016-6-12</td>
         <td>234</td>
         <td>成功</td>
         
        </tr>
        </tbody>
        </table> 
    
   </div>
 </div>
</div>
<div id="Statistics" style="display:none">
 <div id="main" style="height:400px; overflow:hidden; width:1000px; overflow:auto" ></div>
</div>
</body>
</html>
<script>
$(function() {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [],//默认第几个排序
		"bStateSave": false,//状态保存
		//"dom": 't',
		"bFilter":false,
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,4]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
})
//当月统计
function Statistics_btn(){	
	var index = layer.open({
        type: 1,
        title: '当月销售统计',
		maxmin: true, 
		shadeClose:false,
        area : ['1000px' , ''],
        content:$('#Statistics'),
		btn:['确定','取消'],		
	})
	//layer.full(index);
	}
	//统计
	        require.config({
            paths: {
                echarts: './assets/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('main'),theme);
				option = {
    tooltip : {
        trigger: 'axis'
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    legend: {
        data:['成交订单','失败订单','成交金额']
    },
    xAxis : [
        {
            type : 'category',
            data : ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','125','26','27','28','29','30','31']
        }
    ],
    yAxis : [
        {
            type : 'value',
            name : '订单',
            axisLabel : {
                formatter: '{value} 单'
            }
        },
        {
            type : 'value',
            name : '金额',
            axisLabel : {
                formatter: '{value} 元'
            }
        }
    ],
    series : [

        {
            name:'成交订单',
            type:'bar',
            data:[20, 49, 70, 232, 26, 67, 136, 162, 36, 20, 64, 33,26, 67, 136, 162, 36, 20, 64,]
        },
        {
            name:'失败订单',
            type:'bar',
            data:[2, 5, 9, 4, 2, 7, 1, 1, 4, 1, 0, 3,0, 0, 1, 2, 6, 2, 6,]
        },
        {
            name:'成交金额',
            type:'line',
            yAxisIndex: 1,
            data:[2024, 2233, 3344, 4543, 6355, 1042, 2037, 2346, 2305, 1654, 2120, 6542,2656, 6547, 1346, 2162, 3456, 4520, 6664,]
        }
    ]
};
				
				
				
				 myChart.setOption(option);
			})
</script>
