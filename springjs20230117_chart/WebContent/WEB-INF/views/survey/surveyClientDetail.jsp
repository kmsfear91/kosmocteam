<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>Survey Client Detail Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<form method="post" action="addSurveyClient">
			<table class="table">
				<thead>
					<tr>
						<th colspan="2">SurveyDetail</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>����</th>
						<th>${vo.sub}<input type="hidden" name="subcode" value="${vo.num}"></th>
					</tr>
					<c:forEach var="e" items="${vo.survey}" varStatus="i">
						<tr>
							<th>${i.index+1} <input type="radio" name="subtype" value="${e.subtype}"></th>
							<td>${e.surveytitle}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
							<button type="submit">��ǥ�ϱ�</button>
							<button type="button" onclick="location='surveyList'">����Ʈ</button>
							<button type="button" onclick="location='../mychart/jsonChart?num=${vo.num}'">�׷�������</button>
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</article>