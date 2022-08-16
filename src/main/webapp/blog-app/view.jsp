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
  <%
  int idx = Integer.parseInt(request.getParameter("idx"));
  String userid = (String) session.getAttribute("userid");
  %>
  <script type="text/javascript"> 
  $(function(){
	
	//글내용 불러오기
	const items = "../blog-app/json_data/items.json";
	$.getJSON(items, function(data, textStatus){	
		if (data.length < <%=idx%>) {
			alert("잘못된 접근입니다.");
			history.back();
		}
		$.each(data,function(){
			if(Number(this.idx) == <%=idx%>){
				$("#contents").prepend(
					"<h2>" + this.title + "</h2>" 
					+"<p class='sub'>"+ this.writer 
					+ "<span> · " + this.date + "</span>"
					+ "<span> · " + this.category + "</span></p>" 
				);
				$("#article").append(this.contents);
				$("#title").append(this.title);
				$("#writer_profile").append(
					"<img src='../blog-app/images/profile/"+this.writer+".png'>"
					+"<h4>"+this.writer+"</h4>"
				);
			}
		}); 
	});
		
	//댓글 json데이터 불러오기
 	const comment = "../blog-app/json_data/comment.json";
  	$.getJSON(comment, function(data2, textStatus){
  		var count = 0;
  		for(i=0; i<data2.length; i++){
  			if(Number(data2[i].idx) == <%=idx%>){
  			$("#comment-wrap").append(
  			  	"<div class='comment-list'><div class='info'>"
  			  	+"<div class='profile'><img src='" + data2[i].imgurl+"'>"
  			  	+"<div class='comment-info'>"
  			  	+"<div class='userid'>"+ data2[i].writer +"</div>"
  			  	+"<div class='date'>" + data2[i].date + "</div>"
  			  	+"</div></div></div>"
  			  	+"<div class='comment'>" + data2[i].comment + "</div></div>"
  		  	);
  			count++;
  			} else {
  				continue;
  			}	
		} 
  		
  		$(".c-count").html(count);
  		
  	});
	  	
	//댓글 작성시 ajax처리.(DB구축X)
	$("#btnCoSave").click(function() {
		var param = "idx=" + $("#idx").val() 
		 + "&userid=" + $("#userid").val()
		 + "&comment=" + $("#comment").val();
		$.ajax({
			type : "post",
			url : "/jqmProject/board/comment.do",
			data : param,
			success : function(){
			}
		});
	});
		
	//글수정,삭제,통계등 버튼영역
	$("#btnlike").click(function() {
		alert("좋아요❤️");
	})
	
	$("#btnShare").click(function() {
		alert("어디로 공유할까?");
	});
	
	$("#btnlist").click(function() {
		alert("글목록으로 가자!");
	});
	
	$("#btnUpdate").click(function() {
		alert("글수정하기!");
	});
	
	$("#btnDelete").click(function() {
		confirm("정말 삭제 하시겠습니까?");
	});
	
	$("#btnDetail").click(function() {
		alert("글통계 보기");
	});		
		
	//위로가기 버튼
    var backTop = $(".btn-back_to_top");
    
    $(window).scroll(function() {
        if($(document).scrollTop() > 100) {
			backTop.css('visibility', 'visible');
        }
        else if($(document).scrollTop() < 100) {
			backTop.css('visibility', 'hidden');
		}
	});
      
	backTop.click(function() {
		$('html').animate({
			scrollTop: 0
		}, 1000);
        return false;
	});

});
</script>

<!-- custom css -->
  <style type="text/css">
  a {
	text-decoration: none;
  }

  #contents h2 {
	margin: 0;
	padding: 1.2em 0 0.5em;
  }

  #contents .sub {
	font-size: 0.86em;
	font-weight: 600;
  }

  #contents .sub>span {
	font-weight: 400;
  }

  #article img {
	width: 100%;
	height: auto;
  }

  #writer_profile img {
	width: 15%;
  }

  #writer_profile h4 {
	margin: 0;
	padding-left: 0.8em;
  }

  #comment-wrap {
	padding: 0.8em 0.8em;
  }

  #comment-wrap .comment-list {
	border-bottom: 1px solid #ececec;
	padding: 1em 0;
  }

  #comment-wrap .info {
	display: flex;
	margin-bottom: 0.8em;
  }

  #comment-wrap .info .profile {
	display: flex;
	align-items: center;
  }

  #comment-wrap .info .profile img {
	width: 10%;
	padding-right: 0.8em;
  }

  #comment-wrap .info .profile .comment-info {
	display: flex;
	flex-direction: column;
	font-size: 0.8em;
  }

  #comment-wrap .info .profile .comment-info .userid {
	font-weight: bold;
  }

  #comment-wrap .comment {
	font-size: 1em;
  }

  .ad-title {
	display: block;
	padding: 0.8em 0.5em;
	font-size: 0.8em;
	color: black;
	text-align: left;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
  }

  .ad-title:hover {
	text-decoration: underline;
  }

  .btn-back_to_top {
	position: fixed;
	bottom: 4em;
	right: 1em;
	cursor: pointer;
	visibility: hidden;
	z-index: 999;
  }
  </style>

  <title></title>
</head>
<body>
	<div data-role="page" id="page">
		<!--헤더영역-->
		<%@ include file="../blog-app/include/header.jsp"%>

		<!-- 메뉴패널 -->
		<%@ include file="../blog-app/include/menupanel.jsp"%>

		<!-- 컨텐츠 영역 -->
		<div data-role="content">
			<div class="btn-back_to_top">
				<img src="../blog-app/images/icon/arrow_up.png">
			</div>

			<section id="contents">
				<hr>
				<article id="article">
				</article>
			</section>

			<!-- 작성자 프로필 -->
			<br>
			<div id="writer_profile"></div>
			<br>
			<!-- 버튼 -->
			<form name="form1">
				<fieldset data-role="controlgroup" data-type="horizontal"
					data-mini="true" style="text-align: center">
					<button type="button" id="btnlike" data-icon="heart">좋아요</button>
					<button type="button" id="btnShare" data-icon="action">공유</button>
					<button type="button" id="btnlist" data-icon="bullets">목록</button>
					<button type="button" id="btnUpdate" data-icon="edit">수정</button>
					<button type="button" id="btnDelete" data-icon="delete">삭제</button>
					<button type="button" id="btnDetail" data-icon="info">통계</button>
				</fieldset>
			</form>
			<hr>

			<!-- 추천 콘텐츠 -->
			<h4>당신이 좋아할 만한 컨텐츠</h4>
			<div class="ui-grid-b" align="center">
				<div class="ui-block-a">
					<a href="#" target="_blank" rel="external"> 
						<img src="images/contents/thumb1.jpg" width="95%"> 
						<span class="ad-title">
							카카오페이 신입 Android 개발자 최종합격 후기
						</span>
					</a>
				</div>
				<div class="ui-block-b">
					<a href="#" target="_blank" rel="external"> 
						<img src="images/contents/thumb2.jpg" width="95%"> 
						<span class="ad-title">
							[우아한 테크세미나]FE개발자가 되기 위한 FE개발자가 되기위한 10가지 방법
						</span>
					</a>
				</div>
				<div class="ui-block-c">
					<a href="#" target="_blank" rel="external"> 
						<img src="images/contents/thumb3.jpg" width="95%">
						<span class="ad-title">
							IT 기업 면접준비, 컴퓨터 공학 CS공부를 위한 유용한 링크(단순 링크)
						</span>
					</a>
				</div>
				<br><br>
				<div class="ui-block-a">
					<a href="#" target="_blank" rel="external"> 
						<img src="images/contents/thumb4.jpg" width="95%"> 
						<span class="ad-title">
							신입 개발자로서 도움이 된 포스트/자료 모음
						</span>
					</a>
				</div>
				<div class="ui-block-b">
					<a href="#" target="_blank" rel="external"> 
						<img src="images/contents/thumb5.jpg" width="95%"> 
						<span class="ad-title">
							백엔드 개발자 [면접/학습내용]
						</span>
					</a>
				</div>
				<div class="ui-block-c">
					<a href="#" target="_blank" rel="external"> 
						<img src="images/contents/thumb6.jpg" width="95%"> 
						<span class="ad-title">
							카카오엔터프라이즈 개발 인턴 합격 후기
						</span>
					</a>
				</div>
			</div>

			<br>
			<hr>

			<!-- 댓글 영역 -->
			<h4>
				댓글 (<span class="c-count">0</span>)
			</h4>
			<%
			if (userid == null) {
			%>
			<form name="commentform">
				<textarea placeholder="댓글은 로그인 후에 작성 가능합니다." readonly></textarea>
			</form>
			<%
			} else {
			%>
			<form name="commentform">
				<input type="hidden" id="userid" name="userid" value=<%=userid%>>
				<input type="hidden" id="idx" name="idx" value="<%=idx%>">
				<textarea placeholder="댓글을 작성해주세요 (100자이하)" id="comment"
					name="comment" maxlength="100"></textarea>
				<button type="button" id="btnCoSave" data-theme="b"
					data-inline="true" data-mini="true" style="float: right;">작성하기</button>
			</form>
			<%
			}
			%>

			<div id="comment-wrap" style="clear: both;"></div>
		</div>

		<!-- 푸터영역 -->
		<%@ include file="../blog-app/include/footer.jsp"%>

	</div>
</body>

</html>