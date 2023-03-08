<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>SurveyList Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>항목</th>
					<th>투표수</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${list}">
					<tr>
						<td>${e.num}</td>
						<c:choose>
							<c:when test="${sessionScope.sessionID eq 'admin'}">
								<td><a href="surveyAdminDetail?num=${e.num}">${e.sub}</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="surveyDetail?num=${e.num}">${e.sub}</a></td>
							</c:otherwise>
						</c:choose>
						<td>${e.code}</td>
						<td>${e.surveytotal}</td>
						<td>${e.sdate}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="5">
						<button type="button" onclick="location='surveyForm'">등록하기</button>
						<button type="button" id="surveyClient">설문참여하기</button>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</article>