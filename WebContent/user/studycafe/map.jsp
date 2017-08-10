<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<%@include file="/common/template/nav.jsp"%>
<%@include file="/user/studycafe/searchForm.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ce7904fc14ee11cd832eb0acb92d2713&libraries=services"></script>
<div class="container akcord" style="padding-bottom:30px;">
	<div class="col-sm-1"></div>
	<div class="col-sm-7" align="center">
		<div class="map_wrap">
			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;">
				<input type="hidden" id="X" name="X" value="${X}">
   				<input type="hidden" id="Y" name="Y" value="${Y}">
			</div>
		</div>
	</div>
	<div class="map_wrap">
    	<ul>
    		<li id="CE7" data-order="4">
				<button type="submit" id="searchBtn" class="category_bg cafe btn"></button>
			</li>
    	</ul>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ce7904fc14ee11cd832eb0acb92d2713&libraries=services"></script>
<script>
$("#keyword").keypress(function(e) {
    if (e.which == 13){
    	$("#searchBtn").click();
    	return false;
    }    
});

$(document).ready(function() {
	onClickSearchBtn();
});
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = "CE7"; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng($('#X').val(), $('#Y').val()), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    }; 

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addSearchBtnClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch('CE7', placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
        
     // 페이지 번호를 표출합니다
		displayPagination(pagination);
     
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === daum.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {
	
	var listEl = document.getElementById('placesList'), 
		fragment = document.createDocumentFragment();
	
	removeAllChildNods(listEl);
	
	removeMarker();

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById('CE7').getAttribute('data-order');

    for ( var i=0; i<places.length; i++ ) {

		// 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
        	marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order)
        	itemEl = getListItem(i, places[i]);

        // 마커와 검색결과 항목을 클릭 했을 때
        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
        (function(marker, place) {
            daum.maps.event.addListener(marker, 'click', function() {
                displayPlaceInfo(place);
            });
            
            itemEl.onmouseover = function() {
				displayInfowindow(placePosition, marker, title);
			};

			itemEl.onmouseout = function() {
				infowindow.close();
			};
        })(marker, places[i]);
        
        fragment.appendChild(itemEl);
    }
    listEl.appendChild(fragment);
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

	var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
			+ (index + 1)
			+ '"></span>'
			+ '<div class="info">'
			+ '   <h5>' + places.place_name + '</h5>';

	if (places.road_address_name) {
		itemStr += '    <span>' + places.road_address_name + '</span>'
				+ '   <span class="jibun gray">' + places.address_name
				+ '</span>';
	} else {
		itemStr += '    <span>' + places.address_name + '</span>';
	}

	itemStr += '  <span class="tel">' + places.phone + '</span>'
			+ '</div>';

	el.innerHTML = itemStr;
	el.className = 'item';

	return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
	var paginationEl = document.getElementById('pagination'), fragment = document
			.createDocumentFragment(), i;

	// 기존에 추가된 페이지번호를 삭제합니다
	while (paginationEl.hasChildNodes()) {
		paginationEl.removeChild(paginationEl.lastChild);
	}

	for (i = 1; i <= pagination.last; i++) {
		var el = document.createElement('a');
		el.href = "#";
		el.innerHTML = i;

		if (i === pagination.current) {
			el.className = 'on';
		} else {
			el.onclick = (function(i) {
				return function() {
					pagination.gotoPage(i);
				}
			})(i);
		}
		fragment.appendChild(el);
	}
	paginationEl.appendChild(fragment);
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
    //alert(place.y);
    //alert(place.x);
    placeOverlay.setMap(map);
}

//클릭 이벤트를 등록합니다
function addSearchBtnClickEvent() {
    document.getElementById('searchBtn').onclick = onClickSearchBtn;
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickSearchBtn() {
    var id = "CE7",
    	className = "category_bg cafe";

    placeOverlay.setMap(null);

    if (className === 'on') {
        removeMarker();
    } else {
        searchPlaces();
    }
}

//버튼 클릭시 콜백함수 호출 
$("#searchBtn").click(function(){
	// input 에 입력하는 검색어의 값을 keyWord변수에 담고 한글처리
	var keyword = $("#keyword").val();			
	keyword = encodeURIComponent(keyword);

	// 입력된 keyWord변수의 값으로 결과를 내기 위해 URL 끝에 +keyWord 삽입과 url변수 선언
	var url = "https://apis.daum.net/local/v1/search/keyword.json?apikey=5a3b393c51ad7571d6a92599bd57a77e&query="+keyword;

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
				var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
				location.href="${root}/cafe/map.akcord?latitude=" + latitude + "&longitude=" + longitude;
			}
		});	
	});				
$("#keyword").val("");
});

function removeMarker() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers = [];
}

//검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
	while (el.hasChildNodes()) {
		el.removeChild(el.lastChild);
	}
}

//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
	zIndex : 1
});
</script>
<%@include file="/common/template/footer.jsp"%>