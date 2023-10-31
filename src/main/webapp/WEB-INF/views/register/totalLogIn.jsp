<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/totalLogIn.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>로그인</title>
</head>
<body>
<nav>
    <a href="/hari/mainNav"> <div class="nav">HARI</div></a>
    <div class="navIcon">
    <img src="/img/loginWeb.png" class="loginIcon" alt="home" onclick="goBack()">
    </div>
</nav>
<hr>
<div class="pageContainer">
<div class="LogInContainer">
<div class="LogInBox">
    <div class="LogInBoxBar" >
        <div class="pageTitle" id="userLoginTitle" style="display:block">일반 로그인</div>
        <div class="pageTitle" id="bizLoginTitle" style="display:none;">비즈니스 로그인</div>
        <div class="switchSec">
            <div class="switchText">일반</div>
        <label class="switch">
            <input type="checkbox" id="toggle">
            <span class="slider round"></span>
        </label>
            <div class="switchText">비즈니스</div>
        </div>
    </div>
    <br>
<%--<form action="/hari/shopLogIn" method="post" id="userLogIn"  style="display:block;" >--%>
    <form action="/hari/userLogInOk" method="post" id="userLogIn"  style="display:block;" onsubmit="return userLogChk()" >
    <div class="inputBox">
        <div class="Row">
            <img src="/img/idIcon.png" class="icon" alt="아이디">
             <input class="inputRow" type="text" name="userId" placeholder="아이디"/><br>
        </div>
        <hr class="inputBoxLine">
        <div class="Row">
            <img src="/img/lock.png" class="icon" alt="비밀번호">
             <input class="inputRow" type="password" name="userPwd" placeholder="비밀번호"/><br>
        </div>
    </div>
    <br>
    <input class="LogInButton" type="submit" value="로그인">
</form>

<!--비즈니스 로그인 -->
<%--    <form action="/hari/shopLogIn" method="post" id="bizLogIn" style="display:none;" >--%>
    <form action="/hari/shopLogInOk" method="post" id="bizLogIn" style="display:none;" onsubmit="return shopLogChk()" >
        <div class="inputBox">
            <div class="Row">
                <img src="/img/idIcon.png" class="icon" alt="아이디">
                <input class="inputRow" type="text" name="bId" placeholder="아이디"/><br>
            </div>
            <hr class="inputBoxLine">
            <div class="Row">
                <img src="/img/lock.png" class="icon" alt="비밀번호">
                <input class="inputRow" type="password" name="bPwd" placeholder="비밀번호"/><br>
            </div>
        </div>
        <br>
        <input class="LogInButton" type="submit" value="로그인">
    </form>
    <div class="LogInBoxBottom">
        <a href="/hari/idSearchForm">아이디 찾기</a>
        <a href="/hari/pwdSearchForm">비밀번호 찾기</a>
        <a href="/hari/totalSignIn">회원가입</a>
    </div>
</div>

</div>
</div>
</body>
<script>
    const toggle=document.querySelector('#toggle');
    toggle.addEventListener('change', (event) => {
        if (toggle.checked) {
            //체크박스 체크 되면 나타나고
            const bizLoginTitle = document.querySelector('#bizLoginTitle');
            const bizLogIn = document.querySelector('#bizLogIn');
            const userLogIn = document.querySelector('#userLogIn');
            const userLoginTitle = document.querySelector('#userLoginTitle');


            if (bizLogIn) {
                bizLoginTitle.style.display="block";
                bizLogIn.style.display = "block";
                userLogIn.style.display="none";
                userLoginTitle.style.display="none";
            }
        } else {
            //체크박스 체크 해제 되면 사라진다
            const bizLoginTitle = document.querySelector('#bizLoginTitle');
            const bizLogIn = document.querySelector('#bizLogIn');
            const userLogIn = document.querySelector('#userLogIn');
            const userLoginTitle = document.querySelector('#userLoginTitle');
            bizLoginTitle.style.display="none";
            bizLogIn.style.display = "none";
            userLogIn.style.display="block";
            userLoginTitle.style.display="block";
        }
    })

    function userLogChk() {
        if (document.getElementById("userId").value("")) {
            alert("아이디를 입력하세요.");

            return false;
        }

        if (document.getElementById("userPwd").value("")) {
            alert("비밀번호를 입력하세요.");

            return false;
        }

        return true;
    }

    function shopLogChk() {
        if (document.getElementById("bId").value("")) {
            alert("아이디를 입력하세요.");

            return false;
        }

        if (document.getElementById("bPwd").value("")) {
            alert("비밀번호를 입력하세요.");

            return false;
        }

        return true;
    }

    function goBack() {
        history.back();
    }

</script>
</html>