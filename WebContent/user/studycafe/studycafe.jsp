<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<%@include file="/common/template/nav.jsp"%>
<%@include file="/user/studycafe/searchForm.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ce7904fc14ee11cd832eb0acb92d2713&libraries=services"></script>
<script>
// jQuery를 사용을 위한 코드 열기
$(document).ready(function(){
	// 마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

		var lat = position.coords.latitude, // 위도
		lon = position.coords.longitude; // 경도

		var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

		// 마커와 인포윈도우를 표시합니다
		displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
		displayMarker(locPosition, message);
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map : map,
			position : locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}
	
	$("#keyword").keypress(function(e) {
	    if (e.which == 13){
	    	$("#searchBtn").click();
	    	return false;
	    }    
	});
	
	// 버튼 클릭시 콜백함수 호출 
	$("#searchBtn").click(function(){
		// input 에 입력하는 검색어의 값을 keyWord변수에 담고 한글처리
		var keyword = $("#keyword").val();			
		keyword = encodeURIComponent(keyword);

		// 입력된 keyWord변수의 값으로 결과를 내기 위해 URL 끝에 +keyWord 삽입과 url변수 선언
		var url = "https://apis.daum.net/local/v1/search/keyword.json?apikey=5a3b393c51ad7571d6a92599bd57a77e&query="+keyword;
                   // AJAX로 프로젝트 외부에 있는거 못가져옴
			// (브라우저의 동일 출처 정책)
			// XML : 자바로 받아서(프록시 서버)
			// JSON : 프록시 서버, 서버(다음)에서 JSONP를 적용해놨으면
				// {} => x
			// JSON with Padding
				// asdasd({}) => o
				// jQuery에서는 주소뒤에 &callback=?붙이면 사용가능
       // 위와 같은 이유로 URL 주소로 연결했을 때 제공되는 json 데이터를 이용하기 위한 jQuery내의 getJSON코드

       $.getJSON(url + "&callback=?" , function(json){
            // json.channel.item; 은 json데이터 내에서 내가 원하는 값에 접근하기 위해
            // Daum API에서 제공해주는 형식 맞게 단계별로 들어가는 코드
            var items = json.channel.item;
                         // 반복문을 통해 원하는 json값을 뽑아내는 단계. 지금은 위도와 경도를 받기 위해...
			$.each(items, function(i, it){
                             // items는 위에 선언해둔 변수, it는 임의로 작성해도 되는 거.
                            // 위도와 경도의 변수를 저장
				var latitude = it.latitude;
				var longitude = it.longitude;

				if(i == 0){
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new daum.maps.LatLng(latitude, longitude), //지도의 중심좌표.
						level: 3 //지도의 레벨(확대, 축소 정도)
					};
					//var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
					location.href="${root}/cafe/map.akcord?latitude=" + latitude + "&longitude=" + longitude;
				}
			});	
		});				
	});
    $("#keyword").val("");
});
</script>
<div class="container" style="padding-bottom:20px;">
	<div class="col-sm-12">
			<div class="page-header titleinfo">
				    <h2 id="container"><i class="fa fa-coffee"></i>  &nbsp;<b>STUDY CAFE</b></h2><h5>공부를 할 수 있는 스터디카페를 검색할 수 있습니다.</h5>
			</div>
	<div id="col-sm-8" class="col-sm-8" align="center">
		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		</div>
	</div>
</div>
</div>
<%@include file="/common/template/footer.jsp"%>