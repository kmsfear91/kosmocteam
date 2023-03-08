<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>�������� Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<form id="sendEmailForm" method="post" action="sendEmail">
			<div class="row mb-3">
				<label class="col-sm-2 col-form-label">Email :</label>
				<div class="col-sm-10">
					<input id="receiverMail" type="text" name="email" size="65" />
				</div>
			</div>
			<div class="row mb-3">
				<label class="col-sm-2 col-form-label">Password :</label>
				<div class="col-sm-10">
					<input id="receiverMail" type="password" name="password" size="65" />
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-10">
					<input id="sendEmailBtn" value="������ȣ �߼�" type="submit" />
				</div>
			</div>
		</form>
	</div>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<input type="hidden" name="certnum" value="${certnum}" id="certnum" />
		<div class="row mb-3">
			<label class="col-sm-2 col-form-label">������ȣ :</label>
			<div class="col-sm-10">
				<input type="text" name="num" id="num" />
			</div>
			<div id="target"></div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-10">
				<input value="�����ϱ�" type="button" id="certBtn" />
			</div>
		</div>
	</div>
</article>
<script>
$(function(){
	$('#certBtn').click(function(){
		let certnum = document.getElementById("certnum").value;
		let num = $('#num').val();
		$.ajax({
			url:"../certificationCheck?num=" + num + "&certnum=" + certnum,
			success:function(data){
				if (data === 1) {
					$('#target').css('background-color','red').css('color','black').html('�̸����� �������ּ���.');
				} else if (data === 2) {
					$('#target').css('background-color','orange').css('color','black').html('������ȣ�� �Է����� �ʾҽ��ϴ�.');
				} else if (data === 3) {
					$('#target').css('background-color','yellow').css('color','black').html('������ȣ�� ����ġ�մϴ�.');
				} else if (data === 4) {
					$('#target').css('background-color','green').css('color','white').html('���� ����!');
				}
			}
		});
	});
});
</script>