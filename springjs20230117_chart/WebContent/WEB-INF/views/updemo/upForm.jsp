<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>FileUpload Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<%-- boardForm ��� �� �ڸ�. --%>
		<fieldset>
			<legend>�̹��� ���ε� ��</legend>
			<form method="post" action="uploadpro" enctype="multipart/form-data">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">����</label>
					<div class="col-sm-10">
						<input type="text" name="sub" placeholder="������ �Է��ϼ���." />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">�ۼ���</label>
					<div class="col-sm-10">
						<input type="text" name="writer" />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">��й�ȣ</label>
					<div class="col-sm-10">
						<input type="password" name="pwd" />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">�̹��� ����</label>
					<textarea name="cont" rows="10" cols="13"></textarea>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">*�̹������ε�</label>
					<div class="col-sm-10">
						<input type="file" name="mfile" id="mfile" />
					</div>
					<div class="col-sm-10">
						<img src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx" style="width: 400px;">
					</div>
				</div>
				<div class="row mb-3 ">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-info">���</button>
						<button type="button" id="listBtn" class="btn btn-danger">����Ʈ</button>
					</div>
				</div>
			</form>
		</fieldset>
	</div>
</article>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgx').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$(function() {
		$('#mfile').change(function() {
			if ($(this).val.length > 0) {
				readURL(this);
			}
		});
		$('#listBtn').click(function() {
			location = "upboardList";
		});
	});
</script>