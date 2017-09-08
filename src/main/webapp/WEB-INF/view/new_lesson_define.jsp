<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>自定义课程</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
</head>

<body>
<form class="form-horizontal" role="form" id="form" name="form" method="post" action="/saveNewLesson">
    <div class="form-group">
        <label for="lessonName" class="col-sm-2 control-label">课程名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="lessonName" name="lessonName" placeholder="请输入课程名称">
        </div>
    </div>
    <div class="form-group">
        <label for="learnTimes" class="col-sm-2 control-label">课时数</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="learnTimes" name="learnTimes" placeholder="课时数">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">保存</button>
        </div>
    </div>
</form>



</body>
</html>