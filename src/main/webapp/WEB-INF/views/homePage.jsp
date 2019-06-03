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

    <title>首页</title>
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
                    <a href="/toLogin">用户登录</a>
                    <a href="/toLoginBusiness">进入商家通道</a>
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
            </div>
        </div>
    </div>

    <!--导航栏-->
    <div class="container-fluid bg-light">
        <div class="row">
            <div class="col-8 offset-2" style="background-color: lightgrey">
                <div class="row py-2">
                    <div class="col">
                        <a href="#">生活超市</a>
                    </div>
                    <div class="col">
                        <a href="#">低价秒杀</a>
                    </div>
                    <div class="col">
                        <a href="#">吐血力荐</a>
                    </div>
                    <div class="col">
                        <a href="#">智能生活</a>
                    </div>
                    <div class="col">
                        <a href="#">新品资讯</a>
                    </div>
                    <div class="col">
                        <a href="#">优惠团购</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--图片轮播-->
    <div class="container-fluid bg-light">
        <div class="row pt-5">
            <div class="col-6 offset-2">
                <div id="demo" class="carousel slide" data-ride="carousel">
                    <!-- 指示符 -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>
                    <!-- 轮播图片 -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://static.runoob.com/images/mix/img_fjords_wide.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="https://static.runoob.com/images/mix/img_nature_wide.jpg">
                        </div>
                        <div class="carousel-item">
                            <img src="https://static.runoob.com/images/mix/img_mountains_wide.jpg">
                        </div>
                    </div>
                    <!-- 左右切换按钮 -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
            <div class="col-2 border border-warning">
                <div class="row">
                    <div class="rol-2 offset-1 pt-1">
                        <span class="font-weight-bold text-info">教育</span>
                    </div>
                </div>
                <div class="row">
                    <div class="rol-11 offset-1 pt-1">
                        <span>教材</span>
                        <span>外语</span>
                        <span>考试</span>
                        <span>考研</span>
                        <span>工具书</span>
                    </div>
                </div>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <div class="row">
                    <div class="rol-2 offset-1 pt-1">
                        <span class="font-weight-bold text-info">文艺</span>
                    </div>
                </div>
                <div class="row">
                    <div class="rol-11 offset-1 pt-1">
                        <span>文学</span>
                        <span>传记</span>
                        <span>艺术</span>
                        <span>摄影</span>
                    </div>
                </div>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <div class="row">
                    <div class="rol-2 offset-1 pt-1">
                        <span class="font-weight-bold text-info">人文社科</span>
                    </div>
                </div>
                <div class="row">
                    <div class="rol-11 offset-1 pt-1">
                        <span>历史</span>
                        <span>古籍</span>
                        <span>政治</span>
                        <span>军事</span>
                        <span>法律</span>
                    </div>
                </div>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <div class="row">
                    <div class="rol-2 offset-1 pt-1">
                        <span class="font-weight-bold text-info">生活</span>
                    </div>
                </div>
                <div class="row">
                    <div class="rol-11 offset-1 pt-1">
                        <span>两性</span>
                        <span>运动</span>
                        <span>手工</span>
                        <span>风水</span>
                        <span>休闲</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--商品推荐导航-->
    <div class="container-fluid bg-light">
        <div class="row">
            <!--商品显示-->
            <div class="col-8 offset-2 py-5">
                <div class="row pb-3 border" style="background-color: lightgrey">
                    <span class=" py-2 px-2 text-danger" style="font-size: 30px">热品推荐</span>
                </div>
                <div class="row pt-3">
                <c:forEach items="${pageInfo.list}" var="book" varStatus="time">
                    <div class="col-3 pb-5">
                        <div class="card" style="width: 250px" onclick="toBookInfoPage(${book.id})">
                            <img class="card-img-top" src="img/${book.picture}" alt="Card image" style="width:250px;height: 300px">
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
    function logout() {
        if (window.confirm("确定注销该用户吗？")){
            window.location.href="/logout"
        }
    }
    function query() {
        var queryCondition=document.getElementById("queryCondition").value;
        if (queryCondition==null||queryCondition==""){
            alert("请输入要搜索的内容")
        }else {
            window.location.href="/toSearchResultsPage?pageNumber=1&queryCondition="+queryCondition;
        }
    }
    function toBookInfoPage(id) {
        window.location.href="/toBookInfoPage?id="+id
    }
</script>



</body>
</html>
