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


    <title>订单管理</title>
</head>
<body>

<!-- 顶行提示 -->
<div class="container-fluid bg-light">
    <div class="row">
        <div class="col-2 offset-2 my-1">
            <%--<a href="/toHomePage">首页</a>--%>
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
            <div class="my-2"><a class="my-5" href="/toPersonalCenter">全部功能</a></div>
            <div class="my-2"><a class="my-5" href="/toAddGoods">添加商品</a></div>
            <div class="my-2"><a class="my-5">商品管理</a></div>
            <div class="my-2"><a class="my-5">客户管理</a></div>
            <div class="my-2"><a class="my-5">评价管理</a></div>
            <div class="my-2"><a class="my-5">信息管理</a></div>
            <div class="my-2"><a class="my-5">安全中心</a></div>
            <div class="my-2"><a class="my-5">退出登录</a></div>
        </div>
        <div class="col-5 my-5">


            <h2>我的商品</h2>
            <br>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#home">所有商品</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#menu1">缺货商品</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#menu2">下架商品</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div id="home" class="container tab-pane active"><br>
                    <div class="row">
                        <div class="col-5 bg-light py-1 my-1">
                            <span>商品</span>
                        </div>
                        <div class="col-1 bg-light py-1 my-1">
                            <span>单价</span>
                        </div>
                        <div class="col-1 bg-light py-1 my-1">

                        </div>
                        <div class="col-2 bg-light py-1 my-1">
                            <span>金额</span>
                        </div>
                        <div class="col-1 bg-light py-1 my-1">
                            <span>商品操作</span>
                        </div>
                        <div class="col-2 bg-light py-1 my-1">
                            <span>交易操作</span>
                        </div>
                    </div>
                    <e:forEach items="${businessGoods}" var="businessGoods">
                            <div class="row">
                                <div class="col-2 bg-light py-3 my-3">
                                    <img src="img/${businessGoods.book.picture}" height="100" width="100">
                                </div>
                                <div class="col-3 bg-light py-3 my-3">
                                    <a>${businessGoods.book.title}</a>
                                </div>
                                <div class="col-1 bg-light py-3 my-3">
                                    <a>${businessGoods.book.price}</a>
                                </div>
                                <div class="col-1 bg-light py-3 my-3">

                                </div>
                                <div class="col-2 bg-light py-3 my-3">
                                    <span id="${businessGoods.id}-price">${businessGoods.book.price}</span>
                                </div>
                                <div class="col-1 bg-light py-3 my-3">
                                    <a>修改</a>
                                </div>
                                <div class="col-2 bg-light py-3 my-3">
                                    <%--<a href="/deleteGoods?businessgoodsid=${businessGoods.id}&bookid=${businessGoods.book.id}">下架</a>--%>
                                    <span onclick="deleteGoods(${businessGoods.id},${businessGoods.book.id})">下架</span>
                                </div>
                            </div>
                    </e:forEach>
                </div>
            </div>


        </div>
    </div>

</div>

<script>
    function logout() {
        if (window.confirm("确定注销该用户吗？")){
            window.location.href="/logout"
        }
    }
    function deleteGoods(businessgoodsid,bookid) {
        if(window.confirm("确认要下架吗？")){
            window.location.href="/deleteGoods?businessgoodsid="+businessgoodsid+"&bookid="+bookid;
        }
    }
</script>
</body>
</html>
