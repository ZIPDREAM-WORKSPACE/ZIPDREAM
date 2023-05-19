<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZIPDREAM</title>
<style>
	div{
		   /* border : 1px solid red; */
	}
	.wrap{
		width: 100%;
		height: 100vw;
		display: inline-flex;
		border-top: 1px solid lightblue;
	}
	#con1{
		float: left;
		width: 20%;
		height: 100%;
	}
	#map{
		float: right;
		width: 80%;
		height: 100%;
		border: 1px solid lightgray;
	}
	#con1>#search{
		position: top;
		width: 100%;
		height: 50px;
		
	}
	.listWrap{
		width: 100%;
		height: 2083px;
		border-bottom: 1px solid lightgray; 
		overflow: auto;
	}
	.listWrap::-webkit-scrollbar {
	    width: 10px;
	    background-color: gray;
	  }
	.bi-search{
		float: left;
	}
	#search>svg{
		padding-top: 10px;
	}
	#search{
		border-bottom: 1px solid lightgray;
	}
	.object{
		width: 100%;
		height: 150px;
		border-bottom: 1px solid lightgray;
	}
	#imgArea{
		margin: 10px;
		float: left;
		width: 130px;
		height: 130px;
		background-color: red;
	}
	.infoArea{
		float:right;
		width: 230px;
		height: 130px;
		margin-top: 10px;
		margin-right: 10px;
	}
	#ia1{
		width: 100%;
		height: 50px;
	}
	#ia2{
		width: 100%;
		height: 80px;
	}
	.searchBtn{
		border: none;
		background-color: transparent;
	}
	.dropdown-item{
		display: inline-flex;
	}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>

<body>
	<div class="wrap">
		<div id="con1">
			<div id="search">
				
				  <!-- <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    Dropdown button
				  </button> -->
				  <button class="searchBtn" type="submit"data-bs-toggle="dropdown" aria-expanded="false" >
					<svg 
						xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
				  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				  	<div class="dropdown-item">1</div>
				  	<div class="dropdown-item">2</div>
				  	<div class="dropdown-item">3</div>
				  </div>
				  
				
				<input id="keyword" type="text" style="width: 70%; height: 95%; border: none;  outline: none; font-size: 18px;">
				
			</div>
			<div class="listWrap">
				<div class="object">
					<div id="imgArea"></div>
					<div class="infoArea">
						<div id="ia1">현지아파트</div>
						<div id="ia2">짱조아요</div>
					</div>
				</div>
			</div>
		</div>
		<div id="map">
		</div>
	</div>
	
	
	
	
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cf092d014fa143b1ab25b8a119f9ee7"></script>
<script>
	/* let markers: any[] = []; */

	const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	let options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	
/* 	const markerPosition = new window.kakao.maps.LatLng(
			38.2313466,
			128.2139293
	);
	const marker = new window.kakao.maps.Marker({
			position: markerPosition,
	});
	marker.setMap(map);
	
	const ps = new window.kakao.maps.services.Places();
	const infowindow = new window.kakao.maps.InfoWindow({ zIndex: 1 });
	
	const searchForm = document.getElementsById("searchBtn");
		searchForm?.addEventListener("click", function(e){
			e.preventDefault();
			searchPlaces();
		}); */
	
</script>

<!-- <script>
function searchPlaces() {
	const keyword = document.getElementById("keyword").value;
  
	if (!keyword.replace(/^\s+|\s+$/g, "")) {
	alert("키워드를 입력해주세요!");
	  
		return false;
	}
	  
	ps.keywordSearch(keyword, placesSearchCB);
}

function placesSearchCB(data, status, pagination) {
    if (status === window.kakao.maps.services.Status.OK) {
      displayPlaces(data);

      displayPagination(pagination);

      const bounds = new window.kakao.maps.LatLngBounds();
      for (let i = 0; i < data.length; i++) {
        displayMarker(data[i]);
        bounds.extend(new window.kakao.maps.LatLng(data[i].y, data[i].x));
      }

      map.setBounds(bounds);
    } else if (status === window.kakao.maps.services.Status.ZERO_RESULT) {
      alert("검색 결과가 존재하지 않습니다.");
    } else if (status === window.kakao.maps.services.Status.ERROR) {
      alert("검색 결과 중 오류가 발생했습니다.");
    }
  }
  
  
  var sw = new kakao.maps.LatLng(36, 127);
  	  ne = new kakao.maps.LatLng(37, 128);
  
  var bounds = new kakao.maps.LatLngBounds(sw, ne); // 인자를 주지않으면 빈 영역 생성
  
  function displayMarker(place) {
      const marker = new window.kakao.maps.Marker({
        map,
        position: new window.kakao.maps.LatLng(place.y, place.x),
      });
      window.kakao.maps.event.addListener(marker, "click", function (mouseEvent) {
          props.setAddress(place);
          infowindow.setContent(`
          <span>
          ${place.place_name}
          </span>
          `);
          infowindow.open(map, marker);
          const moveLatLon = new window.kakao.maps.LatLng(place.y, place.x);
          map.panTo(moveLatLon);
        }
      );
    }
  	  

</script> -->

<script>
import requests

searching = '합정 스타벅스'
url = 'https://dapi.kakao.com/v2/local/search/keyword.json?query={}'.format(searching)
headers = {
    "Authorization": "KakaoAK 5cf092d014fa143b1ab25b8a119f9ee7"
}
places = requests.get(url, headers = headers).json()['documents']
places
	
</script>

</html>