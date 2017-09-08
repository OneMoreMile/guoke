<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>学员列表</title>
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

        function newStudent() {
            var form1 = $("#form1");
            form1.action = "/createUser";
            $("#form1").attr("action",form1.action);
            form1.submit();
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
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="javascript:void(0)" onclick="is_submit(1)">学员管理</a></li>
                    <li><a href="javascript:void(0)" onclick="is_submit(6)">课程管理</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%--<li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>--%>
                    <li><a href="../navbar-static-top/" onclick="is_submit(5)">退出系统</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </nav>

    <form class="form-inline" role="form" id="form1" name="form1" METHOD="post">
        <div class="form-group">
            <label class="sr-only" for="studentName">名称</label>
            <input type="text" class="form-control" name="studentName" placeholder="请输入学生姓名">
        </div>
        <button type="submit" class="btn btn-default" onclick="is_submit(1)">查询</button>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2" data-backdrop="static">新建学员信息</button>
        <div>
            <table class="table table-bordered">
                <caption><h3>学员列表</h3></caption>
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



        <%--新增上课记录--%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">新增上课记录</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="classDate">上课日期</label>
                            <input id="classDate" name="classDate" type="text" class="form-control" onClick="WdatePicker()" placeholder="选择日期"/>
                        </div>
                        <div class="form-group">
                            <label for="classSpent">消耗课时</label>
                            <input type="text" id="classSpent" name="classSpent" class="form-control" >
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
                            <label for="newLessonTime">新增课时</label>
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

        <%--新建学员信息--%>
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" style="width:400px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">新增学员信息</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label" style="width:100px">名字</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入名字">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label" style="width:100px">性别</label>
                            <div class="col-sm-10" style="width:150px">
                                <select class="gender" name="gender" style="width:150px">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="birthday" style="width:100px">出生年月</label>
                            <div class="col-sm-10" style="width:150px">
                                <input id="birthday" name="birthday" type="text" onClick="WdatePicker()"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="lessonName" class="col-sm-2 control-label" style="width:100px">选择课程</label>
                            <div class="col-sm-10" style="width:150px">
                                <select class="combobox" name="lessonName" style="width:150px">
                                    <c:forEach var="lesson" items="${lessonList}">
                                        <option value="${lesson.id}">${lesson.lessonName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="fatherName" class="col-sm-2 control-label" style="width:100px">父亲</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="fatherName" name="fatherName" placeholder="请输入父亲姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="motherName" class="col-sm-2 control-label" style="width:100px">母亲</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="motherName" name="motherName" placeholder="请输入母亲姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phoneNum" class="col-sm-2 control-label" style="width:100px">联系手机</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="请输入手机号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phoneNum2" class="col-sm-2 control-label" style="width:100px">联系手机2</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="phoneNum2" name="phoneNum2" placeholder="请输入手机号2">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="kidGarden" class="col-sm-2 control-label" style="width:100px">幼儿园</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="kidGarden" name="kidGarden" placeholder="幼儿园信息">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="primarySchool" class="col-sm-2 control-label" style="width:100px">小学</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="primarySchool" name="primarySchool" placeholder="小学信息">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="middleSchool" class="col-sm-2 control-label" style="width:100px">初中</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="middleSchool" name="middleSchool" placeholder="初中信息">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="homeAddress" class="col-sm-2 control-label" style="width:100px">住址</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="homeAddress" name="homeAddress" placeholder="住址">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="wechat" class="col-sm-2 control-label" style="width:100px">微信</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="wechat" name="wechat" placeholder="微信号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="qq" class="col-sm-2 control-label" style="width:100px">QQ</label>
                            <div class="col-sm-10" style="width:150px">
                                <input type="text" class="form-control" id="qq" name="qq" placeholder="qq号">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="signDateStr" style="width:100px">签约日期</label>
                            <div class="col-sm-10" style="width:150px">
                                <input id="signDateStr" name="signDateStr" type="text" onClick="WdatePicker()"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="newStudent()"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                    </div>
                </div>
            </div>
        </div>

    </form>

</div>
</body>
</html>