<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>新建签约信息</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/WdatePicker.js"></script>

    <script language="JavaScript">
        function submitUser() {
            var form = $("#form");
            form.action = "/userlist?type=createUser";
            $("#form").attr("action",form.action);
            form.submit();
        }
    </script>

</head>

<body>
<form class="form-horizontal" role="form" id="form" name="form" method="post">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">名字</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入名字">
        </div>
    </div>

    <div class="form-group">
        <label for="gender" class="col-sm-2 control-label">性别</label>
        <div class="col-sm-10">
            <select class="gender" name="gender">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="birthday">出生年月</label>
        <div class="col-sm-10">
            <input id="birthday" name="birthday" type="text" onClick="WdatePicker()"/>
        </div>
    </div>

    <div class="form-group">
        <label for="lessonName" class="col-sm-2 control-label">选择课程</label>
        <div class="col-sm-10">
            <select class="combobox" name="lessonName">
                <c:forEach var="lesson" items="${lessonList}">
                    <option value="${lesson.id}">${lesson.lessonName}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="fatherName" class="col-sm-2 control-label">父亲</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="fatherName" name="fatherName" placeholder="请输入父亲姓名">
        </div>
    </div>
    <div class="form-group">
        <label for="motherName" class="col-sm-2 control-label">母亲</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="motherName" name="motherName" placeholder="请输入母亲姓名">
        </div>
    </div>
    <div class="form-group">
        <label for="phoneNum" class="col-sm-2 control-label">联系手机</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="请输入手机号">
        </div>
    </div>

    <div class="form-group">
        <label for="phoneNum2" class="col-sm-2 control-label">联系手机2</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="phoneNum2" name="phoneNum2" placeholder="请输入手机号2">
        </div>
    </div>

    <div class="form-group">
        <label for="kidGarden" class="col-sm-2 control-label">幼儿园</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="kidGarden" name="kidGarden" placeholder="幼儿园信息">
        </div>
    </div>

    <div class="form-group">
        <label for="primarySchool" class="col-sm-2 control-label">小学</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="primarySchool" name="primarySchool" placeholder="小学信息">
        </div>
    </div>

    <div class="form-group">
        <label for="middleSchool" class="col-sm-2 control-label">初中</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="middleSchool" name="middleSchool" placeholder="初中信息">
        </div>
    </div>

    <div class="form-group">
        <label for="homeAddress" class="col-sm-2 control-label">住址</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="homeAddress" name="homeAddress" placeholder="住址">
        </div>
    </div>

    <div class="form-group">
        <label for="wechat" class="col-sm-2 control-label">微信</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="wechat" name="wechat" placeholder="微信号">
        </div>
    </div>

    <div class="form-group">
        <label for="qq" class="col-sm-2 control-label">QQ</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="qq" name="qq" placeholder="qq号">
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label" for="signDateStr">签约日期</label>
        <div class="col-sm-10">
            <input id="signDateStr" name="signDateStr" type="text" onClick="WdatePicker()"/>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" onclick="submitUser()" >保存</button>
        </div>
    </div>
</form>



</body>
</html>