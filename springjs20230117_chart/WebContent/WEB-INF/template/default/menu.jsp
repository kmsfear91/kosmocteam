<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="-bs-scroll-height: 100px;">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/web/main">Home</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mboard/boardList">Board</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/upload/upboardList">Upload</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mail/emailForm">Email</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/ksawon/deptForm">Sawon</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/ksawon/sPhoneList">SawonPhone</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/survey/surveyList">Survey</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/test/keyword">Keyword</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Chart</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/studentChart">barChart</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/weatherChart">donutChart</a></li>
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/web/mychart/memberJsonDemo">MemberJsonDemo</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/web/test/test">설날 과제</a></li>
			</ul>
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>