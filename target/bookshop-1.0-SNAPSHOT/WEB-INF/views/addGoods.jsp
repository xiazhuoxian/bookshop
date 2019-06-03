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

    <title>商家通道</title>
</head>
<body>

<!-- 顶行提示 -->
<div class="container-fluid bg-light" style="background-color: white">
    <div class="row">
        <div class="col-2 offset-2 my-4">
            <%--<a href="/toHomePage">网上商城</a>--%>
        </div>
        <div class="col-6 mt-4 mb-4">
            <span class="border border-warning py-1"><small>&nbsp;&nbsp;&nbsp;为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持&nbsp;&nbsp;&nbsp;</small></span>
        </div>
    </div>
</div>

<!-- 添加 -->
<div class="container-fluid" style="margin-top: 75px">
    <div class="row">
        <div class="col-10 offset-1 bg-light">
            <div class="row">
                <div class="col-4 offset-4 bg-light my-5">
                    <h1>添加商品</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-4 offset-4 py-5 bg-light">
                    <form action="/addGoods" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>作者:</label>
                            <input type="text" name="author" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>名称:</label>
                            <input type="text" name="title" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>价格:</label>
                            <input type="text" name="price" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>产地:</label>
                            <input type="text" name="address" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>简介:</label>
                            <input type="text" name="remark" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>图片:</label><br>
                            <input type="file" name="file" id="file"/>
                            <%--<input type="file" name="file" id="file" accept="image/*" onchange="imgChange(this);"/>--%>
                            <%--<img id="imghead" width="260" height="180"/>--%>
                        </div>
                        <input type="submit" value="提交">
                        <button value="turnback" onclick="turnback()">返回</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 尾行 -->
<div class="container-fluid bg-light py-5" style="margin-top: 75px">
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
    function turnback() {
        window.location.href=document.referrer;
    }
    /*function imgChange(obj) {
        alert(1);
        var file=document.getElementById("file");
        alert(file);
        var imgUrl=window.URL.createObjectURL(file,files[0]);
        alert(imgUrl);
        var img=document.getElementById("imghead");
        img.setAttribute('src',imgUrl);
    };*/
</script>
</body>
</html>
