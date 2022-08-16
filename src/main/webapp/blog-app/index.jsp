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
	//json 데이터 불러와서 리스트뷰에 추가하기
	$(function(){
		const JSON_DATA = "../blog-app/json_data/items.json";
		$.getJSON(JSON_DATA, function(data, textStatus){
			$.each(data, function(){
				$("#listviews").append(
				"<li data-icon='false' class='ui-first-child'>" 
				+"<a href='view.jsp?idx=" + this.idx 
				+ "' data-transition='slide' data-ajax='false' class='ui-btn'>" 
				+"<p><img src='"+ this.imgurl + "'width='100%'></p>" 
				+"<h1>" + this.title + "</h1>" 
				+"<p>" + this.desc + "</p>" 
				+"<p style='margin:1.2em 0 0.8em 0; color: #9fa4ab;'>" 
				+ this.date + " · <strong>" 
				+ this.comment +"</strong>개의 댓글</p>" 
				+"<div style='display:flex; align-items:center; border-top: 1px solid #ccc;'>" 
				+"<p style='display:flex; align-items: center;'>"
				+"<img src='../blog-app/images/profile/"+this.writer+".png' width='7%'>"
				+"<span style='padding: 0 0.9em;'>by.<strong>" 
				+ this.writer + "</strong></span>" 
				+"♥ " + this.like + "</p>"
				+"</div></a></li>"				
				);
			});
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
  <title>WE.LOG</title>
</head>

<body>
	<% String userid = (String)session.getAttribute("userid"); %>
	<div data-role="page" id="page">
		<!--헤더영역-->
		<div data-role="header" id="header" data-position="fixed"
			data-theme="b">
			<!-- <a href="#" data-role="button" data-icon="carat-l" data-iconpos="notext" data-rel="back" rel="external">back</a> -->
			<h1>WE.LOG</h1>
			<a href="#menupanel" data-role="button" data-icon="bars"
				data-iconpos="notext" class="ui-btn-right" data-ajax="false"></a>
		</div>

		<!-- 패널영역 -->
		<%@ include file="../blog-app/include/menupanel.jsp"%>

		<!-- 컨텐츠 영역 -->
		<div data-role="content">
			<%if(userid == null) {//아이디가 null이면 %>
			<img src="../blog-app/images/profile/default.png" 
				width="20%"	height="auto">
			<h3>User ID</h3>
			<p style="font-size: 0.86em;">
				로그인 시, 글과 댓글을 작성할 수 있습니다😁<br> WE.LOG 회원이 되고 싶다면? 우측 메뉴 클릭!
			</p>

			<% } else { %>
			<img src="../blog-app/images/profile/login_profile.png" 
				width="20%"	height="auto">
			<h3><%= userid %></h3>
			<p style="font-size: 0.86em;">
				안녕하세요:D
				<%= name %>
				님<br> WE.LOG에 오신걸 환영합니다😁 <br>
			</p>
			<% } %>

			<div data-role="controlgroup" data-type="horizontal">
				<a href="https://github.com/" target="_blank" 
					data-role="button" rel="external" data-theme="b">
					<i class="fab fa-github" style="font-size: 1.2rem"></i></a> 
				<a href="https://facebook.com/"	target="_blank" 
					data-role="button" rel="external" data-theme="a">
					<i class="fab fa-facebook" style="font-size: 1.2rem"></i></a> 
				<a href="https://www.instagram.com/" target="_blank"
					data-role="button" rel="external" data-theme="a">
					<i class="fab fa-instagram" style="font-size: 1.2rem"></i></a> 
				<a href="https://www.youtue.com/" target="_blank" 
					data-role="button" rel="external" data-theme="a">
					<i class="fab fa-youtube" style="font-size: 1.2rem"></i></a>
			</div>
			<hr>

			<!-- 탭 영역 -->
			<div data-role="tabs">
				<div data-role="navbar">
					<ul data-inset="true">
						<li><a href="#tab1" data-role="button" class="ui-btn-active">글목록</a></li>
						<li><a href="#tab2" data-role="button">소개</a></li>
					</ul>
				</div>
				<!-- 글목록 영역 -->
				<div id="tab1">
					<ul data-role="listview" data-inset="true" id="listviews">
					</ul>
				</div>
				
				<!-- 소개 영역 -->
				<div id="tab2">
					<h2>⭐WE.LOG 소개⭐</h2>
					<p>소통하고 싶은 컨텐츠들을 작성하여 WE.LOG 회원분들과 공유해보세요🤗</p>
					<h3>📌이용방법</h3>
					<p>- 게시글을 클릭하면 볼 수 있으며, 검색이 필요하면 검색 버튼을 통해 이용합니다.</p>
					<p>- 로그인,회원가입은 우측 상단 메뉴 버튼을 클릭하면 확인할 수 있습니다.</p>
					<p>- 글쓰기,관리 메뉴는 로그인 후 사용이 가능합니다.</p>

					<h3>📌회원혜택</h3>
					<p>- 개인 프로필 및 정보 수정</p>
					<p>- 글작성 및 댓글 작성</p>
					<p>- 글쓰기 html에디터 지원</p>

					<h3>📌그 외</h3>
					<p>- 다크모드 지원</p>
				</div>
			</div>
		</div>

		<!-- 푸터영역 -->
		<%@ include file="../blog-app/include/footer.jsp"%>

	</div>
</body>
</html>