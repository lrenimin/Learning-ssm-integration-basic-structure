<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<body>

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12">
                <form action="${pageContext.request.contextPath}/user/addUserList" method="post">
                    用户名称：<input type="text" class="form-control" name="username" required><br/>
                    密&nbsp;&nbsp;码：<input type="password" class="form-control" name="password" required><br/>
                    电话号码：<input type="text" class="form-control" name="telephone" required><br/>
                    电子邮箱：<input type="text" class="form-control" name="email" required><br/>
                    <input type="submit" value="提交">
                </form>
            </div>
        </div>
    </div>

</body>
</html>
