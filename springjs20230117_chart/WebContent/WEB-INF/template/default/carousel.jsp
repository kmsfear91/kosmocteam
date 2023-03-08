<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.card {
    margin-bottom: 5%;
    min-height: 200px;
}


.card-caption h4 {
    margin-bottom: 8px;
    font-style: bold;
}

.card button {
    margin-top: 16px;
}

.card-text {
    margin: 8px 0;
    color: #232323;
}

#map {
    display: flex;
    width: 100%;
    min-height: 300px;
    height: 100%;
}
</style>
<div id="demo" class="carousel slide" data-bs-ride="carousel">
	<!-- Indicators/dots -->
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>
	<!-- The slideshow/carousel -->
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="${pageContext.request.contextPath}/resources/image/d1.jpg" alt="Kosmo113" class="d-block" style="width: 100%">
			<div class="carousel-caption">
				<h3>UI 요구사항 확인하기,UI 설계하기</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
							${sessionScope.sessionName}님 반가워요. 당신이 좋아하는 선물은?
							<div class="card">
				               <div class="row no-gutters">
				                  <div class="col-8">
				                     <div id="map"></div>
				                  </div>
				                  <div class="col-4">
				                     <div class="card-body">
				                        <h4 class="card-text">jQuery스터디 모임</h4>
				                        <p class="card-text">서울 금천구 가산디지털1로 151 2층 B강의실</p>
				                        <button type="button" class="btn btn-dark" onclick="alert('Open 준비중!')">jQuery스터디 모임 확인</button>
				                     </div>
				                  </div>
				               </div>
				            </div>
						</c:when>
						<c:otherwise>
							jQuery 를 이용하여 제공받은 샘플파일에서 아래 요구사항대로 구현합니다.<br />
							로그인을 하면 장소를 확인 할 수 있어요.
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath}/resources/image/d2.jpg" alt="Carousel" class="d-block" style="width: 100%">
			<div class="carousel-caption">
				<h3>Carousel 기능을 CSS3로!</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
							${sessionScope.sessionName}님 반가워요. 당신이 좋아하는 선물은?
						</c:when>
						<c:otherwise>
							Thank you, CSS3!
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="carousel-item">
			<c:choose>
				<c:when test="${sessionScope.sessionName != null}">
					<c:set var="imgv3" value="d4.png" scope="page" />
				</c:when>
				<c:otherwise>
					<c:set var="imgv3" value="d3.jpg" scope="page" />
				</c:otherwise>
			</c:choose>
			<img src="${pageContext.request.contextPath}/resources/image/${imgv3}" alt="JSP" class="d-block" style="width: 100%">
			<div class="carousel-caption">
				<h3>UI 요구사항 확인하기,UI 설계하기</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
							${sessionScope.sessionName}님 반가워요. 당신이 좋아하는 선물은?
						</c:when>
						<c:otherwise>
							오늘의 날씨 같은거 출력해주면 어떨까?
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
	</div>
	<!-- Left and right controls/icons -->
	<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
		<span class="carousel-control-next-icon"></span>
	</button>
</div>
<%-- Kakao Map API --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5be25e4139861d90b781433aac84885c"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.477107, 126.879647), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
</script>