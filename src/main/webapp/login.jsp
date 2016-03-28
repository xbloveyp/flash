<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
<body style="background-color: #e7e7e7">
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

<img src="static/img/1.jpg" class="img-responsive img-circle" style="margin-top: 5%;width: 150px;height: 150px;margin-left:auto;margin-right: auto">
<div class="container col-lg-4 col-lg-offset-4" style="margin-top: 3%">
    <div class="input-group">
        <span class="input-group-addon" >用户名</span>
        <input type="text" class="form-control" placeholder="Username" aria-describedby="username" id="username">
    </div>
    <div class="" role="alert" id="usernametip" ></div>

    <div class="input-group" style="margin-top: 20px">
        <span class="input-group-addon" >密&nbsp;&nbsp;&nbsp;码</span>
        <input type="password" class="form-control" placeholder="Password" aria-describedby="password" id="password">
    </div>
    <div class="" role="alert" id="passwordtip" ></div>

    <div class="checkbox col-lg-offset-1" >
            <input type="checkbox" id="savePassword"> 保存密码30天
    </div>
    <div class="">
    <button type="button" class="btn btn-success col-lg-12" style="margin-top: 20px" id="loginbtn">登录</button>
    </div>
</div>
</body>
<script src="static/js/jquery-2.1.1.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/util.js"></script>
<script>
    $(document).ready(function(){
        init();
        function init(){
            $.ajax({
                type: 'POST',
                url: getRootPath()+"/flash/getCookie",
                contentType: "application/json",
                data:{},
                success: function (result) {
                    if (result.code == 200) {
                        $("#username").val( result.data.userName);
                        $("#password").val( result.data.password);
                        $("#savePassword").attr("checked",true);
                    }
                }
            });
        }
        $("#username").focus(function () {
            $("#usernametip").html("请输入用户名");
            document.getElementById("usernametip").className = "alert alert-success text-center";
        });

        $("#password").focus(function () {
            $("#passwordtip").html("请输入密码");
            document.getElementById("passwordtip").className = "alert alert-success text-center";
        });

        $("#username").blur(function(){
            var username = $(this).val();
            var divtip = document.getElementById("usernametip");

            var url = getRootPath()+"/flash/getUser";
            $.ajax({
                type: 'POST',
                url:url,
                data:{username:username},
                success:function(result){
                    if(result.code==200) {
                        $("#usernametip").html(null);
                        divtip.className = "";
                    }else{
                        $("#usernametip").html("用户名不存在");
                        divtip.className="alert alert-danger text-center";
                    }
                }
            });
        });

        $("#password").blur(function(){
            var password = $(this).val();
            var divtip = document.getElementById("passwordtip");
            if(password.length==0) {
                $("#passwordtip").html("请输入密码");
                divtip.className="alert alert-danger text-center";
            }else{
                $("#passwordtip").html(null);
                divtip.className="";
            }
        });

        $("#loginbtn").click(function(){
            $("#password").blur();
            $("#username").blur();
            var flag = true;
            function valid(){ var roles = $("div[role='alert']");
                for(var i = 0;i<roles.length;i++){
                    if(roles[i].innerHTML!=""){
                        flag=false;
                    }
                }};
            setTimeout(valid(),1000);
            if(flag) {
                var userName = $("#username").val();
                var password = $("#password").val();
                var save = $("#savePassword").is(':checked');
                var url = getRootPath()+"/flash/login";
                $.ajax({
                    type: 'POST',
                    url: url,
                    contentType: "application/json",
                    data:JSON.stringify({userName: userName, password: password,save:save}),
                    success: function (result) {
                        if (result.code == 200) {
                            if(result.data["loginRefererUrl"]!=null){
                                var refererUrl = result.data["loginRefererUrl"];
                                if (refererUrl=="workSpace.jsp"){
                                    window.location.href = getRootPath()+"/flash/loadProject";
                                }else {
                                    window.location.href = getRootPath() + "/" + refererUrl;
                                }
                            }else {
                                window.location.href = getRootPath()+"/index.jsp";
                            }
                        } else {
                            $("#passwordtip").html("用户名或密码错误");
                            document.getElementById("passwordtip").className = "alert alert-danger text-center";
                        }
                    }
                });
            }
        });
    });
</script>
</html>