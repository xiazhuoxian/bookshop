<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11841
  Date: 2019/5/3
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>


    <title>个人信息修改</title>
</head>
<body>

<!-- 顶行提示 -->
<div class="container-fluid bg-light">
    <div class="row">
        <div class="col-2 offset-2 my-1">
            <a href="/toHomePage">首页</a>
        </div>
        <div class="col-2 offset-4 my-1">
            <a>消息</a>
            <a>联系客服</a>
            <a onclick="logout()">注销</a>
        </div>
    </div>
</div>

<!-- 次行提示 -->
<div class="container-fluid bg-info">
    <div class="row">
        <div class="col-1 offset-2 my-4">
            <h2>个人信息</h2>
        </div>
        <div class="col-1 my-4">
            <a>首页</a>
        </div>
        <div class="col-1 my-4">
            <a>账户设置</a>
        </div>
        <div class="col-1 my-4">
            <a>消息</a>
        </div>
        <div class="col-3 my-4">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="请输入要搜索的内容">
                <div class="input-group-append">
                    <span class="input-group-text">搜索</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 内容 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-2 offset-2 my-5">
            <div class="my-2"><h3 class="my-5">账号管理</h3></div>
            <div class="my-2"><a class="my-5" href="/toPersonalCenter">个人资料</a></div>
            <div class="my-2"><a class="my-5">安全设置</a></div>
            <div class="my-2"><a class="my-5">收货地址</a></div>
            <div class="my-2"><a class="my-5">交易记录</a></div>
            <div class="my-2"><a class="my-5">银行卡绑定</a></div>
            <div class="my-2"><a class="my-5">应用授权</a></div>
            <div class="my-2"><a class="my-5">分享</a></div>
        </div>
        <div class="col-5 my-5">
            <form action="/updateUserinfo">
                <div class="form-group">
                    <label>用户名:</label>
                    <input type="text" class="form-control" id="username" name="username" value="${userinfo.username}">
                </div>
                <div class="form-group">
                    <label>密码:</label>
                    <input type="password" class="form-control" id="password" name="password" value="${userinfo.password}">
                </div>
                <div class="form-group">
                    <label>地址:</label>
                    <input type="text" class="form-control" id="location" name="location" value="${userinfo.location}">
                </div>
                <div class="form-group">
                    <label>电话:</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${userinfo.phone}">
                </div>
                <button type="submit" class="btn btn-primary">修改</button>
                <button class="btn btn-primary">撤回</button>
            </form>

        </div>
    </div>

</div>

<!-- 尾行 -->
<div class="container-fluid bg-light my-5">
    <div class="row my-5">
        <div class="col-8 offset-2 my-5">
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
    function logout() {
        if (window.confirm("确定注销该用户吗？")){
            window.location.href="/logoutBusiness"
        }
    }
</script>
</body>
</html>
