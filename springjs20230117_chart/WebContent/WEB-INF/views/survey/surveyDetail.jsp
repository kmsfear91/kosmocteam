<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>Survey Detail Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th colspan="2">SurveyDetail</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>제목</th>
					<th colspan="2">${vo.sub}</th>
				</tr>
				<c:forEach var="e" items="${vo.survey}" varStatus="i">
					<tr>
						<th>${i.index+1}</th>
						<td>${e.surveytitle}</td>
						<td style="text-align: center;">투표수 : ${e.surveycnt}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="3">
						<button type="button" onclick="location='surveyList'">리스트</button>
						<button type="button" id="delete">삭제</button>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</article>