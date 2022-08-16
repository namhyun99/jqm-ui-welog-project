<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>

<html>
<head>
<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function() {
		var passwd = $("#passwd");
		if(passwd.val() == ""){
			alert("비밀번호를 입력해주세요.")
			passwd.focus();
			return;
		}
		var exp2 = /(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*\d){8,12}/;
		if(!exp2.test(passwd.val())){
			alert("비밀번호는 영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용해서 8~12자리로 입력하세요.");
			passwd.focus();
			return;
		}
		
		var name = $("#name");
		if(name.val() == ""){
			alert("이름은 필수입력 사항입니다.")
			name.focus();
			return;
		}
		
		var email = $("#email");
		if(email.val() == ""){
			alert("이메일을 입력해주세요.")
			email.focus();
			return;
		}
		
		var exp4 = /^[a-zA-Z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
		if(!exp4.test(email.val())){
			alert("이메일 형식이 잘못되었습니다.");
			email.focus();
			return;
		}
		
		var hp = $("#hp");
		var exp5 = /^[0-9]+$/;
		if(!hp.val().match(exp5)){
			alert("전화번호는 숫자만 읿력하세요.")
			hp.focus();
			return;
		}
		
		document.form2.action = "/jqmProject/user/update.do";
		document.form2.submit();
	});
	
	$("#btnDelete").click(function() {
		if(confirm("정말로 탈퇴하시겠습니까? 😭")){
			document.form2.action = "/jqmProject/user/delete.do";
			document.form2.submit();
		}
	});
});
</script>
</head>
<body>
	<%
	UserDTO dto = (UserDTO) request.getAttribute("dto");
	%>
	<div class="title">
		<h3>가입정보</h3>
	</div>
	<div class="form_wrap">
		<form name="form2" method="post">
			<table style="width: 100%">
				<colgroup>
					<col style="width: 30%">
					<col style="width: 70%">
				</colgroup>
				<tr>
					<td>아이디</td>
					<td>
					<input value="<%=dto.getUserid()%>" disabled> 
					<input type="hidden" name="userid" value="<%=dto.getUserid()%>">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" id="passwd" name="passwd"
							value="<%=dto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input name="name" value="<%=dto.getName()%>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="email" id="email" name="email"
							value="<%=dto.getEmail()%>">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input id="hp" name="hp" value="<%=dto.getHp()%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input value="<%=dto.getJoin_date()%>" disabled></td>
				</tr>
				<tr>
					<td>이용약관</td>
					<td><input value="<%=dto.getConsent()%>" disabled></td>
				</tr>
				<tr>
					<td>개인정보</td>
					<td><input value="<%=dto.getPrivacy()%>" disabled></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="info">
		<p>※정보수정은 비밀번호,이름,이메일,연락처만 가능합니다.</p>
		<p>※탈퇴 시 작성하신 포스트 및 댓글이 모두 삭제되며 복구되지 않습니다.</p>
	</div>
	<div class="btn_area">
		<button type="button" id="btnUpdate">정보수정</button>
		<button type="button" id="btnDelete">회원탈퇴</button>
	</div>
</body>
</html>