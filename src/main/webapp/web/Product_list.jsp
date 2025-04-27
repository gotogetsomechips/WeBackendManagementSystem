<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript" ></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript" src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <title>产品列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="products_style">
        <div class="search_style">
            <form id="searchForm">
                <ul class="search_content clearfix">
                    <li><label class="l_f">产品名称</label><input name="name" type="text" class="text_add" placeholder="输入产品名称" style="width:150px"></li>
                    <li><label class="l_f">所属分类</label>
                        <select name="categoryId" style="width:150px">
                            <option value="">--选择分类--</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </li>
                    <li><label class="l_f">地区</label>
                        <select name="region" style="width:100px">
                            <option value="">--选择地区--</option>
                            <option value="中国">中国</option>
                            <option value="美国">美国</option>
                            <option value="日本">日本</option>
                            <option value="法国">法国</option>
                        </select>
                    </li>
                    <li><label class="l_f">价格区间</label>
                        <input name="minPrice" type="number" class="text_add" placeholder="最低价" style="width:80px">
                        <span>-</span>
                        <input name="maxPrice" type="number" class="text_add" placeholder="最高价" style="width:80px">
                    </li>
                    <li><label class="l_f">添加时间</label>
                        <input class="inline laydate-icon" id="startTime" name="startTime" style="margin-left:10px;">
                        <span>至</span>
                        <input class="inline laydate-icon" id="endTime" name="endTime">
                    </li>
                    <li style="width:90px;">
                        <button type="button" class="btn_search" onclick="searchProducts()"><i class="icon-search"></i>查询</button>
                    </li>
                </ul>
            </form>
        </div>
        <div class="border clearfix">
            <span class="l_f">
                <a href="javascript:void(0)" title="添加产品" class="btn btn-warning" onclick="showAddProductModal()"><i class="icon-plus"></i>添加产品</a>
                <a href="javascript:void(0)" class="btn btn-danger" onclick="batchDeleteProducts()"><i class="icon-trash"></i>批量删除</a>
            </span>
            <span class="r_f">共：<b id="totalCount">0</b>件产品</span>
        </div>
        <!--产品列表展示-->
        <div class="h_products_list clearfix" id="products_list">
            <div id="scrollsidebar" class="left_Treeview">
                <div class="show_btn" id="rightArrow"><span></span></div>
                <div class="widget-box side_content">
                    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                    <div class="side_list">
                        <div class="widget-header header-color-green2">
                            <h4 class="lighter smaller">产品分类列表</h4>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main padding-8">
                                <ul id="treeDemo" class="ztree"></ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="table_menu_list" id="productTableWrapper">
                <table class="table table-striped table-bordered table-hover" id="productTable">
                    <thead>
                    <tr>
                        <th width="25px"><label><input type="checkbox" class="ace" id="selectAll"><span class="lbl"></span></label></th>
                        <th width="80px"><a href="javascript:void(0)" onclick="sortBy('sort_order')">编号<span id="sort_order_icon"></span></a></th>
                        <th width="250px">产品名称</th>
                        <th width="100px">原价格</th>
                        <th width="100px">现价</th>
                        <th width="100px">所属地区</th>
                        <th width="180px">加入时间</th>
                        <th width="80px">审核状态</th>
                        <th width="70px">状态</th>
                        <th width="250px">操作</th>
                    </tr>
                    </thead>
                    <tbody id="productList">
                    </tbody>
                </table>
                <!-- 分页 -->
                <div id="pagination" class="pagination"></div>
            </div>
        </div>
    </div>
</div>

<!-- 添加产品表单 -->
<div id="addProductModal" style="display:none;padding:20px;">
    <form id="addProductForm" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">产品名称：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="name" required>
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
            <label class="col-sm-3 control-label">原价格：</label>
            <div class="col-sm-9">
                <input type="number" step="0.01" class="form-control" name="originalPrice" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">现价：</label>
            <div class="col-sm-9">
                <input type="number" step="0.01" class="form-control" name="currentPrice" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属地区：</label>
            <div class="col-sm-9">
                <select class="form-control" name="region">
                    <option value="中国">中国</option>
                    <option value="美国">美国</option>
                    <option value="日本">日本</option>
                    <option value="法国">法国</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" name="sortOrder" required>
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
<div id="detailProductModal" style="display:none;padding:20px;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">产品编号：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailSortOrder"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">产品名称：</label>
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
            <label class="col-sm-3 control-label">原价格：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailOriginalPrice"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">现价：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailCurrentPrice"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属地区：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailRegion"></p>
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
            <label class="col-sm-3 control-label">产品简介：</label>
            <div class="col-sm-9">
                <div class="form-control-static" id="detailDescription" style="height:auto;min-height:100px;"></div>
            </div>
        </div>
    </div>
</div>
<!-- 编辑产品表单 -->
<div id="editProductModal" style="display:none;padding:20px;">
    <form id="editProductForm" class="form-horizontal">
        <input type="hidden" name="id">
        <div class="form-group">
            <label class="col-sm-3 control-label">产品名称：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="name" required>
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
            <label class="col-sm-3 control-label">原价格：</label>
            <div class="col-sm-9">
                <input type="number" step="0.01" class="form-control" name="originalPrice" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">现价：</label>
            <div class="col-sm-9">
                <input type="number" step="0.01" class="form-control" name="currentPrice" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属地区：</label>
            <div class="col-sm-9">
                <select class="form-control" name="region">
                    <option value="中国">中国</option>
                    <option value="美国">美国</option>
                    <option value="日本">日本</option>
                    <option value="法国">法国</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" name="sortOrder" required>
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
    // 当前排序字段
    var currentSortField = "sort_order";
    // 当前排序方向
    var currentSortOrder = "asc";
    var currentPageProducts = [];
    $(function () {
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
        loadProductList();

        // 全选/取消全选
        $("#selectAll").on('click', function(){
            $("input[name='productIds']").prop("checked", this.checked);
        });

        // 初始化树形分类
        initCategoryTree();

        // 初始化侧边栏
        initSidebar();

        // 调整表格容器高度，为分页留出空间
        adjustTableHeight();
    });
    // 添加调整表格高度的函数
    function adjustTableHeight() {
        var windowHeight = $(window).height();
        var headerHeight = $(".search_style").outerHeight() + $(".border").outerHeight();
        var paginationHeight = 60; // 为分页预留高度

        var tableHeight = windowHeight - headerHeight - paginationHeight - 50; // 50为额外边距

        $("#productTableWrapper").css("height", tableHeight + "px");
        $("#productTable").css("height", "100%");

        // 重新计算滚动条位置
        if ($.fn.dataTable.isDataTable("#productTable")) {
            $("#productTable").DataTable().columns.adjust();
        }
    }
    // 初始化侧边栏
    function initSidebar() {
        $("#products_style").fix({
            float: 'left',
            skin: 'green',
            durationTime: false,
            spacingw: 30,
            spacingh: 260,
            closeBtn: ".close_btn",
            trigger: "#rightArrow",
            onClose: function() {
                $(".table_menu_list").width($(window).width() - 50);
            },
            onOpen: function() {
                $(".table_menu_list").width($(window).width() - 220);
            }
        });
    }

    // 初始化分类树
    function initCategoryTree() {
        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,
                selectedMulti: false
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: 0
                }
            },
            callback: {
                onClick: function(event, treeId, treeNode) {
                    if (treeNode.id === 0) {
                        // 点击"所有分类"时清空分类筛选
                        $("select[name='categoryId']").val('');
                    } else if (!treeNode.isParent) {
                        // 当点击叶子节点时，按分类ID筛选产品
                        $("select[name='categoryId']").val(treeNode.id);
                    }
                    searchProducts();
                }
            }
        };

        // 获取分类数据
        $.ajax({
            url: "product/getAllCategories",
            type: "get",
            dataType: "json",
            success: function(response) {
                if (response && response.length > 0) {
                    // 构建树形结构数据
                    var zNodes = buildTreeData(response);
                    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                }
            }
        });
    }

    // 构建树形结构数据
    function buildTreeData(categories) {
        // 这里假设categories已经是树形结构数据
        // 如果数据库中是扁平结构，需要在这里转换为树形结构
        // 示例代码假设categories已经是[{id, pId, name}]格式

        // 添加根节点
        var zNodes = [{
            id: 0,
            pId: null,
            name: "所有分类",
            open: true
        }];

        // 添加分类数据
        $.each(categories, function(i, category) {
            zNodes.push({
                id: category.id,
                pId: category.parentId || 0, // 假设有parentId字段，如果没有则默认为0
                name: category.name
            });
        });

        return zNodes;
    }

    // 加载产品列表
    function loadProductList() {
        var params = $("#searchForm").serialize();
        params += "&page=" + currentPage + "&limit=" + pageSize;
        // 不发送排序参数，只获取原始顺序的数据

        $.ajax({
            url: "getProductList",
            type: "get",
            data: params,
            dataType: "json",
            success: function(response) {
                // 保存当前页数据
                currentPageProducts = response.data;

                // 应用当前的排序状态到新获取的数据
                if(currentSortField && currentSortOrder) {
                    sortCurrentPageData();
                }

                // 渲染排序后的数据
                renderProductList(response);

                // 更新排序图标
                updateSortIcons();
            },
            error: function() {
                layer.msg("加载数据失败，请稍后重试", {icon: 2, time: 2000});
            }
        });
    }
    // 本地排序当前页面数据
    function sortCurrentPageData() {
        if(!currentPageProducts || currentPageProducts.length === 0) return;

        currentPageProducts.sort(function(a, b) {
            var aValue, bValue;

            // 根据排序字段获取对应的值
            switch(currentSortField) {
                case 'sort_order':
                    aValue = parseInt(a.sortOrder || 0);
                    bValue = parseInt(b.sortOrder || 0);
                    break;
                // 可以添加其他字段的排序逻辑
                default:
                    aValue = a.sortOrder || 0;
                    bValue = b.sortOrder || 0;
            }

            // 根据排序方向比较
            if(currentSortOrder === "asc") {
                return aValue - bValue;
            } else {
                return bValue - aValue;
            }
        });
    }
    // 根据字段排序
    function sortBy(field) {
        // 更新全局排序状态
        if (currentSortField === field) {
            currentSortOrder = currentSortOrder === "asc" ? "desc" : "asc";
        } else {
            currentSortField = field;
            currentSortOrder = "asc";
        }

        // 对当前页数据进行排序
        sortCurrentPageData();

        // 更新排序图标
        updateSortIcons();

        // 重新渲染表格（不重新请求数据）
        var response = {
            data: currentPageProducts,
            count: $("#totalCount").text()
        };
        renderProductList(response);
    }
    // 更新排序图标
    function updateSortIcons() {
        $("[id$='_icon']").html(""); // 清除所有图标
        if (currentSortField) {
            var iconText = currentSortOrder === "asc" ?
                '<i class="icon-sort-up" style="margin-left:5px;"></i> <span style="font-size:12px;"></span>' :
                '<i class="icon-sort-down" style="margin-left:5px;"></i> <span style="font-size:12px;"></span>';
            $('#' + currentSortField + '_icon').html(iconText);
        }
    }

    // 渲染产品列表
    function renderProductList(data) {
        var productList = data.data;
        var total = data.count;

        // 更新总数
        $("#totalCount").text(total);

        // 清空表格
        $("#productList").empty();

        // 渲染数据行
        if(productList && productList.length > 0) {
            for(var i = 0; i < productList.length; i++) {
                var product = productList[i];
                var statusText = "";
                if(product.status == 0) statusText = "待审核";
                else if(product.status == 1) statusText = "通过";
                else if(product.status == 2) statusText = "拒绝";

                var row = '<tr>' +
                    '<td><label><input type="checkbox" class="ace" name="productIds" value="' + product.id + '"><span class="lbl"></span></label></td>' +
                    '<td>' + (product.sortOrder || 0) + '</td>' +
                    '<td>' + product.name + '</td>' +
                    '<td>' + product.originalPrice + '</td>' +
                    '<td>' + product.currentPrice + '</td>' +
                    '<td>' + product.region + '</td>' +
                    '<td>' + formatDate(product.createTime) + '</td>' +
                    '<td>' + statusText + '</td>' +
                    '<td><span class="label label-' + (product.status == 1 ? 'success' : 'warning') + ' radius">' + (product.status == 1 ? '已启用' : '未启用') + '</span></td>' +
                    '<td class="td-manage">' +
                    '<a title="详情" onclick="viewProductDetail(' + product.id + ')" class="btn btn-xs btn-success"><i class="icon-info-sign bigger-120"></i></a> ' +
                    '<a title="编辑" onclick="editProduct(' + product.id + ')" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a> ' +
                    '<a title="删除" onclick="deleteProduct(' + product.id + ')" class="btn btn-xs btn-warning"><i class="icon-trash bigger-120"></i></a>' +
                    '</td>' +
                    '</tr>';
                $("#productList").append(row);
            }
        } else {
            // 添加无数据提示
            var searchForm = $("#searchForm").serialize();
            if(searchForm && searchForm !== "") {
                $("#productList").append('<tr><td colspan="10" class="text-center">没有找到符合条件的数据，请尝试调整搜索条件</td></tr>');
            } else {
                $("#productList").append('<tr><td colspan="10" class="text-center">暂无数据</td></tr>');
            }
        }

        // 生成分页
        renderPagination(total);
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

    // 查看产品详情
    function viewProductDetail(id) {
        $.ajax({
            url: "getProductById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var product = response.data;
                    var statusText = "";
                    if(product.status == 0) statusText = "待审核";
                    else if(product.status == 1) statusText = "通过";
                    else if(product.status == 2) statusText = "拒绝";

                    $("#detailSortOrder").text(product.sortOrder || 0);
                    $("#detailName").text(product.name);
                    $("#detailCategory").text(product.categoryName);
                    $("#detailOriginalPrice").text(product.originalPrice);
                    $("#detailCurrentPrice").text(product.currentPrice);
                    $("#detailRegion").text(product.region);
                    $("#detailStatus").text(statusText);
                    $("#detailCreateTime").text(formatDate(product.createTime));
                    $("#detailUpdateTime").text(formatDate(product.updateTime));
                    $("#detailDescription").text(product.description || "无");

                    layer.open({
                        type: 1,
                        title: '产品详情',
                        area: ['600px', '600px'],
                        content: $("#detailProductModal"),
                        btn: ['关闭']
                    });
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }

    // 页面跳转相关函数修改
    function gotoFirstPage() {
        if(currentPage !== 1) {
            currentPage = 1;
            loadProductList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    function gotoPrevPage() {
        if(currentPage > 1) {
            currentPage--;
            loadProductList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    function gotoNextPage(totalPages) {
        if(currentPage < totalPages) {
            currentPage++;
            loadProductList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    function gotoLastPage(totalPages) {
        if(currentPage !== totalPages) {
            currentPage = totalPages;
            loadProductList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    function gotoPage(page) {
        currentPage = page;
        loadProductList();
    }
    // 输入页码跳转
    function gotoInputPage(totalPages) {
        var inputPage = parseInt($("#pageInput").val());

        if(isNaN(inputPage)) {
            showPageTip('请输入有效的页码');
            return;
        }

        if(inputPage <= 0 || inputPage > totalPages) {
            showPageTip('页码超出范围');
            return;
        }

        currentPage = inputPage;
        loadProductList();
    }

    // 显示页面提示信息
    function showPageTip(message) {
        layer.msg(message, {icon: 0, time: 1500});
    }

    // 搜索产品
    function searchProducts() {
        currentPage = 1;
        loadProductList();
    }

    // 显示添加产品模态框
    function showAddProductModal() {
        // 重置表单
        $("#addProductForm")[0].reset();

        layer.open({
            type: 1,
            title: '添加产品',
            area: ['550px', '500px'],
            content: $("#addProductModal"),
            btn: ['提交', '取消'],
            yes: function(index) {
                // 获取分类名称
                var categoryId = $("#categorySelect").val();
                var categoryName = $("#categorySelect option:selected").text();

                var formData = $("#addProductForm").serialize() + "&categoryName=" + encodeURIComponent(categoryName);

                $.ajax({
                    url: "addProduct",
                    type: "post",
                    data: formData,
                    dataType: "json",
                    success: function(response) {
                        if(response.success) {
                            layer.msg(response.message, {icon: 1, time: 1000});
                            layer.close(index);
                            loadProductList();
                        } else {
                            layer.msg(response.message, {icon: 2, time: 2000});
                        }
                    }
                });
            }
        });
    }

    // 编辑产品
    function editProduct(id) {
        // 获取产品信息
        $.ajax({
            url: "getProductById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var product = response.data;

                    // 保存原始数据
                    var originalData = {
                        name: product.name,
                        categoryId: product.categoryId,
                        originalPrice: product.originalPrice,
                        currentPrice: product.currentPrice,
                        region: product.region,
                        sortOrder: product.sortOrder,
                        status: product.status,
                        description: product.description
                    };

                    // 填充表单
                    $("#editProductForm input[name='id']").val(product.id);
                    $("#editProductForm input[name='name']").val(product.name);
                    $("#editProductForm select[name='categoryId']").val(product.categoryId);
                    $("#editProductForm input[name='originalPrice']").val(product.originalPrice);
                    $("#editProductForm input[name='currentPrice']").val(product.currentPrice);
                    $("#editProductForm select[name='region']").val(product.region);
                    $("#editProductForm input[name='sortOrder']").val(product.sortOrder);
                    $("#editProductForm select[name='status']").val(product.status);
                    $("#editProductForm textarea[name='description']").val(product.description);

                    // 打开模态框
                    layer.open({
                        type: 1,
                        title: '编辑产品',
                        area: ['550px', '550px'],
                        content: $("#editProductModal"),
                        btn: ['提交', '取消'],
                        yes: function(index) {
                            // 检查是否有修改
                            var isModified = false;
                            var currentData = {
                                name: $("#editProductForm input[name='name']").val(),
                                categoryId: $("#editProductForm select[name='categoryId']").val(),
                                originalPrice: $("#editProductForm input[name='originalPrice']").val(),
                                currentPrice: $("#editProductForm input[name='currentPrice']").val(),
                                region: $("#editProductForm select[name='region']").val(),
                                sortOrder: $("#editProductForm input[name='sortOrder']").val(),
                                status: $("#editProductForm select[name='status']").val(),
                                description: $("#editProductForm textarea[name='description']").val()
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
                            var sortOrder = $("#editProductForm input[name='sortOrder']").val();
                            var originalSortOrder = product.sortOrder;

                            if(sortOrder != originalSortOrder) {
                                // 如果编号已修改，需要检查唯一性
                                $.ajax({
                                    url: "product/checkSortOrderExists",
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
    function submitEditForm(index) {
        // 获取分类名称
        var categoryId = $("#editCategorySelect").val();
        var categoryName = $("#editCategorySelect option:selected").text();

        var formData = $("#editProductForm").serialize() + "&categoryName=" + encodeURIComponent(categoryName);

        $.ajax({
            url: "updateProduct",
            type: "post",
            data: formData,
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    layer.msg(response.message, {icon: 1, time: 1000});
                    layer.close(index);
                    loadProductList();
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }

    // 删除产品
    function deleteProduct(id) {
        layer.confirm('确认要删除该产品吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "deleteProduct",
                type: "post",
                data: {id: id},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadProductList();
                    } else {
                        layer.msg(response.message, {icon: 2, time: 2000});
                    }
                }
            });
            layer.close(index);
        });
    }

    // 批量删除产品
    function batchDeleteProducts() {
        var ids = [];
        $("input[name='productIds']:checked").each(function(){
            ids.push($(this).val());
        });

        if(ids.length == 0) {
            layer.msg('请选择要删除的产品', {icon: 0, time: 1000});
            return;
        }

        layer.confirm('确认要批量删除选中的产品吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "batchDeleteProducts",
                type: "post",
                data: {"ids[]": ids},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadProductList();
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

    // 初始化宽度、高度
    $(".widget-box").height($(window).height()+50);
    $(".table_menu_list").width($(window).width()-250);

    // 在窗口大小改变时也调整高度
    $(window).resize(function(){
        $(".widget-box").height($(window).height());
        $(".table_menu_list").width($(window).width() - ($(".side_content").is(":visible") ? 220 : 70));
        adjustTableHeight();
    });
</script>
</body>
</html>