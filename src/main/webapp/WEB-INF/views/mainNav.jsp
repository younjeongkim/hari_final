<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/mainNav.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <title>비즈니스 회원가입</title>


</head>
<body>
<nav>
    <a href="/hari/main"> <div class="nav">HARI</div></a>
    <img src="/img/logoutWeb.png" class="loginIcon" alt="home" onclick="goBack()">

</nav>
<hr>

<div class="SPageContainer">
    <div class="SignInContainer">
        <div class="SignInBox">
            <br>
            <div class="navMenu">
                 <img src="/img/navIcon.png" alt="회원관리" class="navIcon">
                <span>회원관리</span>
            </div>
            <br>
            <c:if test="${logStatus != 'Y'}">
                <div class="navMenuRow">
                    <a href="/hari/totalLogIn">
                    <button>로그인</button>
                    </a>
                    <a href="/hari/totalLogIn">
                    <button class="Rclick"></button>
                    </a>
                </div>
            </c:if>
            <c:if test="${logStatus == 'Y'}">
                <div class="navMenuRow">
                    <a href="/hari/logout">
                    <button>로그아웃</button>
                    </a>
                    <a href="/hari/logout">
                    <button class="Rclick"></button>
                    </a>
                </div>
            </c:if>

            <div>
                <c:if test="${logType == 'U'}">
                    <form action="/hari/userEdit" method="get">
                        <a>
                        <button>내 정보 관리</button>
                        </a>
                        <a>
                        <button class="Rclick"></button>
                        </a>
                    </form>

                </c:if>
                <c:if test="${logType == 'S'}">
                    <form action="/hari/shopEdit" method="get">
                        <a>
                        <button>내 정보 관리</button>
                        </a>
                        <a>
                        <button class="Rclick"></button>
                        </a>
                    </form>
                </c:if>
            </div>

            <div class="navMenuRow">
                <a href="/hari/totalSignIn">
                <button>회원가입</button>
                </a>
                <a href="/hari/totalSignIn">
                <button class="Rclick"></button>
                </a>
            </div>
            <c:if test="${logType == 'S'}">
                <div class="navMenuRow" >

                    <a href="/hari/shopMenuList">
                    <button>우리 가게 관리</button>
                    </a>
                    <a href="/hari/shopMenuList">
                    <button class="Rclick"></button>
                    </a>

                </div>
            </c:if>
            <c:if test="${logType != 'S'}">
                <div class="navMenuRow">

                    <a href="/hari/shopMenuList" onclick="showAlert()">
                    <button>우리 가게 관리</button>
                    </a>
                    <a href="/hari/shopMenuList" onclick="showAlert()">
                    <button class="Rclick"></button>
                    </a>

                </div>
            </c:if>

        </div>

        <br>
        <br>
            <div class="SignInBox">
                <div class="navMenu">
                <img src="/img/setting.png" alt="회원관리" class="navIcon">
                <span>고객 센터</span>
                </div>

                <br>
                <div class="navMenuRow">
                    <a href="/hari/qnaList">
                    <button>고객 문의</button>
                    </a>
                    <a href="/hari/qnaList">
                        <button class="Rclick"></button>
                    </a>
                </div>
                <hr>

             </div>

    </div>
</div>

</body>
</html>
<script>
    function showAlert() {
        alert("접근 권한이 없습니다.");
        event.preventDefault(); // 링크를 클릭해도 이동하지 않도록
    }

    function goBack() {
        history.back();
    }
</script>