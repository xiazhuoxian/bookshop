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

    <title>搜索结果显示</title>
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

<!--导航栏-->
<div class="container-fluid">
    <div class="row">
        <div class="col-8 offset-2 bg-light border">
            <div class="row pt-3">
                <div class="col-1">种类:</div>
                <div class="col-11">
                    <a style="margin-right: 20px">励志</a>
                    <a style="margin-right: 20px">哲学</a>
                    <a style="margin-right: 20px">通史</a>
                    <a style="margin-right: 20px">小说</a>
                    <a style="margin-right: 20px">心理学</a>
                    <a style="margin-right: 20px">文化伦理</a>
                    <a style="margin-right: 20px">广告营销</a>
                    <a style="margin-right: 20px">漫画书籍</a>
                    <a style="margin-right: 20px">世界名著</a>
                    <a style="margin-right: 20px">其他</a>
                </div>
            </div>
            <hr style="height:1px;border:none;border-top:1px dashed lightslategrey;" />
            <div class="row">
                <div class="col-1">品牌:</div>
                <div class="col-11">
                    <a style="margin-right: 20px">果麦</a>
                    <a style="margin-right: 20px">当当网</a>
                    <a style="margin-right: 20px">新东方</a>
                    <a style="margin-right: 20px">后浪</a>
                    <a style="margin-right: 20px">中南天使</a>
                    <a style="margin-right: 20px">江苏教育出版社</a>
                    <a style="margin-right: 20px">机械工业出版社</a>
                    <a style="margin-right: 20px">玉田文化</a>
                    <a style="margin-right: 20px">魅丽</a>
                    <a style="margin-right: 20px">人民大学出版社</a>
                </div>
            </div>
            <hr style="height:1px;border:none;border-top:1px dashed lightslategrey;" />
            <div class="row">
                <div class="col-1">作者地区:</div>
                <div class="col-11">
                    <a style="margin-right: 20px">中国大陆</a>
                    <a style="margin-right: 20px">美国</a>
                    <a style="margin-right: 20px">日本</a>
                    <a style="margin-right: 20px">法国</a>
                    <a style="margin-right: 20px">台湾</a>
                    <a style="margin-right: 20px">英国</a>
                    <a style="margin-right: 20px">德国</a>
                    <a style="margin-right: 20px">韩国</a>
                    <a style="margin-right: 20px">意大利</a>
                    <a style="margin-right: 20px">苏联</a>
                </div>
            </div>
            <hr style="height:1px;border:none;border-top:1px dashed lightslategrey;" />
            <div class="row">
                <div class="col-1">适用年龄:</div>
                <div class="col-11">
                    <a style="margin-right: 20px">7-10岁</a>
                    <a style="margin-right: 20px">11-14岁</a>
                    <a style="margin-right: 20px">15-18岁</a>
                    <a style="margin-right: 20px">18岁以上</a>
                </div>
            </div>
            <hr style="height:1px;border:none;border-top:1px dashed lightslategrey;" />
            <div class="row pb-3">
                <div class="col-1">价钱:</div>
                <div class="col-11">
                    <a style="margin-right: 20px">20以下</a>
                    <a style="margin-right: 20px">20-50</a>
                    <a style="margin-right: 20px">50-100</a>
                    <a style="margin-right: 20px">100以上</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 结果显示 -->
<div class="container-fluid">
    <div class="row">
        <div class="col-8 offset-2">
            <div class="row my-3">
                <e:forEach var="book" items="${result.bookList}">
                    <div class="col-3 card" style="width:400px" onclick="toBookInfoPage(${book.id})">
                        <img class="card-img-top" src="img/${book.picture}" alt="Card image" style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">￥：${book.price}</h4>
                            <p class="card-text">${book.remark}</p>
                        </div>
                    </div>
                </e:forEach>
            </div>
        </div>
    </div>
</div>

<!--页码控制-->
<div class="container-fluid my-5">
    <div class="row">
        <%--<div class="col-8 offset-2 auto">
            <span>第${result.pageNumber}/${result.totalPageCount}页</span>
            <a href="/toSearchResultsPage?pageNumber=1&queryCondition=${result.queryCondition}">首页</a>
            <a href="/toSearchResultsPage?pageNumber=${result.pageNumber-1}&queryCondition=${result.queryCondition}" onclick="return checkIfFirstPage()">上一页</a>
            <a href="/toSearchResultsPage?pageNumber=${result.pageNumber+1}&queryCondition=${result.queryCondition}" onclick="return checkIfLastPage()">下一页</a>
            <a href="/toSearchResultsPage?pageNumber=${result.totalPageCount}&queryCondition=${result.queryCondition}">尾页</a>
            <input type="text" id="searchPage">
            <input type="button" onclick="turn()" value="跳转">
        </div>--%>
        <div class="col-3 offset-4">
            <button type="button" class="btn btn-outline-info" onclick="firstPage(${result.queryCondition})">
                首页
            </button>
            <button type="button" class="btn btn-outline-info" onclick="checkIfFirstPage(${result.pageNumber-1},${result.queryCondition})">
                上一页
            </button>
            <span>第${result.pageNumber}/${result.totalPageCount}页</span>
            <button type="button" class="btn btn-outline-info" onclick="checkIfLastPage(${result.pageNumber+1},${result.queryCondition},${result.totalPageCount})">
               下一页
            </button>
            <button type="button" class="btn btn-outline-info" onclick="lastPage(${result.queryCondition},${result.totalPageCount})">
                尾页
            </button>
        </div>
        <div class="col-2 offset-1">
            <span>跳转到第</span>
            <input type="text" id="searchPage" style="width: 50px">
            <span>页</span>
            <button type="button" class="btn btn-outline-info" onclick="turn()">
                确定
            </button>
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
    function checkIfFirstPage(pageNumber,queryCondition) {
        if(${result.pageNumber>1}){
            window.location.href="/toSearchResultsPage?pageNumber="+pageNumber+"&queryCondition="+queryCondition
        }else {
            alert("当前为第一页");
        }
    }
    function checkIfLastPage(pageNumber,queryCondition,totalPageCount) {
        var pn=${result.pageNumber}
        if(pn<totalPageCount){
            window.location.href="/toSearchResultsPage?pageNumber="+pageNumber+"&queryCondition="+queryCondition
        }else {
            alert("当前为最后一页");
        }
    }
    function turn() {
        var searchPage=document.getElementById("searchPage").value;
        if(searchPage==null||searchPage==""){
            alert("请输入要跳转的页数")
        }else if(searchPage>${result.totalPageCount}){
            alert("请求跳转的页数大于总页数")
        }else {
            window.location.href="/toSearchResultsPage?pageNumber="+searchPage+"&queryCondition=${result.queryCondition}";
        }
    }
    function toBookInfoPage(id) {
        window.location.href="/toBookInfoPage?id="+id
    }
    function firstPage(queryCondition) {
        window.location.href="/toSearchResultsPage?pageNumber=1&queryCondition="+queryCondition
    }
    function lastPage(queryCondition,totalPageCount) {
        window.location.href="/toSearchResultsPage?pageNumber="+totalPageCount+"&queryCondition="+queryCondition
    }
    function logout() {
        if (window.confirm("确定注销该用户吗？")){
            window.location.href="/logout"
        }
    }
</script>

</body>
</html>
