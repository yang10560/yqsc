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
    <link rel="stylesheet" href="../admin/css/font.css">
    <link rel="stylesheet" href="../admin/css/xadmin.css">
    <script src="../admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../admin/js/xadmin.js"></script>
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
            <a href="">乐器管理</a>
            <a>
              <cite>类别管理</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5" onsubmit="return false">

                        <div class="layui-inline layui-show-xs-block">
                            <input id="searchID" type="text" value="${categoryName}" placeholder="请输入类别名"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" onclick="searchFun()"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">

                    <button class="layui-btn"
                            onclick="xadmin.open('添加类别','<%=APP_PATH%>/category/toAddPage',600,400)"><i
                            class="layui-icon"></i>添加类别
                    </button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>

                            <th>ID</th>
                            <th>类别名称</th>
                            <th>类别描述</th>

                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cat" items="${pageBean.list}">
                            <tr>
                                <td>${cat.id}</td>
                                <td>${cat.categoryname}</td>
                                <td>${cat.description}</td>


                                <td class="td-manage">

                                    <a title="编辑类别"
                                       onclick="xadmin.open('编辑类别','<%=APP_PATH%>/category/toeditPage?id=${cat.id}',600,400)"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    &nbsp; &nbsp;

                                    <a title="删除" onclick="cat_del(this,${cat.id})" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>

                <%--分页开始--%>

                <div class="layui-card-body ">
                    <span>当前${pageBean.currentPage} 页，共${pageBean.totalPage} 页,共${pageBean.totalCount}条</span>
                    <div class="page">
                        <div>

                            <a class="prev"
                               href="<%=APP_PATH%>/category/list?categoryName=${categoryName}&pageNo=${pageBean.currentPage-1>0?pageBean.currentPage-1:1}&pageSize=10">上一页</a>
                            <%--<a class="num" href="">1</a>--%>

                            <c:forEach var="p" begin="${pageBean.pageStartNo}" end="${pageBean.pageEndNo}">

                                <c:if test="${p == pageBean.currentPage}">
                                    <%--<a class="num" class="current"
                                           href="<%=APP_PATH%>/member/list?pageNo=${p}&pageSize=1">${p}</a>--%>
                                    <span class="current">${p}</span>
                                </c:if>
                                <c:if test="${p != pageBean.currentPage}">
                                    <a class="num"
                                       href="<%=APP_PATH%>/category/list?categoryName=${categoryName}&pageNo=${p}&pageSize=10">${p}</a>
                                </c:if>

                            </c:forEach>

                            <a class="next"
                               href="<%=APP_PATH%>/category/list?categoryName=${categoryName}&pageNo=${pageBean.currentPage+1>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+1}&pageSize=10">下一页</a>
                        </div>
                    </div>
                </div>

                <%--分页结束--%>

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

    /*用户-删除*/
    function cat_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据

            console.log(id);

            $.ajax({
                url: "<%=APP_PATH%>/category/delById",
                data: "id=" + id,
                method: "post",
                success: function (r) {
                    if (r.status == 200) {
                        // alert(obj.msg);
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        // alert(obj.msg);
                        layer.msg('删除失败!', {icon: 1, time: 1000});
                    }
                }
            })

            //$(obj).parents("tr").remove();
            //  layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function searchFun() {
        var searchName = $("#searchID").val();
        // alert(searchName)
        location.href = "<%=APP_PATH%>/category/list?categoryName=" + searchName + "&pageNo=1&pageSize=10";
    }
</script>
</html>