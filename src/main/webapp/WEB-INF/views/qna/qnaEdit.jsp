<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/boardWrite.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
            <input type="hidden" id="qNo" value="${qnaDTO.qNo }" />
            <input type="text" class="boardWriteTitle" name="subject" value="${qnaDTO.subject }"/><br>
            <br>
            <textarea class="boardWriteContent" name="content">${qnaDTO.content }</textarea><br>
            <br>
            <input type="file">
        </div>
        <br>
        <div style="float: right;">
            <button onclick="qnaEdit()">수정</button>
            <button id="cancelButton">취소</button>
        </div>
    </div>
</div>
</body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function () {
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

    <%--function qnaEdit() {--%>
    <%--    if (confirm("수정하시겠습니까?")) {--%>
    <%--        // 사용자가 확인을 누른 경우--%>
    <%--        window.location.href = `/hari/qnaEditOk?qNo=${qnaDTO.qNo}`;--%>
    <%--    }--%>
    <%--}--%>

    function qnaEdit() {
        if (confirm("수정하시겠습니까?")) {
            const qNo = document.querySelector('#qNo').value;
            const subject = document.querySelector('.boardWriteTitle').value;
            const content = document.querySelector('.boardWriteContent').value;

            // POST 요청을 보내기 위한 XMLHttpRequest 객체 생성
            const xhr = new XMLHttpRequest();
            xhr.open('POST', `/hari/qnaEditOk`, true);
            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

            // 요청 본문 데이터 설정
            const data = JSON.stringify({ qNo, subject, content });

            // 요청 완료 시 콜백 함수
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // 서버로부터 응답을 받은 후 수행할 동작을 여기에 작성
                    alert('수정이 완료되었습니다.');
                    window.location.href = `/hari/qnaView?qNo=${qnaDTO.qNo}`;
                }
            };

            // POST 요청 보내기
            xhr.send(data);
        }
    }

    <%--function qnaEdit() {--%>
    <%--    if (confirm("수정하시겠습니까?")) {--%>
    <%--        const qNo = document.querySelector('#qNo').value;--%>
    <%--        const subject = document.querySelector('.boardWriteTitle').value;--%>
    <%--        const content = document.querySelector('.boardWriteContent').value;--%>

    <%--        // 요청 데이터를 JSON 형식으로 구성--%>
    <%--        const requestData = {--%>
    <%--            qNo: qNo,--%>
    <%--            subject: subject,--%>
    <%--            content: content--%>
    <%--        };--%>

    <%--        // POST 요청을 보내기 위한 XMLHttpRequest 객체 생성--%>
    <%--        const xhr = new XMLHttpRequest();--%>
    <%--        xhr.open('POST', `/hari/qnaEditOk`, true);--%>
    <%--        xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');--%>

    <%--        // 요청 본문 데이터 설정--%>
    <%--        const data = JSON.stringify(requestData);--%>

    <%--        // 요청 완료 시 콜백 함수--%>
    <%--        xhr.onreadystatechange = function () {--%>
    <%--            if (xhr.readyState === 4) {--%>
    <%--                if (xhr.status === 200) {--%>
    <%--                    const response = JSON.parse(xhr.responseText);--%>
    <%--                    if (response.success) {--%>
    <%--                        // 수정 성공 시 메시지 출력 후 페이지 이동--%>
    <%--                        alert(response.message);--%>
    <%--                        window.location.href = `/hari/qnaView?qNo=${qnaDTO.qNo}`;--%>
    <%--                    } else {--%>
    <%--                        // 수정 실패 시 메시지 출력--%>
    <%--                        alert(response.message);--%>
    <%--                    }--%>
    <%--                } else {--%>
    <%--                    // 서버 오류 등의 경우에 대한 처리--%>
    <%--                    console.error('서버 오류:', xhr.status);--%>
    <%--                }--%>
    <%--            }--%>
    <%--        };--%>

    <%--        // POST 요청 보내기--%>
    <%--        xhr.send(data);--%>
    <%--    }--%>
    <%--}--%>

</script>