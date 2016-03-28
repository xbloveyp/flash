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
    <link rel="shortcut icon" href="static/img/1.jpg" type="image/x-icon" />
    <title>益画</title>
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
                <li role="presentation"><a href="${pageContext.request.contextPath}/flash/findAllEssencePosts/1">讨论区</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/flash/loadProject">创作空间</a></li>
            </ul>
            <c:if test="${sessionScope.user==null}">
                <form class="navbar-form navbar-right">
                    <a  class=" btn btn-normal btn-primary" href="${pageContext.request.contextPath}/login.jsp" style="padding-left: 30px;padding-right: 30px">登录</a>
                    <a  class=" btn btn-normal btn-success" href="${pageContext.request.contextPath}/regist.jsp" style="padding-left: 30px;padding-right: 30px;margin-left: 15px">注册</a>
                </form>
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                <form class="navbar-form navbar-right" style="display: inline">
                    <h5 style="color: #888888">欢迎您：${sessionScope.user.userName==""?sessionScope.user.userName:sessionScope.user.userName}&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/flash/logout" role="presentation">注销</a>
                    </h5>
                </form>
            </c:if>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<div class="container " style="border-radius: 10px;margin-top: 70px;background-color: #e7e7e7;width: 80%;height: auto;margin-left: auto;margin-right: auto;padding: 1%">
    <div>
        <h3 class="pid" id="${post.id}">${post.title}</h3>
    </div>
</div>
<div class="container " style="border-radius: 5px;margin-top: 20px;background-color: #e7e7e7;width: 80%;height: auto;margin-left: auto;margin-right: auto;padding: 1%">
    <div>
        <div style="float: left;text-align: center">
            <a style="" href="#">
                <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class="img-circle img-responsive" style="height: 50px;width: 50px ;margin-top: 0px">
                <small>${post.userName}</small>
            </a>
        </div>
        <div class="container" style="margin-top: 10px;margin-left: 50px">
            <p>${post.content}</p>
        </div>
        <div style="float: right;right: 10px">
            <small style="color: #adadad">${post.addTime}</small>
        </div>
    </div>
    <c:forEach items="${followPosts}" var="fp" varStatus="vs">
        <%--<c:if test="${vs.index==0}">--%>
            <%--<h3>${post.followNum}个回复</h3>--%>
        <%--</c:if>--%>
        <div style="width: 100% ;background-color: #b17ba2;height: 1px;margin-top: 30px;margin-bottom: 10px" ></div>
        <div>
            <div style="float: left;text-align: center">
                <a style="" href="#">
                    <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class="img-circle img-responsive" style="height: 50px;width: 50px ;margin-top: 0px">
                    <small>${fp.userName}</small>
                </a>
            </div>
            <div class="container" style="margin-top: 10px;margin-left: 50px">
                <p>${fp.content}</p>
            </div>
            <div style="float: right;right: 10px">
                <small style="color: #adadad">${fp.addTime}</small>
            </div>
        </div>
    </c:forEach>
</div>
<div class="container " style="border-radius: 10px;margin-top: 20px;background-color: #e7e7e7;width: 80%;height: auto;margin-left: auto;margin-right: auto;padding: 1%">
    <div style="margin-top: 10px">
        <textarea style="border-radius: 5px;height:150px;width: 100%" placeholder="请文明跟帖！" name="content" id="content"></textarea>
    </div>
    <div style="margin-top: 10px;margin-right: 10px;margin-bottom:10px;text-align: right">
        <c:if test="${sessionScope.user!=null}">
            <button class="btn  btn-success" type="button" id="send">回复</button>
        </c:if>
        <c:if test="${sessionScope.user==null}">
            <button class="btn  btn-danger" disabled="disabled" type="button" >请先登录</button>
        </c:if>
    </div>
</div>
</body>
<script src="static/js/jquery-2.1.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/util.js"></script>
</html>
<script>
    $(document).ready(function(){
        $("#send").click(function(){
            var url = getRootPath()+ "/flash/addFollowPost";
            var content = $("#content").val();
            var postId =  $(".pid").attr("id");
            if(content==null || ""==content.trim()){
                window.alert("请输入内容");
                return;
            }
            $.ajax({
                type: 'POST',
                url: url,
                contentType: "application/json",
                data:JSON.stringify({pid:postId, content: content}),
                success: function (result) {
                    window.location.href=getRootPath()+"/posts.jsp";
                }
            });
        });
    });
</script>