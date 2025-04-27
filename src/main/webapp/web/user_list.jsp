<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
			<script src="assets/js/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="js/H-ui.js"></script>
        <script type="text/javascript" src="js/H-ui.admin.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
<title>用户列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <div class="search_style">
                <ul class="search_content clearfix">
                    <li><label class="l_f">用户名</label><input name="username" type="text" class="text_add" placeholder="输入用户名" style="width:150px"/></li>
                    <li><label class="l_f">用户等级</label>
                        <select name="userLevel" style="width:150px">
                            <option value="">--选择用户等级--</option>
                            <option value="普通用户">普通用户</option>
                            <option value="银牌用户">银牌用户</option>
                            <option value="金牌用户">金牌用户</option>
                            <option value="管理员">管理员</option>
                        </select>
                    </li>
                    <li><label class="l_f">状态</label>
                        <select name="status" style="width:150px">
                            <option value="">--选择状态--</option>
                            <option value="0">正常</option>
                            <option value="1">锁定</option>
                        </select>
                    </li>
                    <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="startTime" name="startTime" style="margin-left:10px;">至<input class="inline laydate-icon" id="endTime" name="endTime"></li>
                    <li style="width:90px;"><button type="button" class="btn_search" onclick="searchUsers()"><i class="icon-search"></i>查询</button></li>
                </ul>
            </div>
            <!---->
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void(0)" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
        <a href="javascript:void(0)" class="btn btn-danger" onclick="batchDelete()"><i class="icon-trash"></i>批量删除</a>
       </span>
                <span class="r_f">共：<b id="totalCount">0</b>条</span>
            </div>
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="userTable">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace" id="selectAll"><span class="lbl"></span></label></th>
                        <th width="80">ID</th>
                        <th width="100"><a href="javascript:void(0)" onclick="sortBy('username')">用户名<span id="username_icon"></span></a></th>
                        <th width="80">性别</th>
                        <th width="120">手机</th>
                        <th width="150">邮箱</th>
                        <th width="300">地址</th>
                        <th width="180">加入时间</th>
                        <th width="100">等级</th>
                        <th width="70">状态</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody id="userList">
                    </tbody>
                </table>
            </div>
            <!-- 分页 -->
            <div id="pagination" class="pagination"></div>
        </div>
    </div>
</div>
<!-- 添加用户详情模态框 -->
<div id="userDetailModal" style="display:none;padding:20px;">
    <div class="user-detail-content">
        <table class="table table-bordered">
            <tr>
                <th width="100">用户ID</th>
                <td id="detail-id"></td>
            </tr>
            <tr>
                <th>用户名</th>
                <td id="detail-username"></td>
            </tr>
            <tr>
                <th>邮箱</th>
                <td id="detail-email"></td>
            </tr>
            <tr>
                <th>手机</th>
                <td id="detail-phone"></td>
            </tr>
            <tr>
                <th>性别</th>
                <td id="detail-gender"></td>
            </tr>
            <tr>
                <th>地址</th>
                <td id="detail-address"></td>
            </tr>
            <tr>
                <th>用户等级</th>
                <td id="detail-userLevel"></td>
            </tr>
            <tr>
                <th>账号状态</th>
                <td id="detail-status"></td>
            </tr>
            <tr>
                <th>注册时间</th>
                <td id="detail-createTime"></td>
            </tr>

        </table>
    </div>
</div>
<!-- 添加用户表单 -->
<div id="addUserModal" style="display:none;padding:20px;">
    <form id="addUserForm" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label">用户名：</label>
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
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-9">
                <input type="email" class="form-control" name="email" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="phone">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">性别：</label>
            <div class="col-sm-9">
                <select class="form-control" name="gender">
                    <option value="0">未知</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">地址：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="address">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">用户等级：</label>
            <div class="col-sm-9">
                <select class="form-control" name="userLevel">
                    <option value="普通用户">普通用户</option>
                    <option value="银牌用户">银牌用户</option>
                    <option value="金牌用户">金牌用户</option>
                    <option value="管理员">管理员</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">状态：</label>
            <div class="col-sm-9">
                <select class="form-control" name="status">
                    <option value="0">正常</option>
                    <option value="1">锁定</option>
                </select>
            </div>
        </div>
    </form>
</div>
</body>
</html>
<script>
    // 当前页码
    var currentPage = 1;
    // 每页记录数
    var pageSize = 10;
    // 排序字段和顺序
    var currentSortField = "";
    var currentSortOrder = "asc";

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
        loadUserList();

        // 全选/取消全选
        $("#selectAll").on('click', function(){
            $("input[name='userIds']").prop("checked", this.checked);
        });
    });

    function loadUserList() {
        var params = {
            page: currentPage,
            limit: pageSize,
            username: $("input[name='username']").val(),
            userLevel: $("select[name='userLevel']").val(),
            status: $("select[name='status']").val()
        };

        // 如果存在排序参数，添加到请求中
        if(currentSortField) {
            params.sortField = currentSortField;
            params.sortOrder = currentSortOrder;
        }

        // 添加日期参数（如果有值）
        var startTime = $("input[name='startTime']").val();
        var endTime = $("input[name='endTime']").val();
        if(startTime) params.startTime = startTime;
        if(endTime) params.endTime = endTime;

        $.ajax({
            url: "user/data",
            type: "get",
            data: params,
            dataType: "json",
            success: function(response) {
                renderUserList(response);

                // 如果需要，应用客户端排序
                if(currentSortField) {
                    applySorting();
                }
            },
            error: function(xhr, status, error) {
                console.error("加载用户数据失败:", error);
                layer.msg("加载用户数据失败", {icon: 2, time: 2000});
            }
        });
    }
    function applySorting() {
        // 获取当前页数据并排序
        var rows = $("#userList tr").get();
        rows.sort(function(a, b) {
            var colIdx = getColumnIndex(currentSortField);
            var aValue = $(a).children("td").eq(colIdx).text().toLowerCase();
            var bValue = $(b).children("td").eq(colIdx).text().toLowerCase();

            // 根据排序方向比较
            if (currentSortOrder === "asc") {
                return aValue > bValue ? 1 : -1;
            } else {
                return aValue < bValue ? 1 : -1;
            }
        });

        // 重新添加排序后的行
        $.each(rows, function(idx, row) {
            $("#userList").append(row);
        });

        // 更新排序图标
        updateSortIcons();
    }
    // 查看用户详情
    function viewUserDetail(id) {
        $.ajax({
            url: "user/get",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var user = response.data;

                    // 填充详情
                    $("#detail-id").text(user.id);
                    $("#detail-username").text(user.username || '无');
                    $("#detail-email").text(user.email || '无');
                    $("#detail-phone").text(user.phone || '无');

                    var genderText = "";
                    if(user.gender == 1) genderText = "男";
                    else if(user.gender == 2) genderText = "女";
                    else genderText = "未知";
                    $("#detail-gender").text(genderText);

                    $("#detail-address").text(user.address || '无');
                    $("#detail-userLevel").text(user.userLevel || '普通用户');

                    var statusText = user.status == 0 ? "正常" : "锁定";
                    $("#detail-status").text(statusText);

                    $("#detail-createTime").text(formatDate(user.createTime) || '无');

                    // 打开模态框
                    layer.open({
                        type: 1,
                        title: '用户详情',
                        area: ['550px', '500px'],
                        content: $("#userDetailModal"),
                        btn: ['关闭'],
                        yes: function(index) {
                            layer.close(index);
                        }
                    });
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }
    // 辅助函数：获取字段对应的列索引
    function getColumnIndex(field) {
        switch(field) {
            case 'username': return 2; // 用户名列是第3列(索引2)
            default: return 0;
        }
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

        // 更新排序图标
        updateSortIcons();

        // 获取当前页数据并排序
        var rows = $("#userList tr").get();
        rows.sort(function(a, b) {
            var colIdx = getColumnIndex(field);
            var aValue = $(a).children("td").eq(colIdx).text().toLowerCase();
            var bValue = $(b).children("td").eq(colIdx).text().toLowerCase();

            // 根据排序方向比较
            if (currentSortOrder === "asc") {
                return aValue > bValue ? 1 : -1;
            } else {
                return aValue < bValue ? 1 : -1;
            }
        });

        // 重新添加排序后的行
        $.each(rows, function(idx, row) {
            $("#userList").append(row);
        });
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

    // 渲染用户列表
    function renderUserList(data) {
        var userList = data.data;
        var total = data.count;

        // 更新总数
        $("#totalCount").text(total);

        // 清空表格
        $("#userList").empty();

        // 渲染数据行
        if(userList && userList.length > 0) {
            for(var i = 0; i < userList.length; i++) {
                var user = userList[i];
                var genderText = "";
                if(user.gender == 1) genderText = "男";
                else if(user.gender == 2) genderText = "女";
                else genderText = "未知";

                var statusText = "";
                var statusClass = "";
                if(user.status == 0) {
                    statusText = "正常";
                    statusClass = "label-success";
                } else if(user.status == 1) {
                    statusText = "锁定";
                    statusClass = "label-warning";
                }

                var row = '<tr>' +
                    '<td><label><input type="checkbox" class="ace" name="userIds" value="' + user.id + '"><span class="lbl"></span></label></td>' +
                    '<td>' + user.id + '</td>' +
                    '<td>' + user.username + '</td>' +
                    '<td>' + genderText + '</td>' +
                    '<td>' + (user.phone || '无') + '</td>' +
                    '<td>' + (user.email || '无') + '</td>' +
                    '<td class="text-l">' + (user.address || '无') + '</td>' +
                    '<td>' + formatDate(user.createTime) + '</td>' +
                    '<td>' + user.userLevel + '</td>' +
                    '<td class="td-status"><span class="label ' + statusClass + ' radius">' + statusText + '</span></td>' +
                    '<td class="td-manage">' +
                    '<a title="查看详情" onclick="viewUserDetail(' + user.id + ')" class="btn btn-xs btn-info"><i class="icon-eye-open bigger-120"></i></a> ' +
                    '<a title="编辑" onclick="editUser(' + user.id + ')" class="btn btn-xs btn-warning"><i class="icon-edit bigger-120"></i></a> ' +
                    '<a title="删除" onclick="deleteUser(' + user.id + ')" class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></a>' +
                    '</td>' +
                    '</tr>';
                $("#userList").append(row);
            }
        } else {
            // 添加无数据提示
            $("#userList").append('<tr><td colspan="11" class="text-center">暂无数据</td></tr>');
        }

        // 生成分页
        renderPagination(total);
    }

    // 渲染分页（完全照搬shop_list的分页代码）
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

    // 搜索用户
    function searchUsers() {
        currentPage = 1;
        loadUserList();
    }

    // 显示添加用户模态框
    $('#member_add').on('click', function(){
        // 重置表单
        $("#addUserForm")[0].reset();
        $("#addUserForm input[name='id']").remove(); // 移除可能存在的隐藏id字段

        layer.open({
            type: 1,
            title: '添加用户',
            area: ['550px', '500px'],
            content: $("#addUserModal"),
            btn: ['提交', '取消'],
            yes: function(index) {
                // 表单验证
                if(!validateForm()) {
                    return;
                }

                // 检查用户名是否已存在
                var username = $("#addUserForm input[name='username']").val();
                $.ajax({
                    url: "user/checkUsername",
                    type: "get",
                    data: {username: username},
                    dataType: "json",
                    success: function(response) {
                        if(response.exists) {
                            layer.msg("用户名已存在，请使用其他用户名", {icon: 2, time: 2000});
                            return;
                        } else {
                            submitAddForm(index);
                        }
                    }
                });
            }
        });
    });

    function editUser(id) {
        // 获取用户信息
        $.ajax({
            url: "user/get",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var user = response.data;

                    // 填充表单
                    $("#addUserForm")[0].reset(); // 重置表单
                    $("#addUserForm").append('<input type="hidden" name="id" value="' + user.id + '">');

                    // 使用相同的数据类型和格式进行填充
                    var username = user.username || '';
                    var email = user.email || '';
                    var phone = user.phone || '';
                    var gender = user.gender !== null ? user.gender.toString() : '0';
                    var address = user.address || '';
                    var userLevel = user.userLevel || '普通用户';
                    var status = user.status !== null ? user.status.toString() : '0';

                    $("#addUserForm input[name='username']").val(username);
                    $("#addUserForm input[name='password']").val(''); // 密码不回显
                    $("#addUserForm input[name='email']").val(email);
                    $("#addUserForm input[name='phone']").val(phone);
                    $("#addUserForm select[name='gender']").val(gender);
                    $("#addUserForm input[name='address']").val(address);
                    $("#addUserForm select[name='userLevel']").val(userLevel);
                    $("#addUserForm select[name='status']").val(status);

                    // 直接将原始数据存储在表单元素上，保证数据类型一致
                    $("#addUserForm").data('originalUsername', username);
                    $("#addUserForm").data('originalEmail', email);
                    $("#addUserForm").data('originalPhone', phone);
                    $("#addUserForm").data('originalGender', gender);
                    $("#addUserForm").data('originalAddress', address);
                    $("#addUserForm").data('originalUserLevel', userLevel);
                    $("#addUserForm").data('originalStatus', status);

                    // 打开模态框
                    layer.open({
                        type: 1,
                        title: '编辑用户',
                        area: ['550px', '500px'],
                        content: $("#addUserModal"),
                        btn: ['保存', '取消'],
                        yes: function(index) {
                            // 表单验证
                            if(!validateFormForEdit()) {
                                return;
                            }

                            // 检查是否有修改
                            var hasChange = false;

                            // 逐个检查每个字段，确保数据类型和比较方式一致
                            if($("#addUserForm input[name='username']").val() !== $("#addUserForm").data('originalUsername')) {
                                hasChange = true;
                                console.log("用户名发生变化");
                            }

                            // 密码字段不为空则视为有修改
                            if($("#addUserForm input[name='password']").val() !== '') {
                                hasChange = true;
                                console.log("密码发生变化");
                            }

                            if($("#addUserForm input[name='email']").val() !== $("#addUserForm").data('originalEmail')) {
                                hasChange = true;
                                console.log("邮箱发生变化");
                            }

                            if($("#addUserForm input[name='phone']").val() !== $("#addUserForm").data('originalPhone')) {
                                hasChange = true;
                                console.log("电话发生变化");
                            }

                            if($("#addUserForm select[name='gender']").val() !== $("#addUserForm").data('originalGender')) {
                                hasChange = true;
                                console.log("性别发生变化");
                            }

                            if($("#addUserForm input[name='address']").val() !== $("#addUserForm").data('originalAddress')) {
                                hasChange = true;
                                console.log("地址发生变化");
                            }

                            if($("#addUserForm select[name='userLevel']").val() !== $("#addUserForm").data('originalUserLevel')) {
                                hasChange = true;
                                console.log("用户级别发生变化");
                            }

                            if($("#addUserForm select[name='status']").val() !== $("#addUserForm").data('originalStatus')) {
                                hasChange = true;
                                console.log("状态发生变化");
                            }

                            // 输出调试信息
                            console.log("是否有变化: " + hasChange);

                            if (!hasChange) {
                                layer.msg("没有修改任何信息", {icon: 0, time: 2000});
                                return;
                            }

                            // 检查用户名唯一性
                            var newUsername = $("#addUserForm input[name='username']").val();
                            if(newUsername !== $("#addUserForm").data('originalUsername')) {
                                $.ajax({
                                    url: "user/checkUsername",
                                    type: "get",
                                    data: {username: newUsername, excludeId: user.id},
                                    dataType: "json",
                                    success: function(checkResponse) {
                                        if(checkResponse.exists) {
                                            layer.msg("用户名已存在，请使用其他用户名", {icon: 2, time: 2000});
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
    // 用于编辑表单的验证函数，密码可以为空
    function validateFormForEdit() {
        var username = $("#addUserForm input[name='username']").val().trim();
        var password = $("#addUserForm input[name='password']").val().trim();
        var email = $("#addUserForm input[name='email']").val().trim();
        var phone = $("#addUserForm input[name='phone']").val().trim();

        // 用户名验证
        if(username === "") {
            layer.msg("用户名不能为空", {icon: 2, time: 2000});
            return false;
        }

        // 密码验证 - 编辑时可以为空，但如果填写了则验证长度
        if(password !== "" && password.length < 8) {
            layer.msg("密码长度不能少于8位", {icon: 2, time: 2000});
            return false;
        }

        // 邮箱验证
        if(email === "") {
            layer.msg("邮箱不能为空", {icon: 2, time: 2000});
            return false;
        }
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if(!emailRegex.test(email)) {
            layer.msg("邮箱格式不正确", {icon: 2, time: 2000});
            return false;
        }

        // 手机号验证（如果填写了手机号）
        if(phone !== "") {
            var phoneRegex = /^1[3-9]\d{9}$/;
            if(!phoneRegex.test(phone)) {
                layer.msg("手机号格式不正确", {icon: 2, time: 2000});
                return false;
            }
        }

        return true;
    }

    // 表单验证函数
    function validateForm() {
        var username = $("#addUserForm input[name='username']").val().trim();
        var password = $("#addUserForm input[name='password']").val().trim();
        var email = $("#addUserForm input[name='email']").val().trim();
        var phone = $("#addUserForm input[name='phone']").val().trim();

        // 用户名验证
        if(username === "") {
            layer.msg("用户名不能为空", {icon: 2, time: 2000});
            return false;
        }

        // 密码验证
        if(password === "") {
            layer.msg("密码不能为空", {icon: 2, time: 2000});
            return false;
        }
        if(password.length < 8) {
            layer.msg("密码长度不能少于8位", {icon: 2, time: 2000});
            return false;
        }

        // 邮箱验证
        if(email === "") {
            layer.msg("邮箱不能为空", {icon: 2, time: 2000});
            return false;
        }
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if(!emailRegex.test(email)) {
            layer.msg("邮箱格式不正确", {icon: 2, time: 2000});
            return false;
        }

        // 手机号验证（如果填写了手机号）
        if(phone !== "") {
            var phoneRegex = /^1[3-9]\d{9}$/;
            if(!phoneRegex.test(phone)) {
                layer.msg("手机号格式不正确", {icon: 2, time: 2000});
                return false;
            }
        }

        return true;
    }
    // 修改提交添加表单的函数，添加验证
    function submitAddForm(index) {
        // 表单验证
        if(!validateForm()) {
            return;
        }

        var formData = $("#addUserForm").serialize();

        $.ajax({
            url: "user/add",
            type: "post",
            data: formData,
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    layer.msg(response.message, {icon: 1, time: 1000});
                    layer.close(index);
                    loadUserList();
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }
    function submitEditForm(index) {
        var formData = {};

        // 手动获取表单数据
        formData.id = $("#addUserForm input[name='id']").val();
        formData.username = $("#addUserForm input[name='username']").val();
        formData.email = $("#addUserForm input[name='email']").val();
        formData.phone = $("#addUserForm input[name='phone']").val();
        formData.gender = $("#addUserForm select[name='gender']").val();
        formData.address = $("#addUserForm input[name='address']").val();
        formData.userLevel = $("#addUserForm select[name='userLevel']").val();
        formData.status = $("#addUserForm select[name='status']").val();

        // 只有当密码不为空时，才添加到表单数据中
        var password = $("#addUserForm input[name='password']").val();
        if(password !== '') {
            formData.password = password;
        }

        $.ajax({
            url: "user/update",
            type: "post",
            data: formData,
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    layer.msg(response.message, {icon: 1, time: 1000});
                    layer.close(index);
                    loadUserList();
                } else {
                    layer.msg(response.message, {icon: 2, time: 2000});
                }
            }
        });
    }
    // 锁定用户
    function lockUser(id) {
        layer.confirm('确认要锁定该用户吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "user/lock",
                type: "post",
                data: {id: id},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadUserList();
                    } else {
                        layer.msg(response.message, {icon: 2, time: 2000});
                    }
                }
            });
            layer.close(index);
        });
    }

    // 解锁用户
    function unlockUser(id) {
        layer.confirm('确认要解锁该用户吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "user/unlock",
                type: "post",
                data: {id: id},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadUserList();
                    } else {
                        layer.msg(response.message, {icon: 2, time: 2000});
                    }
                }
            });
            layer.close(index);
        });
    }

    // 删除用户
    function deleteUser(id) {
        layer.confirm('确认要删除该用户吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "user/delete",
                type: "post",
                data: {id: id},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadUserList();
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
        $("input[name='userIds']:checked").each(function(){
            ids.push($(this).val());
        });

        if(ids.length == 0) {
            layer.msg('请选择要删除的用户', {icon: 0, time: 1000});
            return;
        }

        layer.confirm('确认要批量删除选中的用户吗？', {icon: 3, title:'提示'}, function(index){
            $.ajax({
                url: "user/batchDelete",
                type: "post",
                data: {"ids[]": ids},
                dataType: "json",
                success: function(response) {
                    if(response.success) {
                        layer.msg(response.message, {icon: 1, time: 1000});
                        loadUserList();
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

    // 分页相关函数（完全照搬shop_list的代码）
    function gotoFirstPage() {
        if(currentPage !== 1) {
            currentPage = 1;
            loadUserList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    function gotoPrevPage() {
        if(currentPage > 1) {
            currentPage--;
            loadUserList();
        } else {
            showPageTip('已经是第一页了');
        }
    }

    function gotoNextPage(totalPages) {
        if(currentPage < totalPages) {
            currentPage++;
            loadUserList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    function gotoLastPage(totalPages) {
        if(currentPage !== totalPages) {
            currentPage = totalPages;
            loadUserList();
        } else {
            showPageTip('已经是最后一页了');
        }
    }

    function gotoPage(page) {
        currentPage = page;
        loadUserList();
    }

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
        loadUserList();
    }

    function showPageTip(message) {
        layer.msg(message, {icon: 0, time: 1500});
    }
</script>