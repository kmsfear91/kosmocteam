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
			<div style="margin-bottom: 15px;">���̵� : <input style="width: 500px;" onkeyup="onkeyupTest()" type="text" id="id" name="id" placeholder="���̵� �Է��ϼ���"></div>
			<hr>
			<button type="button" id="jsonAjaxTest" class="btn btn-outline-primary">Click</button>
			<div style="margin-top: 15px;">
				<table class="table">
					<thead>
						<tr>
							<th>��ȣ</th>
							<th>���̵�</th>
							<th>�̸�</th>
							<th>����</th>
							<th>����</th>
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
										<option value="2">�̸�</option>
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
			$.ajaxSetup({ // Ajax ĳ�ø� ����
				cache: false
			});
			$.ajax({
				url: "../memberJsonView1?id=" + $('#id').val(),
				success: function(jsonData) {
					$('#target').html(""); // ����
					// json �����͸� jQuery �ݺ��ڸ� ����ؼ� ����ϱ�
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
					// target�� �ڽ��� p �±׸� �����ؼ� jQuery�� css�Լ��� ����ؼ� �������� css�� ������ �� �ִ�.
					$('#target>p').css("background", "orange").css("text-align", "center").css("color", "#ffffff");
				}
			});
		})
	});
	function onkeyupTest() {
		$.ajaxSetup({ // Ajax ĳ�ø� ����
			cache: false
		});
		$.ajax({
			url: "../memberJsonView1?id=" + $('#id').val(),
			success: function(jsonData) {
				$('#target').html(""); // ����
				// json �����͸� jQuery �ݺ��ڸ� ����ؼ� ����ϱ�
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
				// target�� �ڽ��� p �±׸� �����ؼ� jQuery�� css�Լ��� ����ؼ� �������� css�� ������ �� �ִ�.
				$('#target>p').css("background", "orange").css("text-align", "center").css("color", "#ffffff");
			}
		});
	}
</script>