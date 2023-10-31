<%--
  Created by IntelliJ IDEA.
  User: jihyun
  Date: 2023/10/05
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/idSearchForm.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <title>아이디 찾기</title>
</head>
<body>
<nav>
    <a href="/hari/mainNav"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="../img/loginWeb.png" class="loginIcon" alt="home" onclick="goBack()">
    </div>
</nav>
<hr>
<div class="pageContainer">
    <div class="idSearchContainer">
        <div class="idSearchBox">
            <div class="idSearchBoxBar" >
                <div class="pageTitle" id="userTitle" style="display:block">일반 회원 아이디 찾기</div>
                <div class="pageTitle" id="bizTitle" style="display:none;">비즈니스 회원 아이디 찾기</div>
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
            <form  method="post"  id="userIdSearchForm" style="display:block;" >
                <div class="inputBox">
                    <div class="Row">
                        <img src="../img/idIcon.png" class="icon" alt="이름">
                        <input class="inputRow" type="text" placeholder="이름"  name="userName"  id="userName" required/><br>
                    </div>
                    <hr class="inputBoxLine">
                    <div class="Row">
                        <img src="../img/mail.png" class="icon" alt="이메일">
                        <input class="inputRow" type="text" name="email" id="email" placeholder="이메일  예) aaa@hari.com" required/><br>
                    </div>
                </div>
                <br>
                <input class="idSearchButton" type="submit" value="아이디 찾기" onclick="searchUserId()">
            </form>

            <!--비즈니스 로그인 -->
            <form  method="post"  id="bizIdSearchForm" style="display:none;" >
                <div class="inputBox">
                    <div class="Row">
                        <img src="../img/idIcon.png" class="icon" alt="이름">
                        <input class="inputRow" type="text" placeholder="이름"  name="bOwner"  id="bOwner" required/><br>
                    </div>
                    <hr class="inputBoxLine">
                    <div class="Row">
                        <img src="../img/mail.png" class="icon" alt="이메일">
                        <input class="inputRow" type="text" name="bEmail" id="bEmail" placeholder="이메일  예) aaa@hari.com" required/><br>
                    </div>
                </div>
                <br>
                <input class="idSearchButton" type="submit" value="아이디 찾기" onclick="searchBId()">
            </form>
            <div class="idSearchBoxBottom">
                <span>비밀번호가 기억나지 않는다면?</span><br>
                <a href="/hari/pwdSearchForm">비밀번호 찾기</a>
            </div>

        </div>
    </div>
</div>

</body>
</html>

<script>
    // 아이디 찾기 AJAX 요청 함수
    function searchUserId() {
        const url = '/hari/userIdSearchOk';
        const userName = $("#userName").val();
        const email = $("#email").val();

        $.ajax({
            url: url,
            data: {
                userName: userName,
                email: email
            },
            type: "post",
            success: function (result) {
                console.log(result);

                if (result === 'Y') {
                    alert("아이디를 이메일로 전송했습니다.");
                    location.href = "/hari/totalLogIn";
                } else {
                    alert("일치하는 정보가 없습니다.");
                }
            },
            error: function () {
                console.log("아이디 찾기 에러 발생함!!!");
            }
        });
    }

    const toggle=document.querySelector('#toggle');
    toggle.addEventListener('change', (event) => {
        if (toggle.checked) {
            //체크박스 체크 되면 나타나고
            const bizTitle = document.querySelector('#bizTitle');
            const bizIdSearchForm = document.querySelector('#bizIdSearchForm');
            const userIdSearchForm = document.querySelector('#userIdSearchForm');
            const userTitle = document.querySelector('#userTitle');


            if (bizIdSearchForm) {
                bizTitle.style.display="block";
                bizIdSearchForm.style.display = "block";
                userIdSearchForm.style.display="none";
                userTitle.style.display="none";
            }
        } else {
            //체크박스 체크 해제 되면 사라진다
            const bizTitle = document.querySelector('#bizTitle');
            const bizIdSearchForm = document.querySelector('#bizIdSearchForm');
            const userIdSearchForm = document.querySelector('#userIdSearchForm');
            const userTitle = document.querySelector('#userTitle');
            bizTitle.style.display="none";
            bizIdSearchForm.style.display = "none";
            userIdSearchForm.style.display="block";
            userTitle.style.display="block";
        }
    })

    function goBack() {
        history.back();
    }
</script>
