<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/orderBasket.css">
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
        <div class="detailBox">
            <div class="menuCategory">
                <div class="menuCategoryText" >장바구니를 확인 해주세요</div>
            </div>
            <br>
            <!-- 주문 DB 불러오기-->
            <form action="/hari/orderDetail" method="post">
            <c:forEach items="${basketList}" var="item">
                <div class="orderDetailBox">
                    <input type="hidden" value="${item.userId}" />
                    <div style="display: flex; justify-content: right; margin: 5px;">
                        <input type="checkbox" class="basketCheck" value="${item.mNo},${item.temperature}">
                    </div>
                    <div class="orderDetailSec">
                        <img src="data:image/jpeg;base64,${item.mImg_base64}" alt="커피" class="orderImg">
                        <ul>
                            <li><span>${item.mName}</span></li>
                            <li><span>${item.temperature}</span></li>
                            <li><span>${item.mPrice}</span><span>원</span></li>
                            <li><span>수량</span><span> ${item.mCnt} </span><span>개</span></li>
                        </ul>
                    </div>
                </div>
                <br>
            </c:forEach>

                <!-- 선택된 상품 번호를 담을 hidden input 추가 -->
                <input type="hidden" name="selectedProducts">
                <div class="orderButtonSec" >

                    <button type="submit" class="orderButton">주문하기</button>
<%--                    onclick="submitForm()"--%>
            </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>
<script>
    document.querySelector(".orderButton").addEventListener("click", function () {
        // 선택된 항목을 배열로 저장
        var selectedProducts = [];
        var checkboxes = document.querySelectorAll(".basketCheck");
        checkboxes.forEach(function (checkbox) {
            if (checkbox.checked) {  // 체크박스가 선택된 경우만 처리
                selectedProducts.push(checkbox.value);
            }
        });

        // 선택된 항목을 컴마로 구분된 문자열로 변환하여 hidden input에 설정
        document.querySelector("input[name='selectedProducts']").value = selectedProducts.join(",");

        // 폼 제출 전에 기본 동작 중단
        event.preventDefault();

        // 폼 제출
        document.querySelector("form").submit();
    });


    function goBack() {
        history.back();
    }
</script>