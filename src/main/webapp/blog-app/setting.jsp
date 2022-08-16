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
	  info();
  });
  
  function info(){
	  var param = "userid2=" + $("#userid2").val();
	  
	  $.ajax({
		  type : "post",
		  url : "<%=request.getContextPath()%>/user/lookup.do",
		  data : param,
		  success : function(result){
			  $("#info_result").html(result);
		  }
	  });
  }
    <%
	String updateMsg = request.getParameter("updateMsg");
	if (updateMsg != null) {
	%>
 	alert("<%=updateMsg%>");
	<%
	}
	%>
  </script>
  <!-- custom css -->
  <style type="text/css">
  	#info_result {
  		display: flex;
  		flex-direction: column;
  		align-items: center;
  		justify-content: center;
  	}
  	
  	#info_result .title, .form_wrap, .info, .btn_area {
		width: 95%;
	}

	#info_result .title h3 {
		text-align: left;
		font-size: 1.17em;
	}
	
	#info_result .btn_area {
		text-align: center;
	}
	
	#btnDelete {
		background-color: #ff6b6b;	
	}
	
	#btnUpdate {
		background-color: #38c;
		
	}
	
	#btnDelete,
	#btnUpdate {
		padding : 0.8em 1.2em;
		border:none;
		box-shadow:none;
		border-radius: 0.5em;
		color: #fff;
		font-size : 0.75em;
		text-align: center;
		font-weight: 700;
		cursor: pointer;
		vertical-align: middle;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#btnUpdate:hover,
	#btnDelete:hover {
		opacity: 0.9;
	}
	
	.form_wrap input {
		width: 100%;
		margin:0;
		text-align: left;
		border:1;
		background: transparent none;
		border-radius: 0.5em;
		padding: 0.4em;
		padding-right: 0;
		box-sizing: border-box;
		font-size: 1em;
	}
	
	.info {
		font-size: 0.78em;
		color: #ad7568;
	}
	  
  </style>
  <title>관리</title>
</head>

<body>
	<div data-role="page" id="page">
		<!-- 세션체크 -->
		<%@ include file="../blog-app/include/session_check.jsp"%>
		<!-- 헤더영역 -->
		<%@ include file="../blog-app/include/header.jsp"%>

		<!-- 메뉴패널 -->
		<%@ include file="../blog-app/include/menupanel.jsp"%>

		<!-- 컨텐츠 영역 -->
		<div data-role="content">
			<input type="hidden" id="userid2" name="userid2"
				value="<%=userid%>">
			<div class="profile" align="center" style="margin: 1.8em 0 0.8em 0;">
				<a href="#">
				<img src="../blog-app/images/profile/login_profile.png" width="20%"></a>
			</div>
			<div data-role="controlgroup" data-mini="true" align="center"
				style="margin-bottom: 1.8em">
				<a href="#" data-role="button" data-inline="true"
					class="ui-btn-active">이미지 업로드</a> 
				<a href="#" data-role="button" data-inline="true">이미지 제거</a>
			</div>
			<hr>
			<div id="info_result"></div>
			<hr>
		</div>

		<!--푸터영역-->
		<%@ include file="../blog-app/include/footer.jsp"%>

	</div>
</body>
</html>