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

    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <LINK rel="Bookmark" href="favicon.ico" >
    <LINK rel="Shortcut Icon" href="favicon.ico" />
    <!--[if lt IE 9]>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/lib/html5.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/lib/respond.min.js"></script>
<![endif]-->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>H-ui.admin.page/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>H-ui.admin.page/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>H-ui.admin.page/lib/Hui-iconfont/1.0.8/iconfont.css" />

    <link rel="stylesheet" type="text/css" href="<%=basePath%>H-ui.admin.page/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>H-ui.admin.page/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script><![endif]-->
    <title>新增文章 - 资讯管理 - H-ui.admin v3.0</title>
</head>
<body>
<article class="cl pd-20">
    <form action="foodServlet" method="post" class="form form-horizontal" id="form-admin-add">
       <input type="hidden" name="action" value="${empty param.id ? "addFood" : "updateFood"}">

        <div class="row cl" style="display: none">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品id：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${requestScope.food.id}" placeholder="商品id" id="" name="id">
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${requestScope.food.foodName}" placeholder="商品类别名称" id="" name="foodName">
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">商品类型：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="foodType_id">
					<option>${requestScope.food.typeName}</option>
					<option value="1">果汁</option>
					<option value="2">咖啡</option>
					<option value="3">奶茶</option>
					<option value="4">甜品</option>
					<option value="5">其它</option>
				</select>
				</span> </div>
        </div>


        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">商品价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="price" id="" placeholder="" value="${requestScope.food.price}" class="input-text" style="width:90%">
                元</div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">产品摘要：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="remark" value="" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onkeyup="textarealength(this,200)">${requestScope.food.remark}
                </textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
            </div>
        </div>

        <!--上传图片，暂时不弄-->


        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius closeNow" type="submit" value="&nbsp;&nbsp;提交商品&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>



<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/lib/layer/2.4/layer.js"></script>

<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>H-ui.admin.page/static/h-ui.admin/js/H-ui.admin.page.js"></script>

<script type="text/javascript">
    $(function(){



        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });


        $list = $("#fileList"),
            $btn = $("#btn-star"),
            state = "pending",
            uploader;

        var uploader = WebUploader.create({
            auto: true,
            swf: 'lib/webuploader/0.1.5/Uploader.swf',

            // 文件接收服务端。
            server: 'fileupload.php',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });
        uploader.on( 'fileQueued', function( file ) {
            var $li = $(
                '<div id="' + file.id + '" class="item">' +
                '<div class="pic-box"><img></div>'+
                '<div class="info">' + file.name + '</div>' +
                '<p class="state">等待上传...</p>'+
                '</div>'
                ),
                $img = $li.find('img');
            $list.append( $li );

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr( 'src', src );
            }, thumbnailWidth, thumbnailHeight );
        });
        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),
                $percent = $li.find('.progress-box .sr-only');

            // 避免重复创建
            if ( !$percent.length ) {
                $percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
            }
            $li.find(".state").text("上传中");
            $percent.css( 'width', percentage * 100 + '%' );
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file ) {
            $( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
        });

        // 文件上传失败，显示上传出错。
        uploader.on( 'uploadError', function( file ) {
            $( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file ) {
            $( '#'+file.id ).find('.progress-box').fadeOut();
        });
        uploader.on('all', function (type) {
            if (type === 'startUpload') {
                state = 'uploading';
            } else if (type === 'stopUpload') {
                state = 'paused';
            } else if (type === 'uploadFinished') {
                state = 'done';
            }

            if (state === 'uploading') {
                $btn.text('暂停上传');
            } else {
                $btn.text('开始上传');
            }
        });

        $btn.on('click', function () {
            if (state === 'uploading') {
                uploader.stop();
            } else {
                uploader.upload();
            }
        });

        var ue = UE.getEditor('editor');

    });
</script>
<!--/请在上方写此页面业务相关的脚本-->




</body>
</html>