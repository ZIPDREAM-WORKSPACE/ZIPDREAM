<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	/* border: 0px; */
}

.roomSellWrap {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	min-width: 1200px;
	min-height: 100%;
	position: relative;
}

.roomSellWrap>header {
	width: 100%;
	flex: 0 0 auto;
}

.roomSellTitleWrap {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	height: 278px;
	position: relative;
}

.roomSellTitle {
	margin: 80px 0px 64px;
	font-size: 46px;
	line-height: 70px;
	letter-spacing: -1px;
	font-weight: 700;
}

.roomSellContent {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	padding: 0px 10px;
}

.roomType {
	width: 100%;
	margin-bottom: 50px;
	border-radius: 4px;
	box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 5px 0px;
	border: 1px solid rgb(226, 226, 226);
	background-color: rgb(255, 255, 255);
	overflow: hidden;
}

.roomType>h1 {
	height: 60px;
	color: rgb(34, 34, 34);
	font-size: 20px;
	line-height: 60px;
	text-align: center;
	border-bottom: 1px solid rgb(204, 204, 204);
	position: relative;
	margin-bottom: 0px;
}

.roomType>table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0px;
	margin: 0px;
	padding: 0px;
	border: 0px;
	vertical-align: baseline;
}

.roomType>table tr {
	height: 70px;
	border-bottom: 1px solid rgb(204, 204, 204);
}

.roomType>table th {
	min-width: 150px;
	color: rgb(34, 34, 34);
	background-color: rgb(249, 249, 249);
	vertical-align: middle;
	text-align: center;
}

.roomType>table td {
	vertical-align: middle;
	display: table-cell;
}

.roomTypeList {
	display: flex;
	align-items: center;
	padding: 0px 20px;
	list-style: none;
	margin-bottom: 0px;
	margin-top: 15px;
}

.roomTypeList>li {
	flex: 0 0 auto;
	display: list-item;
	margin-right: 10px;
}

.roomTypeCover {
	display: block;
	position: relative;
	cursor: pointer;
}

.roomTypeCover>input[type="radio"] {
	width: 0px;
	height: 0px;
	opacity: 0;
	position: absolute;
	top: 0px;
	left: 0px;
	outline: none;
}

.roomTypeCover>input[type="radio"]:checked+p {
	color: rgb(255, 255, 255);
	border-color: rgb(50, 108, 249);
	background-color: rgb(50, 108, 249);
}

.roomTypeCover>p {
	display: flex;
	align-items: center;
	justify-content: center;
	min-width: 82px;
	height: 46px;
	padding: 0px 15px;
	color: rgb(102, 102, 102);
	font-size: 14px;
	border: 1px solid rgb(217, 217, 217);
	border-radius: 3px;
	background-color: rgb(255, 255, 255);
	user-select: none;
}

.addressSearch {
	display: flex;
	justify-content: space-between;
	padding: 20px;
}

.addressMap {
	width: 440px;
	height: 330px;
	border: 1px solid rgb(221, 221, 221);
	position: relative;
	height: 250px;
}

.addressInfo>input[type="text"] {
	padding: 0px 16px;
	color: rgb(76, 76, 76);
	font-size: 14px;
	border: 1px solid rgb(223, 223, 223);
	border-radius: 2px;
	background-color: rgb(255, 255, 255);
	width: 430px;
	height: 46px;
	outline: none;
	margin-bottom: 30px;
}

.addressInfo>input[type="button"] {
	height: 46px;
	min-width: 82px;
	margin-left: 10px;
	color: rgb(255, 255, 255);
	font-size: 15px;
	font-weight: 500;
	border: 0px;
	border-radius: 3px;
	background-color: rgb(50, 108, 249);
	user-select: none;
	cursor: pointer;
}

.addressDetail {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 530px;
	height: 100px;
	padding: 0px 15px;
	border: 1px solid rgb(208, 210, 214);
	background-color: rgb(255, 255, 255);
	margin-bottom: 30px;
	outline: none;
}

.appInfo {
	display: flex;
	justify-content: space-between;
	margin: 10px 0px;
}

.dong {
	width: 260px;
	padding-right: 48px;
	position: relative;
}

.inputDong {
	width: 100%;
	padding: 0px 16px;
	color: rgb(76, 76, 76);
	font-size: 14px;
	border: 1px solid rgb(223, 223, 223);
	border-radius: 2px;
	background-color: rgb(255, 255, 255);
	flex-grow: 1;
	height: 46px;
	outline: none;
}

.dong::after {
	content: "동";
	width: 48px;
	height: 46px;
	color: rgb(102, 102, 102);
	font-size: 14px;
	text-align: center;
	line-height: 44px;
	border-width: 1px 1px 1px 0px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-top-color: rgb(208, 210, 214);
	border-right-color: rgb(208, 210, 214);
	border-bottom-color: rgb(208, 210, 214);
	border-image: initial;
	border-left-style: initial;
	border-left-color: initial;
	box-sizing: border-box;
	position: absolute;
	top: 0px;
	right: 0px;
}

.ho {
	margin-left: 10px;
	width: 260px;
	padding-right: 48px;
	position: relative;
}

.inputHo {
	padding: 0px 16px;
	color: rgb(76, 76, 76);
	font-size: 14px;
	border: 1px solid rgb(223, 223, 223);
	border-radius: 2px;
	background-color: rgb(255, 255, 255);
	flex-grow: 1;
	height: 46px;
	outline: none;
}

.ho::after {
	content: "호";
	width: 48px;
	height: 46px;
	color: rgb(102, 102, 102);
	font-size: 14px;
	text-align: center;
	line-height: 44px;
	border-width: 1px 1px 1px 0px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-top-color: rgb(208, 210, 214);
	border-right-color: rgb(208, 210, 214);
	border-bottom-color: rgb(208, 210, 214);
	border-image: initial;
	border-left-style: initial;
	border-left-color: initial;
	box-sizing: border-box;
	position: absolute;
	top: 0px;
	right: 0px;
}

.dealType {
	display: flex;
	align-items: center;
	padding: 12px 20px;
}

.dealType>input[type="button"] {
	width: 100px;
	height: 40px;
	color: rgb(68, 68, 68);
	font-size: 14px;
	border: 1px solid rgb(68, 68, 68);
	border-radius: 3px;
	background-color: rgb(255, 255, 255);
}

.warning {
	display: flex;
	align-items: center;
	margin-top: 23px;
	margin-bottom: 4px;
	line-height: 20px;
	user-select: none;
	position: relative;
}

.warning>svg {
	margin-left: 5px;
}

.warning>span {
	color: rgb(136, 136, 136);
	font-size: 14px;
	line-height: 20px;
	margin-left: 5px;
}

.warning>a {
	margin-left: 5px;
	color: rgb(0, 108, 255);
	font-size: 14px;
	font-weight: 500;
	text-decoration: underline;
}

.agreeWrap {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	margin: 50px 0px 150px;
}

.agreeWrap>label {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-left: 10px;
	cursor: pointer;
	user-select: none;
}

.agreeWrap>label>input[type="checkbox"] {
	margin: 0px;
	border: 0px;
	border-radius: 0px;
	background: url("https://ifh.cc/g/7Dm91V.png") center center/cover
		no-repeat rgb(255, 255, 255);
	appearance: none;
	cursor: pointer;
	width: 22px;
	height: 22px;
}

.agreeWrap>label>input[type="checkbox"]:checked {
	background: url("https://ifh.cc/g/OW3wqJ.png") center center/cover
		no-repeat rgb(255, 255, 255);
}

.agreeWrap>label>p {
	margin-left: 8px;
	margin-bottom: 0;
	color: rgb(34, 34, 34);
	font-size: 16px;
}

.btn-wrap {
	margin-top: 30px;
	text-align: center;
}

.btn-wrap>button {
	width: 160px;
	height: 50px;
}

.cancel {
	color: rgb(34, 34, 34);
	font-size: 15px;
	border: 1px solid rgb(204, 204, 204);
	background-color: rgb(255, 255, 255);
}

.add {
	color: rgb(255, 255, 255);
	font-size: 15px;
	border: 0px;
	background-color: rgb(26, 90, 232);
}

.add:disabled {
	background-color: rgb(136, 136, 136);
}

.addressMap>div {
	width: 52px;
	height: 52px;
	margin: 80px auto 15px;
	border-radius: 50%;
}

.addressMap>p {
	color: rgb(136, 136, 136);
	font-size: 15px;
	line-height: 22px;
	text-align: center;
}

#mapImg>svg {
	width: 52px;
	height: 52px;
}
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="roomSellWrap">
		<header>
			<div class="roomSellTitleWrap">
				<h1 class="roomSellTitle">방내놓기</h1>
			</div>
		</header>
		<form class="roomSellContent">
			<div class="roomType">
				<h1>매물 종류</h1>
				<table>
					<colgroup>
						<col width="150px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>종류 선택</th>
							<td>
								<ul class="roomTypeList">
									<li><label class="roomTypeCover"> <input
											type="radio" name="roomType" checked>
											<p>원룸</p>
									</label></li>
									<li><label class="roomTypeCover"> <input
											type="radio" name="roomType">
											<p>투룸</p>
									</label></li>
									<li><label class="roomTypeCover"> <input
											type="radio" name="roomType">
											<p>쓰리룸</p>
									</label></li>
									<li><label class="roomTypeCover"> <input
											type="radio" name="roomType">
											<p>오피스텔</p>
									</label></li>
									<li><label class="roomTypeCover"> <input
											type="radio" name="roomType">
											<p>아파트</p>
									</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<th>건물 유형</th>
							<td>
								<ul class="roomTypeList">
									<li><label class="roomTypeCover"> <input
											type="radio" name="buildingType">
											<p>단독주택</p>
									</label></li>
									<li><label class="roomTypeCover"> <input
											type="radio" name="buildingType">
											<p>다가구주택</p>
									</label></li>
									<li><label class="roomTypeCover"> <input
											type="radio" name="buildingType">
											<p>빌라</p>
									</label></li>
									<li><label class="roomTypeCover"> <input
											type="radio" name="buildingType">
											<p>상가</p>
									</label></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="roomType">
				<h1>위치 정보</h1>
				<table>
					<colgroup>
						<col width="150px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>주소</th>
							<td>
								<div class="addressSearch">
									<div class="addressInfo">
										<input type="text" id="sample5_address"
											placeholder="주소를 검색하세요."> <input type="button"
											onclick="sample5_execDaumPostcode()" value="검색"><br>
										<input class="addressDetail" placeholder="상세주소를 입력하세요.">
										<div class="appInfo">
											<div class="dong">
												<input class="inputDong" placeholder="예)101동">
											</div>
											<div class="ho">
												<input class="inputHo" placeholder="예)201호">
											</div>
										</div>
									</div>
									<div class="addressMap" >
										<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
										<div id="mapImg">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-geo-alt"
												viewBox="0 0 16 16">
                                                <path
													d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
                                                <path
													d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                            </svg>
										</div>
										<p>
											주소검색을 하시면<br>해당 위치가 지도에 표시됩니다.
										</p>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="roomType" style="margin-bottom: 0px;">
				<h1>거래 정보</h1>
				<table>
					<colgroup>
						<col width="150px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>거래 종류</th>
							<td>
								<div class="dealType">
									<ul class="roomTypeList">
										<li><label class="roomTypeCover"> <input
												type="radio" name="dealType" checked>
												<p>월세</p>
										</label></li>
										<li><label class="roomTypeCover"> <input
												type="radio" name="dealType">
												<p>전세</p>
										</label></li>
										<li><label class="roomTypeCover"> <input
												type="radio" name="dealType">
												<p>매매</p>
										</label></li>
									</ul>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<p class="warning">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-exclamation-octagon-fill"
					viewBox="0 0 16 16">
                    <path
						d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
				<span>허위 매물을 등록할 경우 집드림에서 임의로 계정 및 매물 전체 삭제 처리됩니다.</span> <a href="">허위매물
					제재 정책 확인하기</a>
			</p>
			<div class="agreeWrap">
				<label for="agreeCheck"> <input id="agreeCheck"
					type="checkbox">
					<p>매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</p>
				</label>
				<div class="btn-wrap">
					<button typte="reset" class="cancel">취소</button>
					<button type="submit" class="add" disabled>매물등록</button>
				</div>
			</div>
		</form>
	</div>


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=waPCFjtcKyjDOnXs6Bn4GUGOASC7K5kMpKiyIeuSvEx6xq9M6UV3cGxdX5NBKna%2Fe5nKMWQARaIrhPKkt%2BiGKw%3D%3D&libraries=services"></script>
	<script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };

        //지도를 미리 생성
        var map = new daum.maps.Map(mapContainer, mapOption);
        //주소-좌표 변환 객체를 생성
        var geocoder = new daum.maps.services.Geocoder();
        //마커를 미리 생성
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map
        });


        function sample5_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.address; // 최종 주소 변수

                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("sample5_address").value = addr;
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function(results, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {

                            var result = results[0]; //첫번째 결과의 값을 활용

                            // 해당 주소에 대한 좌표를 받아서
                            var coords = new daum.maps.LatLng(result.y, result.x);
                            // 지도를 보여준다.
                            mapContainer.style.display = "block";
                            map.relayout();
                            // 지도 중심을 변경한다.
                            map.setCenter(coords);
                            // 마커를 결과값으로 받은 위치로 옮긴다.
                            marker.setPosition(coords)
                        }
                    });
                }
            }).open();
        }
    </script>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>