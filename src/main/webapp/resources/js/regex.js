const regex_En = /[a-zA-Z]/;
		const regex_Ko = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		const regex_Num = /[0-9]/;
		const regex_Sc = /[\!\@\#\$\%]/;
		
		function checkRegex(inputVal,type){
			console.log("확인 요청값: " + inputVal);
			console.log("확인 요청 유형: " + type);
			var checkType = null;
			var isResult = false;
			switch(type){
			case 'en':
				checkType = regex_En;
				break;
			case 'ko':
				checkType = regex_Ko;
				break;
			case 'num':
				checkType = regex_Num;
				break;
			case 'sc':
				checkType = regex_Sc;
				break;
			}
			for(var i = 0; i < inputVal.length;i++){
				var ch = inputVal.charAt(i);
				if(checkType.test(ch)){
					isResult = true;
				}
			}
			return isResult;
		}