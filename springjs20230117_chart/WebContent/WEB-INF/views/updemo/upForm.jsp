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
		<%-- boardForm 들어 갈 자리. --%>
		<fieldset>
			<legend>이미지 업로드 폼</legend>
			<form method="post" action="uploadpro" enctype="multipart/form-data">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" name="sub" placeholder="제목을 입력하세요." />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" name="writer" />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" name="pwd" />
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">이미지 내용</label>
					<textarea name="cont" rows="10" cols="13"></textarea>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">*이미지업로드</label>
					<div class="col-sm-10">
						<input type="file" name="mfile" id="mfile" />
					</div>
					<div class="col-sm-10">
						<img src="${pageContext.request.contextPath}/resources/image/noimage.jpg" id="imgx" style="width: 400px;">
					</div>
				</div>
				<div class="row mb-3 ">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-info">등록</button>
						<button type="button" id="listBtn" class="btn btn-danger">리스트</button>
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