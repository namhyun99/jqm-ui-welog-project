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
  <% String category = request.getParameter("category"); %>
  <script type="text/javascript">
	//json 데이터 불러와서 리스트뷰에 추가하기
	$(function(){
		const JSON_DATA = "../blog-app/json_data/items.json";
		$.getJSON(JSON_DATA, function(data, textStatus){
			for(i=0; i<data.length; i++){
				if(data[i].category == '<%= category %>'){
					$("#listviews").append(
						"<li data-icon='false' class='ui-first-child'>" 
						+"<a href='view.jsp?idx=" + data[i].idx 
					    + "&writer=" + data[i].writer 
					    + "'data-transition='slide' data-ajax='false' class='ui-btn'>" 
						+"<p><img src='"+ data[i].imgurl + "'width='100%'></p>" 
						+"<h1>" + data[i].title + "</h1>" 
						+"<p>" + data[i].desc + "</p>" 
						+"<p style='margin:1.2em 0 0.8em 0; color: #9fa4ab;'>" 
						+ data[i].date + " · <strong>" 
						+ data[i].comment +"</strong>개의 댓글</p>" 
						+"<div style='display:flex; align-items:center; border-top: 1px solid #ccc;'>" 
						+"<p style='display:flex; align-items: center;'>"
						+"<img src='../blog-app/images/profile/"
						+data[i].writer+".png' width='7%'>"
						+"<span style='padding: 0 0.9em;'>by.<strong>" 
						+ data[i].writer + "</strong></span>" 
						+"♥ " + data[i].like + "</p>"
						+"</div></a></li>"				
				    );
				};
			};
		});
	});	
  </script>
  <title><%= category %></title>
</head>

<body>
	<div data-role="page" id="page">
		<!--헤더영역-->
		<%@ include file="../blog-app/include/header.jsp"%>

		<!--메뉴패널-->
		<%@ include file="../blog-app/include/menupanel.jsp"%>

		<!-- 컨텐츠 영역 -->
		<div data-role="content">
			<ul data-role="listview" data-inset="true" data-filter="true"
				data-filter-placeholder="글제목을 입력하세요." id="listviews">
			</ul>
		</div>

		<!--푸터영역-->
		<%@ include file="../blog-app/include/footer.jsp"%>
	</div>
</body>

</html>