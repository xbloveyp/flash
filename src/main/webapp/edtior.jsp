<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="margin: 0;padding: 0;height: 100%">
<head lang="en">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="在线动画设计">
    <meta name="author" content="Cao Xiaobo">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/1.jpg" type="image/x-icon" />
    <title>益画</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/util.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/edtior.js"></script>
    <!--<link href="css/edtior.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'iconfont';
            src: url('//at.alicdn.com/t/font_1461658337_9636898.eot'); /* IE9*/
            src: url('//at.alicdn.com/t/font_1461658337_9636898.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
            url('//at.alicdn.com/t/font_1461658337_9636898.woff') format('woff'), /* chrome、firefox */
            url('//at.alicdn.com/t/font_1461658337_9636898.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
            url('//at.alicdn.com/t/font_1461658337_9636898.svg#iconfont') format('svg'); /* iOS 4.1- */
        }
        .iconfont{
            font-family:"iconfont";
            font-size:50px;font-style:normal;
        }
        a[name = "animationList"]{
            width: 80%;
            float: left;
        }
        i[name="deleteAnimation"]{
            width: 20%;
            color: #c9302c;
            float: left;
            padding: 0;
            margin: 0;
            font-size: 30px;
        }


    </style>
</head>
<body style="margin: 0;padding: 0;height:100%;">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container" style="margin-left: 3%">
        <div class="navbar-header" style="margin: 0">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Flash Online</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="margin: 0;padding: 5px">
                <img src="${pageContext.request.contextPath}/static/img/1.jpg" class="img-circle img-responsive" style="height:40px;width: 40px;float: left ;margin: 0;vertical-align: top">
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
                <form class="navbar-form navbar-right" style="display: inline;padding:0;margin:0;height: 50px">
                    <h5 style="color: #888888">欢迎您：${sessionScope.user.userName==""?sessionScope.user.userName:sessionScope.user.userName}&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/flash/logout" role="presentation">注销</a>
                        <a id ="save" class=" btn btn-normal btn-success" style="margin-left: 30px">保存为初始状态</a>
                        <%--<a id ="load" class=" btn btn-normal btn-success" style="padding-left: 30px;padding-right: 30px;margin-right: 30px">加载</a>--%>
                    </h5>
                </form>
            </c:if>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<div class="container col-lg-12" id="container" style="margin: 0; padding: 0;height: 92%;bottom: 0;position: absolute;">
    <div class=" col-lg-3" style="margin: 0; padding: 0;height: 100%;bottom: 0;display: inline-block">
    <div id="paint" style="background-color: #D9D9D9 ;margin: 0;padding: 0;float:left;height: 100%;width: 18%;overflow-y: auto;">
        <div id="pan" style="text-align: center">
            <table >
                <tr><td ><i class="iconfont btn" type="button" id="mouse" create="mouse" style="padding: 0;margin-top: 2px;border-radius: 10px">&#xe600;</i></td></tr>
                <tr><td ><i class="iconfont btn" type="button" id="rect" create="rect" style="padding: 0;margin-top: 2px;border-radius: 10px">&#xe605;</i></td></tr>
                <tr><td ><i class="iconfont btn" type="button" id="circle" create="circle" style="padding: 0;margin-top: 2px;border-radius: 10px">&#xe607;</i></td></tr>
                <tr><td ><i class="iconfont btn" type="button" id="triangle" create="triangle" style="padding: 0;margin-top: 2px;border-radius: 10px">&#xe608;</i></td></tr>
                <tr><td ><i class="iconfont btn" type="button" id="line" create="line" style="padding: 0;margin-top: 2px;border-radius: 10px">&#xe60b;</i></td></tr>
                <tr><td ><i class="iconfont btn" type="button" id="text" create="text" style="padding: 0;margin-top: 2px;border-radius: 10px">&#xe604;</i></td></tr>
                <tr><td ><i class="btn" type="button"  data-toggle="modal" data-target="#library" style="padding: 0;margin-top: 2px;border-radius: 10px">加载图形</i></td></tr>
            </table>
            <div class="modal fade" id="library" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">官方图库</h4>
                        </div>
                        <div class="modal-body" style="overflow-y: scroll;height: 400px">
                            <div class="container-fluid" >
                                <div >
                                    <c:forEach items="${librarys}" var="lib" varStatus="vs">
                                        <div  id="${lib.code}" type="button" class="importShape" style="float: left">
                                            <a href="#"> <img src="${lib.imageUrl}" alt="..." class="img-responsive" style="margin:1px;border: solid  1px #CACACA"></a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </div>


    <div class="panel-group " id="accordion" role="tablist" aria-multiselectable="true" style="margin: 0;padding: 0;float: left;height: 100%;width:82%;overflow-y: auto;">
        <div class="panel panel-default">
            <%--<div class="panel-heading" role="button" id="headingOne">--%>
                <%--<h4 class="panel-title">--%>
                    <a id="headingOne" class="panel-heading btn btn-default" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="width: 100%">
                        外观和变换
                    </a>
                <%--</h4>--%>
            <%--</div>--%>
            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                    <div id="toolbox" >
                        <form id="look-and-transform" disabled="disabled">
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">left</span>
                                <input  id="animation_left1" name="animation_left" class="form-control" type="number" value="0" step="1">
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">top</span>
                                <input  id="animation_top1" name="animation_top" class="form-control" type="number" value="0" step="1">
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">填充</span>
                                <input id="animation_fill1" name="animation_fill" type="color" class="form-control" value="#00D5FF" />
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">描边</span>
                                <input id="animation_stroke1" name="animation_stroke" class="form-control" type="color" value="#FFFFFF" />
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">描边大小</span>
                                <input  id="animation_strokeWidth1" name="animation_strokeWidth" class="form-control" type="number" value="0" step="1">
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">width</span>
                                <input  id="animation_width1" name="animation_width" class="form-control" type="number" value="0" step="1">
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">height</span>
                                <input  id="animation_height1" name="animation_height" class="form-control" type="number" value="0" step="1">
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">angle</span>
                                <input  id="animation_angle1" name="animation_angle" class="form-control" type="number" value="0" step="1">
                            </div>
                            <div class="input-group"  style="margin-top: 5px">
                                <span class="input-group-addon">opacity</span>
                                <input  id="animation_opacity1" name="animation_opacity" class="form-control" type="number" value="1" min="0" max="1" step="0.1">
                            </div>
                            <%--<input id="strokeWidth" name="strokeWidth" type="range" value="" />--%>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
                    <a id="headingTwo" class="collapsed panel-heading btn btn-default" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="width: 100%">
                        动画
                    </a>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">left</span>
                        <input  id="animation_left2" name="animation_left" class="form-control" type="number" value="0" step="1">
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">top</span>
                        <input  id="animation_top2" name="animation_top" class="form-control" type="number" value="0" step="1">
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">填充</span>
                        <input id="animation_fill2" name="animation_fill" type="color" class="form-control" value="#00D5FF" />
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">描边</span>
                        <input id="animation_stroke2" name="animation_stroke" class="form-control" type="color" value="#FFFFFF" />
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">width</span>
                        <input id="animation_width2" name="animation_width" class="form-control" type="number" value="0" step="1">
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">height</span>
                        <input id="animation_height2" name="animation_height" class="form-control" type="number" value="0" step="1">
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">angle</span>
                        <input  id="animation_angle2" name="animation_angle" class="form-control" type="number" value="0" step="1">
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">opacity</span>
                        <input  id="animation_opacity2" name="animation_opacity" class="form-control" type="number" value="1" min="0" max="1" step="0.1">
                    </div>
                    <div class="input-group"  style="margin-top: 5px">
                        <span class="input-group-addon">开始时间</span>
                        <input id="animation_startTime" class="form-control" type="number" min="0" value="0" step="1">
                        <span class="input-group-addon">秒</span>
                    </div>
                    <div class="input-group" style="margin-top: 5px">
                        <span class="input-group-addon">结束时间</span>
                        <input id="animation_endTime" class="form-control" type="number" min="0" value="0" step="1">
                        <span class="input-group-addon">秒</span>
                    </div>
                    <div class="input-group" style="margin-top: 5px">
                        <span class="input-group-addon">方式</span>
                        <select id="animation_easing" class="form-control" >
                        <option>easeInQuad</option>
                        <option>easeOutQuad</option>
                        <option>easeInOutQuad</option>
                        <option>easeInCubic</option>
                        <option>easeOutCubic</option>
                        <option>easeInOutCubic</option>
                        <option>easeInQuart</option>
                        <option>easeOutQuart</option>
                        <option>easeInOutQuart</option>
                        <option>easeInQuint</option>
                        <option>easeOutQuint</option>
                        <option>easeInOutQuint</option>
                        <option>easeInSine</option>
                        <option>easeOutSine</option>
                        <option>easeInOutSine</option>
                        <option>easeInExpo</option>
                        <option>easeOutExpo</option>
                        <option>easeInOutExpo</option>
                        <option>easeInCirc</option>
                        <option>easeOutCirc</option>
                        <option>easeInOutCirc</option>
                        <option>easeInElastic</option>
                        <option>easeOutElastic</option>
                        <option>easeInOutElastic</option>
                        <option>easeInBack</option>
                        <option>easeOutBack</option>
                        <option>easeInOutBack</option>
                        <option>easeInBounce</option>
                        <option>easeOutBounce</option>
                        <option>easeInOutBounce</option>
                    </select>
                    </div>
                    <button id="animation_add" class="btn btn-info" style="margin-top: 5px">添加动画</button>
                    <div id="animationList" style="margin-top: 5px">
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="panel panel-default">--%>
            <%--<div class="modal fade bs-example-modal-sm" id="createFlash" tabindex="-1" role="dialog" aria-labelledby="createFlash">--%>
                <%--<div class="modal-dialog modal-sm" role="document">--%>
                    <%--<div class="modal-content">--%>
                        <%--<div class="modal-header">--%>
                            <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                            <%--<h4 class="modal-title" id="createFlashLabel">动画</h4>--%>
                        <%--</div>--%>
                        <%--<div class="modal-body">--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">left</span>--%>
                                <%--<input  id="animation_left2" name="animation_left" class="form-control" type="number" value="0" step="1">--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">top</span>--%>
                                <%--<input  id="animation_top2" name="animation_top" class="form-control" type="number" value="0" step="1">--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">填充</span>--%>
                                <%--<input id="animation_fill2" name="animation_fill" type="color" class="form-control" value="#00D5FF" />--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">描边</span>--%>
                                <%--<input id="animation_stroke2" name="animation_stroke" class="form-control" type="color" value="#FFFFFF" />--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">width</span>--%>
                                <%--<input id="animation_width2" name="animation_width" class="form-control" type="number" value="0" step="1">--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">height</span>--%>
                                <%--<input id="animation_height2" name="animation_height" class="form-control" type="number" value="0" step="1">--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">angle</span>--%>
                                <%--<input  id="animation_angle2" name="animation_angle" class="form-control" type="number" value="0" step="1">--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">opacity</span>--%>
                                <%--<input  id="animation_opacity2" name="animation_opacity" class="form-control" type="number" value="1" min="0" max="1" step="0.1">--%>
                            <%--</div>--%>
                            <%--<div class="input-group"  style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">开始时间</span>--%>
                                <%--<input id="animation_startTime" class="form-control" type="number" min="0" value="0" step="1">--%>
                                <%--<span class="input-group-addon">秒</span>--%>
                            <%--</div>--%>
                            <%--<div class="input-group" style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">结束时间</span>--%>
                                <%--<input id="animation_endTime" class="form-control" type="number" min="0" value="0" step="1">--%>
                                <%--<span class="input-group-addon">秒</span>--%>
                            <%--</div>--%>
                            <%--<div class="input-group" style="margin-top: 5px">--%>
                                <%--<span class="input-group-addon">方式</span>--%>
                                <%--<select id="animation_easing" class="form-control" >--%>
                                    <%--<option>easeInQuad</option>--%>
                                    <%--<option>easeOutQuad</option>--%>
                                    <%--<option>easeInOutQuad</option>--%>
                                    <%--<option>easeInCubic</option>--%>
                                    <%--<option>easeOutCubic</option>--%>
                                    <%--<option>easeInOutCubic</option>--%>
                                    <%--<option>easeInQuart</option>--%>
                                    <%--<option>easeOutQuart</option>--%>
                                    <%--<option>easeInOutQuart</option>--%>
                                    <%--<option>easeInQuint</option>--%>
                                    <%--<option>easeOutQuint</option>--%>
                                    <%--<option>easeInOutQuint</option>--%>
                                    <%--<option>easeInSine</option>--%>
                                    <%--<option>easeOutSine</option>--%>
                                    <%--<option>easeInOutSine</option>--%>
                                    <%--<option>easeInExpo</option>--%>
                                    <%--<option>easeOutExpo</option>--%>
                                    <%--<option>easeInOutExpo</option>--%>
                                    <%--<option>easeInCirc</option>--%>
                                    <%--<option>easeOutCirc</option>--%>
                                    <%--<option>easeInOutCirc</option>--%>
                                    <%--<option>easeInElastic</option>--%>
                                    <%--<option>easeOutElastic</option>--%>
                                    <%--<option>easeInOutElastic</option>--%>
                                    <%--<option>easeInBack</option>--%>
                                    <%--<option>easeOutBack</option>--%>
                                    <%--<option>easeInOutBack</option>--%>
                                    <%--<option>easeInBounce</option>--%>
                                    <%--<option>easeOutBounce</option>--%>
                                    <%--<option>easeInOutBounce</option>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="modal-footer">--%>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                            <%--<button id="animation_add" class="btn btn-info">添加动画</button>--%>
                            <%--&lt;%&ndash;<button type="button" class="btn btn-primary" id="project_save">保存</button>&ndash;%&gt;--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<a class="collapsed panel-heading btn btn-default" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="width: 100%">--%>
                <%--动画列表--%>
            <%--</a>--%>
            <%--<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">--%>
                <%--<div class="panel-body">--%>
                    <%--<button class="btn btn-success " type="button" data-toggle="modal" data-target="#createFlash" style="margin-top: 2px;">添加动画</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="panel panel-default">
            <a class="collapsed panel-heading btn btn-default" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour" style="width: 100%">
                操作
            </a>
            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                    <button id="upOne" class="btn btn-success" style="margin-top: 5px">上移一层</button>
                    <button id="upTop" class="btn btn-info" style="margin-top: 5px">置于顶层</button>
                    <button id="downOne" class="btn btn-default" style="margin-top: 5px">下移一层</button>
                    <button id="downBottom" class="btn btn-primary" style="margin-top: 5px">置于底层</button>
                    <button id="clone" class="btn btn-info" style="margin-top: 5px">复制</button>
                    <button id="delete" class="btn btn-danger" style="margin-top: 5px">删除选中图形</button>
                    <button id="deleteAll" class="btn btn-danger" style="margin-top: 5px">清空画板</button>
                    <button id="importImage" class="btn btn-success" style="margin-top: 5px">导出图片</button>
                    <button id="groups" class="btn btn-primary" style="margin-top: 5px">组合</button>
                    <button id="loadOriginal" class="btn btn-default" style="margin-top: 5px">加载初始状态</button>
                    <button id="animation_start" class="btn btn-info" style="margin-top: 5px">开始动画</button>
                </div>
            </div>
        </div>
    </div>
    </div>

    <div id="canvas" class="col-lg-7 col-lg-offset-3" style="margin: 0;padding: 0;float: left;border-top:1px solid #A3A3A3;height: 100%" >
        <div id="cParent" style="padding:0;margin: 0;height: 100%;width: 100%">
            <canvas id="c"  style="top: 0;left: 0;right: 0;bottom: 0;height: 100%;width: 100%"></canvas>
        </div>
    </div>

    <div  class="col-lg-2 container col-lg-offset-10" style="margin: 0;padding: 0;background-color:#e7e7e7 ;float: left;border-top:1px solid #A3A3A3;height: 100%;overflow-y: auto">
        <h2 style="text-align: center">所有组件</h2>
        <div id="module" >
        </div>
    </div>

</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/fabric.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/util.js"></script>
</html>
