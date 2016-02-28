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
    <title>flash_edtior</title>

    <script type="text/javascript" src="js/edtior.js"></script>
    <!--<link href="css/edtior.css" rel="stylesheet">-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'iconfont';
            src: url('//at.alicdn.com/t/font_1456563258_2788763.eot'); /* IE9*/
            src: url('//at.alicdn.com/t/font_1456563258_2788763.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
            url('//at.alicdn.com/t/font_1456563258_2788763.woff') format('woff'), /* chrome、firefox */
            url('//at.alicdn.com/t/font_1456563258_2788763.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
            url('//at.alicdn.com/t/font_1456563258_2788763.svg#iconfont') format('svg'); /* iOS 4.1- */
        }
        .iconfont{
            font-family:"iconfont";
            font-size:50px;font-style:normal;
        }

    </style>
</head>
<body style="margin: 0;padding: 0">
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
                <li role="presentation"><a href="/loadProject">创作空间</a></li>
            </ul>
            <c:if test="${sessionScope.user==null}">
                <form class="navbar-form navbar-right">
                    <a  class=" btn btn-normal btn-primary" href="login.jsp" style="padding-left: 30px;padding-right: 30px">登录</a>
                    <a  class=" btn btn-normal btn-success" href="regist.jsp" style="padding-left: 30px;padding-right: 30px;margin-left: 15px">注册</a>
                    <a id ="save" class=" btn btn-normal btn-success" style="padding-left: 30px;padding-right: 30px;margin-right: 30px">保存</a>
                </form>
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                <form class="navbar-form navbar-right" style="display: inline">
                    <h5 style="color: #888888">欢迎您：${sessionScope.user.userName==""?sessionScope.user.userName:sessionScope.user.userName}&nbsp;&nbsp;
                        <a href="/logout" role="presentation">注销</a>
                        <a id ="save1" class=" btn btn-normal btn-success" style="padding-left: 30px;padding-right: 30px;margin-right: 30px">保存</a>
                    </h5>
                </form>
            </c:if>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<div class="container" id="container" style="margin-top: 50px ; margin-left: 0 ; padding: 0;height: 100%">
    <div id="paint" class="col-lg-1 container" style="background-color: #1F1F1F ;margin-left: 0;padding-left: 0;height: auto;position: absolute;bottom: 0;top: 51px;border-right:1px solid #707070;border-top:1px solid #A3A3A3">
        <form id="pan" style="text-align: center">
            <button class="iconfont " type="button" id="mouse" create="mouse" style="margin-top: 2px;border-radius: 10px">&#xe600;</button>
            <button class="iconfont " type="button" id="rect" create="rect" style="margin-top: 2px;border-radius: 10px">&#xe605;</button>
            <button class="iconfont " type="button" id="circle" create="circle" style="margin-top: 2px;border-radius: 10px">&#xe607;</button>
            <button class="iconfont " type="button" id="triangle" create="triangle" style="margin-top: 2px;border-radius: 10px">&#xe608;</button>
            <button class="iconfont " type="button" id="line" create="line" style="margin-top: 2px;border-radius: 10px">&#xe60b;</button>
            <button class="iconfont " type="button" id="text" create="text" style="margin-top: 2px;border-radius: 10px">&#xe604;</button>
        </form>
    </div>


    <div id="toolbox" class="col-lg-2 container col-lg-offset-1" style="background-color: #e7e7e7 ;height: auto;position: absolute;bottom: 0;top: 51px">
        <h2>形状</h2>
        <form id="shape-attrs">

        </form>
        <!--<h2>外观和变换</h2>-->
        <form id="look-and-transform" disabled="disabled">
            <p>
                <label style="display: inline;">填充</label>
                <input id="fill" name="fill" type="color" value="#00D5FF" />
            </p>
            <p>
                <label style="display: inline;">描边</label>
                <input id="stroke" name="stroke" type="color" value="#FFFFFF" />
                <input id="strokeWidth" name="strokeWidth" type="range" value="" />
            </p>
            <!--&lt;!&ndash;<p>&ndash;&gt;-->
                <!--&lt;!&ndash;<label>left</label>&ndash;&gt;-->
                <!--&lt;!&ndash;<input id="left" name="left" type="range" min="0" max="100" value="0" />&ndash;&gt;-->

                <!--&lt;!&ndash;<label>top</label>&ndash;&gt;-->
                <!--&lt;!&ndash;<input id="top" name="top" type="range" min="0" max="100" value="0" />&ndash;&gt;-->

                <!--&lt;!&ndash;<label>angle</label>&ndash;&gt;-->
                <!--&lt;!&ndash;<input id="angle" name="angle" type="range" min="-180" max="180" value="0" />&ndash;&gt;-->

            <!--&lt;!&ndash;</p>&ndash;&gt;-->
        </form>
        <button id="delete">删除</button>
    </div>

    <div id="canvas" class="col-lg-7 container col-lg-offset-3" style="padding: 0;border: 1px solid #333333;bottom: 0;position: absolute;top: 51px" >
        <div style="padding:0;margin: 0;overflow:auto;height: 100%;width: 100%">
            <canvas id="c" width="760" height="577" style="top: 0;left: 0;right: 0;bottom: 0"></canvas>
        </div>
    </div>

    <div  class="col-lg-2 container col-lg-offset-10" style="background-color:#e7e7e7 ;height: auto;position: absolute;bottom: 0;top: 51px">
        <h2>所有组件</h2>
        <form id="module" disabled="disabled">
        </form>
    </div>

</div>
</body>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/fabric.min.js"></script>
</html>
