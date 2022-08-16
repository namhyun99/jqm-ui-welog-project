const userid = document.getElementById("userid");
const passwd = document.getElementById("passwd");
const passwd2 = document.getElementById("passwd2");
const name = document.getElementById("name");
const email = document.getElementById("email");
const hp = document.getElementById("hp");
const consent = document.getElementById("consent");
const privacy = document.getElementById("privacy");

function joinCheck(){
	//1) 아이디 체크	
	if(userid.value == ""){ //value값이 입력되지 않았다면
		alert("아이디를 입력해주세요."); //alert창 출력
		userid.focus(); //userId창 강조
		return;
	}
	
	//정규식 사용하여 제한 ^ 시작문자랑 $마지막 문자는 안써도된다.
	var exp1 = /^[A-Za-z0-9]{4,10}$/;  // [] 대,소문자,숫자사용가능, {}자리수 표현 
	if(!exp1.test(userid.value)){
		alert("아이디는 영문자, 숫자를 사용해서 4~10자리로 입력하세요.");
		userid.focus();
		return;
	}
	
	//2) 비밀번호 체크
	if(passwd.value == ""){
		alert("비밀번호1를 입력해주세요.")
		passwd.focus();
		return;
	}
	
	var exp2 = /(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*\d){8,12}/;
	//(=?.*[a-z]) : 적어도 소문자가 하나가 포함되어야 한다. 이외 모두 동일
	//(?=.*\d) : 숫자를 표현	
	
	if(!exp2.test(passwd.value)){
		alert("비밀번호는 영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용해서 8~12자리로 입력하세요.");
		passwd.focus();
		return;
	}
	
	if(passwd2.value == ""){
		alert("비밀번호2를 입력해주세요.")
		passwd.focus();
		return;
	}
	
	// 비밀번호 확인 체크 (두 값이 같지 않다면.)
	if(passwd.value != passwd2.value){
		alert("비밀번호가 일치하지 않습니다.");
		passwd2.focus;
		return false;  //false를 반환, 
	}
	
	
	
	//3)이름 체크
	if(name.value == ""){
		alert("이름은 필수입력 사항입니다.");
		name.focus();
		return;
	}
	
	//3)이메일 체크
	var exp4 = /^[a-zA-Z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	if(email.value != ""){
		if(!exp4.test(email.value)){
			alert("이메일 형식이 잘못되었습니다.");
			email.focus();
			return;
		}
	}
	
	//4)전화번호 체크
	var exp5 = /^[0-9]+$/;
	if(hp.value != ""){
	  	if(!hp.value.match(exp5)){
			alert("전화번호는 숫자만 읿력하세요.")
			hp.focus();
			return;
		}
	}
	
	//5)체크사항 확인
	if(consent.checked == false){
		alert("이용약관 동의 체크가 되지 않았습니다.");
		return;
	}
	
	if(privacy.checked == false){
		alert("개인정보 수집 및 이용동의 체크가 되지 않았습니다.");
		return;
	}
	
	
	document.joinform.submit();	
}