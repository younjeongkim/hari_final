<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/shopMenuWrite.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>우리 가게 관리</title>
</head>
<script type="text/javascript">
    function convertImageToBase64(event){
        const fileInput = event.target;
        const file = fileInput.files[0];
        const reader = new FileReader();

        reader.onload = function (event) {
            const base64 = event.target.result;
            document.getElementById("mImg_base64_input").value = base64;
        };

        reader.readAsDataURL(file);
    }

</script>

<body>
<nav>
    <a href="/"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="/img/loginWeb.png" class="loginIcon" alt="home">
    </div>
</nav>
<hr>
<div class="MenuWritePageContainer">
    <div class="MenuWriteContainer">
        <div class="MenuWriteBox">
            <div class="MenuWritePageTitle">우리 가게 관리 ㅣ 메뉴 등록</div><br>
            <div class="formText">
            <div class=>가게 이름</div>

            <br>

                <form action="/hari/shopMenuWriteOk" method="post" enctype="multipart/form-data">
                    <div class="mBox">

                        <input type="hidden" name="mNo" id="mNo" value="${mNo}" class="mInputRow" required>
                        <input type="hidden" name="bId" id="bId" value="${bId}" class="mInputRow" required>

                        <div>메뉴명<br>
                            <input class="mInputRow" type="text" name="mName" id="mName"/><br>
                        </div> <br>
                        <div>메뉴 사진<br>
                            <input class="mInputRow" type="file" onchange="convertImageToBase64(event);"/>
                            <input type="hidden" name="mImg_base64" id="mImg_base64_input">
                            <br>
                        </div> <br>
                        <div>메뉴 가격 <br>
                            <input class="mInputRow" type="text" name="mPrice" id="mPrice"><br>
                        </div> <br>
                        <div>메뉴 설명<br>
                            <textarea class="mInputRow" name="mContent" id="mContent"></textarea><br>
                        </div> <br>
                        <div>메뉴 분류<br>
                            <select class="dropRow" name="mType" id="mType">
                                <option value="1">카페</option>
                                <option value="2">한식</option>
                                <option value="3">양식</option>
                                <option value="4">중식</option>
                                <option value="5">일식</option>
                            </select><br>
                        </div>
                        <div>
                            <input type="text" name="mStatus" id="mStatus" value="Y" class="mInputRow" >
                        </div>
                        <br>
                        <input class="mwButton" type="submit" value="확인">
                    </div>
                </form>
            </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>