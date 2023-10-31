<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/orderDetail.css">
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
                <div class="menuCategoryText">주문을 확인 해주세요</div>
            </div>
            <br>

            <!-- 주문 DB 불러오기 원본코드 -->
            <c:forEach items="${selectedProducts}" var="item">
                <div class="orderDetailSec">
                    <img src="data:image/jpeg;base64,${item.mImg_base64}" alt="${item.mName}" class="orderImg">
                    <ul>
                        <li><span>${item.mName}</span></li>
                        <li><span>${item.temperature}</span></li>
                        <li><span>${item.mPrice}</span><span>원</span></li>
                        <li><span>수량</span><span> ${item.mCnt} </span><span>개</span></li>
                    </ul>
                </div>
            </c:forEach>

            <br>
            <div class="couponSec">
                <img src="/img/coupon.png" alt="쿠폰" class="couponIcon">
                <input type="text" placeholder="쿠폰 번호를 입력 해주세요" class="couponInput">
                <input type="button" value="등록" class="couponInsert">
            </div>
            <br>
            <div class="payAmount">
                <ul>
                    <li>주문 금액<span class="price">${totalAmount}<span>원</span></span></li>
                    <li>할인 금액<span class="price">${discountAmount}<span>원</span></span></li>
                    <li>최종 결제 금액<span class="price">${payAmount}<span>원</span></span></li>
                </ul>
                <script>
                    var payAmount = "${payAmount}";
                </script>

            </div>

            <br>
            <div class="payButton">
                <button class="pay" onclick="requestPay()">결제하기</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script>
    var IMP = window.IMP;
    IMP.init('imp15846883');

    function requestPay() {
        IMP.request_pay({
            pg: "inicis",
            pay_method: "card",
            merchant_uid : 'merchant_'+ new Date().getTime(),
            name : '(주)HARI👻',
            amount : payAmount,
            // buyer_name : '구매자',
            // buyer_tel : '010-1234-5678',
        }, function (rsp) { // callback
            console.log(rsp);

            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';

                alert(msg);

                clearBasket();

                // 해당 코드는 결제 완료 후, 리다이렉트할 url 설정
                location.href = '/hari/main';
            } else {
                var msg = '결제가 실패하였습니다.';

                msg += '에러 내용 : ' + rsp.error_msg;

                alert(msg);
                location.href = '/hari/main';
            }
        });
    }

    // 지현_추가 결제 완료 시, 장바구니 비우기
    // 장바구니 비우기 함수
    function clearBasket() {
        $.ajax({
            type: 'POST',
            url: '/hari/clearBasket', // 장바구니 비우기를 처리할 URL
            success: function (response) {
                if (response === 'success') {
                    console.log('장바구니가 비워졌습니다.');
                } else {
                    console.log('장바구니 비우기 실패');
                }
            },
            error: function () {
                console.log('장바구니 비우기 요청 중 오류 발생');
            }
        });
    }
    function goBack() {
        history.back();
    }
</script>
