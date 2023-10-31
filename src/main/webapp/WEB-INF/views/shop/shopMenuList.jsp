<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="ko">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/shopMenuList.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>우리 가게 관리</title>
</head>
<body>
<nav>
    <a href="/"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="/img/loginWeb.png" class="loginIcon" alt="home">
    </div>
</nav>
<hr>

<%--2023-10-13-jihan--%>
<div class="MenuListPageContainer">
    <div class="MenuListContainer">
        <div class="MenuListBox">
            <div class="MenuListPageTitle">우리 가게 관리 ㅣ 메뉴 리스트</div><br>
            <form action="/hari/shopMenuList">
                <input type="hidden" id="bId" value="${list[0].bId}">
                <div class="MenuCardList">
                    <c:forEach var="dto" items="${list }">
                        <div class="MenuCardSec">
                            <div class="MenuCard">

                                <div class="imgSec">
                                    <img class="MenuThumb" src="data:image/jpeg;base64,${dto.mImg_base64}" alt="${dto.mName}">
                                </div>
                                <div class="MenuExText">
                                    <li>메뉴명<span>${dto.mName}</span></li>
                                        <%--                            <div>Menu ID: ${dto.mNo}</div>--%>
                                    <li>메뉴 가격<span class="price">${dto.mPrice}<span>원</span></li>
                                    <li>메뉴 설명<span class="MenuScript">${dto.mContent}</span></li>
                                    <li>메뉴 분류<span>${dto.mType}</span></li>
                                </div>
                            </div>
                            <input class="cardCheckBox" type="checkbox" value="${dto.mNo}"/>

                        </div>
                    </c:forEach>
                </div>
                <br>
                <div class="ButtonSec">
                    <a href="/hari/shopMenuWrite">
                        <input type="button" class="delMemu" value="등록" />
                    </a>
                    <input type="button" class="delMemu" value="삭제" />
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

<script>

    const deleteButtons = document.getElementsByClassName("delMemu");
    console.log("Delete buttons found:", deleteButtons.length);
    document.getElementsByClassName("delMemu")[1].addEventListener("click", function(event) {
        console.log("Delete button clicked");  // 추가된 로그
        const selectedIds = [];
        const checkboxes = document.querySelectorAll(".cardCheckBox:checked");
        const form = document.querySelector("form");
        const bId = document.getElementById("bId").value;

        checkboxes.forEach(function(checkbox) {
            console.log("Checkbox value:", checkbox.value);  // 이 부분 추가
            selectedIds.push(checkbox.value);
        });
        console.log("Selected IDs:", selectedIds);  // 추가된 로그

        if (selectedIds.length > 0) {
            // 선택된 상품 ID를 hidden input으로 폼에 추가
            selectedIds.forEach(id => {
                const input = document.createElement("input");
                input.type = "hidden";
                input.name = "mNo";
                input.value = id;
                form.appendChild(input);


            });
// bId 값을 hidden input으로 폼에 추가
            const bIdInput = document.createElement("input");
            bIdInput.type = "hidden";
            bIdInput.name = "bId";
            bIdInput.value = bId;
            form.appendChild(bIdInput);


            // 폼의 action 속성을 변경하고 폼 제출
            form.action = "/hari/shopMenuDelete";
            console.log("Form action set to:", form.action);  // 추가된 로그
            form.method = "post";  // method를 post로 설정
            console.log("Submitting form...");  // 추가된 로그
            form.submit();
        } else {
            alert("삭제할 상품을 선택해주세요.");
        }
    });

</script>