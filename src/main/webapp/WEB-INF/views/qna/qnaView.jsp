<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String logId = (String) session.getAttribute("logId"); %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8" >
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/boardView.css">
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

      <div class="boardPageTitle">고객 문의</div><br>
      <ul class="boarTitle">
        <li class="boardWriteTitle">제목</li>
        <li class="boardWriteTitle">${qnaDTO.subject}</li>
      </ul>
      <div class="boardContentBox">
        <div class="boardWriteContent" >${qnaDTO.content}</div><br>
      </div>
      <hr>

      <div>
        <button onclick="goList()">목록</button>
        <c:if test="${logId == qnaDTO.userId}">
          <button onclick="qnaEdit()">수정</button>
          <button onclick="qnaDel()">삭제</button>
        </c:if>
      </div>
    </div>
    <br>

    <div id="qnaReply">

      <c:if test="${logId == qnaDTO.userId || logId == 'admin'}">
        <div class="replyTitle">댓글 쓰기</div>
        <form action="/hari/qnaReplyWrite" id="qnaReplyFrm" method="post">
          <input type="hidden" name="qNo" value="${qnaDTO.qNo}">
          <textarea name="rContent" id="qnaReplyContent"></textarea>
          <input type="submit" value="작성" class="replyButton">
        </form>
      </c:if>


      <c:if test="${logId == qnaDTO.userId || logId == 'admin'}">
        <div class="replyTitle">댓글 보기</div>
        <ul id="qnaReplyList">
          <c:forEach var="qnaReplyContent" items="${qnaReplyList}">
            <li>
              <div>
                <b>${qnaReplyContent.userId} (${qnaReplyContent.createdAt})</b>
                <p>${qnaReplyContent.rContent}</p>
              </div>
            </li>
          </c:forEach>
        </ul>
      </c:if>
    </div>
  </div>
</div>
</body>
<footer class="footerText">HARI</footer>
</html>

<script>
  function goList() {
    window.location.href = '/hari/qnaList';
  }


  $(function () {
    function qnaReplyAllList() {
      var qNo = ${qnaDTO.qNo};
      var logId = "${logId}";

      $.ajax({
        url : '/hari/qnaReplyList',
        data : {qNo : qNo},
        dataType : 'json',
        success : function(qnaReplyResult) {
          $("#qnaReplyList").html("");

          console.log(qnaReplyResult);

          $(qnaReplyResult).each(function(i, qnaReplyContent) {
            console.log(qnaReplyContent);

            var tag = "<li><div>";

            tag += "<b>" +"작성자 : " + qnaReplyContent.userId + "</b>";

            if (logId === qnaReplyContent.userId || logId === "admin") {
              // tag += "<input type='button' value='Edit' class='replyButton' />";
              // tag += "<input type='button' value='Del' class='replyButton' data-rno='" + qnaReplyContent.rNo + "'/>";
              tag += "<p class='replycon'>" + "내용: " + qnaReplyContent.rContent + "</p></div>";

              // 수정폼
              tag += "<div style='display: none'>";
              tag += "<form>";
              tag += "<textarea style='width: 400px; height: 20px; ' name='qnaReplyContent'>";

              // 글 내용 수정, 댓글번호
              tag += qnaReplyContent.rContent;
              tag += "</textarea>";
              tag += "<input type='hidden' name='rNo' value='" + qnaReplyContent.rNo + "'>";
              tag += "<input type='button' value='수정' class='replyButton'/>";

              tag += "</form>";
              tag += "</div>";
            } else {
              tag += "<p>" + qnaReplyContent.rContent + "</p></div>";
            }

            tag += "</li>";

            $("#qnaReplyList").append(tag);
          });
        },

        error : function (e) {
          console.log(e.responseText);
        }
      });
    }

    $("#qnaReplyFrm").submit(function (event) {
      // form태그의 기본 이동의 기능을 가진 action으로 이동하는 것을 해제
      event.preventDefault();

      // 0. 댓글 입력 확인
      var qnaReplyContent = $("#qnaReplyContent").val();

      if (!qnaReplyContent) {
        alert("댓글을 입력하세요.");

        return;
      }

      // 1. 데이터 준비 no=99&content=댓글내용 -> 폼 내의 값을 쿼리로 만들어주는 함수(serialize)
      var params = $("#qnaReplyFrm").serialize();

      console.log('params', params);

      // 2. ajax 실행
      $.ajax({
        url: '/hari/qnaReplyWrite',
        type: 'POST',
        data: params,
        success: function (result) {
          console.log("result : " + result);

          // 이미 DB에 등록된 글 폼에서 지우기
          $("#rContent").val("");

          // 댓글 리스트 다시 출력
          qnaReplyAllList();
        },
        error: function (e) {
          console.log(e.responseText);
        }
      });
    });

    // 댓글 수정 폼
    $(document).on('click', '#qnaReplyList input[value=Edit]', function () {
      var $replyDiv = $(this).parent();
      var $editFormDiv = $replyDiv.next();

      // 해당 댓글을 수정 폼으로 전환
      $replyDiv.hide();
      $editFormDiv.show();
    });

    // 댓글 수정(DB)
    $(document).on('click', '#qnaReplyList input[value=수정하기]', function () {
      var $editForm = $(this).closest('form');
      var params = $editForm.serialize();

      $.ajax({
        url: '/hari/qnaReplyEditOk',
        data: params,
        type: 'POST',
        success: function (result) {
          if (result == '0') {
            alert('댓글이 수정되지 않았습니다.');
          } else {
            qnaReplyAllList();
          }
        },
        error: function (e) {
          console.log("댓글 수정 실패");
        }
      });
    });

    $(document).on('click', '#qnaReplyList input[value=Del]', function () {
      if (!confirm('댓글을 삭제하시겠습니까?')) {
        return false;
      }

      var rNo = $(this).data('rNo');
      var logId = "<%= session.getAttribute("logId") %>";

      if (logId === 'admin' || logId === rNo) {
        $.ajax({
          url: '/hari/qnaReplyDelete?rNo=' + rNo,
          data: {rNo: rNo},
          success: function (result) {
            if (result == '0') {
              alert("댓글이 삭제되어 않았습니다.");
            } else {
              qnaReplyAllList();
            }
          },
          error: function (e) {
            console.log("댓글 삭제 에러 발생");
          }
        });
      } else {
        alert("댓글을 삭제할 권한이 없습니다.");
      }
    });
    qnaReplyAllList();
  });
</script>