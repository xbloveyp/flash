<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html style="height: 100%">
<head lang="en">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="在线动画设计">
    <meta name="author" content="Cao Xiaobo">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/1.jpg" type="image/x-icon" />
    <title>益画</title>
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
    </style>
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp" style="margin: 0;padding: 5px">
                <img src="${pageContext.request.contextPath}/static/img/1.jpg" class="img-circle img-responsive" style="height:40px;width: 40px;float: left ;margin: 0;vertical-align: top">
                <p  style="float: left ;margin-top: 8px;margin-left: 15px">益画</p>
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" style="margin-left: 17%">
            <ul class="nav navbar-nav">
                <li role="presentation" ><a href="${pageContext.request.contextPath}/tutorial.jsp">新手教程</a></li>
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
        <div class="list-group " style="margin-bottom: 5%;margin-left: 1%">
            <c:if test="${postType=='essence'}">
            <a id="essence" name="postType" class="active  text-center list-group-item " href="${pageContext.request.contextPath}/flash/findAllEssencePosts/1" style="float: left ;width: 20%"><span class="badge">${page.count}</span>精选</a>
            </c:if>
            <c:if test="${postType!='essence'}">
                <a id="essence" name="postType" class="text-center list-group-item " href="${pageContext.request.contextPath}/flash/findAllEssencePosts/1" style="float: left ;width: 20%">精选</a>
            </c:if>
            <c:if test="${postType=='newest'}">
            <a id="newest" name="postType" class="active  text-center list-group-item " href="${pageContext.request.contextPath}/flash/findAllNewestPosts/1" style="float: left;width: 20%"><span class="badge">${page.count}</span>最新</a>
            </c:if>
            <c:if test="${postType!='newest'}">
                <a id="newest" name="postType" class="text-center list-group-item " href="${pageContext.request.contextPath}/flash/findAllNewestPosts/1" style="float: left;width: 20%">最新</a>
            </c:if>
            <c:if test="${postType=='my'}">
                <a id="myPost" name="postType" class="active  text-center list-group-item " href="${pageContext.request.contextPath}/flash/findAllMyPosts/1" style="float: left;width: 20%"><span class="badge">${page.count}</span>我的</a>
            </c:if>
            <c:if test="${postType!='my'}">
                <a id="myPost" name="postType" class="  text-center list-group-item " href="${pageContext.request.contextPath}/flash/findAllMyPosts/1" style="float: left;width: 20%">我的</a>
            </c:if>
        </div>
    <c:if test="${error==null}">
        <c:if test="${posts==null}">
            <div class="jumbotron">
                <h3>发表跟帖</h3>
                <p>快来占个沙发吧</p>
                <p><a class="btn btn-primary btn-lg" role="button" href="#post" >发帖</a></p>
            </div>
        </c:if>
    </c:if>
    <c:if test="${error=='noUser'}">
        <div class="jumbotron">
            <h3>您尚未登录</h3>
            <p>先登录再来查看吧</p>
            <p><a class="btn btn-primary btn-lg" role="button" href="${pageContext.request.contextPath}/login.jsp" >登录</a></p>
        </div>
    </c:if>
    <c:if test="${error=='noEssence'}">
        <div class="jumbotron">
            <h3>尚未有精华帖</h3>
            <p>亲！来发个好贴，收到一定的点赞就能进入精华帖了</p>
            <p><a class="btn btn-primary btn-lg" role="button" href="#post" >发帖</a></p>
        </div>
    </c:if>
    <c:forEach items="${posts}" var="po" varStatus="vs">
        <div class="" style="margin-top: 10px ;background-color: white;border-radius: 10px">
            <div class=" container" style="margin-top: 20px ;padding: 10px">
                <a >
                    <img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="..." class="img-circle img-responsive" style="height: 40px;width: 40px ;position: absolute;margin-top: 20px">
                </a>
                <div class="" style="margin-left: 50px">
                    <h3 class=""><a href="#" class="postItem" id="${po.id}">${po.title}</a></h3>
                    <a href="#" class="" style="margin-left: 10px">
                        <small>${po.userName}</small>
                    </a>
                    <small style="color: #adadad;margin-left: 40px">${po.updateTime}</small>
                    <span class="badge" style="margin-left: 10px">回复：${po.followNum}</span>
                    <c:if test="${po.isPraised=='1'}">
                        <i class="iconfont btn disabled" style="font-size: 25px;padding: 0;margin:0;margin-left: 20px">&#xe614;</i>
                    </c:if>
                    <c:if test="${po.isPraised=='0'}">
                        <i class="iconfont btn" id="praise" postId="${po.id}" style="color: #5bc0de;font-size: 25px;padding: 0;margin:0;margin-left: 20px">&#xe614;</i>
                    </c:if>
                    <span class="badge">${po.praise}</span>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<div class="container" style="width: 80%;height: auto;margin-left: auto;margin-right: auto;text-align: center">
    <nav>
        <ul class="pagination" id="pagination">
            <%--<li>--%>
                <%--<a href="#" aria-label="Previous">--%>
                    <%--<span aria-hidden="true">&laquo;</span>--%>
                <%--</a>--%>
            <%--</li>--%>
            <%--<li><a href="#">1</a></li>--%>
            <%--<li><a href="#">2</a></li>--%>
            <%--<li><a href="#">3</a></li>--%>
            <%--<li><a href="#">4</a></li>--%>
            <%--<li><a href="#">5</a></li>--%>
            <%--<li>--%>
                <%--<a href="#" aria-label="Next">--%>
                    <%--<span aria-hidden="true">&raquo;</span>--%>
                <%--</a>--%>
            <%--</li>--%>
        </ul>
    </nav>
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
<script src="${pageContext.request.contextPath}/static/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/util.js"></script>
</html>
<script>
    $(document).ready(function(){
        function init(){
            var total = "${page.total}";
            var current = "${page.current}";
            var pagination = document.getElementById("pagination");
            //往前翻页
            var li = document.createElement("li")
            if(current==1){
                li.setAttribute("class","disabled");
            }
            var a = document.createElement("a");
            a.href = "${pageContext.request.contextPath}/flash/findAllEssencePosts/"+(parseInt(current)-1);
            a.setAttribute("aria-label","Previous");
            var span = document.createElement("span");
            span.setAttribute("aria-hidden","true");
            span.innerHTML = "&laquo";
            a.appendChild(span)
            li.appendChild(a);
            pagination.appendChild(li)
            //中间页数
            for(var i=1;i<=total;i++){
                var li = document.createElement("li")
                if(current==i){
                    li.setAttribute("class","active");
                }
                var a = document.createElement("a");
                a.href = "${pageContext.request.contextPath}/flash/findAllEssencePosts/"+i;
                a.innerHTML = i;
                li.appendChild(a);
                pagination.appendChild(li)
            }
            //往后翻页
            var li = document.createElement("li")
            if(current==total){
                li.setAttribute("class","disabled");
            }
            var a = document.createElement("a");
            a.href = "${pageContext.request.contextPath}/flash/findAllEssencePosts/"+(parseInt(current)+1);
            a.setAttribute("aria-label","Next");
            var span = document.createElement("span");
            span.setAttribute("aria-hidden","true");
            span.innerHTML = "&raquo;";
            a.appendChild(span)
            li.appendChild(a);
            pagination.appendChild(li)
        }
        init();
        $("#send").click(function(){
            var url = getRootPath()+"/flash/addPost";
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
                    window.location.href=getRootPath()+"/discuss.jsp";
                }
            });
        });
        $(".postItem").click(function(){
            var url = getRootPath()+"/flash/findFollowPost";
            var postId =  $(this).attr("id");
            $.ajax({
                type: 'GET',
                url: url,
                contentType: "application/json",
                data:{id:postId},
                success: function (result) {
                    window.location.href=getRootPath()+"/posts.jsp";
                }
            });
        });
        $("#praise").click(function(){
            var postId =  $(this).attr("postId");
            var url = getRootPath()+"/flash/praisePost/"+postId;
            $.ajax({
                type: 'GET',
                url: url,
                contentType: "application/json",
                data:{},
                success: function (result) {
                    if (result.code==500){
                        alert(result.data);
                    }else {
                        window.location.href = getRootPath() + "/discuss.jsp";
                    }
                }
            });
        });
    });
</script>