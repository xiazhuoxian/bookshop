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


    <title>购物车</title>
</head>
<body>

<!-- 顶行提示 -->
<div class="container-fluid bg-light">
    <div class="row">
        <div class="col-2 offset-2 my-1">
            <a href="/toHomePage">首页</a>
        </div>
        <div class="col-2 offset-4">
            <a>你好，<span style="color: crimson">${user.username}</span></a>
            <a>客服</a>
            <a href="/toPersonalCenter">个人中心</a>
            <a onclick="logout()">注销</a>
        </div>
    </div>
</div>

<!-- 次行提示 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-1 offset-2 my-4">
            <h1>购物车</h1>
        </div>
        <div class="col-3 offset-4 my-4">
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
<div class="container-fluid" style="padding-bottom: 40px">
    <!--提示-->
    <div class="row my-3">
        <div class="col-1 offset-2">
            <label class="form-check-label">
                <input type="checkbox" class="form-check-input" id="selectAll-1">全选
            </label>
        </div>
        <div class="col-1">
            <span>书名</span>
        </div>
        <div class="col-2">
            <span>详细信息</span>
        </div>
        <div class="col-1">
            <span>单价</span>
        </div>
        <div class="col-1">
            <span>数量</span>
        </div>
        <div class="col-1">
            <span>金额</span>
        </div>
        <div class="col-1">
            <span>操作</span>
        </div>
    </div>

    <!--购物车列表-->
    <form action="/settlement_cart">
        <div class="row">
            <e:forEach items="${orders}" var="order">
                <e:if test="${order.state==1}">
                    <div class="col-1 offset-2 bg-light py-3 my-3">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" name="selection" value="${order.orderid}">
                        </label>
                        <img src="img/${order.book.picture}" height="100" width="100">
                    </div>
                    <div class="col-1 bg-light py-3 my-3">
                        <a>${order.book.title}</a>
                    </div>
                    <div class="col-2 bg-light py-3 my-3">
                        <span>详细信息</span>
                    </div>
                    <div class="col-1 bg-light py-3 my-3">
                        <a>${order.book.price}</a>
                    </div>
                    <div class="col-1 bg-light py-3 my-3">
                        <button onclick="$.reduceOrderQuantity(${order.orderid},this.value,${order.book.price});return false;"
                                value="${order.quantity}" name="${order.orderid}">-</button>
                        <input value="${order.quantity}" style="width: 20px" id="${order.orderid}">
                        <button onclick="$.addOrderQuantity(${order.orderid},this.value,${order.book.price});return false;"
                                value="${order.quantity}" name="${order.orderid}">+</button>
                    </div>
                    <div class="col-1 bg-light py-3 my-3">
                        <span id="${order.orderid}-price" class="font-weight-bold text-danger">${order.book.price*order.quantity}</span>
                    </div>
                    <div class="col-1 bg-light py-3 my-3">
                        <a href="/deleteOrder?orderid=${order.orderid}">删除</a>
                    </div>
                </e:if>
            </e:forEach>
        </div>
        <div class="row fixed-bottom">
            <div class="col-1 offset-2 my-3">
                <input type="submit" id="submit" width="0px">
            </div>
        </div>
    </form>

</div>

<!-- 尾行 -->
<div class="container-fluid fixed-bottom">
    <div class="row">
        <div class="col-5 offset-2 bg-light py-3">
            <label class="form-check-label">
                <input type="checkbox" class="form-check-input" id="selectAll-2">全选
            </label>
            <a class="py-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除</a>
            <a class="py-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;清除失效宝贝</a>
            <a class="py-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;移入收藏夹</a>
            <a class="py-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分享</a>
        </div>
        <div class="col-1 bg-light py-3">
            <span>已选商品：</span>
            <span id="theNumberOfGoods" class="font-weight-bold text-danger">0</span>
            <span style="margin-top: 110px">件</span>
        </div>
        <div class="col-1 bg-light py-3">
            <span>合计：</span>
            <span id="TotalPrice" class="font-weight-bold text-danger">0</span>
            <span>元</span>
        </div>
        <div class="col-1 bg-light py-3">
            <button type="button" class="btn btn-outline-info" id="submitForm">结算</button>
        </div>
    </div>
</div>

<script>
    function logout() {
        if (window.confirm("确定注销该用户吗？")){
            window.location.href="/logout"
        }
    }

    $(document).ready(function ($) {
        $("#selectAll-1").click(function (t) {
            $("[name=selection]").prop("checked",this.checked);
            $("#selectAll-2").prop("checked",this.checked);
        });
        $("#selectAll-2").click(function (t) {
            $(":checkbox[name=selection]").prop("checked",this.checked);
            $("#selectAll-1").prop("checked",this.checked);
        });
        $("#submitForm").click(function (t) {
            var sign=0;
            $("input[name='selection']").each(function (index) {
                if ($(this).is(":checked")){
                    sign=1;
                }
            })
            if (sign==0){
                alert("请选择要购买的商品")
            } else if (sign==1){
                $("#submit").click();
            }
        });
        $("input[type='checkbox']").change(function (t) {
            var num=0;
            var totalprice=0;
            $("input[name='selection']").each(function (index) {
                if ($(this).is(":checked")) {
                    num=Number(num)+1;
                    var orderid=$(this).val();
                    var price=$("#"+orderid+"-price").text();
                    totalprice=Number(totalprice)+Number(price);
                }
            })
            $("#theNumberOfGoods").text(num);
            $("#TotalPrice").text(totalprice);
        })
    })


    $.addOrderQuantity=function (orderid,quantity,price) {
        $.ajax({
            url:"/addOrderQuantity",
            type:"POST",
            dataType:"text",
            data:'orderid='+orderid+'&quantity='+quantity,
            success:function (data) {
                $("#"+orderid).prop("value",Number(quantity)+1);
                $("[name="+orderid+"]").prop("value",Number(quantity)+1);
                $("#"+orderid+"-price").text((Number(quantity)+1)*price);
                $("input[type='checkbox']").change();
            },
            error:function (jqXHR) {
                alert("操作失败")
            }
        });
    };

    $.reduceOrderQuantity=function (orderid,quantity,price) {
        $.ajax({
            url:"/reduceOrderQuantity",
            type:"POST",
            dataType:"text",
            data:'orderid='+orderid+'&quantity='+quantity,
            success:function (data) {
                $("#"+orderid).prop("value",Number(quantity)-1);
                $("[name="+orderid+"]").prop("value",Number(quantity)-1);
                $("#"+orderid+"-price").text((Number(quantity)-1)*price);
                $("input[type='checkbox']").change();
            },
            error:function (jqXHR) {
                alert("操作失败")
            }
        });
    };


</script>
</body>
</html>
