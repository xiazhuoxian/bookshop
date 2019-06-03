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

    <title>商品信息页</title>
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

<!-- 搜索框 -->
<div class="container-fluid py-4">
    <div class="row">
        <div class="col-1 offset-2">
            <h2>购物商城</h2>
        </div>
        <div class="col-4 offset-2">
            <input type="text" id="queryCondition" name="queryCondition" style="width: 80%">
            <input type="button" onclick="query()" value="搜索">
            <input type="button" onclick="reset()" value="重置">
        </div>
    </div>
</div>

<!--详细信息-->
<div class="container-fluid">
    <div class="row py-2">
        <div class="col-3 offset-2 py-2">
            <img src="img/${book.picture}" style="width: 400px;height: 500px">
        </div>
        <div class="col-5 pt-4 pb-2">
            <div class="row py-2">
                <h4>${book.remark}</h4>
            </div>
            <div class="row py-2">
                <div class="col-2 bg-light pt-3">
                    <p class="font-weight-bold">价格： </p>
                </div>
                <div class="col-7 bg-light pt-3">
                    <p class="font-weight-bold text-danger">￥：${book.price}</p>
                </div>
            </div>
            <div class="row pt-1">
                <div class="col-2">
                    <p>原著地： </p>
                </div>
                <div class="col-5">
                    <p>${book.address}</p>
                </div>
            </div>
            <div class="row pt-1">
                <div class="col-2">
                    <p>作者： </p>
                </div>
                <div class="col-5">
                    <p>${book.author}</p>
                </div>
            </div>
            <div class="row pt-1">
                <div class="col-2">
                    <p>版本： </p>
                </div>
                <div class="col-2 border border-warning">
                    <p>${book.title}</p>
                </div>
            </div>
            <div class="row pt-1">
                <div class="col-2">
                    <p>购买数量： </p>
                </div>
                <div class="col-5">
                    <button onclick="$.reduceQuantity()">-</button>
                    <input type="text" style="width: 20px" value="1" id="quantity">
                    <button onclick="$.addQuantity()">+</button>
                </div>
            </div>
            <div class="row pt-1">
                <div class="col-2">
                    <button onclick="$.buyNow(${book.id})" class="btn btn-outline-warning btn-lg">立即购买</button>
                </div>
                <div class="col-2">
                    <button onclick="$.addToCart(${book.id})" class="btn btn-outline-danger btn-lg">加入购物车</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    function query() {
        var queryCondition=document.getElementById("queryCondition").value;
        if (queryCondition==null||queryCondition==""){
            alert("请输入要搜索的内容")
        }else {
            window.location.href="/toSearchResultsPage?pageNumber=1&queryCondition="+queryCondition;
        }
    }
    function reset() {
        window.location.href="/toSearchResultsPage?pageNumber=1";
    }
    function logout() {
        if (window.confirm("确定注销该用户吗？")){
            window.location.href="/logout"
        }
    }
    $.addQuantity=function(){
        var quantity=$("#quantity").val();
        $("#quantity").prop("value",Number(quantity)+1);
    }
    $.reduceQuantity=function(){
        var quantity=$("#quantity").val();
        $("#quantity").prop("value",Number(quantity)-1);
    }
    $.addToCart=function (bookid) {
        if(${user==null}){
            if(window.confirm("请先登录，才能加入购物车")){
                window.location.href="/toLogin"
            }
        }else {
            userid=${user.userid}
            $.ajax({
                url:"/addToCart",
                async:false,
                type:"POST",
                dataType:"text",
                data:'userid='+userid+'&bookid='+bookid+'&quantity='+$("#quantity").val(),
                success:function (data) {
                    alert("添加购物车成功")
                },
                error:function (jqXHR) {
                    alert("添加购物车失败")
                }
            });
        }
    }
    $.buyNow=function (bookid) {
        if(${user==null}){
            if(window.confirm("请先登录，才能购买")){
                window.location.href="/toLogin"
            }
        }else {
            var quantity=document.getElementById("quantity").value;
            window.location.href="/settlement_now?bookid="+bookid+"&quantity="+quantity
        }
    }
</script>

</body>
</html>
