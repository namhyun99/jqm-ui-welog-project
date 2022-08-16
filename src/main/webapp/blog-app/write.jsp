<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- jquery mobile -->
  <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
  <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
  <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
  <!-- fontawesome.js -->
  <script src="https://kit.fontawesome.com/fbdfc0aa10.js"></script>
  <!-- custom scripts -->
  <script src="../blog-app/include/js/include.js"></script>
  <!-- summernote css/js -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <script type="text/javascript">
	$(function() {
		$("#summernote").summernote({
			height : 250,
			minHeight : null,
			maxHeight : null,
			tabsize: 2,
			focus : true,
			lang : "ko-KR",
			placeholder : '글을 작성해주세요.',
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert', ['link', 'picture', 'video']],
			    ['view', ['codeview']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36']
		});
		
		$("#btnSave").click(function() {
			document.writeform.action = "<%=request.getContextPath()%>/board/write.do";
			document.writeform.submit();
		})
		
		$("#btnExit").click(function() {
			location.href="index.jsp";
		})
		
	});
  </script>
  <title>글쓰기</title>
</head>

<body>
	<!-- 세션체크 -->
	<%@ include file="../blog-app/include/session_check.jsp"%>

	<!-- 메인페이지 -->
	<div data-role="page" id="page">
		<!--헤더영역-->
		<%@ include file="../blog-app/include/header.jsp"%>

		<!-- 메뉴패널 -->
		<%@ include file="../blog-app/include/menupanel.jsp"%>

		<!-- 컨텐츠 영역 -->
		<div data-role="content">
			<h2>글작성</h2>
			<hr>
			<form name="writeform" method="post"
				action="<%=request.getContextPath()%>/board/write.do">
				<select name="category" data-mini="true" data-inline="true">
					<option value="">카테고리</option>
					<option value="꿀팁모음">꿀팁모음</option>
					<option value="스터디">스터디</option>
				</select> <input type="text" name="title" id="title" 
					maxlength="50" placeholder="제목을 입력하세요.">
				<textarea id="summernote" name="editordate"></textarea>
				<input type="hidden" name="userid" value="<%=userid%>">
				<button type="button" id="btnSave" data-theme="b">글작성</button>
				<button type="button" id="btnExit">취소</button>
			</form>
		</div>

		<!--푸터영역-->
		<%@ include file="../blog-app/include/footer.jsp"%>
	</div>
</body>

</html>