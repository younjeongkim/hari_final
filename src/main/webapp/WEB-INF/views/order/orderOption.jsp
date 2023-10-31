<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<html lang="ko">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/orderOption.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>HARI</title>
</head>
<body>
<nav>
    <input type="button" class="back" onclick="goBack()">
    <input type="button" class="home" onclick="location.href='/hari/main'">
</nav>

<div class="locationContainer">
    <div class="locationBox">
        <br>
        <br>
        <div class="myLocation">
            <span class="myLocationText">${bName}</span>
        </div>
        <br>
        <form id="orderOptionForm" action="/hari/addBasket" method="post">
            <div class="optionBox">
                <input type="hidden" name="mNo" value="${selectedMenu.mNo}">
                <input type="hidden" name="bId" value="${sessionScope.bId}"> <!-- 이 부분을 추가하세요 -->
                <div class="menuCategory">
                    <div class="menuCategoryText">온도를 선택 해주세요</div>
                </div>
                <br>
                <div class="checkDegree">
                    <input type="radio" name="temperature" value="HOT" required>HOT
                    <input type="radio" name="temperature" value="ICE" required>ICE
                </div>
                <br>
                <div class="menuCategory">
                    <div class="menuCategoryText">수량을 선택 해주세요</div>
                </div>
                <br>
                <div style="padding: 0 30px 0 30px">
                    <button type="button" class="cntButton" onclick="decrement()">-</button>
                    <input type="number" id="count" class="countNum" name="mCnt" value="1" style="width: 40px; text-align: center;" readonly>
                    <button type="button" class="cntButton" onclick="increment()">+</button>
                </div>
                <br>
                <br>
                <br>
                <div class="addBasket">
                    <button type="submit" class="addBasketText">장바구니 담기</button>
                </div>
                <input type="hidden" name="userId" value="${sessionScope.logId}">
            </div>
        </form>
    </div>
</div>

</body>
</html>

<script>
    function decrement() {
        var countElement = document.getElementById('count');
        var currentCount = parseInt(countElement.value);
        if (currentCount > 1) {
            countElement.value = currentCount - 1;
        }
    }

    function increment() {
        var countElement = document.getElementById('count');
        countElement.value = parseInt(countElement.value) + 1;
    }
    function goBack() {
        history.back();
    }
</script>
