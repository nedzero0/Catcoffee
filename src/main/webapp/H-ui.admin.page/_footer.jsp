<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">

<script type="text/javascript" src="<%=basePath%>H-ui.admin.pagelib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.pagelib/layer/2.4/layer.js"></script>
 
<script type="text/javascript" src="<%=basePath%>H-ui.admin.pagelib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.pagelib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.pagelib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.pagestatic/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.pagestatic/h-ui.admin/js/H-ui.admin.page.js"></script>
</head>
</html>