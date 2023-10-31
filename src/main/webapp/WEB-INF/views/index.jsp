<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="logo">HARI</div>

    <div class="outline">
        <div class="waves"> </div>
    </div>

    <div class="homeMenu">
        <ul>
            <li><a href="/hari/totalSignIn">SIGN IN</a></li>
            <c:if test="${logStatus != 'Y'}">
                <li><a href="/hari/totalLogIn">LOG IN</a></li>
            </c:if>
            <c:if test="${logStatus == 'Y'}">
                <li><a href="/hari/logout">LOGOUT</a></li>
            </c:if>
        </ul>
    </div>




</body>
</html>