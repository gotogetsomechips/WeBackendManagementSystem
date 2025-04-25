<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="css/style.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <title>用户注册</title>
</head>

<body class="login-layout Reg_log_style">
<div class="logintop">
    <span>欢迎注册后台管理平台</span>
    <ul>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">
        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="register-box" class="login-box widget-box no-border visible">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="icon-user green"></i>
                            用户注册
                        </h4>

                        <div class="login_icon"><img src="images/login.png" /></div>

                        <form id="registerForm">
                            <fieldset>
                                <ul>
                                    <li class="frame_style form_error"><label class="user_icon"></label><input name="username" type="text" id="username"/><i>用户名</i></li>
                                    <li class="frame_style form_error"><label class="password_icon"></label><input name="password" type="password" id="password"/><i>密码</i></li>
                                    <li class="frame_style form_error"><label class="password_icon"></label><input name="confirmPassword" type="password" id="confirmPassword"/><i>确认密码</i></li>
                                    <li class="frame_style form_error"><label class="email_icon"></label><input name="email" type="text" id="email"/><i>电子邮箱</i></li>
                                    <li class="frame_style form_error"><label class="phone_icon"></label><input name="phone" type="text" id="phone"/><i>手机号码</i></li>
                                </ul>
                                <div class="space"></div>

                                <div class="clearfix">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="login">登录</a>
                                    <button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="register_btn">
                                        <i class="icon-edit"></i>
                                        注册
                                    </button>
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">
                    </div>
                </div><!-- /widget-body -->
            </div><!-- /register-box -->
        </div><!-- /position-relative -->
    </div>
</div>
<div class="loginbm">版权所有  2016  <a href="https://shop68701876.taobao.com/?spm=a211vu.server-home.sellercard.15.49965e16btRrif">楠斯素材</a> </div><strong></strong>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        // 邮箱格式验证
        function isValidEmail(email) {
            var pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            return pattern.test(email);
        }

        // 手机号格式验证
        function isValidPhone(phone) {
            var pattern = /^1[3-9]\d{9}$/;
            return pattern.test(phone);
        }

        // 注册按钮点击事件
        $('#register_btn').on('click', function(){
            var num = 0;
            var str = "";

            // 检查必填字段
            $("input[type$='text'],input[type$='password']").each(function(n){
                if($(this).val() == "" && $(this).parent().css("display") != "none") {
                    layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                        title: '提示框',
                        icon: 0,
                    });
                    num++;
                    return false;
                }
            });

            // 检查密码一致性
            if($("#password").val() != $("#confirmPassword").val()) {
                layer.alert("两次输入的密码不一致", {
                    title: '提示框',
                    icon: 0,
                });
                num++;
                return false;
            }

            // 检查邮箱格式
            if(!isValidEmail($("#email").val())) {
                layer.alert("请输入有效的邮箱地址", {
                    title: '提示框',
                    icon: 0,
                });
                num++;
                return false;
            }

            // 检查手机号格式
            if(!isValidPhone($("#phone").val())) {
                layer.alert("请输入有效的手机号码", {
                    title: '提示框',
                    icon: 0,
                });
                num++;
                return false;
            }

            if (num > 0) {
                return false;
            }

            // 提交表单
            $.ajax({
                url: "doRegister",
                type: "post",
                data: {
                    username: $("#username").val(),
                    password: $("#password").val(),
                    email: $("#email").val(),
                    phone: $("#phone").val(),
                    captcha: $("#captcha").val()
                },
                dataType: "json",
                success: function(data) {
                    if (data.success) {
                        layer.alert('注册成功！', {
                            title: '提示框',
                            icon: 1,
                            end: function() { // 用户点击确认后执行
                                location.href = "login";
                            }
                        });
                    } else {
                        layer.alert(data.message, {
                            title: '提示框',
                            icon: 0,
                        });
                        refreshCaptcha();
                    }
                }
            });
        });


        // 输入框焦点事件
        $("input[type='text'],input[type='password']").blur(function(){
            var $el = $(this);
            var $parent = $el.parent();
            $parent.attr('class','frame_style').removeClass(' form_error');
            if($el.val()==''){
                $parent.attr('class','frame_style').addClass(' form_error');
            }
        });

        $("input[type='text'],input[type='password']").focus(function(){
            var $el = $(this);
            var $parent = $el.parent();
            $parent.attr('class','frame_style').removeClass(' form_errors');
            if($el.val()==''){
                $parent.attr('class','frame_style').addClass(' form_errors');
            } else{
                $parent.attr('class','frame_style').removeClass(' form_errors');
            }
        });
    });
</script>