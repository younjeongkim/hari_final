<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/totalSignIn.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>내 정보 관리</title>
</head>
<body>
<nav>
    <a href="/hari/mainNav"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="/img/loginWeb.png" class="loginIcon" alt="home">
    </div>
</nav>
<hr>
<div class="SPageContainer">
    <div class="SignInContainer">
        <div class="SignInBox">
            <div class="SignInTitleBar">
                <div class="SPageTitle" id="userSignTitle" style="display:block">일반 회원 정보 수정</div>
            </div>
            <br>
<!--        <form action="/hari/totalLogIn" method="post" id="userSign"  style="display:block;" >-->
        <form action="/hari/userEditOk" method="post" id="userSign" name="userEditForm" onclick="pwdChk()" style="display:block;" >
        <div class="SBox">
            <div class="SRow">
                <img src="/img/idIcon.png" class="SIcon" alt="아이디">
                <input class="SInputRow" type="text" name="userId" value="${user.userId}" placeholder="아이디" readonly/>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/lock.png" class="SIcon" alt="비밀번호">
                <input class="SInputRow" type="password" name="userPwd" value="${user.userPwd}" placeholder="비밀번호"/>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/mail.png" class="SIcon" alt="이메일">
                <input class="SInputRow" type="text" name="email" value="${user.email}" placeholder="이메일"/>
            </div>
        </div>
        <br><br>
        <div class="SBox">
            <div class="SRow">
                <img src="/img/idIcon.png" class="SIcon" alt="이름">
                <input class="SInputRow" type="text" name="userName" value="${user.userName}" placeholder="이름"/><br>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/idIcon.png" class="SIcon" alt="닉네임">
                <input class="SInputRow" type="text" name="nickName" value="${user.nickName}" placeholder="닉네임"/><br>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/phone.png" class="SIcon" alt="연락처">
                <input class="SInputRow" type="text" name="phone" value="${user.phone}" placeholder="연락처"/><br>
            </div>


        </div>
            <br>
            <input class="SignInButton" type="submit" value="수정">
        </form>



        </div>
    </div>
</div>
<br>

</body>
<script>


    // function pwdChk() {
    //     const userPwd = document.getElementById('userPwd').value;
    //
    //     if (userPwd === "") {
    //         alert("비밀번호를 입력하세요.");
    //         return false;
    //     }
    //
    //     return true;
    // }
</script>
</html>