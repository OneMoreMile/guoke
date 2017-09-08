<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>上课历史记录</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script language="JavaScript">
        function is_submit(value) {
            var form1 = $("#form1");
            if (value == 1) {
                form1.action = "/userlist?type=query";
                $("#form1").attr("action",form1.action);
                form1.submit();
            }
            if (value == 2) {
                form1.action = "/newUserPage";
                $("#form1").attr("action", form1.action);
                form1.submit();
            }
            if (value == 3) {
                form1.action = "/newLessonPage";
                $("#form1").attr("action", form1.action);
                form1.submit();
            }
            if (value == 4) {
                var ison = $(":radio[name='ison']:checked").val()
                form1.action = "/Test/querrybyison?ison=" + ison;
                $("#form1").attr("action", form1.action);
                form1.submit();
            }
            if (value == 5) {
                form1.action = "/logout";
                $("#form1").attr("action", form1.action);
                form1.submit();
            }
            if (value == 6) {
                form1.action = "/lessonlist";
                $("#form1").attr("action", form1.action);
                form1.submit();
            }
        }
    </script>

</head>
<body>
<div class="container">

    <!-- Static navbar -->
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">果核科学</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="javascript:void(0)" onclick="is_submit(1)">学员管理</a></li>
                    <li><a href="javascript:void(0)" onclick="is_submit(6)">课程管理</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%--<li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>--%>
                    <li><a href="javascript:void(0)" onclick="is_submit(5)">退出系统</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>

    <form class="form-inline" role="form" id="form1" name="form1" METHOD="post">
        <div>
            <table class="table table-bordered">
                <caption><h3>上课记录</h3></caption>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>上课日期</th>
                    <th>描述</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="classSpend" items="${classSpendList}" varStatus="status">
                    <tr>
                        <td><span>${status.index +1}</span></td>
                        <td><span>${classSpend.classDate}</span></td>
                        <td><span>${classSpend.desc}</span></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </form>

</div>
</body>
</html>

