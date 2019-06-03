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


    <title>个人中心</title>
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
<div class="container-fluid bg-light">
    <div class="row">
        <div class="col-2 offset-2 my-5">
            <div class="my-2"><a class="my-5">全部功能</a></div>
            <div class="my-2"><a class="my-5" href="/queryOrderByUserId">我的购物车</a></div>
            <div class="my-2"><a class="my-5" href="/toAllOrderPage">我的订单</a></div>
            <div class="my-2"><a class="my-5">我的收藏</a></div>
            <div class="my-2"><a class="my-5">评价管理</a></div>
            <div class="my-2"><a class="my-5" href="/toPersonalInformationChange">信息管理</a></div>
            <div class="my-2"><a class="my-5">安全中心</a></div>
            <div class="my-2"><a class="my-5">退出登录</a></div>
        </div>
        <div class="col-5 my-5">
            <div class="row border" style="background-color: lightgrey">
                <div class="col-3 py-3">
                    <a>你好，<span style="color: crimson">${user.username}</span></a>
                </div>
                <div class="col-2 offset-7 py-3">
                    <a style="float: right">我的收货地址</a>
                </div>
            </div>
            <div class="row">
                <div class="col-3 border pt-2">
                    <p class="text-center">所有订单</p>
                </div>
                <div class="col-3 border pt-2">
                    <p class="text-center">待收货</p>
                </div>
                <div class="col-3 border pt-2">
                    <p class="text-center">待评价</p>
                </div>
                <div class="col-3 border pt-2">
                    <p class="text-center">退款中</p>
                </div>
            </div>
            <div class="row border" style="margin-top: 20px;background-color: skyblue">
                <div class="col-4 py-2">
                    <span style="font-size: 20px" class="text-white">根据浏览记录，猜你喜欢</span>
                </div>
                <div class="col-2 offset-6 py-2">
                    <button type="button" class="btn btn-light">换一组</button>
                </div>
            </div>

            <div class="row border">
                <c:forEach items="${pageInfo.list}" var="book" varStatus="time">
                    <div class="col-4 py-2">
                        <div class="card py-1 px-1" onclick="toBookInfoPage(${book.id})">
                            <img class="card-img-top" src="img/${book.picture}" alt="Card image" style="width: 200px;height: 280px">
                            <div class="card-body">
                                <h4 class="card-title">${book.title}</h4>
                                <p class="card-text">${book.author} </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>


        </div>
    </div>

</div>
<script>
    function toBookInfoPage(id) {
        window.location.href="/toBookInfoPage?id="+id
    }
    function logout() {
        if (window.confirm("确定注销该用户吗？")){
            window.location.href="/logout"
        }
    }
</script>
</body>
</html>
