<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 11841
  Date: 2019/5/1
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <%--<script src="static/resources/jquery-3.4.0.min.js"></script>
    <script src="static/resources/bootstrap.bundle.min.js"></script>
    <script src="static/resources/bootstrap.min.css"></script>--%>

    <title>结算</title>
</head>
<body>
<!-- 登录行 -->
<div class="container-fluid bg-light py-1">
    <div class="row">
        <div class="col-2 offset-2">
            <a href="/toHomePage">网上商城</a>
        </div>
        <c:if test="${user==null}">
            <div class="col-2 offset-4">
                <a href="/toLogin">登录</a>
                <a>客服</a>
            </div>
        </c:if>
        <c:if test="${user!=null}">
            <div class="col-2 offset-4">
                <a>你好，<span style="color: crimson">${user.username}</span></a>
                <a>客服</a>
                <a href="/toPersonalCenter">个人中心</a>
                <a onclick="logout()">注销</a>
            </div>
        </c:if>
    </div>
</div>

<!-- 提示框 -->
<div class="container-fluid">
    <div class="row py-3 my-3">
        <div class="col-2 offset-2">
            <h2>网上商城</h2>
        </div>
        <div class="col-5 offset-1">
            <div class="progress" style="height: 45px">
                <div class="progress-bar bg-success" style="width:25%">
                    确认订单
                </div>
                <div class="progress-bar bg-info" style="width:25%">
                    付款
                </div>
                <div class="progress-bar bg-info" style="width:25%">
                    确认收货
                </div>
                <div class="progress-bar bg-info" style="width:25%">
                    评价
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 收货地址 -->
<div class="container-fluid" style="padding-bottom: 50px">
    <div class="row mt-2 pt-2">
        <div class="col-8 offset-2">
            <h5>确认收货地址</h5>
            <hr style="height:1px;border:none;border-top:1px dashed lightslategrey;" />
        </div>
    </div>
    <div class="row">
        <div class="col-8 offset-2">
            <div class="row border border-warning pt-2">
                <div class="col-2">
                    <p class="text-warning">寄送至：</p>
                </div>
                <div class="col-10">
                    ${user.location}
                </div>
            </div>
        </div>
    </div>
</div>

<!--详细信息-->
<div class="container-fluid">
    <div class="row">
        <div class="col-8 offset-2">
            <h5>确认订单信息</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-8 offset-2">
            <div class="row">
                <div class="col-3 offset-1">
                    <span>店铺宝贝</span>
                </div>
                <div class="col-2">
                    <span>商品属性</span>
                </div>
                <div class="col-2">
                    <span>单价</span>
                </div>
                <div class="col-2">
                    <span>数量</span>
                </div>
                <div class="col-2">
                    <span>合计</span>
                </div>
            </div>
            <hr style="height:3px;border:none;border-top:3px double lightslategray;" />
        </div>
    </div>
    <e:forEach items="${orders}" var="order">
        <div class="row">
                        <div class="col-8 offset-2">
                            <div class="row" style="padding-bottom: 30px;padding-top: 20px">
                                <div class="col-4">
                                    <img src="img/${order.book.picture}" style="height: 200px;width: 200px">
                                </div>
                                <div class="col-2">
                                    <span>${order.book.remark}</span>
                                </div>
                                <div class="col-2">
                                    <span>${order.book.price}</span>
                                </div>
                                <div class="col-2">
                                    <span>${order.quantity}</span>
                                </div>
                                <div class="col-2">
                                    <span>${totalPrice}</span>
                                </div>
                            </div>
                            <hr style="height:1px;border:none;border-top:1px dashed lightslategrey;" />
                        </div>
                    </div>
    </e:forEach>
</div>

<!-- 提交订单 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-2 offset-8  border border-warning">
            <div class="row pt-3">
                <div class="col-4" style="padding-top: 15px">
                    <span>实付款：</span>
                </div>
                <div class="col-8">
                    <span style="font-size: 30px">￥</span>
                    <span class="font-weight-bold text-danger" style="font-size: 30px">${totalPrice}</span>
                </div>
            </div>
            <div class="row" style="padding-top: 15px">
                <div class="col-4">
                    <span>寄送至：</span>
                </div>
                <div class="col-8">
                    <span>${user.location}</span>
                </div>
            </div>
            <div class="row" style="padding-top: 2px;padding-bottom: 15px">
                <div class="col-4">
                    <span>收货人：</span>
                </div>
                <div class="col-8">
                    <span>${user.username}</span>
                </div>
            </div>
        </div>
        <div class="col-2 offset-8 mt-1" style="padding-right: 0px;">
            <div class="float-right">
                <button onclick="$.return()"
                        type="button" class="btn btn-outline-info">返回</button>
                <button onclick="$.pay(${totalPrice},${user.account.balance})"
                        type="button" class="btn btn-outline-info">提交订单</button>
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
    $.return=function(){
        window.location.href=document.referrer;
    }
    $.pay=function (totalPrice,balance,sign,bookid,quantity) {
        if (totalPrice>balance){
            alert("当前余额不足，无法购买")
        } else {

                $.ajax({
                    url:"/payCart",
                    async:false,
                    type:"POST",
                    dataType:"text",
                    success:function (data) {
                        alert("支付成功")
                        window.location.href="/toAllOrderPage"
                    },
                    error:function (jqXHR) {
                        alert("支付失败")
                    }
                });
        }

    }
</script>


</body>
</html>
