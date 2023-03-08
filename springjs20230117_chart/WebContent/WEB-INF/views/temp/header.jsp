<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<TITLE>New Document</TITLE>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
a {
	text-decoration: none;
}

select.btn-mini {
	height: auto;
	width: 200px;
	line-height: 14px;
}

.card {
	border: none;
	box-shadow: 5px 6px 6px 2px #e9ecef;
	border-radius: 4px;
}

.dots {
	height: 4px;
	width: 4px;
	margin-bottom: 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
}

.badge {
	padding: 7px;
	padding-right: 9px;
	padding-left: 16px;
	box-shadow: 5px 6px 6px 2px #e9ecef;
}

.user-img {
	margin-top: 4px;
}

.check-icon {
	font-size: 17px;
	color: #c3bfbf;
	top: 1px;
	position: relative;
	margin-left: 3px;
}

.form-check-input {
	margin-top: 6px;
	margin-left: -24px !important;
	cursor: pointer;
}

.form-check-input:focus {
	box-shadow: none;
}

.icons i {
	margin-left: 8px;
}

.reply {
	margin-left: 12px;
}

.reply small {
	color: #b7b4b4;
}

.reply small:hover {
	color: green;
	cursor: pointer;
}

.bgGr1 {
	background-color: #0d6efd
}

.bgGr2 {
	background-color: #ffc107
}

.bgGr3 {
	background-color: #0dcaf0
}

#colTitle {
	background-color: #000000;
}

.mytable-condensed {
	font-size: 11px;
}
</style>
<script>
	$(function() {
		$('#searchv').focusin(function() {
			$(this).val("�˻��� �Է�")
		});
		$('#searchv').focusout(function() {
			$(this).val("")
		});
		//let firstColor ="d-flex flex-row-reverse mybgColor";
		console.log("log00 => " + $('.mybgColor').attr('class'));
		$('#item1').click(function() {
			//$(this).attr('class',firstColor)
			console.log("log => " + $('.mybgColor').attr('class'));
			$('.mybgColor').attr('class', function() {
				$(this).attr('style', 'background-color:#0dcaf0');
				/*
				let changeClass = $(this).attr('class');
				let class_sttr_arr = changeClass.split(" ");
				$.each(class_sttr_arr,function(e,val){
					console.log(e+"::::::::::::::::::"+val)
					if(val.includes("bg-")){
						console.log("================>"+e+":"+val);
						$('.mybgColor').attr('class').replace(val,'bg-info');
					}else{
						changeClass +=" bg-info";
					}
					$('.mybgColor').attr('class',changeClass)
				});
				 */
			});
		});
		$('#item2').click(
				function() {
					console.log("log => " + $('.mybgColor').attr('class'));
					$('.mybgColor').attr('class', function() {
						$(this).attr('style', 'background-color:#ffc107');
					});
					//�̹��� �����ϱ�
					let imgArr = [ 'd1.jpg', 'd2.jpg', 'd3.jpg' ];
					$('.carousel-item > img').each(
							function(idx) {
								console
										.log("�ٲ� �̹��� :" + imgArr[idx]
												+ ", log Img => "
												+ $(this).attr('src'));
								$(this).attr('src',
										'resources/image/' + imgArr[idx]);
							});
				});
		$('#item3').click(
				function() {
					$('.mybgColor').attr('class', function() {
						$(this).attr('style', 'background-color:#0d6efd');
					});
					//�̹��� �����ϱ�
					let imgArr = [ 'c1.jpg', 'c2.jpg', 'c3.jpg' ];
					$('.carousel-item > img').each(
							function(idx) {
								console
										.log("�ٲ� �̹��� :" + imgArr[idx]
												+ ", log Img => "
												+ $(this).attr('src'));
								$(this).attr('src',
										'resources/image/' + imgArr[idx]);
							});
				});
	});
</script>
</head>
<body>
	<header class="text-white text-center">
		<div class="d-flex flex-row-reverse mybgColor">
			<div class="p-2 bg-info">
				<a href="#" class="nav-link text-white" id="item1">Flex item 1</a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.sessionID == null}">
					<div class="p-2 bg-warning">
						<a href="${pageContext.request.contextPath}/login/loginForm" class="nav-link text-white" id="item2">Login</a>
					</div>
					<div class="p-2 bg-primary">
						<a href="${pageContext.request.contextPath}/member/memberForm" class="nav-link text-white" id="item3">ȸ������</a>
					</div>
				</c:when>
				<c:when test="${sessionScope.sessionID != null}">
					<div class="p-2 bg-warning">
						<a href="${pageContext.request.contextPath}/login/logout" class="nav-link text-white" id="item2">Logout</a>
					</div>
					<div class="p-2 bg-primary">
						<a href="${pageContext.request.contextPath}/member/memberForm" class="nav-link text-white" id="item3">����������</a>
					</div>
				</c:when>
			</c:choose>
		</div>
		<!-- Carousel -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
			<!-- Indicators/dots -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
					class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>

			<!-- The slideshow/carousel -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="${pageContext.request.contextPath}/resources/image/d1.jpg"
						alt="Kosmo113" class="d-block" style="width: 100%">
					<div class="carousel-caption">
						<h3>UI �䱸���� Ȯ���ϱ�,UI �����ϱ�</h3>
						<p>
							<c:choose>
								<c:when test="${sessionScope.sessionName != null}">
									${sessionScope.sessionName}�� �ݰ�����. ����� �����ϴ� ������?
								</c:when>
								<c:otherwise>
									jQuery �� �̿��Ͽ� �������� �������Ͽ��� �Ʒ� �䱸���״�� �����մϴ�.
								</c:otherwise>
							</c:choose>
						</p>
					</div>
				</div>
				<div class="carousel-item">
					<img
						src="${pageContext.request.contextPath}/resources/image/d2.jpg"
						alt="Carousel" class="d-block" style="width: 100%">
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
					<img
						src="${pageContext.request.contextPath}/resources/image/${imgv3}"
						alt="JSP" class="d-block" style="width: 100%">
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
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
	</header>
	<%--bg-dark navbar-dark --%>
	<nav class="navbar navbar-expand-sm mybgColor">
		<div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="${pageContext.request.contextPath}/main" class="nav-link active">Home</a></li>
				<li class="nav-item"><a href="${pageContext.request.contextPath}/mboard/boardList" class="nav-link">Board</a></li>
				<li class="nav-item"><a href="${pageContext.request.contextPath}/upload/upboardList" class="nav-link">Upload</a></li>
				<li class="nav-item"><a href="${pageContext.request.contextPath}/mail/emailForm" class="nav-link">Email</a></li>
				<li class="nav-item"><a href="#" class="nav-link">Contact</a></li>
			</ul>
			<form class="d-flex">
				<input class="form-control me-2" type="text" placeholder="Search"
					name="searchv" id="searchv">
				<button class="btn btn-primary" type="button">Search</button>
			</form>
		</div>
	</nav>