<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#container {
	width: 650px;
	margin: auto;
}

table {
	border-collapse: collapse;
	width: 100%
}

th {
	background-color: #c0c0c0
}

tbody img {
	width: 100px;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background: #f5f5f5
}
</style>
<article style="margin-bottom: 50px;">
	<header>
		<h1>SawonList Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div id="container">
		<h1>ResultMap 예제 2</h1>
		<h2>부서번호 : ${vo.deptno}</h2>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>직책</th>
					<th>이름</th>
					<th>사원급여</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${vo.sawon}">
					<tr>
						<td>${e.sabun}</td>
						<td>${e.sajob}</td>
						<td>${e.saname}</td>
						<td>${e.sapay}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" style="text-align: center;">
						<button type="button" id="formBtn" class="btn btn-outline-secondary">이전</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</article>
<script>
	$(function() {
		$('#formBtn').click(function() {
			location = "deptForm";
		});
	});
</script>