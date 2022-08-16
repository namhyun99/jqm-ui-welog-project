<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
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
  <script defer src="../blog-app/js/joinCheck.js"></script>
  <!-- custom css -->
  <style type="text/css">
	.info {
	  font-size: 0.78em;
	  color: #ad7568;
	}
	
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
  <title>JOIN</title>
</head>
<body>

	<%
	String userid = (String) session.getAttribute("userid");

	if (userid != null) { //세션변수에 값이 있다면
		String message = "이미 로그인 되어 있습니다.";
		message = URLEncoder.encode(message, "utf-8");
		//메인 화면으로 이동
		response.sendRedirect("index.jsp?message=" + message);
	}
	%>

	<div data-role="page" id="page">
		<!--헤더영역-->
		<%@ include file="../blog-app/include/header.jsp"%>

		<!--메뉴패널-->
		<%@ include file="../blog-app/include/menupanel.jsp"%>

		<!-- 컨텐츠 영역 -->
		<div data-role="content" id="content">
			<h2>
				회원가입 <span style="font-size: 0.65em;"> (*필수입력)</span>
			</h2>
			<hr>

			<form name="joinform" method="post"
				action="<%=request.getContextPath()%>/join/join.do">
				<div data-role="fieldcontain">
					<label for="userid">아이디*</label> 
					<input type="text" id="userid" name="userid"
						placeholder="아이디를 입력해주세요" data-clear-btn="true" required>
					
					<p class="info">※ 영문자, 숫자를 사용해서 4~10자리로 입력하세요.</p>

					<label for="passwd">비밀번호*</label> 
					<input type="password"	id="passwd" name="passwd" 
						placeholder="비밀번호를 입력해주세요" data-clear-btn="true" required> 
					
					<label for="passwd2">비번체크*</label>
					<input type="password" id="passwd2" name="passwd2"
						placeholder="비밀번호를 똑같이 입력해주세요" data-clear-btn="true" required>
					<p class="info">
						※ 영문소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용해서 8~12자리로	입력하세요
					</p>
					
					<label for="name">이름*</label> 
					<input type="text" id="name" name="name" 
						placeholder="이름을 입력해주세요" data-clear-btn="true" required> 
					<label for="email">이메일</label> 
					<input type="email" id="email" name="email" 
						placeholder="abc@naver.com"	data-clear-btn="true"> 
					<label for="hp">전화번호</label> 
					<input type="text" id="hp" name="hp" 
						placeholder="01012345678" data-clear-btn="true">
				</div>
				
				<div data-role="collapsibleset" data-mini="true"
					data-collapsed-icon="carat-d" data-expanded-icon="carat-u"
					data-iconpos="right">
					
					<div data-role="collapsible" data-mini="true"
						data-content-mini="true">
						<h4>
							서비스 이용약관 동의 <span style="color: red">(필수)</span>
						</h4>
						<p style="font-size: 0.75em">여러분을 환영합니다.OOO 서비스 및 제품(이하
							‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 서비스를 제공하는 네이버
							주식회사(이하 ‘OOO’)와 이를 이용하는 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러
							여러분의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다...생략</p>
						<label for="consent">서비스 이용약관에 동의합니다.</label> 
						<input type="checkbox" id="consent" name="consent" value="동의" data-mini="true">
					</div>
					<div data-role="collapsible" data-mini="true"
						data-collapsed-icon="carat-d" data-expanded-icon="carat-u"
						data-iconpos="right">
						<h4>
							개인정보 수집 및 이용동의 <span style="color: red">(필수)</span>
						</h4>
						<p style="font-size: 0.75em">개인정보보호법에 따라 OOO에 회원가입 신청하시는 분께
							수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시
							불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다...생략</p>
						<label for="privacy">개인정보 수집 및 이용안내를 숙지하였습니다.</label> 
						<input type="checkbox" id="privacy" name="privacy" 
						value="동의"	data-mini="true">
					</div>
				</div>
				<button type="button" onclick="joinCheck()" data-theme="b">가입하기</button>
			</form>
			<div class="hr-sect">또는</div>
			<h4 style="text-align: center">소셜계정으로 회원가입하기</h4>
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

		<!--푸터영역-->
		<%@ include file="../blog-app/include/footer.jsp"%>

	</div>
</body>
</html>