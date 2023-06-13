<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.wrap {
	width: 100%;
	height: 100vw;
	display: inline-flex;
	border-top: 1px solid lightgray;
}

#con1 {
	float: left;
	width: 20%;
	height: 100%;
}

#con1>#search {
	position: top;
	width: 100%;
	height: 60px;
}

.bi-search {
	float: left;
}

/* #search {
	border-bottom: 1px solid lightgray;
} */

#imgArea {
	margin: 10px;
	float: left;
	width: 130px;
	height: 130px;
	background-color: red;
}

.infoArea {
	float: right;
	width: 230px;
	height: 130px;
	margin-top: 10px;
	margin-right: 10px;
}

#ia1 {
	width: 100%;
	height: 50px;
}

#ia2 {
	width: 100%;
	height: 80px;
}

.searchBtn {
	border: none;
	background-color: transparent;
}

.searchBtn>svg {
	position: absolute;
	top: 16px;
	right: 10px;
}

#keyword {
	padding: 10px;
	border: 1px solid lightgray;
	border-radius: 5px;
	height: 30px;
	width: 180px;
	margin: 10px 0;
	margin-right: 10px;
	
}

#menu_wrap {
	width: 700px;
	height: 850px;
}

.scrollBar {
	width: 200px;
	height: 50px;
	overflow-y: scroll;
}

/* 아래의 모든 코드는 영역::코드로 사용 */
.scrollBar::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

.scrollBar::-webkit-scrollbar-thumb {
	height: 10%; /* 스크롤바의 길이 */
	background: #989FA7; /* 스크롤바의 색상 */
	border-radius: 10px;
}

.scrollBar::-webkit-scrollbar-track {
	background: rgba(211, 211, 211, 0.5); /*스크롤바 뒷 배경 색상*/
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	/* background: rgba(255, 255, 255, 0.7); */
	background: white;
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
	font-size: 15px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#placesList>li {
	/* width: 600px;
	font-size: 15px; */
	font-weight: 600;
	margin: 20px;
	background-color: #f0f3f5;
	border-radius: 3px;
	border: 1px solid lightgray;
	border-bottom: 2px solid #1A1A3A; 
	cursor: pointer;
	padding: 10px;
}
#placesList>li:hover{
	background-color: #e3f4ffa1;
}
.price {
	font-size: 15px;
	font-weight: 600;
	width: 200px;
	height: 80px;
}

.infoAdd {
	font-size: 13px;
	font-weight: normal;
}
.wrap button{
	height: 30px;
	width: 50px;
	border: none;
	border-radius: 2px;
}
.btnSt{
	position: absolute;
	top: 50px;
	left: 75px;
	
}
#comOkOj{
	width: 100px;
}
.selectBtn {
        border: 1px solid;
        width: 100px;
        height: 50px;
        
        align-items: center;
        }

.clicked {
	background-color: #1F4B6B;
	color: white;
	}
.kwBoxLi{
	 list-style-type: none;
	 font-size: 15px;
	 padding: 5px;
}
.kwBoxLi:hover{
	background-color: #F0F0F0;
	cursor: pointer;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
</head>

<body>
	<jsp:include page="../common/header.jsp" />
	<div class="wrap">
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100vh; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white scrollBar">
				<div class="option">
					<div>
						<form id="search" name="sfrom">
							<div style="height: 45px;">
								<input name="s" type="text" id="keyword"
								placeholder="키워드를 입력하세요.">
								<button type="submit" class="searchBtn">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
									  <path
											d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
									</svg>
								</button>
								<div id="keywordListBox" class="scrollBar" style="display:none; border: 1px solid lightgray; border-top: none; box-shadow: rgba(0, 0, 0, 0.25) 0px 15px 18px -10px; width: 220px; height: 200px; position: absolute; background-color: white; top: 45px; left: 30px; z-index: 1;" >
									<ul id="keywordListBoxUl">
									</ul>
								</div>
							</div>
							<div class="btnSt">
								<button id="allOj" class="selectBtn" type="button" >전체</button>
								<button id="comOkOj" class="selectBtn" type="button" >상담 가능 매물</button>
							</div>
						</form>
						<!-- <div style="margin-bottom: 5px;">
							키워드를 입력하여 <br>원하는 매물을 검색해보세요.
						</div> -->
					</div>
				</div>
				<br><br><hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
				<!-- <div class="keywordPlaceList"></div> -->
				
			</div>
			
		</div>
		
	</div>
	<form id="gtSellDetail"
		action="<%=request.getContextPath()%>/sell/detailapi" method="post">
		<input id="sidoCode" name="sidoCode" type="hidden"> <input
			id="sellSno" name="sellSno" type="hidden"> <input
			id="sellName" name="sellName" type="hidden"> <input
			id="sellAddress" name="sellAddress" type="hidden"> <input
			id="sellPrice" name="sellPrice" type="hidden"> <input
			id="brokerAdd" name="brokerAdd" type="hidden"> <input
			id="sellPrivateArea" name="sellPrivateArea" type="hidden"> <input
			id="sellFloor" name="sellFloor" type="hidden"> <input
			id="ymd" name="ymd" type="hidden"> <input
			id="sellApprovalDatetime" name="sellApprovalDatetime" type="hidden">
		<input id="realYn" name="realYn" type="hidden"> <input
			id="realYnDate" name="realYnDate" type="hidden">
	</form>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cf092d014fa143b1ab25b8a119f9ee7&libraries=services"></script>
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cf092d014fa143b1ab25b8a119f9ee7"></script> -->

	<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng( 37.5007861, 127.0368861), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
map = new kakao.maps.Map(mapContainer, mapOption); 

var center = map.getCenter();
var Latitude = center.getLat(); // 위도
var longitude = center.getLng(); // 경도

// 장소 검색 객체를 생성합니다
const ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
const infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        /* alert('키워드를 입력해주세요!'); */
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
 // 지도 위에 표시되고 있는 마커를 모두 제거합니다
	 
	  
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://ifh.cc/g/phtlAJ.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(31, 35),  // 마커 이미지의 크기
        imgOptions = new kakao.maps.Point(13, 34), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}



// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
 
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
    
// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    
var listEl ="";    
// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'dragend', function (mouseEvent) {
    searchDetailAddrFromCoords(map.getCenter(), function(result, status) {
    	console.log("resta"+JSON.stringify(result)+status);
        if (status === kakao.maps.services.Status.OK) {
           var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
           detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>'; 
           // 지번주소 로만 데이터 움직이기
           
           let adressNameArray = result[0].address.address_name.split(' ');
           var detailAddrClob = adressNameArray[0] + ' ' + adressNameArray[1] + ' ' + adressNameArray[2];
           
           switch(detailAddrClob.split(" ")[0]){
	           case "서울":
	        	   detailAddrClob = detailAddrClob.replace("서울","서울특별시");
	        	   break;
	           case "부산":
	        	   detailAddrClob = detailAddrClob.replace("부산","부산광역시");
	        	   break;
	           case "대구":
	        	   detailAddrClob = detailAddrClob.replace("대구","대구광역시");
	        	   break;
	           case "인천":
	        	   detailAddrClob = detailAddrClob.replace("인천","인천광역시");
	        	   break;
	           case "광주":
	        	   detailAddrClob = detailAddrClob.replace("광주","광주광역시");
	        	   break;
	           case "대전":
	        	   detailAddrClob = detailAddrClob.replace("대전","대전광역시");
	        	   break;
	           case "울산":
	        	   detailAddrClob = detailAddrClob.replace("울산","울산광역시");
	        	   break;
	           case "경기":
	        	   detailAddrClob = detailAddrClob.replace("경기","경기도");
	        	   break;
	           case "강원":
	        	   detailAddrClob = detailAddrClob.replace("강원","강원도");
	        	   break;
	           case "충북":
	        	   detailAddrClob = detailAddrClob.replace("충북","충청북도");
	        	   break;
	           case "충남":
	        	   detailAddrClob = detailAddrClob.replace("충남","충청남도");
	        	   break;
	           case "전북":
	        	   detailAddrClob = detailAddrClob.replace("전북","전라북도");
	        	   break;
	           case "전남":
	        	   detailAddrClob = detailAddrClob.replace("전남","전라남도");
	        	   break;
	           case "경북":
	        	   detailAddrClob = detailAddrClob.replace("경북","경상북도");
	        	   break;
	           case "경남":
	        	   detailAddrClob = detailAddrClob.replace("경남","경상남도");
	        	   break;
           }

            var positions = [];
			
            
            let bjdSggCode = "";
            let bjdEmdCode = "";
            let roadName = "";
            let aptName = "";
            $(function (){
            	// 현재 주소를 법정동 테이블에서 찾아서 해당하는 지역코드를 반환받는다.
            	// result 에 그 지역코드가 저장될 것이고
            	// result를 콘솔에 찍은후 result값을 활용해준다.
            	
            	$.ajax({
    				  url : "<%=request.getContextPath()%>/map/bjdCode",
    				  method: "post",
    				  data: {detailAddrClob : detailAddrClob},
    				  dataType: "text",
    				  success : function(result){
    					  let bjdCodeFirst = result.substring(0, 5);
    					  
    					  
    					  $.ajax({
    	                      url: "<%=request.getContextPath()%>/map/getXmlCode",
    	                      method: "get",
    	                      data: {'code' : bjdCodeFirst},
    	                      dataType: "text",
    	                      contentType : "text/plain; charset:UTF-8",
    	                      success: function(resultData){
    	                    	 
    	                         let result = JSON.parse(resultData);
    	                         let result0 = JSON.parse(result[0]);
    	                         let keys = Object.keys(result0);
    
    	                         let areaCode = result0["지역코드"];
    	                        
    	                         for(var i=0; result.length ;i++){
	   	                        	  let addressToXy = JSON.parse(result[i]);
	                            	  roadName = addressToXy['도로명'];
	   	                          	  
	   	                          	  
	   	                          	  listView(addressToXy, roadName);
	   	                          	  
	   	                          	  bjdSggCode = addressToXy['법정동시군구코드'];
	                            	  bjdEmdCode = addressToXy['법정동읍면동코드'];
									  
	                            	  aptName = addressToXy['아파트'];
    	                          	 
	                            	  
	                            	  
    	                              var callback = function(result, status) {
 	    	                        	 
        	                              if (status === kakao.maps.services.Status.OK) {
        	                                  
    			    	                         
    			    	                       	  for(var i=0; i<result.length;i++){
    			    	                       		  let tagNameStr = result[i].y+""+result[i].x;
    			    	                       		  let min = "";
    			    	                       		  let max = "";
    			    	                       		  let minToMax = "";
    			    	                       		 
    			    	                       		  for(var j=0 ; j<30 ; j++){
    			    	                       			
      			    	                       			  // 모든 li태그를 배열에 담는다
      			    	                       			  let tagArr = document.getElementsByName(tagNameStr);
    			    	                       			  
    			    	                       			  let tagMoney = "";
    			    	                       			 // 해당 li태그의 모든 시세값을 가져온다.
    			    	                       			 for(var k=0; k<tagArr.length; k++){
    			    	                       				 if(k==tagArr.length-1){
    			    	                       					 tagMoney += tagArr[k].innerHTML.split("<br>")[0].replace("억","").replace(",","");
    			    	                       				 }else{
	    			    	                       				 tagMoney += tagArr[k].innerHTML.split("<br>")[0].replace("억","").replace(",","")+" ";
    			    	                       				 }
    			    	                       				 
    			    	                       			 }
    			    	                       			 
    			    	                       			 let tagMarr = tagMoney.split(" ");
    			    	                       			 let tagParr =  tagMarr.map(Number);
    			    	                       			 console.log("?"+tagMarr);
    			    	                       			 
    			    	                       			  max = Math.max.apply(null,tagParr);
    			    	                       			  
    			    	                       			  min = Math.min.apply(null,tagParr);
    			    	                       			
      			    	                       			  // 시세값을 비교해서 최소는 min에 최대는 max에 저장한다.
      			    	                       			  
      			    	                       			  minToMax = "최소 : "+min+"<br>최대 : "+max+"<br>(단위 : 만)";
      			    	                       			  
      			    	                       			  if(max == 0 && min == 0){
      			    	                       				 minToMax = "실거래 평균 시세 없음";
      			    	                       			  }
      			    	                       			  
      			    	                       			  break;
      			    	                       				/* } */
    			    	                       		  }  
    			    	                       			positions.push({
    			    	                       				// content안에 주소정보랑 최소금액~최대금액 표시하기
    			    	                       				// content div안에 min과 max를 넣어준다.
    			    	                       				content: "<div class='infoAdd'>"+"주소 : "+result[i].address_name+'</div>'
    			    	                       						+ '<div class="price">'+minToMax+"</div>",
    			    	                       				latlng: new kakao.maps.LatLng(result[i].y, result[i].x)
    			    	                       			})
    			    	                       	  		
    			    	                       	  } 
    			    	                         
    	    	                                   for (var i = 0; i < positions.length; i ++) {
    	    	                                	   removeMarker();
    	    	    	                        	    // 마커를 생성합니다
    	    	    	                        	    const marker = new kakao.maps.Marker({
    	    	    	                        	        map: map, // 마커를 표시할 지도
    	    	    	                        	        position: positions[i].latlng, // 마커의 위치
    	    	    	                        	        clickable: true 
    	    	    	                        	        
    	    	    	                        	        
    	    	    	                        	    });
    	    	    	                        	    
    	    	    	                        	    kakao.maps.event.addListener(marker, 'click', function() {
    	    	    	                        	        // 마커 위에 인포윈도우를 표시합니다
    	    	    	                        	        let markerPosit = marker.getPosition()+"";
    	    	    	                        	        markerPosit = markerPosit.replace(" ", "").replace("(","").replace(")", "").replace("," , "");
    	    	    	                        	        /* location.href="#"+markerPosit; */
    	    	    	                        	        var backgroundTag = $("[name='"+markerPosit+"']");
    	    	    	                        	        $(backgroundTag).siblings().css("background-color","#f0f3f5");
    	    	    	                        	        
    	    	    	                        	        
    	    	    	                        	        if($(backgroundTag).css("background-color") != "rgb(75 100 119)"){
    	    	    	                        	        	$(backgroundTag).css("background-color", "rgb(75 100 119)");
    	    	    	                        	        	$(backgroundTag).css("color", "white");
    	    	    	                        	        }
    	    	    	                        	    });
    	    	    	                        	    
    	    	    	                        	    var markerImage = new kakao.maps.MarkerImage(
	    	    	                        	        	    'https://ifh.cc/g/7NYHtl.png',
	    	    	                        	        	    new kakao.maps.Size(40,40), new kakao.maps.Point(13, 34));
	    	    	                        	     
	    	    	                        	        marker.setImage(markerImage);
    	    	    	                        	    
    	    	    	                        	    var infowindow = new kakao.maps.InfoWindow({
    	    	    	                        	        content: positions[i].content // 인포윈도우에 표시할 내용
    	    	    	                        	    });
    	    	    	                        	    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
    	    	    	                        	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    	    	    	                         }
    	    	                                 
    	    	                                  
    	    	                              }
	   	                          
        	                              
   	                        	 		 }
	   	                           // 리스트 비워놓고 추가하고 비워놓고 추가하고...
	   	                           
    	                           // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    	                              function makeOverListener(map, marker, infowindow) {
    	                                  return function() {
    	                                      infowindow.open(map, marker);
    	                                  };
    	                              }

    	                              // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    	                              function makeOutListener(infowindow) {
    	                                  return function() {
    	                                      infowindow.close();
    	                                  };
    	                              }
    	                              
    	                              
    	                              // 제대로된 주소 필요함
    	                              geocoder.addressSearch(roadName, callback);
	   	                          	
    	                         
    	                         }
    	                         
    	                      },
    	                      error: function(){
    	                         console.log("에러남");
    	                      }
    	                         
    	                     })
    	                     
    	                     function listView(addressToXy, roadName){
    						  	listEl = document.getElementById('placesList');
    						  	var listLiTag = document.createElement("li");
    						  	listLiTag.setAttribute("class", "goDetail");
    						  	
						  	
    						  	$("#allOj").css("background-color", "#1F4B6B").css("color", "white");
    						  	$("#comOkOj").css("background-color", "#F0F0F0").css("color", "black");
    						  	
    						  	
    						  	/* listLiTag.setAttribute("name", 해당li의 정보를 주는 좌표); */
    						  	// x y를 넣어서 <li name="134.25252, 145.12321321">
    						  	// marker.click() => location.href="#134.25252,145.12321321"
    						    
    						  	
    						  	geocoder.addressSearch(roadName, function(result, status){
    						  		
    						  		if (status === kakao.maps.services.Status.OK) {
    						  			let xy = result[0].y+result[0].x;
    						  			listLiTag.setAttribute("name", xy);
    									
    						  			
    						  		}
    						  		
    						  		
    						  		
    						  		
    						  		
    						  	});
    						  	
    						  	var str = addressToXy["거래금액"].trim();
    						  
    						    var arr = [...str];
    						    var arrLeng = arr.length-5;  

    						  	arr.splice(arrLeng, 0, "억");
    						  	
    						  	var resultStr = arr.join('');
    						  				  	
    						  	listLiTag.innerHTML = resultStr+"<br> "+addressToXy["아파트"]+"<br> "+addressToXy["전용면적"]+"㎡ | "+addressToXy["층"]+"층<br> 중개사소재지 : "+addressToXy["중개사소재지"];
    						  	listEl.appendChild(listLiTag);
    					  		
    						  	listLiTag.addEventListener('click', function(){
    						  		let add = addressToXy["지역코드"];
    						  		let sidoCode = add.substring(0,2);
    						        
    						  		document.getElementById("sidoCode").value = sidoCode;
    						  		document.getElementById("sellSno").value = addressToXy["일련번호"];
    						  		document.getElementById("sellName").value = addressToXy["아파트"];
    						  		document.getElementById("sellAddress").value = detailAddrClob+" "+addressToXy["도로명"];
    						  		document.getElementById("sellPrice").value = resultStr;
    						  		document.getElementById("brokerAdd").value = addressToXy["중개사소재지"];
    						  		document.getElementById("sellPrivateArea").value = addressToXy["전용면적"]+"㎡";
    						  		document.getElementById("sellFloor").value = addressToXy["층"];
    						  		document.getElementById("ymd").value = addressToXy["년"]+" / "+addressToXy["월"]+" / "+addressToXy["일"];
    						  		document.getElementById("sellApprovalDatetime").value = addressToXy["건축년도"];
    						  		document.getElementById("realYn").value = addressToXy["해제여부"];
    						  		document.getElementById("realYnDate").value = addressToXy["해제사유발생일"];
    						  	
    						  		document.getElementById("gtSellDetail").submit();
    						  	});
    						  	
    						  	
    					  }
    					  
    					  function removeAllChildNods(el) {   
    						    while (el.hasChildNodes()) {
    						        el.removeChild (el.lastChild);
    						    }
    						}
    					// 지도 위에 표시되고 있는 마커를 모두 제거합니다
    					  function removeMarker() {
    					      for ( var i = 0; i < markers.length; i++ ) {
    					          markers[i].setMap(null);
    					      }   
    					      markers = [];
    					  }
    					  
    					  removeAllChildNods(listEl);
    			  		  
    				  }
    			
              });
            })
            
        }   
    });
    
    
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                /* infoDiv.innerHTML = result[i].address_name; */
                break;
            }
        }
    }    
} 

$("#comOkOj").click(function(){
  	$("#allOj").css("background-color", "#F0F0F0").css("color", "black");
  	$("#comOkOj").css("background-color", "#1F4B6B").css("color", "white");
	
	$.ajax({
		type: "get",
		url: "<%= request.getContextPath() %>/sell/sellList",
		dataType: "json",
		success: function(result){
			console.log(result);
			console.log(result.length);
			var listEl = document.getElementById('placesList');
			listEl.innerHTML = "";
		  	
			for(let i=0; i<result.length; i++){
				var listLiTag = document.createElement("li");
				listLiTag.setAttribute("id", result[i].sellNo);
			  	listLiTag.innerHTML = result[i].sellPrice +"<br>"+
					result[i].sellName+"<br>"+
					result[i].sellPrivateArea+"㎡ | "+ result[i].sellFloor+"층<br>"+
					"중개사 소재지 : "+result[i].address.substring(4);
		  		listEl.appendChild(listLiTag);
			}
			
		  	
		},
		error: function(result){
			console.log("에러");
		}
		
		
		
	});
});

let plusLi = "";
let resultBjdCode = "";
$("#keyword").keyup(function(){
	$("#keywordListBox").css("display", "block");
	
	$(document).on('click', function(e) {
	    var container = $("#keywordListBox");
	    if (!$(e.target).closest(container).length) {
	        container.hide();
	    }
	});
	
	listEl = "";
	let keyword = document.getElementById("keyword").value;
	// 유효성검사 
	
		var positions = [];
		$.ajax({
			  url : "<%=request.getContextPath()%>/map/searchKeyword",
			  method: "get",
			  data: {'keyword' : keyword},
			  dataType: "json",
			  success : function(result){
				  console.log(result);
				  // li 태그에 정보 넣어서 추가
				  document.getElementById("keywordListBoxUl").innerHTML = "";
				  for(let i=0; i<result.length; i++){
					  plusLi = document.createElement("li");
					  resultBjdCode = result[i].bjdCode;
					  plusLi.setAttribute("class", "kwBoxLi");
					  plusLi.setAttribute("id", resultBjdCode);
					  plusLi.innerHTML = result[i].bjdName;
					  
					  document.getElementById("keywordListBoxUl").appendChild(plusLi);
					  
					  let buttonLi = document.getElementById(resultBjdCode);
					  let btnLiVal = document.getElementById(resultBjdCode).id;
					  console.log("btnLiVal "+btnLiVal );
					  let resultBLV = btnLiVal.substring(0, 5);
					  console.log("resultBLV "+resultBLV);
					  
					  buttonLi.onclick = function () {
						  
						  $.ajax({
							  url:"<%= request.getContextPath()%>/map/getXmlCode",
							  method: "get",
							  data :{'code' : resultBLV },
							  dataType: "text",
    	                      contentType : "text/plain; charset:UTF-8",
							  success: function(resultData){
								  console.log(resultData);
								  let result = JSON.parse(resultData);
	    	                         let result0 = JSON.parse(result[0]);
	    	                         let keys = Object.keys(result0);
	    
	    	                         let areaCode = result0["지역코드"];
	    	                        
	    	                         for(var i=0; result.length ;i++){
		   	                        	  let addressToXy = JSON.parse(result[i]);
		                            	  roadName = addressToXy['도로명'];
		   	                          	  
		   	                          	  
		   	                          	  listView(addressToXy, roadName);
		   	                          	  
		   	                          	  bjdSggCode = addressToXy['법정동시군구코드'];
		                            	  bjdEmdCode = addressToXy['법정동읍면동코드'];
										  
		                            	  aptName = addressToXy['아파트'];
	    	                          	 
		                            	  
		                            	  
	    	                              var callback = function(result, status) {
	 	    	                        	 
	        	                              if (status === kakao.maps.services.Status.OK) {
	        	                                  
	    			    	                         
	    			    	                       	  for(var i=0; i<result.length;i++){
	    			    	                       		  let tagNameStr = result[i].y+""+result[i].x;
	    			    	                       		  let min = "";
	    			    	                       		  let max = "";
	    			    	                       		  let minToMax = "";
	    			    	                       		 
	    			    	                       		  for(var j=0 ; j<30 ; j++){
	    			    	                       			
	      			    	                       			  // 모든 li태그를 배열에 담는다
	      			    	                       			  let tagArr = document.getElementsByName(tagNameStr);
	    			    	                       			  
	    			    	                       			  let tagMoney = "";
	    			    	                       			 // 해당 li태그의 모든 시세값을 가져온다.
	    			    	                       			 for(var k=0; k<tagArr.length; k++){
	    			    	                       				 if(k==tagArr.length-1){
	    			    	                       					 tagMoney += tagArr[k].innerHTML.split("<br>")[0].replace("억","").replace(",","");
	    			    	                       				 }else{
		    			    	                       				 tagMoney += tagArr[k].innerHTML.split("<br>")[0].replace("억","").replace(",","")+" ";
	    			    	                       				 }
	    			    	                       				 
	    			    	                       			 }
	    			    	                       			 
	    			    	                       			 let tagMarr = tagMoney.split(" ");
	    			    	                       			 let tagParr =  tagMarr.map(Number);
	    			    	                       			 console.log("?"+tagMarr);
	    			    	                       			 
	    			    	                       			  max = Math.max.apply(null,tagParr);
	    			    	                       			  
	    			    	                       			  min = Math.min.apply(null,tagParr);
	    			    	                       			
	      			    	                       			  // 시세값을 비교해서 최소는 min에 최대는 max에 저장한다.
	      			    	                       			  
	      			    	                       			  minToMax = "최소 : "+min+"<br>최대 : "+max+"<br>(단위 : 만)";
	      			    	                       			  
	      			    	                       			  if(max == 0 && min == 0){
	      			    	                       				 minToMax = "실거래 평균 시세 없음";
	      			    	                       			  }
	      			    	                       			  
	      			    	                       			  break;
	      			    	                       				/* } */
	    			    	                       		  }  
	    			    	                       			positions.push({
	    			    	                       				// content안에 주소정보랑 최소금액~최대금액 표시하기
	    			    	                       				// content div안에 min과 max를 넣어준다.
	    			    	                       				content: "<div class='infoAdd'>"+"주소 : "+result[i].address_name+'</div>'
	    			    	                       						+ '<div class="price">'+minToMax+"</div>",
	    			    	                       				latlng: new kakao.maps.LatLng(result[i].y, result[i].x)
	    			    	                       			})
	    			    	                       	  		
	    			    	                       	  } 
	    			    	                         
	    	    	                                   for (var i = 0; i < positions.length; i ++) {
	    	    	                                	   removeMarker();
	    	    	    	                        	    // 마커를 생성합니다
	    	    	    	                        	    const marker = new kakao.maps.Marker({
	    	    	    	                        	        map: map, // 마커를 표시할 지도
	    	    	    	                        	        position: positions[i].latlng, // 마커의 위치
	    	    	    	                        	        clickable: true 
	    	    	    	                        	        
	    	    	    	                        	        
	    	    	    	                        	    });
	    	    	    	                        	    
	    	    	    	                        	    kakao.maps.event.addListener(marker, 'click', function() {
	    	    	    	                        	        // 마커 위에 인포윈도우를 표시합니다
	    	    	    	                        	        let markerPosit = marker.getPosition()+"";
	    	    	    	                        	        markerPosit = markerPosit.replace(" ", "").replace("(","").replace(")", "").replace("," , "");
	    	    	    	                        	        /* location.href="#"+markerPosit; */
	    	    	    	                        	        var backgroundTag = $("[name='"+markerPosit+"']");
	    	    	    	                        	        $(backgroundTag).siblings().css("background-color","#f0f3f5");
	    	    	    	                        	        
	    	    	    	                        	        
	    	    	    	                        	        if($(backgroundTag).css("background-color") != "rgb(75 100 119)"){
	    	    	    	                        	        	$(backgroundTag).css("background-color", "rgb(75 100 119)");
	    	    	    	                        	        	$(backgroundTag).css("color", "white");
	    	    	    	                        	        }
	    	    	    	                        	    });
	    	    	    	                        	    
	    	    	    	                        	    var markerImage = new kakao.maps.MarkerImage(
		    	    	                        	        	    'https://ifh.cc/g/7NYHtl.png',
		    	    	                        	        	    new kakao.maps.Size(40,40), new kakao.maps.Point(13, 34));
		    	    	                        	     
		    	    	                        	        marker.setImage(markerImage);
	    	    	    	                        	    
	    	    	    	                        	    var infowindow = new kakao.maps.InfoWindow({
	    	    	    	                        	        content: positions[i].content // 인포윈도우에 표시할 내용
	    	    	    	                        	    });
	    	    	    	                        	    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
	    	    	    	                        	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	    	    	    	                         }
	    	    	                                 
	    	                              			}
	    	    	                              }
		   	                          
	        	                           // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	        	                              function makeOverListener(map, marker, infowindow) {
	        	                                  return function() {
	        	                                      infowindow.open(map, marker);
	        	                                  };
	        	                              }

	        	                              // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	        	                              function makeOutListener(infowindow) {
	        	                                  return function() {
	        	                                      infowindow.close();
	        	                                  };
	        	                              }
	        	                              
	        	                              
	        	                              // 제대로된 주소 필요함
	        	                              geocoder.addressSearch(roadName, callback);
	   	                        	 		 }
								  	 
							  },
							  error: function(result){
								  console.log("에러");
							  }
						  });
						  
						  function listView(addressToXy, roadName){
  						  	listEl = document.getElementById('placesList');
  						  	var listLiTag = document.createElement("li");
  						  	listLiTag.setAttribute("class", "goDetail");
  						  	
						  	
  						  	$("#allOj").css("background-color", "#1F4B6B").css("color", "white");
  						  	$("#comOkOj").css("background-color", "#F0F0F0").css("color", "black");
  						  	
  						  	
  						  	/* listLiTag.setAttribute("name", 해당li의 정보를 주는 좌표); */
  						  	// x y를 넣어서 <li name="134.25252, 145.12321321">
  						  	// marker.click() => location.href="#134.25252,145.12321321"
  						    
  						  	
  						  	geocoder.addressSearch(roadName, function(result, status){
  						  		
  						  		if (status === kakao.maps.services.Status.OK) {
  						  			let xy = result[0].y+result[0].x;
  						  			listLiTag.setAttribute("name", xy);
  									
  						  			
  						  		}
  						  		
  						  		
  						  		
  						  		
  						  		
  						  	});
  						  	
  						  	var str = addressToXy["거래금액"].trim();
  						  
  						    var arr = [...str];
  						    var arrLeng = arr.length-5;  

  						  	arr.splice(arrLeng, 0, "억");
  						  	
  						  	var resultStr = arr.join('');
  						  				  	
  						  	listLiTag.innerHTML = resultStr+"<br> "+addressToXy["아파트"]+"<br> "+addressToXy["전용면적"]+"㎡ | "+addressToXy["층"]+"층<br> 중개사소재지 : "+addressToXy["중개사소재지"];
  						  	listEl.appendChild(listLiTag);
  					  		
  						  	listLiTag.addEventListener('click', function(){
  						  		let add = addressToXy["지역코드"];
  						  		let sidoCode = add.substring(0,2);
  						        
  						  		document.getElementById("sidoCode").value = sidoCode;
  						  		document.getElementById("sellSno").value = addressToXy["일련번호"];
  						  		document.getElementById("sellName").value = addressToXy["아파트"];
  						  		document.getElementById("sellAddress").value = addressToXy["도로명"];
  						  		document.getElementById("sellPrice").value = resultStr;
  						  		document.getElementById("brokerAdd").value = addressToXy["중개사소재지"];
  						  		document.getElementById("sellPrivateArea").value = addressToXy["전용면적"]+"㎡";
  						  		document.getElementById("sellFloor").value = addressToXy["층"];
  						  		document.getElementById("ymd").value = addressToXy["년"]+" / "+addressToXy["월"]+" / "+addressToXy["일"];
  						  		document.getElementById("sellApprovalDatetime").value = addressToXy["건축년도"];
  						  		document.getElementById("realYn").value = addressToXy["해제여부"];
  						  		document.getElementById("realYnDate").value = addressToXy["해제사유발생일"];
  						  	
  						  		document.getElementById("gtSellDetail").submit();
  						  	});
  						  	
  						  	
  					  	}
						  
						  function removeAllChildNods(el) {   
  						    while (el.hasChildNodes()) {
  						        el.removeChild (el.lastChild);
  						    }
  						}
	  					// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	  					  function removeMarker() {
	  					      for ( var i = 0; i < markers.length; i++ ) {
	  					          markers[i].setMap(null);
	  					      }   
	  					      markers = [];
	  					  }
	  					  
	  					  removeAllChildNods(listEl);
					}
					  
				  }
					
                      
			  },
			  error : function(result){
				  /* alert("결과가 존재하지 않습니다. 다시 입력해주세요."); */
			  }
		})
	
});

<%-- let liId = "";

$(document).on('click', '.kwBoxLi',
function(e){
	e.preventDefault();
	liId = $('.kwBoxLi').attr('id');
	console.log("liId "+liId);
	
	$.ajax({
		url: "<%= request.getContextPath%>/map/",
		
		
	});

}) --%>

 
</script>
<script>
var selectBtn = document.getElementsByClassName("selectBtn");

function handleClick(event) {
  console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  console.log(event.target.classList);

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < selectBtn.length; i++) {
    	selectBtn[i].classList.remove("clicked");
    }

    event.target.classList.add("clicked");
  }
}

function init() {
  for (var i = 0; i < selectBtn.length; i++) {
	  selectBtn[i].addEventListener("click", handleClick);
  }
}

init();
</script>

</body>

</html>