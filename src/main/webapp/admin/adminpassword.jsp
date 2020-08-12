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
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <% String APP_PATH = request.getContextPath(); %>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" id="xgmmform" onsubmit="return false">

            <input value="${aid}" name="aid" type="hidden">

            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>旧密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="oldpass" required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="newpass"  required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
                <span id="ts" style="color: red"></span>
            </div>

            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="save" onclick="xgmm()">修改</button>
            </div>
        </form>
    </div>
</div>
<script>


    function xgmm() {
        $("#ts").html("");
        var d = $("#xgmmform").serialize();
        console.log(d)
        var newp = $("input[name='newpass']").val();
        var rep = $("input[name='repass']").val();

        console.log(newp)
        console.log(rep)
        if(newp != rep) {
            $("#ts").html("密码不一致") ;
            return
        }

        $.ajax({
            url: "<%=APP_PATH%>/admin/updateAdminPwd",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == "200") {

                    layer.msg('成功!', {icon: 5, time: 1000});
                } else {
                    // alert(obj.msg);
                    layer.msg('失败!', {icon: 1, time: 1000});
                }
            }
        })





    }




</script>

</body>

</html>