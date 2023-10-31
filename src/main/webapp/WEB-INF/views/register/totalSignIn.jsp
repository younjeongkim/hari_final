<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/totalSignIn.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>회원가입</title>
</head>
<body>
<nav>
    <a href="/hari/mainNav"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="/img/loginWeb.png" class="loginIcon" alt="home" onclick="goBack()">
    </div>
</nav>
<hr>
<div class="SPageContainer">
    <div class="SignInContainer">
        <div class="SignInBox">
            <div class="SignInTitleBar">

                <div class="SPageTitle" id="userSignTitle" style="display:block">일반 회원가입</div>
                <div class="SPageTitle" id="bizSignTitle" style="display:none;">비즈니스 회원가입</div>
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
            <!--        <form action="/hari/totalLogIn" method="post" id="userSign"  style="display:block;" >-->
            <form action="/hari/userSignInOk" method="post" id="userSign"  style="display:block;" >

                <div class="SBox">
                    <div class="SRow">
                        <img src="/img/idIcon.png" class="SIcon" alt="아이디">
                        <input class="SInputRow" type="text" name="userId" placeholder="아이디"/>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/lock.png" class="SIcon" alt="비밀번호">
                        <input class="SInputRow" type="password" name="userPwd" placeholder="비밀번호"/>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/mail.png" class="SIcon" alt="이메일">
                        <input class="SInputRow" type="text" name="email" placeholder="이메일"/>
                    </div>
                </div>
                <br><br>
                <div class="SBox">
                    <div class="SRow">
                        <img src="/img/idIcon.png" class="SIcon" alt="이름">
                        <input class="SInputRow" type="text" name="userName" placeholder="이름"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/idIcon.png" class="SIcon" alt="닉네임">
                        <input class="SInputRow" type="text" name="nickName" placeholder="닉네임"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/phone.png" class="SIcon" alt="연락처">
                        <input class="SInputRow" type="text" name="phone" placeholder="연락처"/><br>
                    </div>


                </div>
                <br>
                <input class="SignInButton" type="submit" value="확인">
            </form>

            <!--            <form action="/hari/totalLogIn" method="post" id="bizSign"  style="display:none;">-->
            <form action="/hari/shopSignInOk" method="post" id="bizSign"  style="display:none;">
                <div class="bizSignInBox">
                    <div class="SBox">
                        <div class="SRow">
                            <img src="/img/idIcon.png" class="SIcon" alt="아이디">
                            <input class="SInputRow" type="text" name="bId" placeholder="아이디"/>
                        </div>
                        <hr class="SignBoxLine">
                        <div class="SRow">
                            <img src="/img/lock.png" class="SIcon" alt="비밀번호">
                            <input class="SInputRow" type="password" name="bPwd" placeholder="비밀번호"/>
                        </div>
                        <hr class="SignBoxLine">
                        <div class="SRow">
                            <img src="/img/mail.png" class="SIcon" alt="이메일">
                            <input class="SInputRow" type="text" name="bEmail" placeholder="이메일"/>
                        </div>
                    </div>

                    <br><br>

                    <div class="SBox">
                        <div class="SRow">
                            <img src="/img/idIcon.png" class="SIcon" alt="대표자 이름">
                            <input class="SInputRow" type="text" name="bOwner" placeholder="대표자 이름"/><br>
                        </div>

                        <hr class="SignBoxLine">

                        <div class="SRow">
                            <img src="/img/phone.png" class="SIcon" alt="연락처">
                            <input class="SInputRow" type="text" name="bPhone" placeholder="연락처"/><br>
                        </div>

                        <hr class="SignBoxLine">

                        <div class="SRow">
                            <img src="/img/shop.png" class="SIcon" alt="가게 이름">
                            <input class="SInputRow" type="text" name="bName" placeholder="가게 이름"/><br>
                        </div>

                        <hr class="SignBoxLine">

                        <div class="SRow">
                            <img src="/img/shop.png" class="SIcon" alt="사업자등록번호">
                            <input class="SInputRow" type="text" name="bNo" placeholder="사업자등록번호"/><br>
                        </div>

                        <hr class="SignBoxLine">

                        <div class="SRow_shopAddr">
                            <img src="/img/shop.png" class="SIcon" alt="가게 주소">
                            <span class="shopAddr">가게 주소</span>
                        </div>

                        <div style="display: block; width: 100%;">
                            <div>
                                <div class="SRow_addr">

                                    <input type="text" name="bAddr" id="addrDB" placeholder="가게 주소" style="visibility: hidden; height:0;"/>
                                    <input type="text" name="bLatitude" id="lat" style="visibility: hidden; height:0;">
                                    <input type="text" name="bLongitude" id="lng" style="visibility: hidden; height:0;">

                                    <input type="text" id="postcode" class="inputAddr" placeholder="우편번호">
                                    <div style="display:flex; justify-content: right" >
                                        <input type="button" onclick="execDaumPostcode()" class="postCodeButton" value="우편번호 찾기" >
                                    </div>
                                    <input type="text" id="address" class="inputAddr" placeholder="주소">

                                    <input type="text" id="detailAddress" class="inputAddr" placeholder="상세주소">
                                    <input type="text" id="extraAddress" class="inputAddr" placeholder="참고항목">

                                    <div style="width: 100%;">
                                        <div id="wrap" style="display:none;border:1px solid;width:100%;height:auto;margin:5px 0;position:relative">
                                            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <hr class="SignBoxLine">

                        <div class="SRow">
                            <img src="/img/shop.png" class="SIcon" alt="업종 분류">
                            <input class="SInputRow" type="text" name="bCategory" placeholder="업종 분류"/><br>
                        </div>
                        <br>
                        <input class="SignInButton" type="submit" id="bizSignInSubmit"value="확인">

                    </div>
                </div>
            </form>

            <br>
        </div>
    </div>
</div>
</body>

<%--카카오 우편번호 서비스 자바스크립트--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function foldDaumPostcode() {
        var element_wrap = document.getElementById('wrap');
        element_wrap.style.display = 'none';
    }

    function execDaumPostcode() {
        var element_wrap = document.getElementById('wrap');

        const currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function (data) {
                let addr = '';
                let detailAddress = '';
                let extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("extraAddress").value = extraAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").focus();
                document.getElementById("detailAddress").value = detailAddress;
                document.getElementById("addrDB").value=addr;

                // iframe을 넣은 element를 안보이게 합니다.
                element_wrap.style.display = 'none';

                document.body.scrollTop = currentScroll;

                // Kakao API로 주소 검색을 실행
                console.log(addr);


                $.ajax({
                    url: 'https://dapi.kakao.com/v2/local/search/address.json', // 주소를 JSON으로 요청
                    type: 'GET',
                    headers: {
                        'Authorization': 'KakaoAK 7e4567fb1683a25d1d9f3fc0240900a5'
                    },
                    data: { query: addr },
                    success: function (response) {
                        if (response && response.documents && response.documents.length > 0) {
                            const lat = response.documents[0].y;
                            const lng = response.documents[0].x;
                            console.log("변환된 경도, 위도");
                            console.log(lat, lng);
                            document.getElementById("lat").value=lat;
                            document.getElementById("lng").value=lng;

                        } else {
                            console.log('주소 정보를 찾을 수 없습니다.');
                        }
                    },
                    error: function (error) {
                        console.error('오류 발생:', error);
                    }
                });
            },
            onresize: function (size) {
                element_wrap.style.height = size.height + 'px';
            },
            width: '100%',
            height: '100%'
        }).embed(element_wrap);

        element_wrap.style.display = 'block';
    }
</script>

<script>
    const toggle=document.querySelector('#toggle');
    toggle.addEventListener('change', (event) => {
        if (toggle.checked) {
            //체크박스 체크 되면 나타나고
            const bizSignTitle = document.querySelector('#bizSignTitle');
            const bizSign = document.querySelector('#bizSign');
            const userSign = document.querySelector('#userSign');
            const userSignTitle = document.querySelector('#userSignTitle');


            if (bizSign) {
                bizSignTitle.style.display="block";
                bizSign.style.display = "block";
                userSign.style.display="none";
                userSignTitle.style.display="none";
            }
        } else {
            //체크박스 체크 해제 되면 사라진다
            const bizSignTitle = document.querySelector('#bizSignTitle');
            const bizSign = document.querySelector('#bizSign');
            const userSign = document.querySelector('#userSign');
            const userSignTitle = document.querySelector('#userSignTitle');
            bizSignTitle.style.display="none";
            bizSign.style.display = "none";
            userSign.style.display="block";
            userSignTitle.style.display="block";
        }
    })

    function goBack() {
        history.back();
    }

</script>
</html>