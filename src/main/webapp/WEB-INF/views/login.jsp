<%--
  Created by IntelliJ IDEA.
  User: 11841
  Date: 2019/5/2
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script src="../../resources/jquery-3.4.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <title>登录</title>
</head>
<body>

    <!-- 顶行提示 -->
    <div class="container-fluid bg-light">
        <div class="row">
            <div class="col-2 offset-2 my-4">
                <a href="/toHomePage">网上商城</a>
            </div>
            <div class="col-6 mt-4 mb-4">
                <span class="border border-warning py-1"><small>&nbsp;&nbsp;&nbsp;为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持&nbsp;&nbsp;&nbsp;</small></span>
            </div>
        </div>
    </div>

    <!-- 登录 -->
    <div class="container-fluid bg-primary" style="background:url('../../picture/login.jpg');background-size:100%;height:600px;">
        <div class="row py-5">
            <div class="col-6 offset-2 my-5 py-5">

            </div>
            <div class="col-2 my-5 py-5 bg-light">
                <form onsubmit="return false" method="post">
                    <div class="form-group">
                        <%--<label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email">--%>
                            <label>用户名:</label>
                            <input type="text" class="form-control" id="userName" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="pwd">密码:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="请输入密码">
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox"> 记住密码
                        </label>
                    </div>
                    <button id="login" class="btn btn-primary ml-2">登录</button>
                    <button type="reset" class="btn btn-primary ml-2">重置</button>
                </form>
                <a href="/toRegister">免费注册</a>
            </div>
        </div>
    </div>

    <!-- 尾行 -->
    <div class="container-fluid bg-light py-5">
        <div class="row">
            <div class="col-8 offset-2">
                <hr style="height:1px;border:none;border-top:1px solid #555555;" />
                <a>电商平台</a>
                <hr style="height:1px;border:none;border-top:1px solid #555555;" />
                <a>合作伙伴</a><br>
                <a>负责人：XXX</a><br>
                <a>联系电话：12345678901</a><br>
            </div>
        </div>
    </div>


    <script>
        $(document).ready(function ($) {
            $("#login").click(function (t) {
                $.ajax({
                    url:"/getUserinfoById",
                    async:false,
                    type:"POST",
                    dataType:"json",
                    /*data : {userId:$("#userName").val(),pwd:$("#pwd").val()},*/
                    data:'username='+$("#userName").val()+'&pwd='+$("#pwd").val(),
                    success:function (data) {
                        if ($("#userName").val()==data.extend.selectUser.username&&$("#pwd").val()==data.extend.selectUser.password){
                            alert("登录成功")
                            /*window.location.href="/toHomePage"*/
                            /*window.history.back(-1);*/
                            window.location.href=document.referrer;
                        }else {
                            alert("用户名或密码错误")
                        }
                    },
                    error:function (jqXHR) {
                        alert("该用户不存在")
                    }
                })
            });
        })
    </script>


</body>
</html>
