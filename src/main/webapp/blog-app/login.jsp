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
  <script type="text/javascript">
  $(function(){
		$("#btnLogin").click(function(){
			var userid = $("#userid");
			var passwd = $("#passwd")
			
			if(userid.val() == ""){
				alert("아이디를 입력하세요");
				userid.focus();
				return;
			}
			
			if(passwd.val() == ""){
				alert("패스워드를 입력하세요");
				passwd.focus();
				return;
			}
			
			document.loginform.submit();
		});
	});
  	<%
	String message = request.getParameter("message");
	if (message != null) {
	%>
 	alert("<%=message%>");
	<%
	}
	%>
  </script>
  <!-- custom css -->
  <style type="text/css">
  .hr-sect {
     display: flex;
     flex-basis: 100%;
     align-items: center;
     font-size: 1em;        
     margin: 1em 0;
   }
  .hr-sect::before,
  .hr-sect::after {
    content: "";
    flex-grow: 1;
    background: rgba(0, 0, 0, 0.35);
    height: 1px;
    font-size: 0px;
    line-height: 0px;
     margin: 0px 16px;
  }
  
  </style>
  <title>LOG IN</title>
</head>
<body>

	<div data-role="page" id="page">
		<!-- 헤더영역 -->
		<%@ include file="../blog-app/include/header.jsp"%>

		<!-- 패널영역 -->
		<%@ include file="../blog-app/include/menupanel.jsp"%>

		<!--컨텐츠 영역-->
		<div data-role="content" id="content">
			<h2>로그인</h2>
			<hr>
			<form name="loginform" method="post"
				action="<%=request.getContextPath()%>/login/login.do">
				<label for="userid">아이디 </label> 
				<input type="text" name="userid" id="userid" 
					placeholder="아이디를 입력하세요." data-clear-btn="true" required>
				<label for="userpwd">비밀번호 </label> 
				<input type="password" name="passwd" id="passwd"
					placeholder="비밀번호를 입력하세요." data-clear-btn="true" required>
				<button type="button" id="btnLogin" data-theme="b">로그인</button>
			</form>
			<div class="ui-grid-b" style="text-align: center; margin: 0.9em 0;">
				<div class="ui-block-a" style="border-right: 1px solid #ccc;">
					<a href="join.jsp" data-role="none" rel="external">회원가입</a>
				</div>
				<div class="ui-block-b" style="border-right: 1px solid #ccc;">
					<a href="remind_id.jsp" data-role="none" data-rel="dialog">아이디찾기</a>
				</div>
				<div class="ui-block-c">
					<a href="remind_pwd.jsp" data-role="none" data-rel="dialog">비밀번호찾기</a>
				</div>
			</div>
			<div class="hr-sect">또는</div>
			<h4 style="text-align: center">간편 로그인</h4>
			<div data-role="controlgroup" data-type="horizontal"
				style="text-align: center;">
				<a href="https://github.com/" target="_blank" data-role="button"
					data-inline="true" rel="external">
					<img src="../blog-app/images/icon/sns_github.png" width="50%"></a> 
				<a href="https://m.naver.com/" target="_blank" data-role="button"
					data-inline="true" rel="external">
					<img src="../blog-app/images/icon/sns_n.png" width="50%"></a> 
				<a href="https://facebook.com/" target="_blank" data-role="button"
					data-inline="true" rel="external">
					<img src="../blog-app/images/icon/sns_f.png" width="50%"></a> 
				<a href="https://google.com/" target="_blank" data-role="button"
					data-inline="true" rel="external">
					<img src="../blog-app/images/icon/sns_g.png" width="50%"></a>
			</div>
		</div>
		
		<!-- 푸터영역 -->
		<%@ include file="../blog-app/include/footer.jsp"%>
		
	</div>
</body>

</html>