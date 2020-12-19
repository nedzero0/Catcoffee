<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ include file="_blank.jsp" %>
<html>
<head>

	<title>admin-index.jsp</title>
</head>
<body>


<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/" class="maincolor">首页</a> <span class="c-999 en">&gt;</span><span class="c-666">空白页</span></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<h1>欢迎来到管理员界面！！！</h1>
			<h2>${sessionScope.admin.name}</h2>
		</article>
	</div>
</section>


</body>
</html>