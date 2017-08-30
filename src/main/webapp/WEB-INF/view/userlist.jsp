<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>学生列表</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/WdatePicker.js"></script>

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
                form1.action = "/newLearnRecord";
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
        }

        function firm1(studentId) {
            $('#selectStudentId').val(studentId);
            $("#myModalLabel").text("记录上课信息");
            $('#myModal').modal();
        }

        function firm2(studentId) {
            $('#selectStudentId').val(studentId);
            $("#myModalLabel1").text("续课");
            $('#myModal1').modal();
        }

        function firm3(studentId) {
            var form1 = $("#form1");
            form1.action = "/classHistory?studentId=" + studentId;
            $("#form1").attr("action",form1.action);
            form1.submit();
        }

        function firm6(studentId) {
            var form1 = $("#form1");
            form1.action = "/renewHistory?studentId=" + studentId;
            $("#form1").attr("action",form1.action);
            form1.submit();
        }

        function saveClassUsedRecord() {
            var form1 = $("#form1");
            form1.action = "/saveClassUsedRecord";
            $("#form1").attr("action",form1.action);
            form1.submit();
        }

        function renewClass() {
            var form1 = $("#form1");
            form1.action = "/renewClass";
            $("#form1").attr("action",form1.action);
            form1.submit();
        }

        function deleteStudent(studentId) {
            var msg = "您确定要删除吗？\n\n请确认！";
            if (confirm(msg)==true){
                $('#selectStudentId').val(studentId);
                var form1 = $("#form1");
                form1.action = "/deleteStudent";
                $("#form1").attr("action",form1.action);
                form1.submit();
            }else {
                return false;
            }
        }

    </script>

</head>
<body>

<form class="form-inline" role="form" id="form1" name="form1" METHOD="post">
    <div class="form-group">
        <label class="sr-only" for="studentName">名称</label>
        <input type="text" class="form-control" name="studentName" placeholder="请输入学生姓名">
    </div>
    <button type="submit" class="btn btn-default" onclick="is_submit(1)">查询</button>
    <button type="submit" class="btn btn-default" onclick="is_submit(2)">新建学员信息</button>
    <button type="submit" class="btn btn-default" onclick="is_submit(5)">退出</button>



<div>
<table class="table table-bordered">
    <caption><h2>学员列表</h2></caption>
    <thead>
    <tr>
        <th>序号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>签约日期</th>
        <th>所选课程</th>
        <th>已使用课时</th>
        <th>剩余课时</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
        <td><span>${status.index +1}</span></td>
        <td><span>${student.name}</span></td>
        <td><span>${student.gender}</span></td>
        <td><span>${student.signDateStr}</span></td>
        <td><span>${student.lessonName}</span></td>
        <td><span>${student.usedLessons}</span></td>
        <td><span>${student.boughtLessons - student.usedLessons}</span></td>
        <td>
            <span><a href="javascript:void(0)" onclick="firm1(${student.id})">记录上课</a> </span>
            <span><a href="javascript:void(0)" onclick="firm3(${student.id})">查看上课历史</a> </span>
            <span><a href="javascript:void(0)" onclick="firm2(${student.id})">续课</a> </span>
            <span><a href="javascript:void(0)" onclick="firm6(${student.id})">查看续课历史</a> </span>
            <span><a href="javascript:void(0)" onclick="deleteStudent(${student.id})">删除学员</a> </span>

            <%--<button type="submit" class="btn btn-default" onclick="firm1(${student.id})">记录上课</button>--%>
            <%--<button type="submit" class="btn btn-default" onclick="firm3(${student.id})">查询上课记录</button>--%>
            <%--<button type="submit" class="btn btn-default" onclick="firm2(${student.id})">续课</button>--%>
            <%--<button type="submit" class="btn btn-default" onclick="is_submit(1)">删除</button>--%>
        </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</div>

<input type="hidden" id="selectStudentId" name="selectStudentId" />

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label for="classDate">上课日期</label>
                    <input id="classDate" name="classDate" type="text" onClick="WdatePicker()" placeholder="选择日期"/>
                </div>
                <div class="form-group">
                    <label for="txt_parentdepartment">消耗课时</label>
                    <input type="text" id="classSpent" name="classSpent" class="form-control" id="txt_parentdepartment" >
                </div>
                <div class="form-group">
                    <label for="desc">情况描述</label>
                    <textarea placeholder="情况描述" name="desc" id="desc" class="form-control"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="saveClassUsedRecord()"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">新增课时</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="txt_parentdepartment">新增课时</label>
                    <input type="text" id="newLessonTime" name="newLessonTime" class="form-control" >
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                <button type="button" id="btn_submit1" class="btn btn-primary" data-dismiss="modal" onclick="renewClass()"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
            </div>
        </div>
    </div>
</div>

</form>
</body>
</html>