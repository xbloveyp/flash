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
    <link rel="icon" href="../../favicon.ico">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
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
<img src="img/1.jpg" class="img-responsive img-circle" style="margin-top: 5%;width: 150px;height: 150px;margin-left:auto;margin-right: auto">
<div class="container col-lg-4 col-lg-offset-4" style="margin-top: 3%">
    <div class="form-group ">
        <div class="input-group">
            <span class="input-group-addon" >用&nbsp;&nbsp;&nbsp;户&nbsp;名</span>
            <input type="text" class="form-control" placeholder="Username" aria-describedby="username" id="username" >
        </div>
        <div class="" role="alert" id="usernametip" ></div>
    </div>

    <div class="input-group" style="margin-top: 20px">
        <span class="input-group-addon" >密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</span>
        <input type="password" class="form-control" placeholder="Password" aria-describedby="password" id="password">
    </div>
    <div class="" role="alert" id="passwordtip" ></div>

    <div class="input-group" style="margin-top: 20px">
        <span class="input-group-addon" >密码确认</span>
        <input type="password" class="form-control" placeholder="Password Confirm" aria-describedby="repassword" id="repassword">
    </div>
    <div class="" role="alert" id="repasswordtip" ></div>

	<div class="input-group" style="margin-top: 20px">
        <span class="input-group-addon" >邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
        <input type="email" class="form-control" placeholder="Email" aria-describedby="email" id="email">
    </div>
    <div class="" role="alert" id="emailtip" ></div>

    <div class="">
    <button type="button" id="registbtn" class="btn btn-info col-lg-12 " style="margin-top: 20px">注册</button>
    </div>
</div>
</body>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script>
	 $(document).ready(function(){
         $("#username").focus(function(){
             $("#usernametip").html("请输入一个 3-14 位的用户名");
             document.getElementById("usernametip").className="alert alert-success text-center";
         });

         $("#password").focus(function(){
             $("#passwordtip").html("请输入一个 6-16 位的密码");
             document.getElementById("passwordtip").className="alert alert-success text-center";
         });

         $("#repassword").focus(function(){
             $("#repasswordtip").html("请再次输入密码");
             document.getElementById("repasswordtip").className="alert alert-success text-center";
         });

         $("#email").focus(function(){
             $("#emailtip").html("请输入邮箱");
             document.getElementById("emailtip").className="alert alert-success text-center";
         });

         $("#username").blur(function(){
             var username = $(this).val();
             var divtip = document.getElementById("usernametip");

             var url = "/getUser";
             $.post(url,{username:username},function(data){
                 if(data!=null) {
                     $("#usernametip").html("用户名已经存在");
                     divtip.className="alert alert-danger text-center";
                 }else{
                     if((username.length>=0 && username.length<3)||(username.length)>14){
                         $("#usernametip").html("用户名长度不符合");
                         divtip.className="alert alert-danger text-center";
                     }else {
                         $("#usernametip").html(null);
                         divtip.className = "";
                     }
                 }
             });
         });

         $("#password").blur(function(){
             var password = $(this).val();
             var divtip = document.getElementById("passwordtip");
             if((password.length)<6||(password.length)>16) {
                 $("#passwordtip").html("密码长度不符合");
                 divtip.className="alert alert-danger text-center";
             }else{
                 $("#passwordtip").html(null);
                 divtip.className="";
             }
         });

         $("#repassword").blur(function(){
             var repassword = $(this).val();
             var password = $("#password").val();
             var divtip = document.getElementById("repasswordtip");
             if(repassword!=password){
                 $("#repasswordtip").html("2次密码输入不一致");
                 divtip.className="alert alert-danger text-center";
             }else{
                 $("#repasswordtip").html(null);
                 divtip.className="";
             }
         });

         $("#email").blur(function(){
             var email = $(this).val();
             var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
             var divtip = document.getElementById("emailtip");
             if(pattern.test(email)){
                 $("#emailtip").html(null);
                 divtip.className="";
             }else{
                 $("#emailtip").html("不是有效的邮箱");
                 divtip.className="alert alert-danger text-center";
             }
         });

		 $("#registbtn").click(function(){
             $("#email").blur();
             $("#repassword").blur();
             $("#password").blur();
             $("#username").blur();
             var roles = $("div[role='alert']");
             var flag = true;
             for(var i = 0;i<roles.length;i++){
                 if(roles[i].innerHTML!=""){
                     flag=false;
                 }
             }
             if(flag) {
                 var username = $("#username").val();
                 var password = $("#password").val();
                 var email = $("#email").val();
                 var url = "/addUser";
                 $.post(url, {username: username, password: password, email: email}, function (data) {
                     window.location.href="index.jsp";
                 });
             }
         });
     });
</script>
</html>