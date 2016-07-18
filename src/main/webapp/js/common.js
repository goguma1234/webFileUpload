/*사용자 아이디값 유효성 체크[알파벳소문자, 숫자, _ 까지 허용]*/
	function isUserid(obj){
		var uidVal=obj.value;
		var pattern=new RegExp(/^[a-zA-Z0-9_]+$/);
		var bool=pattern.test(uidVal);
		//alert("bool="+bool);
		return bool;
		/*^ : 시작을 의미
		  $ : 끝을 의미
		  a-z : 알파벳 소문자를 의미
		  0-9 : 숫자를 의미.
		  _ : 밑줄 문자를 의미
          + : 패턴이 한 번 이상 반복된다는 의미
		  */
	}//isUserid()----------------
	function isTel(obj){
		var telVal=obj.value;
		var pattern=new RegExp(/^[0-9+-]+$/);
		/*0~9사이의 숫자나 +, - 기호로 시작하거나 끝나야 한다는 의미*/
		var bool=pattern.test(telVal);
		//alert("bool="+bool);
		return bool;
	}//isTel()-----------------------
	function isDate(obj){
		var dateVal=obj.value;
		var pattern=new RegExp(/\b\d{4}[\/-]\d{1,2}[\/-]\d{1,2}\b/);
		var bool=pattern.test(dateVal);
		return bool;
		/* \b : 단어의 경계를 나타내는데, 해당 패턴이 정확히 일치해야 한다는 의미
		  \d{4}: 숫자 4개가 나와야 한다는 의미
		  [\/-]: /나 - 기호를 허용한다는 의미
		  \d{1,2} : 숫자 1개 또는 2개 올수 있다는 의미
		*/
	}//isDate()----------------------
	/*이메일 형식 체크*/
	function isEmail(obj){
		var emailVal=obj.value;
		var pattern=new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/); 
		var bool=pattern.test(emailVal);
		alert("이메일 bool : "+bool);
		return bool;
		//asdf1-12as@naver.com 형식
		//asdf.my@naver.com
		/*
		^[\w-]+  : 알파벳문자,숫자,하이픈(-)이 이메일 주소 처음에
					올수 있다는 의미.
		(\.[\w-]+)* : 마침표와 그 다음에 하나이상의 알파벳,숫자,- 이
					  0번 이상 나올 수 있다는 의미
        @ : @기호가 해당 위치에 나와야 한다는 의미
		([\w-]+\.)+ : 알파벳문자,숫자,- 이 한 번 이상 나오고 그 다음
					  마침표가 나온다는 의미. 그리고 이 조합이
					   한 번 이상 나올 수 있단 의미
		[a-zA-Z]+  : 알파벳 대문자,소문자 상관없이 문자로 끝나야 한다는 의미
		*/

	}//isEmail()-----------------------
	/*한글 여부를 체크하는 함수*/
	function isKor(obj){
		var val=obj.value;//사용자가 입력한 값
		for(var i=0;i<val.length;i++){
			var uCode=val.charCodeAt(i);//문자값의 유니코드값을 반환한다.
			if(!(uCode>=0xAC00 && uCode<=0xD7A3)){//한글이 아니라면
				return false;
			}//if----------
		}//for----------
		//참고: 한글의 유니코드 범위 0xAC00 ~ 0xD7A3
		return true;
	}
