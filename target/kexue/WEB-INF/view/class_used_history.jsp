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
</head>
<body>

<%--<h1>上课历史记录</h1>--%>

<form class="form-inline" role="form" id="form1" name="form1" METHOD="post">
    <div>
        <table class="table table-bordered">
            <caption><h2>上课记录</h2></caption>
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


</body>
</html>

