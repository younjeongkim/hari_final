<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>HARI</title>
</head>
<body>
<nav>
    <a href="/hari/mainNav">
        <input type="button" class="hamburger">
    </a>
    <div class="basket">
        <div class="basketPlus"></div>
    <input type="button" class="basket-button" onclick="redirectToOrderBasket()">
    </div>
</nav>
    <br>
    <br>
    <div class="locationContainer">
    <div class="locationBox">
        <div class="locationText">내 장소</div>
        <div class="myLocation">
            <input type="button" class="myLocationButton" id="myLocation">
            <!--   위치 API     -->
            <span class="myLocationText" id="myLocationText">서초구 방배동</span>
        </div>
        <br>

        <div class="mainOutLine">
            <div class="menuCategory">
                <ul class="listUnderLine">
                <li><a href="#">전체</a></li>
                <li><a href="#">카페</a></li>
                <li><a href="#">한식</a></li>
                <li><a href="#">양식</a></li>
                <li><a href="#">중식</a></li>
                </ul>
            </div>
            <br>
            <div class="storeBoxContainer" id="storeBoxContainer">

                <br>
            </div>

        </div>
    </div>
    </div>

</body>
<footer class="footerText">HARI</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var options = {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0
    };
    function success(pos) {
        var crd = pos.coords;
        console.log('위도 : ' + crd.latitude);
        console.log('경도: ' + crd.longitude);
        lat = crd.latitude;
        lon = crd.longitude;

        // $.ajax() 함수를 success callback 함수 내에서 실행
        $.ajax({
            url: 'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=' + lon + '&y=' + lat,
            type: 'GET',
            headers: {
                'Authorization': 'KakaoAK 7e4567fb1683a25d1d9f3fc0240900a5'
            },
            success: function(data) {
                console.log(data);
                document.getElementById('myLocationText').innerHTML = data.documents[0].address.region_2depth_name + ' ' + data.documents[0].address.region_3depth_name;

                // 주소 정보를 이용하여 가게 정보를 불러오고 표시
                loadStores(lat, lon);
            }
        });
    }

    function error(err) {
        console.warn('ERROR(' + err.code + '): ' + err.message);
    }

    function loadStores(lat, lon) {
        $.ajax({
            url: '/hari/locateStores',
            type: 'GET',
            data: {
                lat: lat,
                lon: lon
            },
            success: function(data) {
                console.log(data);

                displayStores(data); // 가게 정보를 화면에 표시
            }
        });
    }

    function displayStores(data) {
        var storeContainer = document.getElementById('storeBoxContainer');
        storeContainer.innerHTML = ''; // 기존 내용 초기화

        // data를 반복하여 가게 정보를 생성하여 표시
        data.forEach(function(store) {
            var storeBox = document.createElement('div');
            storeBox.className = 'storeBox';

            var storeImg = document.createElement('div');
            storeImg.className = 'storeImg';
            var img = document.createElement('img');
            img.src = '/img/ame.jpg'; // 가게 이미지 URL
            img.alt = '매장 이미지';
            storeImg.appendChild(img);

            var storeBoxText = document.createElement('div');
            storeBoxText.className = 'storeBoxText';

            var ul = document.createElement('ul');
            var liStoreName = document.createElement('li');
            liStoreName.className = 'storeName';
            var aStoreName = document.createElement('a');
            aStoreName.href = '/hari/orderMenu?bId=' + store.bId; // 가게 상세 페이지 URL에 bId 파라미터 추가 2023-10-19
            // aStoreName.href = '/hari/orderMenu'; // 가게 상세 페이지 URL
            aStoreName.textContent = store.bName; // 가게 이름
            liStoreName.appendChild(aStoreName);

            var liStoreCategory = document.createElement('li');
            liStoreCategory.className = 'storeCategory';
            liStoreCategory.textContent = store.bCategory; // 가게 카테고리

            ul.appendChild(liStoreName);
            ul.appendChild(liStoreCategory);
            storeBoxText.appendChild(ul);

            storeBox.appendChild(storeImg);
            storeBox.appendChild(storeBoxText);

            storeContainer.appendChild(storeBox);
        });
    }

    $("#myLocation").click(function() {
        navigator.geolocation.getCurrentPosition(success, error, options);
    });

    // 페이지 로드 시 위치 정보 가져오기
    $(document).ready(function () {
        // 위치 정보 액세스 권한을 요청
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(success, error, options);
        } else {
            console.log("브라우저가 위치 정보를 지원하지 않습니다.");
        }
    });

    // / 카트 임
    function redirectToOrderBasket() {
        window.location.href = "/hari/orderBasket";
    }
</script>

</html>