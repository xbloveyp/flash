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
    <div class="list-group " style="margin-bottom: 5%;margin-left: 1%">
        <a  class="active  text-center list-group-item " href="#" style="float: left ;width: 20%"><span class="badge">4</span>精选</a>
        <a  class="  text-center list-group-item " href="#" style="float: left;width: 20%">最新</a>
        <a  class="  text-center list-group-item " href="#" style="float: left;width: 20%">我的</a>
    </div>
    <c:forEach items="${posts}" var="po" varStatus="vs">
        <div class="" style="margin-top: 10px ;background-color: white;border-radius: 10px">
            <div class=" container" style="margin-top: 20px ;padding: 10px">
                <a >
                    <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class="img-circle img-responsive" style="height: 40px;width: 40px ;position: absolute;margin-top: 20px">
                </a>
                <div class="" style="margin-left: 50px">
                    <h3 class=""><a href="">${po.title}</a></h3>
                    <a href="#" class="" style="margin-left: 10px">
                        <small>${po.username}</small>
                    </a>
                    <small style="color: #adadad;margin-left: 40px">${po.updatetime}</small>
                    <span class="badge" style="margin-left: 10px">${po.follownum}</span>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<div style="right:5%;top:30%;padding: 0;position: fixed">
  <a class="btn btn-normal btn-info" role="button" href="#post" >发帖</a>
</div>
<div class="container" style="width: 60%;margin-top: 50px;margin-bottom: 20px;border-radius: 10px;background-color: #c4e3f3" >
    <a name="post"></a>
    <div>
        <h5 style="font-family: Kiti">发起讨论</h5>
    </div>
    <div>
        <div class="input-group" style="align-content: center">
            <span class="input-group-addon" id="sizing-addon2">标题</span>
            <input type="text" class="form-control" style="" placeholder="标题名称" aria-describedby="sizing-addon2" name="title" id="title">
        </div>
    </div>
    <div style="margin-top: 10px">
        <textarea style="border-radius: 5px;height:150px;width: 100%" placeholder="请文明发帖！" name="content" id="content"></textarea>
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
            var title = $("#title").val();
            if(title==null || ""==title.trim()){
                window.alert("请输入标题");
                return;
            }
            var content = $("#content").val();
            if(content==null || ""==content.trim()){
                window.alert("请输入内容");
                return;
            }
            $.ajax({
                type: 'POST',
                url: url,
                contentType: "application/json",
                data:JSON.stringify({title: title, content: content}),
                success: function (result) {
                    window.location.href="discuss.jsp";
                }
            });
        });
    });
</script>