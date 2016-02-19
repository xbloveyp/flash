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
    <link href="css/bootstrap.min.css" rel="stylesheet">
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
                <img src="img/1.jpg" class="img-circle img-responsive" style="height:40px;width: 40px;float: left ;margin: 0;vertical-align: top">
                <p  style="float: left ;margin-top: 8px;margin-left: 15px">益画</p>
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" style="margin-left: 17%">
            <ul class="nav navbar-nav">
                <li role="presentation" ><a href="tutorial.jsp">新手教程</a></li>
                <li role="presentation"><a href="/findAllPosts">讨论区</a></li>
                <li role="presentation"><a href="edtior.jsp">创作空间</a></li>
            </ul>
            <c:if test="${sessionScope.user==null}">
                <form class="navbar-form navbar-right">
                    <a  class=" btn btn-normal btn-primary" href="login.jsp" style="padding-left: 30px;padding-right: 30px">登录</a>
                    <a  class=" btn btn-normal btn-success" href="regist.jsp" style="padding-left: 30px;padding-right: 30px;margin-left: 15px">注册</a>
                </form>
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                <form class="navbar-form navbar-right" style="display: inline">
                    <h5 style="color: #888888">欢迎您：${sessionScope.user.username==""?sessionScope.user.username:sessionScope.user.username}&nbsp;&nbsp;
                        <a href="user_logout.do" role="presentation">注销</a>
                    </h5>
                </form>
            </c:if>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<div class="container " style="border-radius: 10px;margin-top: 70px;background-color: #e7e7e7;width: 80%;height: auto;margin-left: auto;margin-right: auto;padding: 1%">
    <div>
        <h3>到那里是到哪里的哪里是到哪里是</h3>
        <h4 style="margin-top: 20px">哪里上课那两款的哪里上的那是理科的哪里的哪里的农村的内存是动车上那是你拉上车那算了采纳了</h4>
    </div>
    <div class="" style="float: left;margin-top: 40px">
        <small style="color: #adadad;margin-left: 40px">一天前</small>
        <small style="color: #adadad;margin-left: 20px"><a href="#">回复</a></small>
    </div>
    <div style="right: 10px;float: right">
        <a style="" href="#">
            <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class="img-circle img-responsive" style="height: 40px;width: 40px ;margin-top: 0px">
            <small>开发团队</small>
        </a>
    </div>
</div>
<div class="container " style="border-radius: 10px;margin-top: 20px;background-color: #e7e7e7;width: 80%;height: auto;margin-left: auto;margin-right: auto;padding: 1%">
    <h3>2个回复</h3>
    <div style="width: 100% ;background-color: #b17ba2;height: 1px;margin-top: 10px;margin-bottom: 10px" ></div>
    <div>
        <div style="float: left">
            <a style="" href="#">
                <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class="img-circle img-responsive" style="height: 40px;width: 40px ;margin-top: 0px">
                <small>开发团队</small>
            </a>
        </div>
        <div class="container" style="margin-top: 10px;margin-left: 50px">
            <p>
                adadanlkda<br><br><br><br><br>
                ncocnsdoicnocinoiasdcnaslkncaslkcna/ns你从爱上你插上吵闹的成三次那是从那时才那是尺寸
            </p>
        </div>
        <div style="float: right;right: 10px">
            <small style="color: #adadad">一天前</small>
        </div>
    </div>
    <div style="width: 100% ;background-color: #b17ba2;height: 1px;margin-top: 25px" ></div>
    <div>
        <div style="float: left">
            <a style="" href="#">
                <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class="img-circle img-responsive" style="height: 40px;width: 40px ;margin-top: 0px">
                <small>开发团队</small>
            </a>
        </div>
        <div class="container" style="margin-top: 10px;margin-left: 50px">
            <p>
                adadanlkda<br><br><br><br><br>
                ncocnsdoicnocinoiasdcnaslkncaslkcna/ns你从爱上你插上吵闹的成三次那是从那时才那是尺寸
            </p>
        </div>
        <div style="float: right;right: 10px">
            <small style="color: #adadad">一天前</small>
        </div>
    </div>
</div>
<div class="container " style="border-radius: 10px;margin-top: 20px;background-color: #e7e7e7;width: 80%;height: auto;margin-left: auto;margin-right: auto;padding: 1%">
    <div style="margin-top: 10px">
        <textarea style="border-radius: 5px;height:150px;width: 100%" placeholder="请文明回帖！" name="content" id="content"></textarea>
    </div>
    <div style="margin-top: 10px;margin-right: 10px;margin-bottom:10px;text-align: right">
        <c:if test="${sessionScope.user!=null}">
            <button class="btn  btn-success" type="button" id="send">发布</button>
        </c:if>
        <c:if test="${sessionScope.user==null}">
            <button class="btn  btn-danger" disabled="disabled" type="button" >请先登录</button>
        </c:if>
    </div>
</div>
</body>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>
<script>
    $(document).ready(function(){

        $("#send").click(function(){
            var url = "/addPost";
            var content = $("#content").val();
            if(content==null || ""==content.trim()){
                window.alert("请输入内容");
                return;
            }
            $.post(url, {title: title, content: content}, function (data) {
                window.location.href="discuss.jsp";
            });
        });
    });
</script>