<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/quote/jquery-3.6.0.js"></script>

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
        </div>

        <%--用户登录的验证--%>
        <div class="col-md-4 column">
            <form class="form-horizontal" role="form" action="" method="post">
                <div class="form-group">
                    <%--帐号：--%>
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name="email" onblur="usr()" required="required" />
                        <span id="userInfo"></span>
                    </div>
                </div>
                <div class="form-group">
                    <%--密码：--%>
                    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputPassword3" name="password" onblur="pwd()" required="required" />
                        <span id="pwdInfo"></span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Sign in</button>
                    </div>
                </div>
            </form>
        </div>

        <%--登录验证，并进行文件的上传--%>
        <div class="col-md-4 column">
        </div>
    </div>
</div>

    <%--使用Ajax进行用户登录的验证：--%>
    <script>
        /*帐号验证：*/
        function usr() {
            $.post({
                url: "${pageContext.request.contextPath}/user/login",
                data: {"email": $("#inputEmail3").val()},
                success: function (data) {
                    if(data.toString() == "OK") {
                        $("#userInfo").css("color","green");
                    } else {
                        $("#userInfo").css("color","red");
                    }
                    $("#userInfo").html(data);
                }
            });
        }
        /*密码验证：*/
        function pwd() {
            $.post({
                url: "${pageContext.request.contextPath}/user/login",
                data: {"password": $("#inputPassword3").val()},
                success: function (data) {
                    if(data.toString() == "SUCCESS") {
                        $("#pwdInfo").css("color","green");
                    } else {
                        $("#pwdInfo").css("color","red");
                    }
                    $("#pwdInfo").html(data);
                }
            });
        }
    </script>


</body>
</html>
