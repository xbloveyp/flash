<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="height: 100%">
<head lang="en">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="在线动画设计">
    <meta name="author" content="Cao Xiaobo">
    <link rel="icon" href="../../favicon.ico">
    <title></title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="height: 80%">
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
                <li role="presentation"><a href="${pageContext.request.contextPath}/flash/findAllPosts">讨论区</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/flash/loadProject">创作空间</a></li>
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

<div class="container" style="margin-top: 70px;background-color: #e7e7e7;border-radius: 10px;height: 100%;width: 80%;padding: 1%;margin-right: auto;margin-left: auto">
    <div class="col-lg-2 " style="margin-left: 6%;margin-top: 6%">
        <div class="list-group">
            <a href="#" class="list-group-item active collapsed" data-toggle="collapse" data-target="#list1" aria-expanded="false" aria-controls="navbar">简单介绍</a>
            <div id="list1" class="collapse" style="margin: 0">
                <div class="list-group" style="margin: 0">
                    <a href="#" class="list-group-item" style="background-color: #ebccd1">&nbsp;1.基本操作</a>
                    <a href="#" class="list-group-item" style="background-color: #ebccd1">&nbsp;2.进阶教程</a>
                </div>
            </div>
            <a href="#" class="list-group-item collapsed" data-toggle="collapse" data-target="#list2" aria-expanded="false" aria-controls="navbar">基本操作</a>
            <div id="list2" class="collapse" style="margin: 0">
                <div class="list-group" style="margin: 0">
                    <a href="#" class="list-group-item" style="background-color: #ebccd1">&nbsp;1.基本操作</a>
                    <a href="#" class="list-group-item" style="background-color: #ebccd1">&nbsp;2.进阶教程</a>
                </div>
            </div>
            <a href="#" class="list-group-item" data-toggle="collapse" data-target="#list3" aria-expanded="false" aria-controls="navbar">进阶教程</a>
            <div id="list3" class="collapse" style="margin: 0">
                <div class="list-group" style="margin: 0">
                    <a href="#" class="list-group-item" style="background-color: #ebccd1">&nbsp;1.基本操作</a>
                    <a href="#" class="list-group-item" style="background-color: #ebccd1">&nbsp;2.进阶教程</a>
                </div>
            </div>
        </div>
    </div>
    <div >
        <div>
            <h1 style="margin-left: 40%">【教程】简单介绍</h1>
        </div>
        <hr/>
        <p style="font-size: 16px;line-height: 1.7;font-weight: 400;padding-left: 4%">
            这是一款在线Flash设计网站，你只要在网站端进行简单的操作就可以完成一个Flash动画，或者创建一幅动画图片。通过你的账户可以在不同机器上进行你的设计。
        </p>
    </div>
</div>
<script src="static/js/jquery-2.1.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</body>
</html>