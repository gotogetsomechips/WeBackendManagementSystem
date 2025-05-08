<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="js/lrtk.js" type="text/javascript" ></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript" ></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="js/H-ui.js" type="text/javascript"></script>
    <script src="js/displayPart.js" type="text/javascript"></script>
    <title>商铺管理</title>
</head>

<body>
<div class="clearfix">
    <div class="article_style" id="article_style">
        <div id="scrollsidebar" class="left_Treeview">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <div class="widget-box side_content" >
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class="side_list">
                    <div class="widget-header header-color-green2">
                        <h4 class="lighter smaller">店铺分类</h4>
                    </div>
                    <div class="widget-body">
                        <ul class="b_P_Sort_list">
                            <li><i class="orange fa fa-list"></i><a href="javascript:void(0)" onclick="filterByCategory(0)">全部</a></li>
                            <c:forEach items="${categories}" var="category">
                                <li><i class="fa fa-shopping-bag pink"></i><a href="javascript:void(0)" onclick="filterByCategory(${category.id})">${category.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--商铺列表-->
        <div class="Ads_list">
            <div class="search_style">
                <form id="searchForm">
                    <ul class="search_content clearfix">
                        <li><label class="l_f">商铺名称</label><input name="name" type="text" class="text_add" placeholder="商铺名称" style="width:150px"></li>
                        <li><label class="l_f">商铺类型</label>
                            <select name="shopType" style="width:150px">
                                <option value="">--选择商铺类型--</option>
                                <option value="个人店铺">个人店铺</option>
                                <option value="企业店铺">企业店铺</option>
                            </select>
                        </li>
                        <li><label class="l_f">所属分类</label>
                            <select name="categoryId" style="width:150px">
                                <option value="">--选择分类--</option>
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </li>
                        <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="startTime" name="startTime" style="margin-left:10px;">至<input class="inline laydate-icon" id="endTime" name="endTime"></li>
                        <li style="width:90px;"><button type="button" class="btn_search" onclick="searchShops()"><i class="fa fa-search"></i>查询</button></li>
                    </ul>
                </form>
            </div>
            <div class="border clearfix">
       <span class="l_f">
         <a href="javascript:void(0)" title="添加店铺" class="btn btn-warning" onclick="showAddShopModal()"><i class="icon-plus"></i>添加店铺</a>
         <a href="javascript:void(0)" class="btn btn-danger" onclick="batchDelete()"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
                <span class="r_f">共：<b id="totalCount">0</b>家</span>
            </div>
            <div class="article_list">
                <table class="table table-striped table-bordered table-hover" id="shopTable">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace" id="selectAll"><span class="lbl"></span></label></th>
                        <th width="80px"><a href="javascript:void(0)" onclick="sortBy('sort_order')">编号<span id="sort_order_icon"></span></a></th>
                        <th width="180">店铺名称</th>
                        <th width="120px">所属分类</th>
                        <th width="120px">店铺类型</th>
                        <th width="300px">简介</th>
                        <th width="150px">添加时间</th>
                        <th width="100px">审核状态</th>
                        <th width="250px">操作</th>
                    </tr>
                    </thead>
                    <tbody id="shopList">
                    </tbody>
                </table>

                <!-- 分页 -->
                <div id="pagination" class="pagination"></div>
            </div>
        </div>
    </div>
</div>

<!-- 添加商铺表单 -->
<div id="addShopModal" style="display:none;padding:20px;">
    <form id="addShopForm" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">商铺名称：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="name" required onblur="checkShopName(this)">
                <span class="help-block" id="nameTip"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属分类：</label>
            <div class="col-sm-9">
                <select class="form-control" name="categoryId" id="categorySelect" required>
                    <option value="">--请选择分类--</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">商铺类型：</label>
            <div class="col-sm-9">
                <select class="form-control" name="shopType" required>
                    <option value="">--请选择类型--</option>
                    <option value="个人店铺">个人店铺</option>
                    <option value="企业店铺">企业店铺</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" name="sortOrder" value="0" required onblur="checkSortOrder(this)">
                <span class="help-block" id="sortOrderTip"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">简介：</label>
            <div class="col-sm-9">
                <textarea class="form-control" name="description" rows="4"></textarea>
            </div>
        </div>
    </form>
</div>
<!-- 详情模态框 -->
<div id="detailShopModal" style="display:none;padding:20px;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">商铺编号：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailSortOrder"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">商铺名称：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailName"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属分类：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailCategory"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">商铺类型：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailShopType"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">审核状态：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailStatus"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">添加时间：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailCreateTime"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">更新时间：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailUpdateTime"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">简介：</label>
            <div class="col-sm-9">
                <div class="form-control-static" id="detailDescription" style="height:auto;min-height:100px;"></div>
            </div>
        </div>
    </div>
</div>
<!-- 编辑商铺表单 -->
<div id="editShopModal" style="display:none;padding:20px;">
    <form id="editShopForm" class="form-horizontal">
        <input type="hidden" name="id">
        <div class="form-group">
            <label class="col-sm-3 control-label">商铺名称：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="name" required onblur="checkEditShopName(this)">
                <span class="help-block" id="editNameTip"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属分类：</label>
            <div class="col-sm-9">
                <select class="form-control" name="categoryId" id="editCategorySelect" required>
                    <option value="">--请选择分类--</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">商铺类型：</label>
            <div class="col-sm-9">
                <select class="form-control" name="shopType" required>
                    <option value="">--请选择类型--</option>
                    <option value="个人店铺">个人店铺</option>
                    <option value="企业店铺">企业店铺</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" name="sortOrder" required onblur="checkEditSortOrder(this)">
                <span class="help-block" id="editSortOrderTip"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">审核状态：</label>
            <div class="col-sm-9">
                <select class="form-control" name="status" required>
                    <option value="0">待审核</option>
                    <option value="1">通过</option>
                    <option value="2">拒绝</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">简介：</label>
            <div class="col-sm-9">
                <textarea class="form-control" name="description" rows="4"></textarea>
            </div>
        </div>
    </form>
</div>

<script>
    // 当前页码
    var currentPage = 1;
    // 每页记录数
    var pageSize = 10;
    // 编号字段和顺序
    var sortField = "";
    var sortOrder = "asc";

    $(function () {
        // 显示部分文本
        $(".displayPart").displayPart();

        // 日期选择器初始化
        laydate({
            elem: '#startTime',
            event: 'focus'
        });
        laydate({
            elem: '#endTime',
            event: 'focus'
        });

        // 初始化表格
        loadShopList();

        // 全选/取消全选
        $("#selectAll").on('click', function(){
            $("input[name='shopIds']").prop("checked", this.checked);
        });
    });
    // 检查店铺名称
    function checkShopName(input) {
        var name = $(input).val();
        var tip = $("#nameTip");

        if (!name) {
            showTip(tip, "店铺名称不能为空", "error");
            return false;
        }

        $.ajax({
            url: "checkShopName",
            type: "get",
            data: {name: name},
            dataType: "json",
            success: function(response) {{
                    showTip(tip, "店铺名称可用", "success");
                }
            }
        });
        return true;
    }

    // 检查编辑时的店铺名称
    function checkEditShopName(input) {
        var name = $(input).val();
        var tip = $("#editNameTip");
        var id = $("#editShopForm input[name='id']").val();

        if (!name) {
            showTip(tip, "店铺名称不能为空", "error");
            return false;
        }

        $.ajax({
            url: "checkShopName",
            type: "get",
            data: {name: name, id: id},
            dataType: "json",
            success: function(response) {{
                    showTip(tip, "店铺名称可用", "success");
                }
            }
        });
        return true;
    }

    // 检查编号
    function checkSortOrder(input) {
        var sortOrder = $(input).val();
        var tip = $("#sortOrderTip");

        if (!sortOrder) {
            showTip(tip, "编号不能为空", "error");
            return false;
        }

        $.ajax({
            url: "shop/checkSortOrderExists",
            type: "get",
            data: {sortOrder: sortOrder},
            dataType: "json",
            success: function(response) {
                if (response.exists) {
                    showTip(tip, "该编号已存在", "error");
                } else {
                    showTip(tip, "编号可用", "success");
                }
            }
        });
        return true;
    }

    // 检查编辑时的编号
    function checkEditSortOrder(input) {
        var sortOrder = $(input).val();
        var tip = $("#editSortOrderTip");
        var id = $("#editShopForm input[name='id']").val();

        if (!sortOrder) {
            showTip(tip, "编号不能为空", "error");
            return false;
        }

        $.ajax({
            url: "shop/checkSortOrderExists",
            type: "get",
            data: {sortOrder: sortOrder, id: id},
            dataType: "json",
            success: function(response) {
                if (response.exists) {
                    showTip(tip, "该编号已存在", "error");
                } else {
                    showTip(tip, "编号可用", "success");
                }
            }
        });
        return true;
    }

    // 显示提示信息
    function showTip(element, message, type) {
        element.text(message);
        if (type === "success") {
            element.css({
                "color": "#28a745",
                "font-weight": "bold"
            });
        } else if (type === "error") {
            element.css({
                "color": "#dc3545",
                "font-weight": "bold"
            });
        } else {
            element.css({
                "color": "",
                "font-weight": ""
            });
        }
    }
    // 加载商铺列表
    function loadShopList() {
        var params = $("#searchForm").serialize();
        params += "&page=" + currentPage + "&limit=" + pageSize;
        params += "&sortField=" + sortField + "&sortOrder=" + sortOrder;

        $.ajax({
            url: "getShopList",
            type: "get",
            data: params,
            dataType: "json",
            success: function(response) {
                renderShopList(response);
            }
        });
    }
    // 辅助函数：获取字段对应的列索引
    function getColumnIndex(field) {
        switch(field) {
            case 'sort_order': return 1; // 编号列是第2列(索引1)
            // 其他列...
            default: return 0;
        }
    }
    // 当前排序状态（保持到翻页时使用）
    var currentSortField = "";    // 当前排序字段
    var currentSortOrder = "asc"; // 当前排序方向
    // 根据字段排序（仅当前页）
    function sortBy(field) {
        // 更新全局排序状态
        if (currentSortField === field) {
            currentSortOrder = currentSortOrder === "asc" ? "desc" : "asc";
        } else {
            currentSortField = field;
            currentSortOrder = "asc";
        }

        // 更新排序图标
        updateSortIcons();

        // 对当前页数据进行排序
        sortCurrentPage();
    }

    // 对当前页数据进行排序
    function sortCurrentPage() {
        if (!currentSortField) return;

        var $tbody = $('#shopTable tbody');
        var $rows = $tbody.find('tr').get();

        $rows.sort(function(a, b) {
            var aVal = $(a).find('td').eq(getColumnIndex(currentSortField)).text();
            var bVal = $(b).find('td').eq(getColumnIndex(currentSortField)).text();

            // 编号列按数字排序
            if (currentSortField === 'sort_order') {
                aVal = parseInt(aVal) || 0;
                bVal = parseInt(bVal) || 0;
                return currentSortOrder === "asc" ? aVal - bVal : bVal - aVal;
            }
            // 其他列按文本排序
            else {
                return currentSortOrder === "asc"
                    ? aVal.localeCompare(bVal)
                    : bVal.localeCompare(aVal);
            }
        });

        // 重新插入排序后的行
        $tbody.empty().append($rows);
    }

    // 更新排序图标
    function updateSortIcons() {
        $("[id$='_icon']").text(""); // 清除所有图标
        if (currentSortField) {
            $('#' + currentSortField + '_icon').text(
                currentSortOrder === "asc" ? "↑" : "↓"
            );
        }
    }
    // 渲染商铺列表
    function renderShopList(data) {
        var shopList = data.data;
        var total = data.count;

        // 更新总数
        $("#totalCount").text(total);

        // 清空表格
        $("#shopList").empty();

        // 渲染数据行
        if(shopList && shopList.length > 0) {
            for(var i = 0; i < shopList.length; i++) {
                var shop = shopList[i];
                var statusText = "";
                if(shop.status == 0) statusText = "待审核";
                else if(shop.status == 1) statusText = "通过";
                else if(shop.status == 2) statusText = "拒绝";

                var row = '<tr>' +
                    '<td><label><input type="checkbox" class="ace" name="shopIds" value="' + shop.id + '"><span class="lbl"></span></label></td>' +
                    '<td>' + (shop.sortOrder || 0) + '</td>' +
                    '<td>' + shop.name + '</td>' +
                    '<td>' + shop.categoryName + '</td>' +
                    '<td>' + shop.shopType + '</td>' +
                    '<td>' + (shop.description ? shop.description : '无') + '</td>' +
                    '<td>' + formatDate(shop.createTime) + '</td>' +
                    '<td>' + statusText + '</td>' +
                    '<td class="td-manage">' +
                    '<a title="详情" onclick="viewShopDetail(' + shop.id + ')" class="btn btn-xs btn-success"><i class="fa fa-info-circle bigger-120"></i></a>' +
                    '<a title="编辑" onclick="editShop(' + shop.id + ')" class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a> ' +
                    '<a title="删除" onclick="deleteShop(' + shop.id + ')" class="btn btn-xs btn-danger"><i class="fa fa-trash bigger-120"></i></a>' +
                    '</td>' +
                    '</tr>';
                $("#shopList").append(row);
            }

            // 重新初始化显示部分文本
            $(".displayPart").displayPart();
        } else {
            // 添加无数据提示
            var searchForm = $("#searchForm").serialize();
            if(searchForm && searchForm !== "") {
                $("#shopList").append('<tr><td colspan="9" class="text-center">没有找到符合条件的数据，请尝试调整搜索条件</td></tr>');
            } else {
                $("#shopList").append('<tr><td colspan="9" class="text-center">暂无数据</td></tr>');
            }
        }

        // 生成分页
        renderPagination(total);
        // 渲染完成后，应用当前排序状态
        if (currentSortField) {
            sortCurrentPage();
        }
    }

    // 渲染分页
    function renderPagination(total) {
        var totalPages = Math.ceil(total / pageSize);

        // 添加一个外层容器，设置上边距
        var html = '<div style="margin-top: 15px;">';
        html += '<div class="pagination-container" style="display:flex; align-items:center; justify-content:flex-end;">';

        // 分页导航
        html += '<ul class="pagination" style="margin-bottom:0; margin-top:10px;">';

        // 首页
        if(currentPage > 1) {
            html += '<li><a href="javascript:void(0)" onclick="gotoFirstPage()">首页</a></li>';
        } else {
            html += '<li class="disabled"><a href="javascript:void(0)" onclick="showPageTip(\'已经是第一页了\')">首页</a></li>';
        }

        // 上一页
        if(currentPage > 1) {
            html += '<li><a href="javascript:void(0)" onclick="gotoPrevPage()">«</a></li>';
        } else {
            html += '<li class="disabled"><a href="javascript:void(0)" onclick="showPageTip(\'已经是第一页了\')">«</a></li>';
        }

        // 页码
        var start = Math.max(1, currentPage - 2);
        var end = Math.min(totalPages, start + 4);

        for(var i = start; i <= end; i++) {
            if(i == currentPage) {
                html += '<li class="active"><a href="javascript:void(0)">' + i + '</a></li>';
            } else {
                html += '<li><a href="javascript:void(0)" onclick="gotoPage(' + i + ')">' + i + '</a></li>';
            }
        }

        // 下一页
        if(currentPage < totalPages) {
            html += '<li><a href="javascript:void(0)" onclick="gotoNextPage(' + totalPages + ')">»</a></li>';
        } else {
            html += '<li class="disabled"><a href="javascript:void(0)" onclick="showPageTip(\'已经是最后一页了\')">»</a></li>';
        }

        // 尾页
        if(currentPage < totalPages) {
            html += '<li><a href="javascript:void(0)" onclick="gotoLastPage(' + totalPages + ')">尾页</a></li>';
        } else {
            html += '<li class="disabled"><a href="javascript:void(0)" onclick="showPageTip(\'已经是最后一页了\')">尾页</a></li>';
        }

        html += '</ul>';

        // 页码输入跳转 - 与分页导航在同一行，并保持垂直对齐
        if(totalPages > 0) {
            html += '<div class="page-go" style="margin-left: 15px; display:flex; align-items:center; margin-top:10px;">';
            html += '<span>跳至</span>';
            html += '<input type="text" id="pageInput" class="form-control input-sm" style="width: 40px; margin: 0 5px; text-align: center; display:inline-block;">';
            html += '<span>页</span>';
            html += '<button class="btn btn-sm btn-primary" style="margin-left: 5px;" onclick="gotoInputPage(' + totalPages + ')">确定</button>';
            html += '</div>';
        }

        html += '</div>';
        html += '</div>';

        $("#pagination").html(html);
    }

    // 查看商铺详情
    function viewShopDetail(id) {
        $.ajax({
            url: "getShopById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var shop = response.data;
                    var statusText = "";
                    if(shop.status == 0) statusText = "待审核";
                    else if(shop.status == 1) statusText = "通过";
                    else if(shop.status == 2) statusText = "拒绝";

                    $("#detailSortOrder").text(shop.sortOrder || 0);
                    $("#detailName").text(shop.name);
                    $("#detailCategory").text(shop.categoryName);
                    $("#detailShopType").text(shop.shopType);
                    $("#detailStatus").text(statusText);
                    $("#detailCreateTime").text(formatDate(shop.createTime));
                    $("#detailUpdateTime").text(formatDate(shop.updateTime));
                    $("#detailDescription").text(shop.description || "无");

                    layer.open({
                        type: 1,
                        title: '商铺详情',
                        area: ['600px', '600px'],
                        content: $("#detailShopModal"),
                        btn: ['关闭']
                    });
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }

    // 首页
    function gotoFirstPage() {
        if(currentPage !== 1) {
            currentPage = 1;
            loadShopList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    // 上一页
    function gotoPrevPage() {
        if(currentPage > 1) {
            currentPage--;
            loadShopList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    // 下一页
    function gotoNextPage(totalPages) {
        if(currentPage < totalPages) {
            currentPage++;
            loadShopList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    // 尾页
    function gotoLastPage(totalPages) {
        if(currentPage !== totalPages) {
            currentPage = totalPages;
            loadShopList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    // 跳转到指定页
    function gotoPage(page) {
        currentPage = page;
        loadShopList();
    }

    // 输入页码跳转
    function gotoInputPage(totalPages) {
        var inputPage = parseInt($("#pageInput").val());

        if(isNaN(inputPage) || inputPage <= 0) {
            showPageTip('请输入有效的页码');
            return;
        }

        if(inputPage > totalPages) {
            showPageTip('页码超出范围，最大页码为 ' + totalPages);
            return;
        }

        currentPage = inputPage;
        loadShopList();
    }

    // 显示页面提示信息
    function showPageTip(message) {
        layer.msg(message, {icon: 0, time: 1500});
    }

    // 搜索商铺
    function searchShops() {
        currentPage = 1;
        loadShopList();
    }

    // 根据分类筛选
    function filterByCategory(categoryId) {
        $("select[name='categoryId']").val(categoryId);
        searchShops();
    }

    // 显示添加商铺模态框
    // 显示添加商铺模态框
    function showAddShopModal() {
        // 重置表单和提示信息
        $("#addShopForm")[0].reset();
        $(".help-block").text("").removeClass("text-success text-danger");

        layer.open({
            type: 1,
            title: '添加商铺',
            area: ['550px', '500px'],
            content: $("#addShopModal"),
            btn: ['提交', '取消'],
            yes: function(index) {
                // 执行所有校验
                var isValid = true;
                isValid = checkShopName($("#addShopForm input[name='name']")) && isValid;
                isValid = checkSortOrder($("#addShopForm input[name='sortOrder']")) && isValid;

                if (!isValid) {
                    layer.msg("请修正表单中的错误", {icon: 2, time: 2000});
                    return;
                }

                // 获取分类名称
                var categoryId = $("#categorySelect").val();
                var categoryName = $("#categorySelect option:selected").text();

                var formData = $("#addShopForm").serialize() + "&categoryName=" + encodeURIComponent(categoryName);

                $.ajax({
                    url: "addShop",
                    type: "post",
                    data: formData,
                    dataType: "json",
                    success: function(response) {
                        if(response.success) {
                            layer.msg(response.message, {icon: 1, time: 1000});
                            layer.close(index);
                            loadShopList();
                        } else {
                            layer.msg(response.message, {icon: 2, time: 2000});
                        }
                    }
                });
            }
        });
    }

    // 编辑商铺
    function editShop(id) {
        // 获取商铺信息
        $.ajax({
            url: "getShopById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var shop = response.data;

                    // 保存原始数据
                    var originalData = {
                        name: shop.name,
                        categoryId: shop.categoryId,
                        shopType: shop.shopType,
                        sortOrder: shop.sortOrder,
                        status: shop.status,
                        description: shop.description
                    };

                    // 填充表单
                    $("#editShopForm input[name='id']").val(shop.id);
                    $("#editShopForm input[name='name']").val(shop.name);
                    $("#editShopForm select[name='categoryId']").val(shop.categoryId);
                    $("#editShopForm select[name='shopType']").val(shop.shopType);
                    $("#editShopForm input[name='sortOrder']").val(shop.sortOrder);
                    $("#editShopForm select[name='status']").val(shop.status);
                    $("#editShopForm textarea[name='description']").val(shop.description);

                    // 打开模态框
                    layer.open({
                        type: 1,
                        title: '编辑商铺',
                        area: ['550px', '550px'],
                        content: $("#editShopModal"),
                        btn: ['提交', '取消'],
                        yes: function(index) {
                            // 检查是否有修改
                            var isModified = false;
                            var currentData = {
                                name: $("#editShopForm input[name='name']").val(),
                                categoryId: $("#editShopForm select[name='categoryId']").val(),
                                shopType: $("#editShopForm select[name='shopType']").val(),
                                sortOrder: $("#editShopForm input[name='sortOrder']").val(),
                                status: $("#editShopForm select[name='status']").val(),
                                description: $("#editShopForm textarea[name='description']").val()
                            };

                            // 比较每个字段
                            for(var key in originalData) {
                                if(currentData[key] != originalData[key]) {
                                    isModified = true;
                                    break;
                                }
                            }

                            if(!isModified) {
                                layer.msg("没有信息修改", {icon: 0, time: 2000});
                                return;
                            }

                            // 编号唯一性校验
                            var sortOrder = $("#editShopForm input[name='sortOrder']").val();
                            var originalSortOrder = shop.sortOrder;

                            if(sortOrder != originalSortOrder) {
                                // 如果编号已修改，需要检查唯一性
                                $.ajax({
                                    url: "checkSortOrderExists",
                                    type: "get",
                                    data: {sortOrder: sortOrder},
                                    dataType: "json",
                                    async: false,
                                    success: function(response) {
                                        if(response.exists) {
                                            layer.msg("该编号已存在，请使用其他编号", {icon: 2, time: 2000});
                                            return;
                                        } else {
                                            submitEditForm(index);
                                        }
                                    }
                                });
                            } else {
                                submitEditForm(index);
                            }
                        }
                    });
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }

    // 提交编辑表单
    // 提交编辑表单
    function submitEditForm(index) {
        // 执行所有校验
        var isValid = true;
        isValid = checkEditShopName($("#editShopForm input[name='name']")) && isValid;
        isValid = checkEditSortOrder($("#editShopForm input[name='sortOrder']")) && isValid;

        if (!isValid) {
            layer.msg("请修正表单中的错误", {icon: 2, time: 2000});
            return;
        }

        // 获取分类名称
        var categoryId = $("#editCategorySelect").val();
        var categoryName = $("#editCategorySelect option:selected").text();

        var formData = $("#editShopForm").serialize() + "&categoryName=" + encodeURIComponent(categoryName);

        $.ajax({
            url: "updateShop",
            type: "post",
            data: formData,
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    layer.msg(response.message, {icon: 1, time: 1000});
                    layer.close(index);
                    loadShopList();
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }

    // 删除商铺
    function deleteShop(id) {
        layer.confirm('确认要删除该商铺吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "deleteShop",
                type: "post",
                data: {id: id},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadShopList();
                    } else {
                        layer.msg(response.message, {icon: 2, time: 2000});
                    }
                }
            });
            layer.close(index);
        });
    }

    // 批量删除
    function batchDelete() {
        var ids = [];
        $("input[name='shopIds']:checked").each(function(){
            ids.push($(this).val());
        });

        if(ids.length == 0) {
            layer.msg('请选择要删除的商铺', {icon: 0, time: 1000});
            return;
        }

        layer.confirm('确认要批量删除选中的商铺吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "batchDeleteShops",
                type: "post",
                data: {"ids[]": ids},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadShopList();
                    } else {
                        layer.msg(response.message, {icon: 2, time: 2000});
                    }
                }
            });
            layer.close(index);
        });
    }

    // 日期格式化
    function formatDate(timestamp) {
        if(!timestamp) return "";

        var date = new Date(timestamp);
        var year = date.getFullYear();
        var month = padZero(date.getMonth() + 1);
        var day = padZero(date.getDate());
        var hours = padZero(date.getHours());
        var minutes = padZero(date.getMinutes());
        var seconds = padZero(date.getSeconds());

        return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
    }

    // 数字补零
    function padZero(num) {
        return num < 10 ? "0" + num : num;
    }

    // 面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);

    // 初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".Ads_list").width($(window).width()-220);

    // 当文档窗口发生改变时 触发
    $(window).resize(function(){
        $(".widget-box").height($(window).height());
        $(".Ads_list").width($(window).width()-220);
    });

    // 左侧树形菜单
    $(function() {
        $("#article_style").fix({
            float : 'left',
            skin : 'green',
            durationTime : false,
            stylewidth : '220',
            spacingw : 30,
            spacingh : 250,
            set_scrollsidebar : '.Ads_style',
            table_menu : '.Ads_list'
        });
    });
</script>