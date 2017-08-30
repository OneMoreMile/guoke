<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>xxx</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script language="JavaScript">
        function is_submit(value) {
            var form1 = $("#form1");
            if (value == 1) {
                var name = $("#studentName").val();
                form1.action = "/queryByName?name="+name;
                $("#form1").attr("action",form1.action);
                form1.submit();
            }
            if (value == 2) {
                form1.action = "/newUser";
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
        }


    </script>

</head>
<body>

<h1>new learn record.</h1>


</body>
</html>

