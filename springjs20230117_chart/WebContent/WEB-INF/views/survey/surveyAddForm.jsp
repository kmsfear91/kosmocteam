<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>Board Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div>
		<%-- form start --%>
		<form method="post" action="addSurvey">
			<table style="border-collapse: collapse; width: 450px; margin: auto">
				<thead>
					<tr>
						<th colspan="2" style="background: #ff9933">설문 작성 폼</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="sub" id="sub"></td>
					</tr>
					<tr>
						<th>문항수</th>
						<td><input type="number" name="code" id="code" value="2" min="2" max="5" onchange="increTitle()"></td>
					</tr>
					<tr>
						<th>기본값설정</th>
						<td><input type="number" name="surveycnt" id="surveycnt" value="2" min="0" max="10"></td>
					</tr>
					<tr>
						<th>설문문항1</th>
						<td><input type="text" name="surveytitle"></td>
					</tr>
					<tr>
					<tr>
						<th>설문문항2</th>
						<td><input type="text" name="surveytitle"></td>
					</tr>
					<tr>
						<td id="target" colspan="2"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
							<button type="submit">작성</button>
							<button type="button" onclick="location='surveyList'">리스트</button>
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</article>
<script>
	function increTitle() {
		var code = document.getElementById("code").value;
		var html ="<table style=\"border-collapse: collapse; width: 100%; margin: auto\">";
		for(var i = 1; i< code-1; i++){
			html += "<tr><th>설문문항"+(i+2)+"</th>";
			html += "<td><input type=\"text\" name=\"surveytitle\"></td></tr>";
		}
		html +="</table>";
		document.getElementById("target").innerHTML=html;
	}

	function insertRow() {
		var code = document.getElementById("code").value;
		$('#test > tbody:last').append('<tr><th>설문조사'+code+'</th><td><input type="text" name="surveytitle"></td>');
	}
</script>