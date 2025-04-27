<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>文章管理</title>
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
                        <h4 class="lighter smaller">文章分类</h4>
                    </div>
                    <div class="widget-body">
                        <ul class="b_P_Sort_list">
                            <li><i class="orange fa fa-list"></i><a href="javascript:void(0)" onclick="filterByCategory(0)">全部</a></li>
                            <c:forEach items="${categories}" var="category">
                                <li><i class="fa fa-newspaper-o pink"></i>
                                    <a href="javascript:void(0)" onclick="filterByCategory(${category.id})">${category.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--文章列表-->
        <div class="Ads_list">
            <div class="search_style">
                <form id="searchForm">
                    <ul class="search_content clearfix">
                        <li><label class="l_f">文章标题</label><input name="title" type="text" class="text_add" placeholder="文章标题" style="width:150px"></li>
                        <li><label class="l_f">所属分类</label>
                            <select name="categoryId" style="width:150px">
                                <option value="">--选择分类--</option>
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </li>
                        <li><label class="l_f">状态</label>
                            <select name="status" style="width:150px">
                                <option value="">--全部状态--</option>
                                <option value="0">待发布</option>
                                <option value="1">显示</option>
                                <option value="2">隐藏</option>
                            </select>
                        </li>
                        <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="startTime" name="startTime" style="margin-left:10px;">至<input class="inline laydate-icon" id="endTime" name="endTime"></li>
                        <li style="width:90px;"><button type="button" class="btn_search" onclick="searchArticles()"><i class="fa fa-search"></i>查询</button></li>
                    </ul>
                </form>
            </div>
            <div class="border clearfix">
                <span class="l_f">
                    <a href="javascript:void(0)" title="添加文章" class="btn btn-warning" onclick="showAddArticleModal()"><i class="fa fa-plus"></i>添加文章</a>
                    <a href="javascript:void(0)" class="btn btn-danger" onclick="batchDelete()"><i class="fa fa-trash"></i>批量删除</a>
                </span>
                <span class="r_f">共：<b id="totalCount">0</b>篇</span>
            </div>
            <div class="article_list">
                <table class="table table-striped table-bordered table-hover" id="articleTable">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace" id="selectAll"><span class="lbl"></span></label></th>
                        <th width="80px"><a href="javascript:void(0)" onclick="sortBy('sort_order')">编号<span id="sort_order_icon"></span></a></th>
                        <th width="120px">所属分类</th>
                        <th width="220px">标题</th>
                        <th>简介</th>
                        <th width="150px">添加时间</th>
                        <th width="80px">状态</th>
                        <th width="150px">操作</th>
                    </tr>
                    </thead>
                    <tbody id="articleList">
                    </tbody>
                </table>

                <!-- 分页 -->
                <div id="pagination" class="pagination"></div>
            </div>
        </div>
    </div>
</div>

<!-- 添加文章表单 -->
<div id="addArticleModal" style="display:none;padding:20px;">
    <form id="addArticleForm" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">文章标题：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="title" required>
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
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" name="sortOrder" value="0" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">状态：</label>
            <div class="col-sm-9">
                <select class="form-control" name="status" required>
                    <option value="0">待发布</option>
                    <option value="1">显示</option>
                    <option value="2">隐藏</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">简介：</label>
            <div class="col-sm-9">
                <textarea class="form-control" name="summary" rows="4"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">内容：</label>
            <div class="col-sm-9">
                <textarea class="form-control" name="content" rows="6"></textarea>
            </div>
        </div>
    </form>
</div>

<!-- 详情模态框 -->
<div id="detailArticleModal" style="display:none;padding:20px;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">文章编号：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailSortOrder"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">文章标题：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailTitle"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属分类：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailCategory"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">状态：</label>
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
                <div class="form-control-static" id="detailSummary" style="height:auto;min-height:50px;"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">内容：</label>
            <div class="col-sm-9">
                <div class="form-control-static" id="detailContent" style="height:auto;min-height:100px;"></div>
            </div>
        </div>
    </div>
</div>

<!-- 编辑文章表单 -->
<div id="editArticleModal" style="display:none;padding:20px;">
    <form id="editArticleForm" class="form-horizontal">
        <input type="hidden" name="id">
        <div class="form-group">
            <label class="col-sm-3 control-label">文章标题：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="title" required>
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
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" name="sortOrder" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">状态：</label>
            <div class="col-sm-9">
                <select class="form-control" name="status" required>
                    <option value="0">待发布</option>
                    <option value="1">显示</option>
                    <option value="2">隐藏</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">简介：</label>
            <div class="col-sm-9">
                <textarea class="form-control" name="summary" rows="4"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">内容：</label>
            <div class="col-sm-9">
                <textarea class="form-control" name="content" rows="6"></textarea>
            </div>
        </div>
    </form>
</div>

<script>
    // 当前页码
    var currentPage = 1;
    // 每页记录数
    var pageSize = 10;
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
        loadArticleList();

        // 全选/取消全选
        $("#selectAll").on('click', function(){
            $("input[name='articleIds']").prop("checked", this.checked);
        });
    });

    // 加载文章列表
    function loadArticleList() {
        var params = $("#searchForm").serialize();
        params += "&page=" + currentPage + "&limit=" + pageSize;

        $.ajax({
            url: "getArticleList",
            type: "get",
            data: params,
            dataType: "json",
            success: function(response) {
                renderArticleList(response);
                // 在渲染完成后，根据当前的排序状态对页面数据进行排序
                if (currentSortField) {
                    sortCurrentPage();
                }
            }
        });
    }
    // 对当前页数据进行排序
    function sortCurrentPage() {
        if (!currentSortField) return; // 如果没有排序字段，不进行排序

        var columnIndex = getColumnIndex(currentSortField);
        var rows = $("#articleList tr").get();

        // 根据指定列的值进行排序
        rows.sort(function(a, b) {
            var aValue = $(a).children("td").eq(columnIndex).text();
            var bValue = $(b).children("td").eq(columnIndex).text();

            // 如果是数字类型，转为数字再比较
            if (currentSortField === 'sort_order') {
                aValue = parseInt(aValue) || 0;
                bValue = parseInt(bValue) || 0;
            }

            // 升序或降序比较
            if (currentSortOrder === "asc") {
                return aValue > bValue ? 1 : -1;
            } else {
                return aValue < bValue ? 1 : -1;
            }
        });

        // 重新添加排序后的行
        $.each(rows, function(index, row) {
            $("#articleList").append(row);
        });
    }
    // 辅助函数：获取字段对应的列索引
    function getColumnIndex(field) {
        switch(field) {
            case 'sort_order': return 1; // 编号列是第2列(索引1)
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

    // 更新排序图标，使用中文显示
    function updateSortIcons() {
        $("[id$='_icon']").text(""); // 清除所有图标
        if (currentSortField) {
            $('#' + currentSortField + '_icon').text(
                currentSortOrder === "asc" ? "↑" : "↓"
            );
        }
    }

    // 渲染文章列表
    function renderArticleList(data) {
        var articleList = data.data;
        var total = data.count;

        // 更新总数
        $("#totalCount").text(total);

        // 清空表格
        $("#articleList").empty();

        // 渲染数据行
        if(articleList && articleList.length > 0) {
            for(var i = 0; i < articleList.length; i++) {
                var article = articleList[i];
                var statusText = "";
                if(article.status == 0) statusText = "待发布";
                else if(article.status == 1) statusText = "显示";
                else if(article.status == 2) statusText = "隐藏";

                var row = '<tr>' +
                    '<td><label><input type="checkbox" class="ace" name="articleIds" value="' + article.id + '"><span class="lbl"></span></label></td>' +
                    '<td>' + (article.sortOrder || 0) + '</td>' +
                    '<td>' + article.categoryName + '</td>' +
                    '<td>' + article.title + '</td>' +
                    '<td>' + (article.summary ? article.summary : '无') + '</td>' +
                    '<td>' + formatDate(article.createTime) + '</td>' +
                    '<td>' + statusText + '</td>' +
                    '<td class="td-manage">' +
                    '<a title="详情" onclick="viewArticleDetail(' + article.id + ')" class="btn btn-xs btn-success"><i class="fa fa-info-circle bigger-120"></i></a>' +
                    '<a title="编辑" onclick="editArticle(' + article.id + ')" class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a> ' +
                    '<a title="删除" onclick="deleteArticle(' + article.id + ')" class="btn btn-xs btn-danger"><i class="fa fa-trash bigger-120"></i></a>' +
                    '</td>' +
                    '</tr>';
                $("#articleList").append(row);
            }

            // 重新初始化显示部分文本
            $(".displayPart").displayPart();
        } else {
            // 添加无数据提示
            var searchForm = $("#searchForm").serialize();
            if(searchForm && searchForm !== "") {
                $("#articleList").append('<tr><td colspan="8" class="text-center">没有找到符合条件的文章，请尝试调整搜索条件</td></tr>');
            } else {
                $("#articleList").append('<tr><td colspan="8" class="text-center">暂无数据</td></tr>');
            }
        }

        // 生成分页
        renderPagination(total);

        // 当前页数据渲染完成后，应用当前排序状态
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

    // 查看文章详情
    function viewArticleDetail(id) {
        $.ajax({
            url: "getArticleById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var article = response.data;
                    var statusText = "";
                    if(article.status == 0) statusText = "待发布";
                    else if(article.status == 1) statusText = "显示";
                    else if(article.status == 2) statusText = "隐藏";

                    $("#detailSortOrder").text(article.sortOrder || 0);
                    $("#detailTitle").text(article.title);
                    $("#detailCategory").text(article.categoryName);
                    $("#detailStatus").text(statusText);
                    $("#detailCreateTime").text(formatDate(article.createTime));
                    $("#detailUpdateTime").text(formatDate(article.updateTime));
                    $("#detailSummary").text(article.summary || "无");
                    $("#detailContent").text(article.content || "无");

                    layer.open({
                        type: 1,
                        title: '文章详情',
                        area: ['700px', '600px'],
                        content: $("#detailArticleModal"),
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
            loadArticleList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    // 上一页
    function gotoPrevPage() {
        if(currentPage > 1) {
            currentPage--;
            loadArticleList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    // 下一页
    function gotoNextPage(totalPages) {
        if(currentPage < totalPages) {
            currentPage++;
            loadArticleList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    // 尾页
    function gotoLastPage(totalPages) {
        if(currentPage !== totalPages) {
            currentPage = totalPages;
            loadArticleList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    // 跳转到指定页
    function gotoPage(page) {
        currentPage = page;
        loadArticleList();
    }

    // 输入页码跳转
    function gotoInputPage(totalPages) {
        var inputPage = parseInt($("#pageInput").val());

        if(isNaN(inputPage)) {
            showPageTip('请输入有效的页码');
            return;
        }

        if(inputPage < 1 || inputPage > totalPages) {
            showPageTip('页码超出范围，有效页码为 1 到 ' + totalPages);
            return;
        }

        currentPage = inputPage;
        loadArticleList();
    }

    // 显示页面提示信息
    function showPageTip(message) {
        layer.msg(message, {icon: 0, time: 1500});
    }

    // 搜索文章
    function searchArticles() {
        currentPage = 1;
        loadArticleList();
    }

    // 根据分类筛选
    function filterByCategory(categoryId) {
        $("select[name='categoryId']").val(categoryId);
        searchArticles();
    }

    // 添加文章表单验证
    function showAddArticleModal() {
        // 重置表单
        $("#addArticleForm")[0].reset();

        layer.open({
            type: 1,
            title: '添加文章',
            area: ['600px', '600px'],
            content: $("#addArticleModal"), // 这里修改为正确的模态框ID
            btn: ['提交', '取消'],
            yes: function(index) {
                // 验证必填项
                var title = $("#addArticleForm input[name='title']").val();
                var categoryId = $("#categorySelect").val();
                var sortOrder = $("#addArticleForm input[name='sortOrder']").val();
                var status = $("#addArticleForm select[name='status']").val();
                var content = $("#addArticleForm textarea[name='content']").val();

                if(!title) {
                    layer.msg('请填写文章标题', {icon: 2, time: 2000});
                    return;
                }
                if(!categoryId) {
                    layer.msg('请选择所属分类', {icon: 2, time: 2000});
                    return;
                }
                if(!sortOrder) {
                    layer.msg('请填写编号', {icon: 2, time: 2000});
                    return;
                }
                if(!status) {
                    layer.msg('请选择状态', {icon: 2, time: 2000});
                    return;
                }
                if(!content) {
                    layer.msg('请填写文章内容', {icon: 2, time: 2000});
                    return;
                }

                // 获取分类名称
                var categoryName = $("#categorySelect option:selected").text();

                var formData = $("#addArticleForm").serialize() + "&categoryName=" + encodeURIComponent(categoryName);

                $.ajax({
                    url: "addArticle",
                    type: "post",
                    data: formData,
                    dataType: "json",
                    success: function(response) {
                        if(response.success) {
                            layer.msg(response.message, {icon: 1, time: 1000});
                            layer.close(index);
                            loadArticleList();
                        } else {
                            layer.msg(response.message, {icon: 2, time: 2000});
                        }
                    }
                });
            }
        });
    }
    // 编辑文章
    function editArticle(id) {
        // 获取文章信息
        $.ajax({
            url: "getArticleById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var article = response.data;

                    // 保存原始数据
                    var originalData = {
                        title: article.title,
                        categoryId: article.categoryId,
                        sortOrder: article.sortOrder,
                        status: article.status,
                        summary: article.summary,
                        content: article.content
                    };

                    // 填充表单
                    $("#editArticleForm input[name='id']").val(article.id);
                    $("#editArticleForm input[name='title']").val(article.title);
                    $("#editArticleForm select[name='categoryId']").val(article.categoryId);
                    $("#editArticleForm input[name='sortOrder']").val(article.sortOrder);
                    $("#editArticleForm select[name='status']").val(article.status);
                    $("#editArticleForm textarea[name='summary']").val(article.summary);
                    $("#editArticleForm textarea[name='content']").val(article.content);

                    // 打开模态框
                    layer.open({
                        type: 1,
                        title: '编辑文章',
                        area: ['600px', '600px'],
                        content: $("#editArticleModal"),
                        btn: ['提交', '取消'],
                        yes: function(index) {
                            // 检查是否有修改
                            var isModified = false;
                            var currentData = {
                                title: $("#editArticleForm input[name='title']").val(),
                                categoryId: $("#editArticleForm select[name='categoryId']").val(),
                                sortOrder: $("#editArticleForm input[name='sortOrder']").val(),
                                status: $("#editArticleForm select[name='status']").val(),
                                summary: $("#editArticleForm textarea[name='summary']").val(),
                                content: $("#editArticleForm textarea[name='content']").val()
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
                            var sortOrder = $("#editArticleForm input[name='sortOrder']").val();
                            var originalSortOrder = article.sortOrder;

                            if(sortOrder != originalSortOrder) {
                                // 如果编号已修改，需要检查唯一性
                                $.ajax({
                                    url: "checkArticleSortOrderExists",
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

        var formData = $("#editArticleForm").serialize() + "&categoryName=" + encodeURIComponent(categoryName);

        $.ajax({
            url: "updateArticle",
            type: "post",
            data: formData,
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    layer.msg(response.message, {icon: 1, time: 1000});
                    layer.close(index);
                    loadArticleList();
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }

    // 删除文章
    function deleteArticle(id) {
        layer.confirm('确认要删除该文章吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "deleteArticle",
                type: "post",
                data: {id: id},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadArticleList();
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
        $("input[name='articleIds']:checked").each(function(){
            ids.push($(this).val());
        });

        if(ids.length == 0) {
            layer.msg('请选择要删除的文章', {icon: 0, time: 1000});
            return;
        }

        layer.confirm('确认要批量删除选中的文章吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "batchDeleteArticles",
                type: "post",
                data: {"ids[]": ids},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadArticleList();
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
</body>
</html>