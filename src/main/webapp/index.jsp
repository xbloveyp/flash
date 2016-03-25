<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="在线动画设计">
    <meta name="author" content="Cao Xiaobo">
    <link rel="icon" href="../../favicon.ico">
    <title></title>

    <link href="static/css/bootstrap.min.css" rel="stylesheet">
<style>
    @font-face {
        font-family: 'iconfont';
        src: url('//at.alicdn.com/t/font_1448771104_489405.eot'); /* IE9*/
        src: url('//at.alicdn.com/t/font_1448771104_489405.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
        url('//at.alicdn.com/t/font_1448771104_489405.woff') format('woff'), /* chrome、firefox */
        url('//at.alicdn.com/t/font_1448771104_489405.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
        url('//at.alicdn.com/t/font_1448771104_489405.svg#iconfont') format('svg'); /* iOS 4.1- */
    }
    .iconfont{
        font-family:"iconfont";
        font-size:50px;font-style:normal;
    }

</style>
</head>
<body >
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container" style="margin-left: 3%">
        <div class="navbar-header" style="margin: 0">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Flash Online</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp" style="margin: 0;padding: 5px">
                <img src="static/img/1.jpg" class="img-circle img-responsive" style="height:40px;width: 40px;float: left ;margin: 0;vertical-align: top">
                <p  style="float: left ;margin-top: 8px;margin-left: 15px">益画</p>
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" style="margin-left: 17%">
            <ul class="nav navbar-nav">
                <li role="presentation" ><a href="tutorial.jsp">新手教程</a></li>
                <li role="presentation"><a href="/flash/findAllPosts">讨论区</a></li>
                <li role="presentation"><a href="/flash/loadProject">创作空间</a></li>
            </ul>
            <c:if test="${sessionScope.user==null}">
                <form class="navbar-form navbar-right">
                    <a  class=" btn btn-normal btn-primary" href="login.jsp" style="padding-left: 30px;padding-right: 30px">登录</a>
                    <a  class=" btn btn-normal btn-success" href="regist.jsp" style="padding-left: 30px;padding-right: 30px;margin-left: 15px">注册</a>
                </form>
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                <form class="navbar-form navbar-right" style="display: inline">
                    <h5 style="color: #888888">欢迎您：${sessionScope.user.userName==""?sessionScope.user.userName:sessionScope.user.userName}&nbsp;&nbsp;
                        <a href="/flash/logout" role="presentation">注销</a>
                    </h5>
                </form>
            </c:if>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<!-- Main jumbotron for a primary marketing message or call to action -->
<%--<div class="jumbotron" >--%>
    <%--<div class="container" >--%>
        <%--<h1>创建属于你的动画</h1>--%>
        <%--<p>人人都可以做设计师，设计从未如此简单！</p>--%>
        <%--<p><a class="btn btn-primary btn-lg" href="edtior.jsp" role="button">创建工程 &raquo;</a></p>--%>
    <%--</div>--%>
<%--</div>--%>

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-top: 50px">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active"  style="height: 600px;width: 100%">
            <img src="static/img/yh.jpg" alt="900x500"  style="height: 100%;width: 100%">
            <div class="carousel-caption" style="top: 5%">
                <h3 style="color: #262626">在线绘画</h3>
                <p style="color: #262626">人人都可以做设计师，设计从未如此简单！</p>
                <p><a class="btn btn-primary" href="/loadProject">创建动画</a></p>
            </div>
        </div>
        <div class="item" style="height: 600px;width: 100%" >
            <img src="static/img/yh1.jpg" alt="900x500" style="height: 100%;width: 100%">
            <div class="carousel-caption" style="top: 5%;left: 10%;">
                <h3 style="color: #262626;margin-left: 0;margin-right: 0;padding-left: 0;padding-right: 0;width: 300px">创建属于你的动画</h3>
                <p style="color: #262626;margin-left: 0;margin-right: 0;padding-left: 0;padding-right: 0;width: 300px">还不赶紧尝试一下！</p>
                <p style="margin-left: 0;margin-right: 0;padding-left: 0;padding-right: 0;width: 300px"><a class="btn btn-primary" href="/loadProject">创建动画</a></p>
            </div>
        </div>
        <div class="item" style="height: 600px;width: 100%" >
            <img src="static/img/yh2.jpg" alt="900x500" style="height: 100%;width: 100%">
            <div class="carousel-caption" style="top: 15%;left: 20%">
                <h3 style="color: #262626;margin-left: 0;margin-right: 0;padding-left: 0;padding-right: 0;width: 300px">团队合作</h3>
                <p style="color: #262626;margin-left: 0;margin-right: 0;padding-left: 0;padding-right: 0;width: 300px">共同为项目献一份力</p>
                <p style="margin-left: 0;margin-right: 0;padding-left: 0;padding-right: 0;width: 300px"><a class="btn btn-primary" href="/loadProject">创建动画</a></p>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="iconfont" aria-hidden="true" style="line-height: 500px;">&#xe609;</span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="iconfont" aria-hidden="true" style="line-height: 500px;">&#xe60a;</span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <h2>在线绘画</h2>
            <p style="width: 90%;font-size: 16px">利用所提供的基本图形和线条，通过简单的移动调整大小，改变形状，进行动画的拼接于组装，以此来实现在线绘制校园公益动画的目的。
            </p>
            <%--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
        </div>
        <div class="col-md-4">
            <h2>讨论区</h2>
            <p style="width: 90%;font-size: 16px"> 将自己所绘制的简易校园动画进行图片上传，发表对话，也可以看到其他人所上传的图片，并进行评论，其他用户也可以对发贴的用户进行回复，也可以删除跟帖人。
            </p>
            <%--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
        </div>
        <div class="col-md-4">
            <h2>合作共享</h2>
            <p style="width: 90%;font-size: 16px"> 可以将自己所绘制的拼接简易图片进行保存，并可以将保存的图片上传到库里，以此作为模板，其他的同伴也可以将自己所绘制的图片上传做模板，并且彼此之间都可以从库里提取出自己所需要的模板
            </p>

        </div>
    </div>

    <hr>

    <footer>
        <p>&copy; Cao xiaobo</p>
    </footer>
</div> <!-- /container -->

<script src="static/js/jquery-2.1.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</body>
</html>
<script>
    $(document).ready(function() {
        $('.carousel').carousel();
    });
</script>