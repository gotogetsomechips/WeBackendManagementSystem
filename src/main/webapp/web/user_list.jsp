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
                <input type="text" class="form-control" name="username" required onblur="checkUsername(this)">
                <span id="usernameTip" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">密码：</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" name="password" required onblur="checkPassword(this)">
                <span id="passwordTip" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-9">
                <input type="email" class="form-control" name="email" required onblur="checkEmail(this)">
                <span id="emailTip" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="phone" onblur="checkPhone(this)">
                <span id="phoneTip" class="help-block"></span>
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

<!-- 编辑用户表单 -->
<div id="editUserModal" style="display:none;padding:20px;">
    <form id="editUserForm" class="form-horizontal">
        <input type="hidden" name="id">
        <div class="form-group">
            <label class="col-sm-3 control-label">用户名：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="username" required onblur="checkEditUsername(this)">
                <span id="editUsernameTip" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">密码：</label>
            <div class="col-sm-9">
                <input type="password" class="form-control" name="password" placeholder="留空表示不修改" onblur="checkEditPassword(this)">
                <span id="editPasswordTip" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-9">
                <input type="email" class="form-control" name="email" required onblur="checkEditEmail(this)">
                <span id="editEmailTip" class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机：</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="phone" onblur="checkEditPhone(this)">
                <span id="editPhoneTip" class="help-block"></span>
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

    // 校验函数
    function checkUsername(input) {
        var username = $(input).val();
        var tip = $("#usernameTip");

        if (!username) {
            showTip(tip, "用户名不能为空", "error");
            return false;
        }

        $.ajax({
            url: "user/checkUsername",
            type: "get",
            data: {username: username},
            dataType: "json",
            success: function(response) {
                if(response.exists) {
                    showTip(tip, "用户名已存在", "error");
                } else {
                    showTip(tip, "用户名可用", "success");
                }
            }
        });
        return true;
    }

    function checkEditUsername(input) {
        var username = $(input).val();
        var tip = $("#editUsernameTip");
        var id = $("#editUserForm input[name='id']").val();

        if (!username) {
            showTip(tip, "用户名不能为空", "error");
            return false;
        }

        $.ajax({
            url: "user/checkUsername",
            type: "get",
            data: {username: username, excludeId: id},
            dataType: "json",
            success: function(response) {
                if(response.exists) {
                    showTip(tip, "用户名已存在", "error");
                } else {
                    showTip(tip, "用户名可用", "success");
                }
            }
        });
        return true;
    }

    function checkPassword(input) {
        var password = $(input).val();
        var tip = $("#passwordTip");

        if (!password) {
            showTip(tip, "密码不能为空", "error");
            return false;
        }

        if (password.length < 8) {
            showTip(tip, "密码长度不能少于8位", "error");
            return false;
        }

        showTip(tip, "密码符合要求", "success");
        return true;
    }

    function checkEditPassword(input) {
        var password = $(input).val();
        var tip = $("#editPasswordTip");

        if (password && password.length < 8) {
            showTip(tip, "密码长度不能少于8位", "error");
            return false;
        }

        showTip(tip, password ? "密码符合要求" : "留空则不修改密码", "success");
        return true;
    }

    function checkEmail(input) {
        var email = $(input).val();
        var tip = $("#emailTip");

        if (!email) {
            showTip(tip, "邮箱不能为空", "error");
            return false;
        }

        if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
            showTip(tip, "请输入有效的邮箱", "error");
            return false;
        }

        showTip(tip, "邮箱格式正确", "success");
        return true;
    }

    function checkEditEmail(input) {
        var email = $(input).val();
        var tip = $("#editEmailTip");

        if (!email) {
            showTip(tip, "邮箱不能为空", "error");
            return false;
        }

        if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
            showTip(tip, "请输入有效的邮箱", "error");
            return false;
        }

        showTip(tip, "邮箱格式正确", "success");
        return true;
    }

    function checkPhone(input) {
        var phone = $(input).val();
        var tip = $("#phoneTip");

        if (phone && !/^1[3-9]\d{9}$/.test(phone)) {
            showTip(tip, "请输入有效的手机号", "error");
            return false;
        }

        showTip(tip, phone ? "手机号格式正确" : "", "success");
        return true;
    }

    function checkEditPhone(input) {
        var phone = $(input).val();
        var tip = $("#editPhoneTip");

        if (phone && !/^1[3-9]\d{9}$/.test(phone)) {
            showTip(tip, "请输入有效的手机号", "error");
            return false;
        }

        showTip(tip, phone ? "手机号格式正确" : "", "success");
        return true;
    }

    function showTip(element, message, type) {
        element.text(message);
        if (type === "success") {
            element.css({
                "color": "#28a745",  // 绿色
                "font-weight": "bold"
            });
        } else if (type === "error") {
            element.css({
                "color": "#dc3545",  // 红色
                "font-weight": "bold"
            });
        } else {
            element.css({
                "color": "",  // 恢复默认颜色
                "font-weight": ""
            });
        }
    }

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
        // 重置表单和提示信息
        $("#addUserForm")[0].reset();
        $(".help-block").text("").removeClass("text-success text-danger");

        layer.open({
            type: 1,
            title: '添加用户',
            area: ['550px', '600px'], // 增加高度以适应校验提示
            content: $("#addUserModal"),
            btn: ['提交', '取消'],
            yes: function(index) {
                // 执行所有校验
                var isValid = true;
                isValid = checkUsername($("#addUserForm input[name='username']")) && isValid;
                isValid = checkPassword($("#addUserForm input[name='password']")) && isValid;
                isValid = checkEmail($("#addUserForm input[name='email']")) && isValid;
                isValid = checkPhone($("#addUserForm input[name='phone']")) && isValid;

                if (!isValid) {
                    layer.msg("请修正表单中的错误", {icon: 2, time: 2000});
                    return;
                }

                submitAddForm(index);
            }
        });
    });

    function editUser(id) {
        $.ajax({
            url: "user/get",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    var user = response.data;

                    // 保存原始数据
                    var originalData = {
                        username: user.username,
                        password: user.password,
                        email: user.email,
                        phone: user.phone,
                        gender: user.gender,
                        address: user.address,
                        userLevel: user.userLevel,
                        status: user.status
                    };

                    // 填充表单
                    $("#editUserForm input[name='id']").val(user.id);
                    $("#editUserForm input[name='username']").val(user.username);
                    $("#editUserForm input[name='password']").val('');
                    $("#editUserForm input[name='email']").val(user.email);
                    $("#editUserForm input[name='phone']").val(user.phone);
                    $("#editUserForm select[name='gender']").val(user.gender || '0');
                    $("#editUserForm input[name='address']").val(user.address);
                    $("#editUserForm select[name='userLevel']").val(user.userLevel || '普通用户');
                    $("#editUserForm select[name='status']").val(user.status || '0');

                    // 重置提示信息
                    $(".help-block").text("").removeClass("text-success text-danger");

                    layer.open({
                        type: 1,
                        title: '编辑用户',
                        area: ['550px', '600px'],
                        content: $("#editUserModal"),
                        btn: ['保存', '取消'],
                        yes: function(index) {
                            // 检查是否有修改
                            var isModified = false;
                            var currentData = {
                                username: $("#editUserForm input[name='username']").val(),
                                password: $("#editUserForm input[name='password']").val(),
                                email: $("#editUserForm input[name='email']").val(),
                                phone: $("#editUserForm input[name='phone']").val(),
                                gender: $("#editUserForm select[name='gender']").val(),
                                address: $("#editUserForm input[name='address']").val(),
                                userLevel: $("#editUserForm select[name='userLevel']").val(),
                                status: $("#editUserForm select[name='status']").val()
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

                            // 执行所有校验
                            var isValid = true;
                            isValid = checkEditUsername($("#editUserForm input[name='username']")) && isValid;
                            isValid = checkEditPassword($("#editUserForm input[name='password']")) && isValid;
                            isValid = checkEditEmail($("#editUserForm input[name='email']")) && isValid;
                            isValid = checkEditPhone($("#editUserForm input[name='phone']")) && isValid;

                            if (!isValid) {
                                layer.msg("请修正表单中的错误", {icon: 2, time: 2000});
                                return;
                            }

                            submitEditForm(index);
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

        // 从editUserForm获取数据
        formData.id = $("#editUserForm input[name='id']").val();
        formData.username = $("#editUserForm input[name='username']").val();
        formData.email = $("#editUserForm input[name='email']").val();
        formData.phone = $("#editUserForm input[name='phone']").val();
        formData.gender = $("#editUserForm select[name='gender']").val();
        formData.address = $("#editUserForm input[name='address']").val();
        formData.userLevel = $("#editUserForm select[name='userLevel']").val();
        formData.status = $("#editUserForm select[name='status']").val();

        // 只有当密码不为空时，才添加到表单数据中
        var password = $("#editUserForm input[name='password']").val();
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