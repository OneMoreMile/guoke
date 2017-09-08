<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程列表</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script language="JavaScript">
        function is_submit(value) {
            var form2 = $("#form2");
            if (value == 1) {
                form2.action = "/userlist?type=query";
                $("#form2").attr("action",form2.action);
                form2.submit();
            }
            if (value == 5) {
                form2.action = "/logout";
                $("#form2").attr("action", form2.action);
                form2.submit();
            }
            if (value == 6) {
                form2.action = "/lessonlist";
                $("#form2").attr("action", form2.action);
                form2.submit();
            }
        }

        function saveLesson() {
            var form2 = $("#form2");
            form2.action = "/saveNewLesson";
            $("#form2").attr("action",form2.action);
            form2.submit();
        }

    </script>

</head>
<body>

<div class="container">

    <!-- Static navbar -->
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">果核科学</a>
            </div>
            <div id="navbar2" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="javascript:void(0)" onclick="is_submit(1)">学员管理</a></li>
                    <li class="active"><a href="javascript:void(0)" onclick="is_submit(6)">课程管理</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%--<li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>--%>
                    <li><a href="javascript:void(0)" onclick="is_submit(5)">退出系统</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>

    <form class="form-inline" role="form" id="form2" name="form1" METHOD="post">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2" data-backdrop="static">新建课程</button>

        <div>
            <table class="table table-bordered">
                <caption><h3>课程列表</h3></caption>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>课程名称</th>
                    <th>课时数</th>
                    <th>描述</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="lesson" items="${lessonPageList}" varStatus="status">
                    <tr>
                        <td><span>${status.index +1}</span></td>
                        <td><span>${lesson.lessonName}</span></td>
                        <td><span>${lesson.learnTimes}</span></td>
                        <td><span>${lesson.lessonDesc}</span></td>
                        <td><span>${lesson.createDateStr}</span></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel1">新增课程</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="lessonName">课程名称</label>
                            <input type="text"  name="lessonName" class="form-control"  >
                        </div>
                        <div class="form-group">
                            <label for="learnTimes">课时数</label>
                            <input type="text"  name="learnTimes" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label for="lessonDesc">情况描述</label>
                            <textarea placeholder="情况描述" name="lessonDesc" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="saveLesson()"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>
</body>
</html>