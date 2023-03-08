<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>deptJsonDemo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="row">
			<div style="margin-bottom: 15px;">아이디 : <input style="width: 500px;" onkeyup="onkeyupTest()" type="text" id="id" name="id" placeholder="아이디를 입력하세요"></div>
			<hr>
			<button type="button" id="jsonAjaxTest" class="btn btn-outline-primary">Click</button>
			<div style="margin-top: 15px;">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>나이</th>
							<th>성별</th>
						</tr>
					</thead>
					<tbody id="target">
						<c:forEach var="e" items="${list}">
							<tr>
								<td>${e.num}</td>
								<td>${e.id}</td>
								<td>${e.name}</td>
								<td>${e.age}</td>
								<td>${e.gender}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="5" style="text-align: center;">
								<%@include file="../page/pageModule.jsp"%>
							</th>
						</tr>
						<tr>
							<th colspan="5">
								<form class="d-flex" method="post" action="memberJsonDemo" style="margin: auto;">
									<select class="form-control btn-mini me-2" name="searchType" id="id2">
										<option value="1">ID</option>
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
		</div>
	</div>
</article>
<script>
	$(function() {
		$('#jsonAjaxTest').click(function() {
			$.ajaxSetup({ // Ajax 캐시를 삭제
				cache: false
			});
			$.ajax({
				url: "../memberJsonView1?id=" + $('#id').val(),
				success: function(jsonData) {
					$('#target').html(""); // 비우기
					// json 데이터를 jQuery 반복자를 사용해서 출력하기
					$.each(jsonData, function(k, v) {
						let htmlTag = "<tr>";
						$('#target').append("<tr>");
						$.each(v, function(k2, v2) {
							if (v2 !== null) {
								htmlTag += "<td>" + v2 + "</td>";
							}
						})
						htmlTag += "</tr>";
						$('#target').append(htmlTag);
					})
					// target의 자식인 p 태그를 선택해서 jQuery의 css함수를 사용해서 동적으로 css를 적용할 수 있다.
					$('#target>p').css("background", "orange").css("text-align", "center").css("color", "#ffffff");
				}
			});
		})
	});
	function onkeyupTest() {
		$.ajaxSetup({ // Ajax 캐시를 삭제
			cache: false
		});
		$.ajax({
			url: "../memberJsonView1?id=" + $('#id').val(),
			success: function(jsonData) {
				$('#target').html(""); // 비우기
				// json 데이터를 jQuery 반복자를 사용해서 출력하기
				$.each(jsonData, function(k, v) {
					let htmlTag = "<tr>";
					$('#target').append("<tr>");
					$.each(v, function(k2, v2) {
						if (v2 !== null) {
							htmlTag += "<td>" + v2 + "</td>";
						}
					})
					htmlTag += "</tr>";
					$('#target').append(htmlTag);
				})
				// target의 자식인 p 태그를 선택해서 jQuery의 css함수를 사용해서 동적으로 css를 적용할 수 있다.
				$('#target>p').css("background", "orange").css("text-align", "center").css("color", "#ffffff");
			}
		});
	}
</script>