<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
#container {
	width: 450px;
	margin: auto;
}

table {
	border-collapse: collapse;
	width: 100%
}

th {
	background-color: #ff9933
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
	background: #ff9933
}
</style>
<article>
	<header>
		<h1>SawonList Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<%-- boardForm ��� �� �ڸ�. --%>
		<fieldset>
			<legend>�μ� ��ȣ �Է�</legend>
			<form method="post" action="deptList">
				<table>
					<thead>
						<tr>
							<th colspan="2">ResultMap ���� 2</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>�μ���ȣ</th>
							<td>
								<select name="deptno">
									<option>10</option>
									<option>20</option>
									<option>30</option>
									<option>40</option>
									<option>50</option>
								</select>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="2"><input type="submit" value="�˻�"></th>
						</tr>
					</tfoot>
				</table>
			</form>
		</fieldset>
	</div>
</article>