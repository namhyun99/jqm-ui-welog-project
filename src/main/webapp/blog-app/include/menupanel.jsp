<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String name = (String) session.getAttribute("name");
%>
<div data-role="panel" id="menupanel" data-display="overlay"
	data-position="right">
	<h2>메뉴</h2>
	<a href="#" data-role="button" data-icon="delete" data-iconpos="notext"
		data-rel="close" data-theme="b" class="ui-btn-right">닫기</a>

	<% if(name == null) { %>
	<div class="profile" data-role="none" style="margin-top: 1.5em;">
		<hr>
		<div class="profile_img" style="display: flex; align-items: center;">
			<img src="../blog-app/images/profile/default.png" width="17%"
				height="auto"> <span style="margin-left: 0.78em"><strong>User
					Name</strong></span>
		</div>
		<hr>
	</div>

	<div class="ui-grid-a" style="margin-top: 0.78em">
		<div class="ui-block-a">
			<a href="../blog-app/login.jsp" data-role="button"
				class="ui-shadow ui-btn ui-corner-all ui-mini ui-btn-active"
				rel="external">로그인</a>
		</div>
		<div class="ui-block-b">
			<a href="../blog-app/join.jsp" data-role="button"
				class="ui-shadow ui-btn ui-corner-all ui-mini" rel="external">회원가입</a>
		</div>
	</div>

	<a href="#" data-role="button" id="btnLightDark"
		class="ui-shadow ui-btn ui-corner-all ui-mini ui-btn-b">다크모드</a>

	<div style="padding: 0.6em; border-radius: 0.5em; margin-top: 1em;">
		<table style="width: 100%; text-align: left;">
			<thead style="font-size: 0.78em; color: gray;">
				<tr>
					<th>전체방문자</th>
					<th>어제</th>
					<th>오늘</th>
				</tr>
			</thead>
			<tbody style="font-weight: bold;">
				<tr>
					<td>150,456</td>
					<td>1,420</td>
					<td>1,523</td>
				</tr>
			</tbody>
		</table>
	</div>
	<% } else { %>
	<div class="profile" data-role="none" style="margin-top: 1.5em;">
		<hr>
		<div class="profile_img" style="display: flex; align-items: center;">
			<img src="../blog-app/images/profile/login_profile.png" width="17%"
				height="auto"> <span style="margin-left: 0.78em"><strong><%= name %>님</strong></span>
		</div>
		<hr>
	</div>
	<div>
		<a href="#" data-role="button" id="btnLogout"
			class="ui-shadow ui-btn ui-corner-all ui-mini" rel="external">로그아웃</a>
		<a href="#" data-role="button" id="btnLightDark"
			class="ui-shadow ui-btn ui-corner-all ui-mini ui-btn-b">다크모드</a>
	</div>
	<div style="padding: 0.6em; border-radius: 0.5em; margin-top: 1em;">
		<table style="width: 100%; text-align: left;">
			<thead style="font-size: 0.78em; color: gray;">
				<tr>
					<th>전체방문자</th>
					<th>어제</th>
					<th>오늘</th>
				</tr>
			</thead>
			<tbody style="font-weight: bold;">
				<tr>
					<td>150,456</td>
					<td>1,420</td>
					<td>1,523</td>
				</tr>
			</tbody>
		</table>
	</div>
	<% } %>
	<div data-role="collapsible" data-mini="true"
		data-collapsed-icon="carat-d" data-expanded-icon="carat-u"
		data-iconpos="right" data-collapsed="false" data-theme="b">
		<h4>카테고리</h4>
		<ul data-role="listview" data-inset="false">
			<li><a href="../blog-app/list.jsp?category=꿀팁모음"
				class="ui btn ui-mini" rel="external"> 꿀팁모음<span
					class="ui-li-count">1</span>
			</a></li>
			<li><a href="../blog-app/list.jsp?category=스터디"
				class="ui btn ui-mini" rel="external"> 스터디<span
					class="ui-li-count">2</span>
			</a></li>
		</ul>
	</div>
	<!--  
	마이메뉴영역 footer버튼과 중복되어 주석처리
	<div data-role="collapsible" data-mini="true" data-collapsed-icon="carat-d" data-expanded-icon="carat-u" data-iconpos="right" data-collapsed="false" data-theme="b">
        <h4>메뉴</h4>
        <ul data-role="listview" data-inset="false" >
          <li><a href="../blog-app/index.jsp" class="ui btn ui-mini ui-icon-home" rel="external">홈</a></li>
          <li><a href="../blog-app/search.jsp" class="ui btn ui-mini ui-icon-search" rel="external">검색</a></li>
          <li><a href="../blog-app/write.jsp" class="ui btn ui-mini ui-icon-edit" rel="external">글쓰기</a></li>
          <li><a href="../blog-app/setting.jsp"  class="ui btn ui-mini ui-icon-gear" rel="external">관리</a></li>
        </ul>
      </div> 
      -->
	<div data-role="collapsible" data-mini="true"
		data-collapsed-icon="carat-d" data-expanded-icon="carat-u"
		data-iconpos="right" data-collapsed="false" data-theme="b">
		<h4>고객지원</h4>
		<ul data-role="listview" data-inset="false">
			<li><a href="mailto:blog@blog.com"
				class="ui btn ui-mini ui-icon-mail">메일문의</a></li>
			<li><a href="tel:010-1234-5678"
				class="ui btn ui-mini ui-icon-phone">전화문의</a></li>
		</ul>
	</div>
	<p style="font-size: 0.7em; text-align: center;">
		&copy 2022 WE.LOG All Rights Reserved.
	</p>
</div>