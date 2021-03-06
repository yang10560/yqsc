<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <% String APP_PATH = request.getContextPath(); %>
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">会员管理</a>
            <a>
              <cite>管理员列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <%--<div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>--%>
                <div class="layui-card-header">
                    <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除
                    </button>--%>
                    <button class="layui-btn" onclick="xadmin.open('添加用户','./toAddAdminView',600,400)"><i
                            class="layui-icon"></i>添加管理员
                    </button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>

                            <th>ID</th>
                            <th>用户名</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>手机</th>
                            <th>邮件</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="ad" items="${adminLists}">
                            <tr>
                                <td>${ad.aid}</td>
                                <td>${ad.username}</td>
                                <td>${ad.name}</td>
                                <c:if test="${ad.sex == 0}">
                                    <td>男</td>
                                </c:if>
                                <c:if test="${ad.sex == 1}">
                                    <td>女</td>
                                </c:if>
                                <td>${ad.age}</td>
                                <td>${ad.tel}</td>
                                <td>${ad.email}</td>
                                <td class="td-status">
                                    <c:if test="${ad.status==1}">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
                                </c:if>
                                <c:if test="${ad.status==0}">
                                    <span class="layui-btn layui-btn-normal layui-btn-mini layui-btn-disabled">未启用</span></td>
                                </c:if>
                                <td class="td-manage">


                                    <c:if test="${ad.status==1}">
                                        <a onclick="member_stop(this,'${ad.aid}')" href="javascript:;" title="启用">
                                            <i class="layui-icon">&#xe601;</i>
                                        </a>
                                </c:if>
                                <c:if test="${ad.status==0}">
                                    <a onclick="member_stop(this,'${ad.aid}')" href="javascript:;" title="停用">
                                        <i class="layui-icon">&#xe62f;</i>
                                    </a>
                                </c:if>


                                  <%--  <a onclick="member_stop(this,'10001')" href="javascript:;" title="启用">
                                        <i class="layui-icon">&#xe601;</i>
                                    </a>--%>
                                    <a title="编辑" onclick="xadmin.open('编辑','<%=APP_PATH%>/admin/toupdateAdminView?aid=${ad.aid}',600,400)"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a onclick="xadmin.open('修改密码','<%=APP_PATH%>/admin/toAdminpass?aid=${ad.aid}',600,400)" title="修改密码"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                    </a>
                                    <a title="删除" onclick="member_del(this,'${ad.aid}')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
                <%--<div class="layui-card-body ">
                    <div class="page">
                        <div>
                          <a class="prev" href="">&lt;&lt;</a>
                          <a class="num" href="">1</a>
                          <span class="current">2</span>
                          <a class="num" href="">3</a>
                          <a class="num" href="">489</a>
                          <a class="next" href="">&gt;&gt;</a>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用/启用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {
                $.ajax({
                    url: "<%=APP_PATH%>/admin/stopAdmin",
                    data: "aid=" + id+"&status=0",
                    method: "post",
                    success: function (r) {
                        if (r.status == "200") {
                            //发异步把用户状态进行更改
                            $(obj).attr('title', '停用')
                            $(obj).find('i').html('&#xe62f;');

                            $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                            layer.msg('已停用!', {icon: 5, time: 1000});
                        } else {
                            // alert(obj.msg);
                            layer.msg('失败!', {icon: 1, time: 1000});
                        }
                    }
                })



            } else {

                $.ajax({
                    url: "<%=APP_PATH%>/admin/stopAdmin",
                    data: "aid=" + id+"&status=1",
                    method: "post",
                    success: function (r) {
                        if (r.status == "200") {
                            $(obj).attr('title', '启用')
                            $(obj).find('i').html('&#xe601;');

                            $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                            layer.msg('已启用!', {icon: 5, time: 1000});
                        } else {
                            // alert(obj.msg);
                            layer.msg('失败!', {icon: 1, time: 1000});
                        }
                    }
                })


            }




        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            var d = {ids: id};
            $.ajax({
                url: "<%=APP_PATH%>/admin/delbyids",
                data: "ids=" + id,
                method: "post",
                success: function (r) {
                    if (r.status == "200") {
                        // alert(obj.msg);
                        // location.href = "<%=APP_PATH%>/admin/index";
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        // alert(obj.msg);
                        layer.msg('删除失败!', {icon: 1, time: 1000});
                    }
                }
            })


        });
    }


    function delAll(argument) {
        var ids = [];

        // 获取选中的id 
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？' + ids.toString(), function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>