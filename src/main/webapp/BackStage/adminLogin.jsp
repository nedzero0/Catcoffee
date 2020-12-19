<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--添加base标签，固定工程路径--%>
    <base href="http://localhost:8770/Catcoffee/">

</head>
<body>
<h1>登录</h1>

<form action="adminServlet?action=login" method="post">
    id：<input type="text" name="id"><br>
    密码： <input type="text" name="password"><br>
    <input type="submit" value="管理员登录">
</form>
</body>
</html>
