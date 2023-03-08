<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
a:link {
	text-decoration: none;
}

table img {
	width: 80px;
}
/* paging */
table tfoot ol.paging {
	margin-left: 30%;
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
<article>
	<header>
		<h1>MemberList Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>가입날짜</th>
				</tr>
			</thead>
			<tbody>
				<%-- for start --%>
				<c:forEach var="e" items="${list}">
					<tr>
						<td class="align-middle">${e.num}</td>
						<td class="align-middle">${e.id}</td>
						<td class="align-middle">${e.name}</td>
						<td class="align-middle">${e.age}</td>
						<td class="align-middle">${e.gender}</td>
						<td class="align-middle">${e.mdate}</td>
					</tr>
				</c:forEach>
				<%-- for end --%>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="6" style="text-align: center;">
						<%@include file="../page/pageModule.jsp"%>
					</th>
				</tr>
				<tr>
					<th colspan="6">
						<form class="d-flex" method="post" action="memberList">
							<select class="form-control btn-mini" name="searchType" id="sel1" style="margin-left: 120px;">
								<option value="">검색</option>
								<option value="1">아이디</option>
								<option value="2">이름</option>
							</select>
							<input class="form-control me-2" type="text" name="searchValue" placeholder="Search.." style="width: 300px">
							<button class="btn btn-outline-secondary" type="submit">Search</button>
						</form>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</article>