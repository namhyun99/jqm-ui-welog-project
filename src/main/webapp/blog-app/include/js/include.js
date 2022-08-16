$(function(){
	//모드체크
	modeCheck();
	
	//페이지별 타이틀 노출
	const title = document.title;
	$("#title").html(title);
	
	//로그아웃 버튼
	$("#btnLogout").click(function() {
		location.href="/welog/login/logout.do";
	});
		
	// 다크모드 버튼
	$("#btnLightDark").click(function() {
		modeChange();
	});
	
});


// 모드체크 함수
function modeCheck(){
	var mode = localStorage.getItem('darkMode');
	if(mode == null) {
		localStorage.setItem('darkMode','N')
	} else if(mode == 'Y') {
		darkMode();
	} else if(mode == 'N') {
		lightMode();
	}
}

// 로컬스토리지를 이용한 다크모드 구현
function modeChange(){
	var mode = localStorage.getItem('darkMode');
	console.log(mode);
	if(mode == 'N'){
		darkMode();
		localStorage.setItem('darkMode', 'Y');
	} else if(mode == 'Y') {
		lightMode();
		localStorage.setItem('darkMode', 'N');
	}
	
}

//다크모드 함수
function darkMode(){
	$("#btnLightDark").text("라이트모드");
	$("#btnLightDark").removeClass("ui-btn-b");
	$("#btnLightDark").addClass("ui-btn-a");
	$("#page").removeClass("ui-page-theme-a");
	$("#page").addClass("ui-page-theme-b");
	$(".ad-title").css("color","white");
	$(".form_wrap input").css("color","white");
}

//라이트 모드 함수
function lightMode() {
	$("#btnLightDark").text("다크모드");
	$("#btnLightDark").removeClass("ui-btn-a");
	$("#btnLightDark").addClass("ui-btn-b");
	$("#page").removeClass("ui-page-theme-b");
	$("#page").addClass("ui-page-theme-a");
	$(".ad-title").css("color","black");
	$(".form_wrap input").css("color","");
}


