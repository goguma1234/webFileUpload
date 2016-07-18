function showToday(){
		var today=new Date();//today.getMonth(): 1월은 0을 반환,
								//5월은 4를 반환
		showCal(today.getFullYear(), today.getMonth()+1);
}


function showCal(year, month){
		//alert(year+"/"+month);
		str="여기에 테이블 태그 들어갈 예정";
		var total_days;//각 달의 총 일수
		switch(month){ //31일, 30일, 28일 29일
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12: total_days=31; break;
			case 4:
			case 6:
			case 9:
			case 11: total_days=30; break;
			case 2:{
				if( (year%4==0 && year%100!=0)|| year%400==0){
					total_days=29;//윤년
				}else{
					total_days=28;//평년
				}
				/*윤년
				1) 기원 연수가 4로 나누어 떨어지는 해를 우선 윤년(29일)
				2) 그 중에서 100으로 나누어 떨어지는 해는 평년(28일)
				3) 다만 400으로 나누어 떨어지는 해는 윤년*/
			}break;
		}//switch----------
		
		//지정된 달의 1일 의 요일 검사
		var first_date=new Date(year,month-1,1);
		var first_day=first_date.getDay(); //요일 알아내기
		//alert(first_date+"==>"+first_day);

		str="<table border='1'>";
		str+="<tr><th colspan='7'>";
		str+=year+"년 "+month+"월</th></tr>";
		//요일 문자열 행 작성
		str+="<tr><td><font color='red'>일</font></td>";
		str+="<td>월</td><td>화</td><td>수</td><td>목</td><td>금</td>";
		str+="<td><font color='blue'>토</font></td></tr>";
		
		col=0;//현재 몇 번째 열을 출력하는지 보관할 변수
		str+="<tr>";
		for(var i=0;i<first_day;i++){//1일이 시작할 때 까지 빈 공백 채우기
			str+="<td></td>";//빈 공간
			col++;
		}
		//1일부터 그달 말일까지 출력
		for(var i=1;i<=total_days;i++){
			switch(col%7){
				case 0://일요일
				str+="<td width='20' height='20' bgcolor='red'>";
				break;
				case 6://토요일
				str+="<td width='20' height='20' bgcolor='blue'>";
				break;
				default: //나머지 요일
				str+="<td width='20' height='20' bgcolor='lightgray'>";
				break;
			}
			var tday=new Date().getDate();
			if(i==tday){
			str+="<font color='red'><b>"+i+"</b></font>";
			}else{
			str+="<font color='white'>"+i+"</font>";
			}
			str+="</td>";
			col++;
			if(col==7){
				str+="</tr>";//줄바꿈
				col=0;
			}
		}//for--------------

		str+="</table>";
		var obj=document.getElementById("cal");
		obj.style.visibility="visible";
		obj.innerHTML=str;
}//showCal()------------------------