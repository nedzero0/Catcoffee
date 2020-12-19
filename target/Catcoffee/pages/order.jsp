<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
                request.getServerPort() + path + "/";
    %>
    <base href="<%=basePath%>">

    <meta charset="UTF-8">
    <title>开始使用layui</title>
    <link rel="stylesheet" href="<%=basePath%>/pages/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="<%=basePath%>/js/jquery-3.3.1.js"></script>
  <%--  <style>
        .ul1 li{
            float: left;
            width: 300px;
            margin-right: 20px;
            margin-bottom: 30px;
        }
        .ul1 li img{
            width: 300px;
            height: 300px;
        }
    </style>--%>
    <%--<script>
        $(document).ready(function(){
           location.href="foodServlet?action=showFoodOfUser";
        });
    </script>--%>
    <script>
         $(function () {
             $("button.buttonPay").click(function () {
               $.getJSON("http://localhost:8770/Catcoffee/ordersServlet","action=payOrders&id=${sessionScope.OrdersId}",
               function (data) {

               })
             })
         })
    </script>


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
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
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
            我的订单：
            <table class="layui-hide" id="test1"></table>

            订单详情：
           <%-- 方法一--%>
         <%--   <table class="layui-hide" id="test"></table>--%>

            <%-- 用方法二--%>
            <table class="layui-table" lay-data="{width: 892, height:330, url:'http://localhost:8770/Catcoffee/ordersServlet?action=userOrderDTs&userId=${sessionScope.Users.id}', page:true, id:'idTest'}" lay-filter="demo">
                <thead>
                <tr>
                    <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
                    <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
                    <th lay-data="{field:'orderID', width:100}">所属订单id</th>
                    <th lay-data="{field:'food_id', width:100, sort: true}">商品id</th>
                    <th lay-data="{field:'foodCount', width:100}">商品个数</th>
                    <th lay-data="{field:'foodName', width:160}">商品名称</th>
                    <th lay-data="{field:'totalPrice', width:100, sort: true}">商品总价</th>
                    <th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}"></th>
                </tr>
                </thead>
            </table>

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>


        </div>
        <div style="margin-left: 50px"><button type="button" class="layui-btn buttonPay">支付</button></div>

    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>


<script src="<%=basePath%>/pages/layui/layui.js"></script>

<script>
    layui.use('table', function(){

        var table1 = layui.table;
        table1.render({
            elem: '#test1'
            ,url:'http://localhost:8770/Catcoffee/ordersServlet?action=userOrder&userId=${sessionScope.Users.id}'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'id', width:80, title: '订单id', sort: true}
                ,{field:'orderUser', width:100, title: '订单用户id', sort: true}
                ,{field:'name', width:100, title: '用户', sort: true}
                ,{field:'table_id', width:100, title: '餐桌id', sort: true}
                ,{field:'orderDate', title: '预约时间'}
                ,{field:'totalPrice', title: '商品总价', sort: true}
                ,{field:'strStatus', title: '支付状态', sort: true}
            ]]
        });


       /* var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'http://localhost:8770/Catcoffee/ordersServlet?action=userOrderDTs&userId=${sessionScope.Users.id}'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'id', width:80, title: 'id', sort: true}
                ,{field:'orderID', width:100, title: '所属订单id', sort: true}
                ,{field:'food_id', width:100, title: '商品id', sort: true}
                ,{field:'foodCount', title: '商品个数'}
                ,{field:'foodName', title: '商品名称', sort: true}
                ,{field:'totalPrice', title: '商品总价', sort: true}
            ]]
        });
*/


    });
</script>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#test1'
        });

        //国际版
        laydate.render({
            elem: '#test1-1'
            ,lang: 'en'
        });

        //年选择器
        laydate.render({
            elem: '#test2'
            ,type: 'year'
        });

        //年月选择器
        laydate.render({
            elem: '#test3'
            ,type: 'month'
        });

        //时间选择器
        laydate.render({
            elem: '#test4'
            ,type: 'time'
        });

        //日期时间选择器
        laydate.render({
            elem: '#test5'
            ,type: 'datetime'
        });

        //日期范围
        laydate.render({
            elem: '#test6'
            ,range: true
        });

        //年范围
        laydate.render({
            elem: '#test7'
            ,type: 'year'
            ,range: true
        });

        //年月范围
        laydate.render({
            elem: '#test8'
            ,type: 'month'
            ,range: true
        });

        //时间范围
        laydate.render({
            elem: '#test9'
            ,type: 'time'
            ,range: true
        });

        //日期时间范围
        laydate.render({
            elem: '#test10'
            ,type: 'datetime'
            ,range: true
        });

        //自定义格式
        laydate.render({
            elem: '#test11'
            ,format: 'yyyy年MM月dd日'
        });
        laydate.render({
            elem: '#test12'
            ,format: 'dd/MM/yyyy'
        });
        laydate.render({
            elem: '#test13'
            ,format: 'yyyyMMdd'
        });
        laydate.render({
            elem: '#test14'
            ,type: 'time'
            ,format: 'H点m分'
        });
        laydate.render({
            elem: '#test15'
            ,type: 'month'
            ,range: '~'
            ,format: 'yyyy-MM'
        });
        laydate.render({
            elem: '#test16'
            ,type: 'datetime'
            ,range: '到'
            ,format: 'yyyy年M月d日H时m分s秒'
        });

        //开启公历节日
        laydate.render({
            elem: '#test17'
            ,calendar: true
        });

        //自定义重要日
        laydate.render({
            elem: '#test18'
            ,mark: {
                '0-10-14': '生日'
                ,'0-12-31': '跨年' //每年的日期
                ,'0-0-10': '工资' //每月某天
                ,'0-0-15': '月中'
                ,'2017-8-15': '' //如果为空字符，则默认显示数字+徽章
                ,'2099-10-14': '呵呵'
            }
            ,done: function(value, date){
                if(date.year === 2017 && date.month === 8 && date.date === 15){ //点击2017年8月15日，弹出提示语
                    layer.msg('这一天是：中国人民抗日战争胜利72周年');
                }
            }
        });

        //限定可选日期
        var ins22 = laydate.render({
            elem: '#test-limit1'
            ,min: '2016-10-14'
            ,max: '2080-10-14'
            ,ready: function(){
                ins22.hint('日期可选值设定在 <br> 2016-10-14 到 2080-10-14');
            }
        });

        //前后若干天可选，这里以7天为例
        laydate.render({
            elem: '#test-limit2'
            ,min: -7
            ,max: 7
        });

        //限定可选时间
        laydate.render({
            elem: '#test-limit3'
            ,type: 'time'
            ,min: '09:30:00'
            ,max: '17:30:00'
            ,btns: ['clear', 'confirm']
        });

        //同时绑定多个
        lay('.test-item').each(function(){
            laydate.render({
                elem: this
                ,trigger: 'click'
            });
        });

        //初始赋值
        laydate.render({
            elem: '#test19'
            ,value: '1989-10-14'
            ,isInitValue: true
        });

        //选中后的回调
        laydate.render({
            elem: '#test20'
            ,done: function(value, date){
                layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
        });

        //日期切换的回调
        laydate.render({
            elem: '#test21'
            ,change: function(value, date){
                layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
            }
        });
        //不出现底部栏
        laydate.render({
            elem: '#test22'
            ,showBottom: false
        });

        //只出现确定按钮
        laydate.render({
            elem: '#test23'
            ,btns: ['confirm']
        });

        //自定义事件
        laydate.render({
            elem: '#test24'
            ,trigger: 'mousedown'
        });

        //点我触发
        laydate.render({
            elem: '#test25'
            ,eventElem: '#test25-1'
            ,trigger: 'click'
        });

        //双击我触发
        lay('#test26-1').on('dblclick', function(){
            laydate.render({
                elem: '#test26'
                ,show: true
                ,closeStop: '#test26-1'
            });
        });

        //日期只读
        laydate.render({
            elem: '#test27'
            ,trigger: 'click'
        });

        //非input元素
        laydate.render({
            elem: '#test28'
        });

        //墨绿主题
        laydate.render({
            elem: '#test29'
            ,theme: 'molv'
        });

        //自定义颜色
        laydate.render({
            elem: '#test30'
            ,theme: '#393D49'
        });

        //格子主题
        laydate.render({
            elem: '#test31'
            ,theme: 'grid'
        });


        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            ,position: 'static'
        });
        laydate.render({
            elem: '#test-n2'
            ,position: 'static'
            ,lang: 'en'
        });
        laydate.render({
            elem: '#test-n3'
            ,type: 'month'
            ,position: 'static'
        });
        laydate.render({
            elem: '#test-n4'
            ,type: 'time'
            ,position: 'static'
        });
    });
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(demo)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);

                    //删除商品
                    $.getJSON("http://localhost:8770/Catcoffee/ordersServlet","action=delOrderDetail&userID=${sessionScope.Users.id}&id="+data.id,
                    function (data) {
                        location.replace(location);
                    });


                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });

        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>


</body>


</html>