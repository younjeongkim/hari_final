<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/orderMenu.css">
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
<div class="micBox">
    <button style="display: flex; justify-content: right;" class="micBoxClose">X</button>

    <div style="display: flex; flex-direction:column; justify-content: center; align-items: center">

        <div class="dictate">
            <svg width="3rem" height="3rem" viewBox="0 0 100 100">
                <g stroke="#fff" stroke-width="20">
                    <path d="M20,20 20,80">
                        <animate attributeName="d" values="M20,40 20,60;M20,20 20,80;M20,40 20,60" dur="1s" repeatCount="indefinite" />
                    </path>
                    <path d="M50,10 50,90">
                        <animate attributeName="d" values="M50,10 50,90;M50,40 50,60;M50,10 50,90" dur="1s" repeatCount="indefinite" />
                    </path>
                    <path d="M80,20 80,80">
                        <animate attributeName="d" values="M80,40 80,60;M80,20 80,80;M80,40 80,60" dur="1s" repeatCount="indefinite" />
                    </path>
                </g>
            </svg>
        </div>
        <div class="search">
            <div class="input-bar">
                <input type="text" placeholder="주문을 말해주세요" autocomplete="off">
            </div>
        </div>
        <div class="orderFin">
            <input type="button" value="완료" class="finButton">
        </div>
    </div>
</div>



<div class="locationContainer">

    <div class="locationBox">
        <br>
        <br>
        <div class="myLocation">

            <span class="myLocationText">${bName}</span>
        </div>
        <br>
        <br>

        <c:forEach var="dto" items="${list}">
        <div class="storeBox">
            <div class="storeImg"><img src="data:image/jpeg;base64,${dto.mImg_base64}" alt="매장 이미지"></div>
            <div class="storeBoxText">
                <ul>
                    <li class="storeName"><a href="/hari/orderOption?mNo=${dto.mNo}&bId=${dto.bId}">${dto.mName}</a></li>
                    <li class="storeCategory"><span>${dto.mPrice}</span><span>원</span></li>
                </ul>
            </div>

        </div>
            <br>
        </c:forEach>


        <!--   플로팅 배너     -->
        <div class="banner"  style="display: flex; justify-content: center; top: 570px;" >
            <div id="floatMenu">
                <div class="floatingButton">
                    <input type="button" class="location-button">
                </div>

                <div class="floatingButton">
                    <input type="button" class="mic-button" id="dropMic">
                </div>

                <div class="basket" onclick="redirectToOrderBasket()">
                    <div class="basketPlus"></div>
                    <input type="button" class="basket-button">
                </div>
            </div>
        </div>
    </div>
</div>


<footer class="footerText">HARI</footer>



</body>
</html>

<script>
    function redirectToOrderBasket() {
        window.location.href = "/hari/orderBasket";
    }



    /* 스크롤 이벤트 핸들러 */
    window.addEventListener('scroll', function() {
        // 스크롤 위치를 가져온다.
        var scrollY = window.scrollY;

        // 배너의 위치를 스크롤 위치에 따라 조정한다.
        var bannerY = document.querySelector('.banner').style.top;
        if (scrollY > bannerY) {
            // 스크롤 위치가 배너의 시작 위치보다 크면 배너를 고정한다.
            document.querySelector('.banner').style.top = bannerY;
        }
    });

    // 버튼 클릭 시 마이크 박스 내려온다
    document.querySelector('.mic-button').addEventListener('click', function() {

        // 배너를 표시한다.
        document.querySelector('.micBox').style.display = 'block';


    });

    document.querySelector('.micBoxClose').addEventListener('click', function (){

        document.querySelector('.micBox').style.display='none'
    });

    const $ = (el) => document.querySelector(el);

    const store = {
        texts : '',
        isRecognizing: true
    };

    (() => {
        /* Speech API start */
        let SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        if(!("webkitSpeechRecognition" in window)){
            alert("지원 안되는 브라우저 입니다. !")
        } else {
            const recognition = new SpeechRecognition();
            recognition.interimResults = true; // true면 음절을 연속적으로 인식하나 false면 한 음절만 기록함
            recognition.lang = 'ko-KR'; // 값이 없으면 HTML의 <html lang="en">을 참고합니다. ko-KR, en-US
            recognition.continuous = false; //각 인식에 대해 연속 결과가 반환되는지 아니면 단일 결과만 반환되는지를 제어합니다. 기본값은 단일( false.)
            recognition.maxAlternatives = 20000; // maxAlternatives가 숫자가 작을수록 발음대로 적고, 크면 문장의 적합도에 따라 알맞은 단어로 대체합니다.

            recognition.onspeechend = function() { // 음성 감지가 끝날때 실행될 이벤트
                recognition.stop();
                $('.mic-button').classList.remove("on");
                store.isRecognizing = true;
            };

            recognition.onresult = function(e) { //result이벤트는 음성 인식 서비스가 결과를 반환할 때 시작됩니다.
                store.texts = Array.from(e.results)
                    .map(results => results[0].transcript).join("");

                console.log(store.texts)
                $('.input-bar input').value = store.texts;
            };
            /* // Speech API END */

            const active = () => {
                $('.mic-button').classList.add('on')
                recognition.start();
                store.isRecognizing = false;
            };

            const unactive = () => {
                $('.mic-button').classList.remove('on')
                recognition.stop();
                store.isRecognizing = true;
            };

            $('.mic-button').addEventListener('click', () => {
                if(store.isRecognizing){
                    active();
                } else {
                    unactive();
                }
            });
        }
    })();

// 10-23-20:40
    document.querySelector('.finButton').addEventListener('click', function() {
        var inputText = document.querySelector('.input-bar input').value.trim();

        if (inputText !== '') {
            // window.location.href = "/hari/predict?order=" + encodeURIComponent(inputText);
            window.location.href = "/hari/main?order=" + encodeURIComponent(inputText);
        }
    });
    function goBack() {
        history.back();
    }
</script>