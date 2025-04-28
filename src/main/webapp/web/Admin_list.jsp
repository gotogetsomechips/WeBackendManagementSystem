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
    <title>管理员管理</title>
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
                        <h4 class="lighter smaller">管理员分类</h4>
                    </div>
                    <div class="widget-body">
                        <ul class="b_P_Sort_list">
                            <li><i class="orange fa fa-list"></i><a href="javascript:void(0)" onclick="filterByRole(0)">全部</a></li>
                            <c:forEach items="${roles}" var="role">
                                <li><i class="fa fa-users pink"></i><a href="javascript:void(0)" onclick="filterByRole(${role.id})">${role.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--管理员列表-->
        <div class="Ads_list">
            <div class="search_style">
                <form id="searchForm">
                    <ul class="search_content clearfix">
                        <li><label class="l_f">登录名</label><input name="username" type="text" class="text_add" placeholder="登录名" style="width:150px"></li>
                        <li><label class="l_f">状态</label>
                            <select name="status" style="width:150px">
                                <option value="">--选择状态--</option>
                                <option value="1">启用</option>
                                <option value="0">停用</option>
                            </select>
                        </li>
                        <li><label class="l_f">所属角色</label>
                            <select name="roleId" style="width:150px">
                                <option value="">--选择角色--</option>
                                <c:forEach items="${roles}" var="role">
                                    <option value="${role.id}">${role.name}</option>
                                </c:forEach>
                            </select>
                        </li>
                        <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="startTime" name="startTime" style="margin-left:10px;">至<input class="inline laydate-icon" id="endTime" name="endTime"></li>
                        <li style="width:90px;"><button type="button" class="btn_search" onclick="searchAdmins()"><i class="fa fa-search"></i>查询</button></li>
                    </ul>
                </form>
            </div>
            <div class="border clearfix">
       <span class="l_f">
         <a href="javascript:void(0)" title="添加管理员" class="btn btn-warning" onclick="showAddAdminModal()"><i class="icon-plus"></i>添加管理员</a>
         <a href="javascript:void(0)" class="btn btn-danger" onclick="batchDelete()"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
                <span class="r_f">共：<b id="totalCount">0</b>人</span>
            </div>
            <div class="article_list">
                <table class="table table-striped table-bordered table-hover" id="adminTable">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace" id="selectAll"><span class="lbl"></span></label></th>
                        <th width="80px"><a href="javascript:void(0)" onclick="sortBy('sort_order')">编号<span id="sort_order_icon"></span></a></th>
                        <th width="180">登录名</th>
                        <th width="120px">真实姓名</th>
                        <th width="120px">角色</th>
                        <th width="150px">手机</th>
                        <th width="150px">添加时间</th>
                        <th width="100px">状态</th>
                        <th width="250px">操作</th>
                    </tr>
                    </thead>
                    <tbody id="adminList">
                    </tbody>
                </table>

                <!-- 分页 -->
                <div id="pagination" class="pagination"></div>
            </div>
        </div>
    </div>
</div>

<!-- 添加管理员表单 -->
<div id="addAdminModal" style="display:none;padding:20px;">
    <form id="addAdminForm" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">登录名：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="username" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">密码：</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" name="password" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">真实姓名：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="realName">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属角色：</label>
            <div class="col-sm-9">
                <select class="form-control" name="roleId" id="roleSelect" required>
                    <option value="">--请选择角色--</option>
                    <c:forEach items="${roles}" var="role">
                        <option value="${role.id}">${role.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="mobile">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="email">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" name="sortOrder" value="0" required>
            </div>
        </div>
    </form>
</div>

<!-- 详情模态框 -->
<div id="detailAdminModal" style="display:none;padding:20px;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">编号：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailSortOrder"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">登录名：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailUsername"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">真实姓名：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailRealName"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">角色：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailRole"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailMobile"></p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-9">
                <p class="form-control-static" id="detailEmail"></p>
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
    </div>
</div>

<!-- 编辑管理员表单 -->
<div id="editAdminModal" style="display:none;padding:20px;">
    <form id="editAdminForm" class="form-horizontal">
        <input type="hidden" name="id">
        <div class="form-group">
            <label class="col-sm-3 control-label">登录名：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="username" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">密码：</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" name="password" placeholder="留空表示不修改">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">真实姓名：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="realName">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">所属角色：</label>
            <div class="col-sm-9">
                <select class="form-control" name="roleId" id="editRoleSelect" required>
                    <option value="">--请选择角色--</option>
                    <c:forEach items="${roles}" var="role">
                        <option value="${role.id}">${role.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="mobile">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="email">
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
                    <option value="1">启用</option>
                    <option value="0">停用</option>
                </select>
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
        loadAdminList();

        // 全选/取消全选
        $("#selectAll").on('click', function(){
            $("input[name='adminIds']").prop("checked", this.checked);
        });
    });

    // 加载管理员列表
    function loadAdminList() {
        var params = $("#searchForm").serialize();
        params += "&page=" + currentPage + "&limit=" + pageSize;
        params += "&sortField=" + sortField + "&sortOrder=" + sortOrder;

        $.ajax({
            url: "getAdminList",
            type: "get",
            data: params,
            dataType: "json",
            success: function(response) {
                renderAdminList(response);
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

        var $tbody = $('#adminTable tbody');
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

    // 渲染管理员列表
    function renderAdminList(data) {
        var adminList = data.data;
        var total = data.count;

        // 更新总数
        $("#totalCount").text(total);

        // 清空表格
        $("#adminList").empty();

        // 渲染数据行
        if(adminList && adminList.length > 0) {
            for(var i = 0; i < adminList.length; i++) {
                var admin = adminList[i];
                var statusText = admin.status == 1 ? "启用" : "停用";
                var statusClass = admin.status == 1 ? "label-success" : "label-defaunt";

                var row = '<tr>' +
                    '<td><label><input type="checkbox" class="ace" name="adminIds" value="' + admin.id + '"><span class="lbl"></span></label></td>' +
                    '<td>' + (admin.sortOrder || 0) + '</td>' +
                    '<td>' + admin.username + '</td>' +
                    '<td>' + (admin.realName || '无') + '</td>' +
                    '<td>' + admin.roleName + '</td>' +
                    '<td>' + (admin.mobile || '无') + '</td>' +
                    '<td>' + formatDate(admin.createTime) + '</td>' +
                    '<td class="td-status"><span class="label ' + statusClass + ' radius">' + statusText + '</span></td>' +
                    '<td class="td-manage">' +
                    '<a title="详情" onclick="viewAdminDetail(' + admin.id + ')" class="btn btn-xs btn-success"><i class="fa fa-info-circle bigger-120"></i></a>' +
                    '<a title="编辑" onclick="editAdmin(' + admin.id + ')" class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a> ' +
                    '<a title="删除" onclick="deleteAdmin(' + admin.id + ')" class="btn btn-xs btn-danger"><i class="fa fa-trash bigger-120"></i></a>' +
                    '</td>' +
                    '</tr>';
                $("#adminList").append(row);
            }
        } else {
            // 添加无数据提示
            var searchForm = $("#searchForm").serialize();
            if(searchForm && searchForm !== "") {
                $("#adminList").append('<tr><td colspan="9" class="text-center">没有找到符合条件的数据，请尝试调整搜索条件</td></tr>');
            } else {
                $("#adminList").append('<tr><td colspan="9" class="text-center">暂无数据</td></tr>');
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

    // 查看管理员详情
    function viewAdminDetail(id) {
        $.ajax({
            url: "getAdminById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var admin = response.data;
                    var statusText = admin.status == 1 ? "启用" : "停用";

                    $("#detailSortOrder").text(admin.sortOrder || 0);
                    $("#detailUsername").text(admin.username);
                    $("#detailRealName").text(admin.realName || "无");
                    $("#detailRole").text(admin.roleName);
                    $("#detailMobile").text(admin.mobile || "无");
                    $("#detailEmail").text(admin.email || "无");
                    $("#detailStatus").text(statusText);
                    $("#detailCreateTime").text(formatDate(admin.createTime));
                    $("#detailUpdateTime").text(formatDate(admin.updateTime));

                    layer.open({
                        type: 1,
                        title: '管理员详情',
                        area: ['600px', '500px'],
                        content: $("#detailAdminModal"),
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
            loadAdminList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    // 上一页
    function gotoPrevPage() {
        if(currentPage > 1) {
            currentPage--;
            loadAdminList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    // 下一页
    function gotoNextPage(totalPages) {
        if(currentPage < totalPages) {
            currentPage++;
            loadAdminList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    // 尾页
    function gotoLastPage(totalPages) {
        if(currentPage !== totalPages) {
            currentPage = totalPages;
            loadAdminList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    // 跳转到指定页
    function gotoPage(page) {
        currentPage = page;
        loadAdminList();
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
        loadAdminList();
    }

    // 显示页面提示信息
    function showPageTip(message) {
        layer.msg(message, {icon: 0, time: 1500});
    }

    // 搜索管理员
    function searchAdmins() {
        currentPage = 1;
        loadAdminList();
    }

    // 根据角色筛选
    function filterByRole(roleId) {
        $("select[name='roleId']").val(roleId);
        searchAdmins();
    }

    // 显示添加管理员模态框
    function showAddAdminModal() {
        // 重置表单
        $("#addAdminForm")[0].reset();

        layer.open({
            type: 1,
            title: '添加管理员',
            area: ['550px', '500px'],
            content: $("#addAdminModal"),
            btn: ['提交', '取消'],
            yes: function(index) {
                // 前端验证
                var username = $("#addAdminForm input[name='username']").val();
                var password = $("#addAdminForm input[name='password']").val();
                var realName = $("#addAdminForm input[name='realName']").val();
                var roleId = $("#roleSelect").val();
                var mobile = $("#addAdminForm input[name='mobile']").val();
                var email = $("#addAdminForm input[name='email']").val();
                var sortOrder = $("#addAdminForm input[name='sortOrder']").val();

                if (!username) {
                    layer.msg("登录名不能为空", {icon: 2, time: 2000});
                    return;
                }
                if (!password || password.length < 8) {
                    layer.msg("密码不能为空且长度不能少于8位", {icon: 2, time: 2000});
                    return;
                }
                if (!realName) {
                    layer.msg("真实姓名不能为空", {icon: 2, time: 2000});
                    return;
                }
                if (!roleId) {
                    layer.msg("请选择角色", {icon: 2, time: 2000});
                    return;
                }
                if (!mobile || !/^1[3-9]\d{9}$/.test(mobile)) {
                    layer.msg("请输入有效的手机号", {icon: 2, time: 2000});
                    return;
                }
                if (!email || !/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
                    layer.msg("请输入有效的邮箱", {icon: 2, time: 2000});
                    return;
                }
                if (!sortOrder) {
                    layer.msg("编号不能为空", {icon: 2, time: 2000});
                    return;
                }

                // 获取角色名称
                var roleName = $("#roleSelect option:selected").text();

                var formData = $("#addAdminForm").serialize() + "&roleName=" + encodeURIComponent(roleName);

                $.ajax({
                    url: "addAdmin",
                    type: "post",
                    data: formData,
                    dataType: "json",
                    success: function(response) {
                        if(response.success) {
                            layer.msg(response.message, {icon: 1, time: 1000});
                            layer.close(index);
                            loadAdminList();
                        } else {
                            layer.msg(response.message, {icon: 2, time: 2000});
                        }
                    }
                });
            }
        });
    }
    // 编辑管理员
    function editAdmin(id) {
        // 获取管理员信息
        $.ajax({
            url: "getAdminById",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var admin = response.data;

                    // 保存原始数据
                    var originalData = {
                        username: admin.username,
                        password: admin.password,
                        realName: admin.realName,
                        roleId: admin.roleId,
                        mobile: admin.mobile,
                        email: admin.email,
                        sortOrder: admin.sortOrder,
                        status: admin.status
                    };

                    // 填充表单
                    $("#editAdminForm input[name='id']").val(admin.id);
                    $("#editAdminForm input[name='username']").val(admin.username);
                    $("#editAdminForm input[name='password']").val('');
                    $("#editAdminForm input[name='realName']").val(admin.realName);
                    $("#editAdminForm select[name='roleId']").val(admin.roleId);
                    $("#editAdminForm input[name='mobile']").val(admin.mobile);
                    $("#editAdminForm input[name='email']").val(admin.email);
                    $("#editAdminForm input[name='sortOrder']").val(admin.sortOrder);
                    $("#editAdminForm select[name='status']").val(admin.status);

                    // 打开模态框
                    layer.open({
                        type: 1,
                        title: '编辑管理员',
                        area: ['550px', '550px'],
                        content: $("#editAdminModal"),
                        btn: ['提交', '取消'],
                        yes: function(index) {
                            // 检查是否有修改
                            var isModified = false;
                            var currentData = {
                                username: $("#editAdminForm input[name='username']").val(),
                                password: $("#editAdminForm input[name='password']").val(),
                                realName: $("#editAdminForm input[name='realName']").val(),
                                roleId: $("#editAdminForm select[name='roleId']").val(),
                                mobile: $("#editAdminForm input[name='mobile']").val(),
                                email: $("#editAdminForm input[name='email']").val(),
                                sortOrder: $("#editAdminForm input[name='sortOrder']").val(),
                                status: $("#editAdminForm select[name='status']").val()
                            };

                            // 比较每个字段
                            for(var key in originalData) {
                                if(key === 'password') continue; // 密码字段特殊处理
                                if(currentData[key] != originalData[key]) {
                                    isModified = true;
                                    break;
                                }
                            }

                            // 如果有密码输入，则视为修改
                            if(currentData.password && currentData.password.trim() !== '') {
                                isModified = true;
                            }

                            if(!isModified) {
                                layer.msg("没有信息修改", {icon: 0, time: 2000});
                                return;
                            }

                            // 登录名唯一性校验
                            var username = $("#editAdminForm input[name='username']").val();
                            var originalUsername = admin.username;

                            if(username != originalUsername) {
                                // 如果登录名已修改，需要检查唯一性
                                $.ajax({
                                    url: "admin/checkUsernameExists",
                                    type: "get",
                                    data: {username: username},
                                    dataType: "json",
                                    async: false,
                                    success: function(response) {
                                        if(response.exists) {
                                            layer.msg("该登录名已存在", {icon: 2, time: 2000});
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
        // 前端验证
        var realName = $("#editAdminForm input[name='realName']").val();
        var mobile = $("#editAdminForm input[name='mobile']").val();
        var email = $("#editAdminForm input[name='email']").val();
        var password = $("#editAdminForm input[name='password']").val();

        if (!realName) {
            layer.msg("真实姓名不能为空", {icon: 2, time: 2000});
            return;
        }
        if (!mobile || !/^1[3-9]\d{9}$/.test(mobile)) {
            layer.msg("请输入有效的手机号", {icon: 2, time: 2000});
            return;
        }
        if (!email || !/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
            layer.msg("请输入有效的邮箱", {icon: 2, time: 2000});
            return;
        }
        if (password && password.length < 8) {
            layer.msg("密码长度不能少于8位", {icon: 2, time: 2000});
            return;
        }

        // 获取角色名称
        var roleId = $("#editRoleSelect").val();
        var roleName = $("#editRoleSelect option:selected").text();

        var formData = $("#editAdminForm").serialize() + "&roleName=" + encodeURIComponent(roleName);

        $.ajax({
            url: "updateAdmin",
            type: "post",
            data: formData,
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    layer.msg(response.message, {icon: 1, time: 1000});
                    layer.close(index);
                    loadAdminList();
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }

    // 批量删除
    function batchDelete() {
        var ids = [];
        $("input[name='adminIds']:checked").each(function(){
            ids.push($(this).val());
        });

        if(ids.length == 0) {
            layer.msg('请选择要删除的管理员', {icon: 0, time: 1000});
            return;
        }

        layer.confirm('确认要批量删除选中的管理员吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "batchDeleteAdmins",
                type: "post",
                data: {"ids[]": ids},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadAdminList();
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