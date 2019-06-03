<%--
  Created by IntelliJ IDEA.
  User: 11841
  Date: 2019/5/3
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <title>注册</title>
</head>
<body>

<!-- 顶行提示 -->
<div class="container-fluid bg-light">

    <div class="row">
        <div class="col-2 offset-2 my-4">
            <a href="/toHomePage">网上商城</a>
        </div>
        <div class="col-6 my-4">
            <span class="border border-warning py-1"><small>&nbsp;&nbsp;&nbsp;为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持！&nbsp;&nbsp;&nbsp;</small></span>
        </div>
    </div>
</div>

<!--注册-->
<div class="container-fluid">
    <div class="row">
        <div class="col-2 offset-5 my-4">
            <h1>注册</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-2 offset-5 my-4">
            <form action="/addUserinfo" method="post">
                <div class="form-group">
                    <label>用户名:</label>
                    <input class="form-control" id="username" name="username" onblur="$.checkUsername()" placeholder="请输入用户名">
                </div>
                <div class="form-group">
                    <label>密码:</label>
                    <input type="password" class="form-control" id="password" name="password" onblur="checkPassword()" placeholder="请输入只有数字的十位以内的密码">
                </div>
                <div class="form-group">
                    <label>地址:</label>
                    <input class="form-control" id="location" name="location" onblur="checkLocation()" placeholder="请输入地址">
                </div>
                <div class="form-group">
                    <label>电话:</label>
                    <input class="form-control" id="phone" name="phone" onblur="checkPhone()" placeholder="请输入电话">
                </div>

                <button type="submit" class="btn btn-primary" onclick="tips()">Submit</button>
                <button type="reset" class="btn bg-primary">reset</button>
            </form>
            <a href="/user/toLoginPage">已有账号，直接登录</a>
        </div>
    </div>

    <div class="row bg-light">
        <div class="col-8 offset-2">
            <hr style="height:1px;border:none;border-top:1px solid #555555;" />
            <a>电商平台</a>
            <hr style="height:1px;border:none;border-top:1px solid #555555;" />
            <a>合作伙伴</a><br>
            <a>负责人：XXX</a><br>
            <a>联系电话：12345678901</a><br><br><br><br><br>
        </div>
    </div>
</div>

<script>
    function tips() {
        alert("注册成功,请登录");
    }
    /*function checkUsername() {
        var username=document.getElementById("username").value;
        if (username==null||username=="")
            alert("请输入用户名");
    }*/
    $.checkUsername=function () {
        if ($("#username").val() == null || $("#username").val() == "")
            alert("请输入用户名")
        else {
            $.ajax({
                url: "/checkUsernameIfExit",
                async: false,
                type: "POST",
                dataType: "text",
                /*data : {userId:$("#userName").val(),pwd:$("#pwd").val()},*/
                data: 'username=' + $("#username").val(),
                success: function (data) {
                    if (data=="exit") {
                        alert("该用户名已存在")
                    } else {

                    }
                },
                error:function (jqXHR) {
                    alert("系统繁忙，请稍后重试")
                }
            })
        }
    }
    function checkPassword() {
        var password=document.getElementById("password").value;
        var reg=/^\d+$/;
        if (password==null||password=="")
            alert("请输入密码");
        else if(password.length>10){
            alert("请输入少于十位的密码")
        }
        else if(reg.test(password)!=true){
            alert("请输入纯数字密码")
        }
    }
    function checkLocation() {
        var location=document.getElementById("location").value;
        if (location==null||location=="")
            alert("请输入地址");
    }
    function checkPhone() {
        var phone=document.getElementById("phone").value;
        if (phone==null||phone=="")
            alert("请输入电话");
    }
</script>
</body>
</html>
