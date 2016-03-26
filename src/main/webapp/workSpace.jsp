<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="margin: 0;padding: 5px">
                <img src="${pageContext.request.contextPath}/static/img/1.jpg" class="img-circle img-responsive" style="height:40px;width: 40px;float: left ;margin: 0;vertical-align: top">
                <p  style="float: left ;margin-top: 8px;margin-left: 15px">益画</p>
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" style="margin-left: 17%">
            <ul class="nav navbar-nav">
                <li role="presentation" ><a href="${pageContext.request.contextPath}/tutorial.jsp">新手教程</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/flash/findAllPosts">讨论区</a></li>
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
<div class="container col-lg-8 col-lg-offset-2" style="margin-top: 10%;" >
    <div class="modal fade" id="creatProject" tabindex="-1" role="dialog" aria-labelledby="creatProject">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="creatProjectLabel">创建新项目</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="project_name" class="control-label">项目名称:</label>
                            <input type="text" class="form-control" id="project_name">
                        </div>
                        <div class="form-group">
                            <label for="project_description" class="control-label">项目描述:</label>
                            <textarea class="form-control" id="project_description"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="project_save">保存</button>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${sessionScope.user!=null}">
    <table class="table" border="0" style="text-align: center;vertical-align: middle;">
        <c:if test="${sessionScope.projects==null}">
            <tr>
                <td class="col-lg-2" style="vertical-align: middle">
                    <div class="jumbotron">
                        <h1>开始创建你的项目</h1>
                        <p>每个用户最多创建6个项目</p>
                        <p><a class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#creatProject" >创建项目</a></p>
                    </div>

                </td>
            </tr>
        </c:if>
        <c:if test="${sessionScope.projects!=null}">
        <c:forEach items="${projects}" var="pj" varStatus="vs">
            <c:if test="${vs.index%3==0}">
                <tr>
            </c:if>
            <td class="col-lg-2" style="margin-left: 20px">
                <div class="row" style="border-radius: 15px">
                    <div class="thumbnail">
                        <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class=" img-responsive" style="margin-top: 10%">
                        <div class="caption">
                            <h3>${pj.title}</h3>
                            <p>${pj.description}</p>
                            <p>${pj.updateTime}</p>
                            <p style="display: inline"><a href="#" class="btn btn-primary" role="button" name="editor" id="${pj.id}">开始制作</a> </p>
                            <p style="display: inline"><a href="#" class="btn btn-danger" role="button" name="delete" id="${pj.id}">删除</a> </p>
                        </div>
                    </div>
                </div>
            </td>
            <c:if test="${(vs.index+1)%3==0}">
                </tr>
            </c:if>
            <c:if test="${((vs.index+1) == fn:length(projects)) && vs.index<5}">
                <td class="col-lg-2" style="vertical-align: middle">
                <button class="iconfont " type="button" data-toggle="modal" data-target="#creatProject" style="margin-top: 2px;border-radius: 10px">&#xe613;</button>
                </td>
            </c:if>
        </c:forEach>
        </c:if>
    </table>
    </c:if>
    <c:if test="${sessionScope.user==null}">
        <div class="jumbotron">
            <h1>开始创建你的项目</h1>
            <p>您尚未登录，请先登录</p>
            <p><a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/login.jsp" role="button">登录</a></p>
        </div>
    </c:if>
</div>


</body>
<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/util.js"></script>
</html>
<script>
    $(document).ready(function(){
        $("#project_save").click(function(){
            var url = getRootPath()+"/flash/saveProject";
            var projectName = $("#project_name").val();
            if(projectName==null || ""==projectName.trim()){
                window.alert("请输入项目名称");
                return;
            }
            var projectDescription = $("#project_description").val();
            if(projectDescription==null || ""==projectDescription.trim()){
                window.alert("请输入项目描述");
                return;
            }
            $.ajax({
                type: 'POST',
                url: url,
                contentType: "application/json",
                data:JSON.stringify({title: projectName, description: projectDescription}),
                success: function (result) {
                    window.location.href=getRootPath()+"/workSpace.jsp";
                }
            });
        });

        $("a[name = 'editor']").click(function(){
            var url = getRootPath()+"/flash/setProjectId";
            var projectId = $(this).attr("id");
            $.ajax({
                type: 'POST',
                url: url,
                data:{id: projectId},
                success: function (result) {
                    window.location.href=getRootPath()+"/edtior.jsp";
                }
            });
        });

        $("a[name = 'delete']").click(function(){
            var url = getRootPath()+"/flash/deleteProjectId";
            var projectId = $(this).attr("id");
            $.ajax({
                type: 'POST',
                url: url,
                data:{id: projectId},
                success: function (result) {
                    window.location.href=getRootPath()+"/workSpace.jsp";
                }
            });
        });
    });
</script>