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
  <title>登陆</title>
</head>

<body class="login-layout Reg_log_style">
<div class="logintop">
  <span>欢迎后台管理界面平台</span>
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
      <div id="login-box" class="login-box widget-box no-border visible">
        <div class="widget-body">
          <div class="widget-main">
            <h4 class="header blue lighter bigger">
              <i class="icon-coffee green"></i>
              管理员登陆
            </h4>

            <div class="login_icon"><img src="images/login.png" /></div>

            <form id="loginForm">
              <fieldset>
                <ul>
                  <li class="frame_style form_error"><label class="user_icon"></label><input name="用户名" type="text" id="username"/><i>用户名</i></li>
                  <li class="frame_style form_error"><label class="password_icon"></label><input name="密码" type="password" id="userpwd"/><i>密码</i></li>
                  <li id="captchaLi" class="frame_style form_error" style="display:none;"><label class="Codes_icon"></label><input name="验证码" type="text" id="Codes_text"/><i>验证码</i><div class="Codes_region"><img id="captchaImg" src="captcha" alt="验证码" onclick="refreshCaptcha()"></div></li>

                </ul>
                <div class="space"></div>

                <div class="clearfix">
                  <label class="inline">
                    <input type="checkbox" class="ace">
                    <span class="lbl">保存密码</span>
                  </label>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="register">注册</a>
                  <button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="login_btn">
                    <i class="icon-key"></i>
                    登陆
                  </button>
                </div>

                <div class="space-4"></div>
              </fieldset>
            </form>

            <div class="social-or-login center">
              <span class="bigger-110">通知</span>
            </div>

            <div class="social-login center">
              本网站系统不再对IE8以下浏览器支持，请见谅。
            </div>
          </div><!-- /widget-main -->

          <div class="toolbar clearfix">



          </div>
        </div><!-- /widget-body -->
      </div><!-- /login-box -->
    </div><!-- /position-relative -->
  </div>
</div>
<div class="loginbm">版权所有  2016  <a href="https://shop68701876.taobao.com/?spm=a211vu.server-home.sellercard.15.49965e16btRrif">楠斯素材</a> </div><strong></strong>
</body>
</html>
<script type="text/javascript">
  $(document).ready(function() {
    // 监听用户名输入框变化，检查是否需要显示验证码
    $("#username").blur(function() {
      var username = $(this).val();
      if (username) {
        $.ajax({
          url: "needCaptcha",
          type: "post",
          data: {username: username},
          dataType: "json",
          success: function(data) {
            if (data.needCaptcha) {
              $("#captchaLi").show();
            } else {
              $("#captchaLi").hide();
            }
          }
        });
      }
    });

    // 刷新验证码
    window.refreshCaptcha = function() {
      $("#captchaImg").attr("src", "captcha?t=" + new Date().getTime());
    };

    // 登录按钮点击事件
    $('#login_btn').on('click', function(){
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

      if (num > 0) {
        return false;
      }

      // 提交表单
      $.ajax({
        url: "doLogin",
        type: "post",
        data: {
          username: $("#username").val(),
          password: $("#userpwd").val(),
          captcha: $("#Codes_text").val()
        },
        dataType: "json",
        success: function(data) {
          if (data.success) {
            layer.alert('登录成功！', {
              title: '提示框',
              icon: 1,
              end: function() { // 用户点击确认后执行
                location.href = "index";
              }
            });
          } else {
            layer.alert(data.message, {
              title: '提示框',
              icon: 0,
            });

            // 需要验证码
            if (data.needCaptcha) {
              $("#captchaLi").show();
              refreshCaptcha();
            }
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