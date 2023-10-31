<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8" >
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/qnaList.css">
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
  <div class="boardListContainer">
    <div class="boardListBox">
      <div class="titleNButton">
        <div class="boardPageTitle">고객 문의</div><br>
        <div style="display: none">총 레코드 수 : ${pagingDTO.totalRecord}</div>
        <div style="margin-left: auto;">
          <a href="/hari/qnaWrite">
            <button>글쓰기</button>
          </a>
        </div>
      </div>
      <ul class="boardTop">
        <li class="boardTopText">TITLE</li>
        <li class="boardTopText">ID</li>
        <li class="boardTopText">DATE</li>
      </ul>

      <c:forEach var="dto" items="${list }">
        <ul>
          <li>
            <a href='/hari/qnaView?qNo=${dto.qNo}&nowPage=${pagingDTO.nowPage}<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
                ${dto.subject}
            </a>
          </li>
          <li>${dto.userId}</li>
          <li>${dto.createdAt}</li>
        </ul>
      </c:forEach>


    </div>

  </div>
  <!--  페이징      -->
  <div class="paging">
    <ul>
      <c:if test="${pagingDTO.nowPage == 1}">
        <li class="pagingNum"><a>prev</a></li>
      </c:if>
      <c:if test="${pagingDTO.nowPage > 1}">
        <li class="pagingNum">
          <a href='/hari/qnaList?nowPage=${pagingDTO.nowPage - 1 }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
            prev
          </a>
        </li>
      </c:if>

      <c:forEach var="p" begin="${pagingDTO.startPageNum }" end="${pagingDTO.startPageNum + pagingDTO.onePageNumCount - 1}" step="1">
        <c:if test="${p <= pagingDTO.totalPage }">
          <c:if test="${p == pagingDTO.nowPage }">
            <li class="pagingNum">
              <a href='/hari/qnaList?nowPage=${p }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
                  ${p }
              </a>
            </li>
          </c:if>
          <c:if test="${p != pagingDTO.nowPage }">
            <li class="pagingNum">
              <a href='/hari/qnaList?nowPage=${p }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
                  ${p }
              </a>
            </li>
          </c:if>
        </c:if>
      </c:forEach>

      <c:if test="${pagingDTO.totalPage <= pagingDTO.nowPage }">
        <li class="pagingNum"><a>next</a></li>
      </c:if>
      <c:if test="${pagingDTO.totalPage > pagingDTO.nowPage }">
        <li class="pagingNum">
          <a href='/hari/qnaList?nowPage=${pagingDTO.nowPage + 1 }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
            next
          </a>
        </li>
      </c:if>
    </ul>
  </div>

  <div class="searchBar"><br>
    <form action="/hari/qnaList" style="display: flex; flex-direction: row; justify-content: center; align-items: center;">
      <select class="dropRow" name="searchKey" id="searchKeySelect" style="height: 30px; font-size: 12px;">
        <option value="userId">아이디</option>
        <option value="subject">제목</option>
        <option value="content">본문</option>
      </select><br>
      <input type="text" class="searchBox" name="searchWord" id="searchWord">
      <input style="border: 0;
                  width: 100px;
                  height: 30px;
                  background:#0DA2AB;
                  color:#ffffff;
                  border-radius: 5px;
                  font-family: 'Noto Sans KR', sans-serif;
                  font-size: 16px;
                  cursor: pointer;
                  " type="button" class="searchButton" value="검색" onclick="executeSearch()">
    </form>
  </div>

</div>
</body>
</html>

<script>
  function goBack() {
    history.back();
  }

  // 페이지 로드 시, URL 파라미터를 확인하여 선택된 옵션을 설정
  window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const selectedOption = urlParams.get("searchKey");

    if (selectedOption) {
      const searchKeySelect = document.getElementById("searchKeySelect");
      searchKeySelect.value = selectedOption;
    }
  }

  function executeSearch() {
    const searchKeySelect = document.getElementById("searchKeySelect");
    const searchWord = document.getElementById("searchWord").value;

    // 선택된 검색 키와 검색어를 가져옵니다.
    const selectedOption = searchKeySelect.value;

    // 현재 페이지 URL을 가져옵니다.
    const currentURL = window.location.href;

    // 검색 키와 검색어를 URL 파라미터로 추가합니다.
    const updatedURL = new URL(currentURL);
    updatedURL.searchParams.set("searchKey", selectedOption);
    updatedURL.searchParams.set("searchWord", searchWord);

    // 새로운 URL로 이동합니다.
    window.location.href = updatedURL.toString();
  }

</script>