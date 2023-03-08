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
						<th colspan="2" style="background: #ff9933">���� �ۼ� ��</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>����</th>
						<td><input type="text" name="sub" id="sub"></td>
					</tr>
					<tr>
						<th>���׼�</th>
						<td><input type="number" name="code" id="code" value="2" min="2" max="5" onchange="increTitle()"></td>
					</tr>
					<tr>
						<th>�⺻������</th>
						<td><input type="number" name="surveycnt" id="surveycnt" value="2" min="0" max="10"></td>
					</tr>
					<tr>
						<th>��������1</th>
						<td><input type="text" name="surveytitle"></td>
					</tr>
					<tr>
					<tr>
						<th>��������2</th>
						<td><input type="text" name="surveytitle"></td>
					</tr>
					<tr>
						<td id="target" colspan="2"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
							<button type="submit">�ۼ�</button>
							<button type="button" onclick="location='surveyList'">����Ʈ</button>
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
			html += "<tr><th>��������"+(i+2)+"</th>";
			html += "<td><input type=\"text\" name=\"surveytitle\"></td></tr>";
		}
		html +="</table>";
		document.getElementById("target").innerHTML=html;
	}

	function insertRow() {
		var code = document.getElementById("code").value;
		$('#test > tbody:last').append('<tr><th>��������'+code+'</th><td><input type="text" name="surveytitle"></td>');
	}
</script>