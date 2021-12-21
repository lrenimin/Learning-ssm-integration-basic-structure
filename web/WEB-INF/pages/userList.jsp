<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>

    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

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
                <form class="form-inline" action="" method="post">
                    <input type="text" class="form-control" name="userName" placeholder="请输入关键字" required>
                    <input type="submit" class="btn btn-primary" value="查询">
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
                        <c:forEach var="users" items="${userList}">
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
            </div>
        </div>


    </div>

</body>
</html>
