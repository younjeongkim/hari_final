<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/boardWrite.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>고객 문의</title>
</head>
<body>
<nav>
    <a href="/hari/mainNav"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="/img/loginWeb.png" class="loginIcon" alt="home" onclick="goBack()">
    </div>
</nav>
<hr>
<div class="boardContainer">
    <div class="boardWriteContainer">
        <div class="boardWriteBox">

            <div class="boardPageTitle">고객 문의</div><br>
            <input type="text" class="boardWriteTitle" name="subject" placeholder="제목"/><br>
            <br>
            <textarea class="boardWriteContent" name="content" placeholder="내용"></textarea><br>
            <br>
        </div>
        <br>
        <div style="float: right;">
            <button id="registerButton">등록</button>
            <button id="cancelButton">취소</button>
        </div>
    </div>
</div>
</body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 등록 버튼 클릭 시 이벤트 처리
        document.querySelector('#registerButton').addEventListener('click', function () {
            // 제목과 내용 입력값 가져오기
            var subject = document.querySelector('.boardWriteTitle').value;
            var content = document.querySelector('.boardWriteContent').value;

            // FormData 객체 생성
            var formData = new FormData();

            // FormData에 데이터 추가
            formData.append('subject', subject);
            formData.append('content', content);

            // XMLHttpRequest 객체 생성
            var xhr = new XMLHttpRequest();

            // POST 요청 설정
            xhr.open('POST', '/hari/qnaWriteOk', true);

            // 서버 응답 처리
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // 성공적으로 처리된 경우
                    alert('문의가 등록되었습니다.');
                    window.location.href = '/hari/qnaList'; // 다시 홈페이지로 이동 (원하는 경로로 변경 가능)
                } else {
                    // 오류 발생 시 처리
                    alert('문의 등록에 실패했습니다.');
                }
            };

            // POST 요청 전송
            xhr.send(formData);
        });

        // 취소 버튼 클릭 시 이벤트 처리
        document.querySelector('#cancelButton').addEventListener('click', function () {
            // 원하는 취소 동작 추가
            alert('취소 버튼을 클릭했습니다.');
            history.back();
        });
    });

    function goBack() {
        history.back();
    }
</script>