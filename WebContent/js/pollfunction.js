//	// << task for poll for admin >>
//	public void pollmake();	// insert poll data into database
//	public void polllist();	// pull list of polls
//	public void pollmodify(); // modify poll data
//	public void pollclose();  // close poll
//	
//	// << poll function for users >>
//	public void pollshow();	// shows poll form for users
//	public void pollvote();	// insert user's choice data
//	public void pollchart();// shows chart of poll result;
//	
//	public void pollavailable();	// check availability for vote 


var content = new Array();


 $(document).ready(function() {
	 // 클릭시 문항 내용들을 배열에 추가한다.
		$(document).on('click', '#writeBtn', function() {
			//http://naradesign.net/wp/2011/07/20/1663/ << 유효성검사
			alert(">>>> " + $('.answerInp').length);
			if($('#startDay').val() > $('#endDay').val()) {
				alert("투표기간 오류!!");
				return;
			} else if(answerCount < 2) {
				alert("설문 문항 오류!!");
				return;
			} else {
				alert("투표생성!!!");
				 var x = getElementById("answerD");
				 alert(x);
				 for (var i = 0; i < answerCount; i++) {
					content.push('x.getElementsByClassName("answerInp form-control")[i]');
					alert('x.getElementsByClassName("answerInp form-control")[i]')
				}
			}
		});
	 
	 
	 });
	 
	 // 투표 생성시 내용 갯수에 따라 컨텐트 인서트를 실행한다.
	 
	 // 결과 보기 시 해당 투표의 내용을 불러온다 + 진행 중 투표는 띄우지 맙시다.
	 
	 // 기간 변경 클릭시 기간을 불러오고 // 수정시 업데이트를 해준다.
	 
	 // 종료시 enddate를 오늘날자로 바꿔준다.
