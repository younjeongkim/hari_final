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
                <div class="SPageTitle" id="bizSignTitle" style="display:block">비즈니스 회원 정보 수정</div>
            </div>
            <br>
            <form action="/hari/shopEditOk" method="post" id="bizSign"  style="display:block;">
                <div class="SBox">
                    <div class="SRow">
                        <img src="/img/idIcon.png" class="SIcon" alt="아이디">
                        <input class="SInputRow" type="text" name="bId" value="${shop.bId}" placeholder="아이디"/>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/lock.png" class="SIcon" alt="비밀번호">
                        <input class="SInputRow" type="password" name="bPwd" value="${shop.bPwd}" placeholder="비밀번호"/>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/mail.png" class="SIcon" alt="이메일">
                        <input class="SInputRow" type="text" name="bEmail" value="${shop.bEmail}" placeholder="이메일"/>
                    </div>
                </div>
                <br><br>
                <div class="SBox">
                    <div class="SRow">
                        <img src="/img/idIcon.png" class="SIcon" alt="대표자 이름">
                        <input class="SInputRow" type="text" name="bOwner" value="${shop.bOwner}" placeholder="대표자 이름"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/phone.png" class="SIcon" alt="연락처">
                        <input class="SInputRow" type="text" name="bPhone" value="${shop.bPhone}" placeholder="연락처"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="가게 이름">
                        <input class="SInputRow" type="text" name="bName" value="${shop.bName}" placeholder="가게 이름"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="사업자등록번호">
                        <input class="SInputRow" type="text" name="bNo" value="${shop.bNo}" placeholder="사업자등록번호"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="가게 주소">
                        <input class="SInputRow" type="text" name="bAddr" value="${shop.bAddr}" placeholder="가게 주소"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="업종 분류">
                        <input class="SInputRow" type="text" name="bCategory" value="${shop.bCategory}" placeholder="업종 분류"/><br>
                    </div>

                </div>
                <br>
                <input class="SignInButton" type="submit" value="확인" >
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