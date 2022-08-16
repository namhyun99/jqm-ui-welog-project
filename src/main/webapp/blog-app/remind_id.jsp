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
  <title>아이디찾기</title>
</head>
<body>
	<div data-role="page">
		<script type="text/javascript">
			$(function() {
				$("#btnIdCheck").click(function() {
					
					
					var email = $("#email");
					
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

					var param = "email=" + $("#email").val();

					$.ajax({
						type : "post",
						url : "<%=request.getContextPath()%>/login/remind_id.do",
						data : param,
						success : function(result) {
							alert(result);
						}
					});
				});
			});
		</script>
		<div data-role="header" data-theme="b">
			<h1>아이디 찾기</h1>
		</div>
		<div data-role="content">
			<h4>가입할 때 사용한 이메일주소를 입력해주세요 :D</h4>
			<input type="email" name="email" id="email" 
				placeholder="abc@abc.com" data-clear-btn="true" required>
			<button type="button" id="btnIdCheck" data-theme="b">확인</button>
		</div>
	</div>
</body>
</html>