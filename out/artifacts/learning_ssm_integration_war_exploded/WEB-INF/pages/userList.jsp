<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>

    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/quote/jquery-3.6.0.js"></script>

</head>
<body>

    <div class="container">
        <%--头部文本--%>
        <div class="row clearfix">
            <div class="col-md-12">
                <h1>显示所有书籍</h1>
            </div>
        </div>
        <%--中部按钮功能--%>
        <div class="row clearfix">
            <%--新增用户和显示所有用户--%>
            <div class="col-md-4">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/addUser">新增用户</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/userList">显示所有用户</a>
            </div>
            <%--根据关键字查询书籍--%>
            <div class="col-md-4">
                <form class="form-inline" action="${pageContext.request.contextPath}/user/queryUser" method="post">
                    <input type="text" class="form-control" name="userName" placeholder="请输入关键字" required>
                    <input type="submit" class="btn btn-primary" value="查询">
                </form>
                <form class="form-inline"  id="sel" action="${pageContext.request.contextPath}/user/userList" method="post">
                    <%--传递分页中的值：pageNo,pageSize--%>
                    <input type="hidden" name="pageNum" value="${userList.pageNum}" id="pageNum">
                    <input type="hidden" name="pageSize" value="${userList.pageSize}" id="pageSize">

                </form>
            </div>
            <%--显示书籍列表--%>
            <div class="col-md-4">

            </div>
        </div>
        <%--表格内容显示区域--%>
        <div class="row clearfix">
            <div class="col-ma-12 column">
                <table class="table table-hover table-strip">
                    <thead>
                        <tr>
                            <th>用户ID</th>
                            <th>用户名称</th>
                            <th>密码</th>
                            <th>电话号码</th>
                            <th>电子邮箱</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="users" items="${userList.list}">
                            <tr>
                                <td>${users.getId()}</td>
                                <td>${users.getUsername()}</td>
                                <td>${users.getPassword()}</td>
                                <td>${users.getTelephone()}</td>
                                <td>${users.getEmail()}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/user/updateUser/${users.getId()}">更新</a>
                                    <a href="${pageContext.request.contextPath}/user/deleteUser/${users.getId()}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <%--通过like查询用户细腻--%>
                        <c:forEach var="users" items="${queryUser}">
                            <tr>
                                <td>${users.getId()}</td>
                                <td>${users.getUsername()}</td>
                                <td>${users.getPassword()}</td>
                                <td>${users.getTelephone()}</td>
                                <td>${users.getEmail()}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/user/updateUser/${users.getId()}">更新</a>
                                    <a href="${pageContext.request.contextPath}/user/deleteUser/${users.getId()}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <%--分页显示用户信息--%>
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <ul class="pagination">
                                <li id="index">
                                    <a href="javascript:void(0)">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>

                                <li id="prev">
                                    <a href="javascript:void(0)">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>

                                <%--通过forEach遍历--%>
                                <c:forEach items="${userList.navigatepageNums}" var="i">
                                    <li name="pageNum" <c:if test="${i == userList.pageNum}">class="active"</c:if>>
                                    <a href="javascript:void(0);">
                                        <span aria-hidden="true">${i}</span>
                                    </a>
                                    </li>
                                </c:forEach>

                                <li id="next">
                                    <a href="javascript:void(0)">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>

                                <li id="last">
                                    <a href="javascript:void(0)">
                                        <span aria-hidden="true">末页</span>
                                    </a>
                                </li>

                                <span style="font-size: 20px; margin-left:15px;">
                                    当前第${userList.pageNum}页/共${userList.pages}页，
                                    合计：${userList.total}条
                                </span>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--分页JS:编写分页相关js代码--%>
        <script>
            /*1.初始化变量，方便使用*/
            let pageNum = ${userList.pageNum};
            let pages = ${userList.pages};
            let hasPreviousPage = ${userList.hasPreviousPage};
            let hasNextPage = ${userList.hasNextPage};
            /*2.判断当前按钮状态*/
            //如果没有上一页，则“首页”和“上一页”disabled
            if(!hasPreviousPage) {
                $("#index").addClass("disabled");
                $("#prev").addClass("disabled");
            }
            if(!hasNextPage) {
                $("#next").addClass("disabled");
                $("#last").addClass("disabled");
            }

            /*3.主要按钮监听事件*/
            //点击首页
            $("#index").click(function () {
                if(!$("#index").hasClass("disabled")) {
                    $("#pageNum").val(1);
                    $("#sel").submit();
                }
            });
            //点击上一页
            $("#prev").click(function () {
                if(!$("#prev").hasClass("disabled")) {
                    $("#pageNum").val(pageNum - 1);
                    $("#sel").submit();
                }
            });
            //点击下一页
            $("#next").click(function () {
                if(!$("#next").hasClass("disabled")) {
                    $("#pageNum").val(pageNum + 1);
                    $("#sel").submit();
                }
            });
            //点击末页
            $("#last").click(function () {
                if(!$("#last").hasClass("disabled")) {
                    $("#pageNum").val(pages);
                    $("#sel").submit();
                }
            });

            /*4.监听点击页码事件*/
            $("li[name='pageNum']").click(function () {
                if(!$(this).hasClass("active")) {
                    $("#pageNum").val($(this).children("a").children("span").html());
                    $("#sel").submit();
                }
            });


            /*使用pageHelper：存在问题或者出现问题
            *
            * 第一：idea中编写好完整无误的JS代码后，重新run没有生效，清缓或者把编译的target删了重新run
            *
            * 第二：$("#sel")。submit   注意获取的是form表单，提交的URL为分页接口
            *
            * 第三：点击分页数字码没有作用：查看代码是否有误：$(this)是否正确获取
            *
            * */

        </script>

    </div>

</body>
</html>
