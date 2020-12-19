<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ include file="_blank.jsp" %>
<html>
<head>

    <title>ad-userShow.jsp</title>
    <script>

    </script>

</head>
<body>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont"></i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">

            <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont"></i> 批量删除</a>

				<a class="btn btn-primary radius" onclick="picture_add('添加图片','H-ui.admin.page/ad-dinnerTaAdd.jsp')" href="javascript:;"><i class="Hui-iconfont"></i> 添加餐桌</a></span>
                <%--<a href="javascript:;" onclick="admin_add('添加管理员','H-ui.admin.page/ad-dinnerTaAdd.jsp','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont"></i> 添加餐桌222</a>
                --%><span class="r">共有数据：<strong>54</strong> 条</span> </div>
            <div class="mt-20">
                <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer"><div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer"><div id="DataTables_Table_0_filter" class="dataTables_filter"></div><table class="table table-border table-bordered table-bg table-hover table-sort dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                    <thead>
                    <tr class="text-c" role="row">
                        <th width="40" class="sorting_disabled" rowspan="1" colspan="1" aria-label="" style="width: 40px;"><input name="" type="checkbox" value=""></th>
                        <th width="80" class="sorting_desc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="ID: 升序排列" style="width: 80px;" aria-sort="descending">ID</th>

                        <th width="100" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="分类: 升序排列" style="width: 100px;">姓名</th>
                        <th width="60" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="发布状态: 升序排列" style="width: 60px;">头像</th>
                        <th width="150" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="更新时间: 升序排列" style="width: 149px;">电话</th>
                        <th width="60" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="发布状态: 升序排列" style="width: 60px;">性别</th>
                        <th width="60" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="发布状态: 升序排列" style="width: 60px;">年龄</th>
                        <th width="60" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="发布状态: 升序排列" style="width: 60px;">地址</th>
                        <th width="100" class="sorting_disabled" rowspan="1" colspan="1" aria-label="操作" style="width: 101px;">操作</th></tr>
                    </thead>

                    <tbody>

                    <c:forEach items="${requestScope.userList}" var="user">
                        <tr class="text-c" role="row">
                            <td><input name="" type="checkbox" value=""></td>
                            <td class="sorting_1">${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.img}</td>
                            <td>${user.phone}</td>
                            <td>${user.sex}</td>
                            <td>${user.age}</td>
                            <td>${user.address}</td>

                            <td class="td-manage">
                                <a style="text-decoration:none" class="updateStus" onclick="picture_stop(this,${user.id})" href="javascript:;" title="${dinner.id}" name="${dinner.id}">
                                    <i class="Hui-iconfont"></i>
                                </a>
                                <a style="text-decoration:none" class="ml-5" onclick="picture_edit('图库编辑','picture-add.html','10001')" href="javascript:;" title="编辑">
                                    <i class="Hui-iconfont"></i>
                                </a>
                                <a style="text-decoration:none" class="ml-5 delId" onclick="dinner_del(this,${user.id})" href="javascript:;">
                                    <i class="Hui-iconfont"></i>
                                        <%--  href="dinTaServlet?action=delDinnerTa&dinnerId=${dinner.id}--%>
                                </a>
                            </td>

                        </tr>

                    </c:forEach>
                    </tbody>
                </table></div></div>
            </div>
        </article>
    </div>
</section>



<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
        ]
    });
    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url,
        });
        layer.full(index);
    }
    /*图片-查看*/
    function picture_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*图片-审核*/
    function picture_shenhe(obj,id){
        layer.confirm('审核文章？', {
                btn: ['通过','不通过'],
                shade: false
            },
            function(){
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布', {icon:6,time:1000});
            },
            function(){
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                $(obj).remove();
                layer.msg('未通过', {icon:5,time:1000});
            });
    }
    /*餐桌-清空*/
    function picture_stop(obj,id){
        layer.confirm('确认要清空吗？',function(index){
            /*$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            */
            //alert(id);
            $.getJSON("http://localhost:8770/Catcoffee/dinTaServlet","action=updateDinnerTaStus&dinnerId="+id,
                function (data) {
                    //alert(data.chageStus);
                    if (data.chageStus){
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">空闲状态</span>');
                        $(obj).parents("tr").find(".td-date").html(' ');

                        $(obj).remove();
                        layer.msg('空闲状态!',{icon: 5,time:1000});
                    }
                    else {
                        alert("失败")
                    }
                });

        });
    }


    /*餐桌-删除*/
    function dinner_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            /*$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            */
            //alert(id);
            $.getJSON("http://localhost:8770/Catcoffee/userServlet","action=delUser&id="+id,
                function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已经删除!',{icon: 5,time:1000});
                });

        });
    }


    /*/!*图片-发布*!/
    function picture_start(obj,id){
        layer.confirm('确认要发布吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">预定状态</span>');
            $(obj).remove();
            layer.msg('已预定!',{icon: 6,time:1000});
        });
    }*/
    /*图片-申请上线*/
    function picture_shenqing(obj,id){
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
    }
    /*图片-编辑*/
    function picture_edit(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }



</script>

<script type="text/javascript">
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-增加*/
    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-删除*/
    function admin_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    /*管理员-编辑*/
    function admin_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*管理员-启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6,time:1000});
        });
    }
</script>

</body>
</html>