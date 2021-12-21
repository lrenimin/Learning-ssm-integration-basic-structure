<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <style type="text/css">
        h3 {
            height: 38px;
            width: 180px;
            line-height: 100px;
            margin: 38px auto;
            text-align: left;
            background: dodgerblue;
        }
    </style>

<body>

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12">
                <h3>修改用户信息</h3>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-12">
                <form action="${pageContext.request.contextPath}/user/updateUserList" class="" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <input type="text" class="form-control" name="username" value="${user.username}"><br/>
                    <input type="text" class="form-control" name="password" value="${user.password}"><br/>
                    <input type="text" class="form-control" name="telephone" value="${user.telephone}"><br/>
                    <input type="text" class="form-control" name="email" value="${user.email}"><br/>
                    <input class="btn btn-primary" type="submit" value="提交">
                </form>
            </div>
        </div>
    </div>

</body>
</html>
