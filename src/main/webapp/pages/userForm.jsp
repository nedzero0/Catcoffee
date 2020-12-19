<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--<%@ include file="blank.jsp"%>--%>
<html lang="en">
<head>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/pages/layui/css/layui.css" media="all">
    <style>
        .ul1 li {
            float: left;
            width: 300px;
            margin-right: 20px;
            margin-bottom: 30px;
        }

        .ul1 li img {
            width: 300px;
            height: 300px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 前台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="dinTaServlet?action=showFreeDinner">选择餐桌和时间</a></li>
            <li class="layui-nav-item"><a href="foodServlet?action=showFoodOfUser">商品管理</a></li>
            <li class="layui-nav-item"><a href="pages/order.jsp">订单管理</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="pages/userForm.jsp">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="pages/userlogin.jsp">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <form class="layui-form" action="userServlet?action=updateUser" method="post">

                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">id</label>
                    <div class="layui-input-inline">
                        <input type="text" name="id" value="${sessionScope.Users.id}" lay-verify="nickname"
                               autocomplete="off" placeholder="请输入昵称" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">账户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="account" value="${sessionScope.Users.account}" readonly
                               lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>
                </div>

                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">密码框</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" value="${sessionScope.Users.password}" required
                               lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" value="${sessionScope.Users.name}" lay-verify="nickname"
                               autocomplete="off" placeholder="请输入昵称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <c:if test="${empty sessionScope.Users.sex || sessionScope.Users.sex=='男'}">
                            <input type="radio" name="sex" value="男" title="男" checked="">
                            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                                <div>男</div>
                            </div>
                            <input type="radio" name="sex" value="女" title="女">
                            <div class="layui-unselect layui-form-radio layui-form-radioed"><i
                                    class="layui-anim layui-icon"></i>
                                <div>女</div>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.Users.sex=='女'}">
                            <input type="radio" name="sex" value="男" title="男">
                            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                                <div>男</div>
                            </div>
                            <input type="radio" name="sex" value="女" title="女" checked="">
                            <div class="layui-unselect layui-form-radio layui-form-radioed"><i
                                    class="layui-anim layui-icon"></i>
                                <div>女</div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-inline">
                        <input type="text" name="age" value="${sessionScope.Users.age}" lay-verify="nickname"
                               autocomplete="off" placeholder="请输入昵称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone" value="${sessionScope.Users.phone}" lay-verify="nickname"
                               autocomplete="off" placeholder="请输入昵称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" value="${sessionScope.Users.address}" required
                               lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="display:none;">
                    <label class="layui-form-label">img</label>
                    <div class="layui-input-block">
                        <input type="text" name="img" value="${sessionScope.Users.img}" required lay-verify="required"
                               placeholder="请输入地址" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>


            <div class="layui-fluid">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-header">修改密码</div>
                            <div class="layui-card-body" pad15="">
                                <form class="layui-form"
                                      action="userServlet?action=updatePass&id=${sessionScope.Users.id}" method="post">
                                    <div class="layui-form" lay-filter="">
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">当前密码</label>
                                            <div class="layui-input-inline">
                                                <input type="password" name="oldPassword" lay-verify="required"
                                                       lay-vertype="tips" class="layui-input" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="layui-form-item">
                                            <label class="layui-form-label">新密码</label>
                                            <div class="layui-input-inline">
                                                <input type="password" name="password" lay-verify="pass"
                                                       lay-vertype="tips" autocomplete="off" id="LAY_password"
                                                       class="layui-input">
                                            </div>
                                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                                        </div>
                                        <span>${requestScope.udPassSuccess}</span>
                                        <%-- <div class="layui-form-item">
                                             <label class="layui-form-label">确认新密码</label>
                                             <div class="layui-input-inline">
                                                 <input type="password" name="repassword" lay-verify="repass" lay-vertype="tips" autocomplete="off" class="layui-input">
                                             </div>
                                         </div>--%>
                                        <input type="submit" value="提交">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>


<script src="<%=basePath%>/pages/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>

<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));

            $.getJSON("http://localhost:8770/Catcoffee/userServlet", "action=updateUser", function (data) {
                layer.msg(JSON.stringify(data.field));
            });

            return false;
        });
    });
</script>

<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#test1'
        });

        //国际版
        laydate.render({
            elem: '#test1-1'
            , lang: 'en'
        });

        //年选择器
        laydate.render({
            elem: '#test2'
            , type: 'year'
        });

        //年月选择器
        laydate.render({
            elem: '#test3'
            , type: 'month'
        });

        //时间选择器
        laydate.render({
            elem: '#test4'
            , type: 'time'
        });

        //日期时间选择器
        laydate.render({
            elem: '#test5'
            , type: 'datetime'
        });

        //日期范围
        laydate.render({
            elem: '#test6'
            , range: true
        });

        //年范围
        laydate.render({
            elem: '#test7'
            , type: 'year'
            , range: true
        });

        //年月范围
        laydate.render({
            elem: '#test8'
            , type: 'month'
            , range: true
        });

        //时间范围
        laydate.render({
            elem: '#test9'
            , type: 'time'
            , range: true
        });

        //日期时间范围
        laydate.render({
            elem: '#test10'
            , type: 'datetime'
            , range: true
        });

        //自定义格式
        laydate.render({
            elem: '#test11'
            , format: 'yyyy年MM月dd日'
        });
        laydate.render({
            elem: '#test12'
            , format: 'dd/MM/yyyy'
        });
        laydate.render({
            elem: '#test13'
            , format: 'yyyyMMdd'
        });
        laydate.render({
            elem: '#test14'
            , type: 'time'
            , format: 'H点m分'
        });
        laydate.render({
            elem: '#test15'
            , type: 'month'
            , range: '~'
            , format: 'yyyy-MM'
        });
        laydate.render({
            elem: '#test16'
            , type: 'datetime'
            , range: '到'
            , format: 'yyyy年M月d日H时m分s秒'
        });

        //开启公历节日
        laydate.render({
            elem: '#test17'
            , calendar: true
        });

        //自定义重要日
        laydate.render({
            elem: '#test18'
            , mark: {
                '0-10-14': '生日'
                , '0-12-31': '跨年' //每年的日期
                , '0-0-10': '工资' //每月某天
                , '0-0-15': '月中'
                , '2017-8-15': '' //如果为空字符，则默认显示数字+徽章
                , '2099-10-14': '呵呵'
            }
            , done: function (value, date) {
                if (date.year === 2017 && date.month === 8 && date.date === 15) { //点击2017年8月15日，弹出提示语
                    layer.msg('这一天是：中国人民抗日战争胜利72周年');
                }
            }
        });

        //限定可选日期
        var ins22 = laydate.render({
            elem: '#test-limit1'
            , min: '2016-10-14'
            , max: '2080-10-14'
            , ready: function () {
                ins22.hint('日期可选值设定在 <br> 2016-10-14 到 2080-10-14');
            }
        });

        //前后若干天可选，这里以7天为例
        laydate.render({
            elem: '#test-limit2'
            , min: -7
            , max: 7
        });

        //限定可选时间
        laydate.render({
            elem: '#test-limit3'
            , type: 'time'
            , min: '09:30:00'
            , max: '17:30:00'
            , btns: ['clear', 'confirm']
        });

        //同时绑定多个
        lay('.test-item').each(function () {
            laydate.render({
                elem: this
                , trigger: 'click'
            });
        });

        //初始赋值
        laydate.render({
            elem: '#test19'
            , value: '1989-10-14'
            , isInitValue: true
        });

        //选中后的回调
        laydate.render({
            elem: '#test20'
            , done: function (value, date) {
                layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
        });

        //日期切换的回调
        laydate.render({
            elem: '#test21'
            , change: function (value, date) {
                layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
            }
        });
        //不出现底部栏
        laydate.render({
            elem: '#test22'
            , showBottom: false
        });

        //只出现确定按钮
        laydate.render({
            elem: '#test23'
            , btns: ['confirm']
        });

        //自定义事件
        laydate.render({
            elem: '#test24'
            , trigger: 'mousedown'
        });

        //点我触发
        laydate.render({
            elem: '#test25'
            , eventElem: '#test25-1'
            , trigger: 'click'
        });

        //双击我触发
        lay('#test26-1').on('dblclick', function () {
            laydate.render({
                elem: '#test26'
                , show: true
                , closeStop: '#test26-1'
            });
        });

        //日期只读
        laydate.render({
            elem: '#test27'
            , trigger: 'click'
        });

        //非input元素
        laydate.render({
            elem: '#test28'
        });

        //墨绿主题
        laydate.render({
            elem: '#test29'
            , theme: 'molv'
        });

        //自定义颜色
        laydate.render({
            elem: '#test30'
            , theme: '#393D49'
        });

        //格子主题
        laydate.render({
            elem: '#test31'
            , theme: 'grid'
        });


        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            , position: 'static'
        });
        laydate.render({
            elem: '#test-n2'
            , position: 'static'
            , lang: 'en'
        });
        laydate.render({
            elem: '#test-n3'
            , type: 'month'
            , position: 'static'
        });
        laydate.render({
            elem: '#test-n4'
            , type: 'time'
            , position: 'static'
        });
    });
</script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function () {
            form.val('example', {
                "username": "贤心" // "name": "value"
                , "password": "123456"
                , "interest": 1
                , "like[write]": true //复选框选中状态
                , "close": true //开关状态
                , "sex": "女"
                , "desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function () {
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>


</body>
</html>