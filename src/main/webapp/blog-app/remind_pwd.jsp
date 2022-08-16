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
  <title>비밀번호 찾기</title>
</head>
<body>
	<div data-role="page">
		<script type="text/javascript">
			$(function() {
				$("#btnPwdCheck").click(function() {
					
					if($("#userid1").val() == ""){
						alert("아이디를 입력해주세요");
						$("#userid1").focus();
						return;
					}
					
					var email = $("#email1");
					if(email.val() == ""){
						alert("데이터를 입력해주세요.")
						email.focus();
						return;
					}

					var exp4 = /^[a-zA-Z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
					if(!exp4.test(email.val())){
						alert("이메일 형식이 잘못되었습니다.");
						email.focus();
						return;
					}

					var param = "userid=" + $("#userid1").val() 
								+ "&email=" + $("#email1").val();

					$.ajax({
						type : "post",
						url : "<%=request.getContextPath()%>/login/remind_pwd.do",
						data : param,
						success : function(result) {
							if(confirm(result)){
								location.href="../blog-app/login.jsp";
							};
						}
					});
				});
			});
		</script>
		<div data-role="header" data-theme="b">
			<h1>비빌번호 찾기</h1>
		</div>
		<div data-role="content">
			<h4>가입할 때 입력한 아이디와 이메일주소를 입력해주세요 :D</h4>
			<input name="userid1" id="userid1" placeholder="아이디를 입력해주세요." 
				data-clear-btn="true" required>
			<input type="email" name="email1" id="email1" placeholder="이메일 주소를 입력해주세요"
				data-clear-btn="true" required>
			<button type="button" id="btnPwdCheck" data-theme="b">확인</button>
			<div id="result"></div>
		</div>
	</div>
</body>
</html>