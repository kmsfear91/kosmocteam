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
				<h3>UI �䱸���� Ȯ���ϱ�,UI �����ϱ�</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
							${sessionScope.sessionName}�� �ݰ�����. ����� �����ϴ� ������?
							<div class="card">
				               <div class="row no-gutters">
				                  <div class="col-8">
				                     <div id="map"></div>
				                  </div>
				                  <div class="col-4">
				                     <div class="card-body">
				                        <h4 class="card-text">jQuery���͵� ����</h4>
				                        <p class="card-text">���� ��õ�� ���������1�� 151 2�� B���ǽ�</p>
				                        <button type="button" class="btn btn-dark" onclick="alert('Open �غ���!')">jQuery���͵� ���� Ȯ��</button>
				                     </div>
				                  </div>
				               </div>
				            </div>
						</c:when>
						<c:otherwise>
							jQuery �� �̿��Ͽ� �������� �������Ͽ��� �Ʒ� �䱸���״�� �����մϴ�.<br />
							�α����� �ϸ� ��Ҹ� Ȯ�� �� �� �־��.
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
		<div class="carousel-item">
			<img src="${pageContext.request.contextPath}/resources/image/d2.jpg" alt="Carousel" class="d-block" style="width: 100%">
			<div class="carousel-caption">
				<h3>Carousel ����� CSS3��!</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
							${sessionScope.sessionName}�� �ݰ�����. ����� �����ϴ� ������?
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
				<h3>UI �䱸���� Ȯ���ϱ�,UI �����ϱ�</h3>
				<p>
					<c:choose>
						<c:when test="${sessionScope.sessionName != null}">
							${sessionScope.sessionName}�� �ݰ�����. ����� �����ϴ� ������?
						</c:when>
						<c:otherwise>
							������ ���� ������ ������ָ� ���?
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
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.477107, 126.879647), // ������ �߽���ǥ
	    level: 3 // ������ Ȯ�� ����
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

	// ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
	var marker = new kakao.maps.Marker({ 
	    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
	    position: map.getCenter() 
	}); 
	// ������ ��Ŀ�� ǥ���մϴ�
	marker.setMap(map);
</script>