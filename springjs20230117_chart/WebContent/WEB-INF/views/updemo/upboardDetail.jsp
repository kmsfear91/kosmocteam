<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>UpBoard Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="sub" name="sub"
				value="${vo.sub}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="writer">작성자</label> <input type="text"
				class="form-control" id="writer" name="writer" value="${vo.writer}"
				readonly="readonly">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="5" id="cont" name="cont"
				readonly="readonly">${vo.cont}</textarea>
		</div>
		<div class="form-group">
			<label for="writer">이미지</label> <input type="image"
				class="form-control"
				src="${pageContext.request.contextPath}/resources/imgfile/${vo.imgn}"
				name="imgn" id="imgn" readonly="readonly" style="width: 300px;">
		</div>
		<div class="form-group">
			<label for="writer">작성날짜</label> <input type="text"
				class="form-control" id="udate" name="udate" value="${vo.udate}"
				readonly="readonly">
		</div>
		<div class="form-group" style="text-align: right; margin-top: 10px;">
			<button type="button" class="btn btn-warning" id="delBtn">삭제</button>
			<button type="button" class="btn btn-primary" id="writeBtn">글쓰기</button>
			<button type="button" class="btn btn-success" id="listBtn">리스트</button>
		</div>
	</div>
	<hr>
	<div class="container mt-5">
		<fieldset>
			<form action="upboardCommIn" method="post">
				<input type="hidden" name="ucode" value="${vo.num}"> <input
					type="hidden" name="uwriter" value="${sessionScope.sessionID}">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">내용</label>
					<c:choose>
						<c:when test="${sessionScope.sessionID == null}">
							<c:set var="textArea" value="로그인을 해주세요" />
						</c:when>
						<c:otherwise>
							<c:set var="textArea" value="댓글을 작성해주세요" />
						</c:otherwise>
					</c:choose>
					<div class="col-sm-10">
						<textarea name="ucontent" rows="3" cols="50"
							placeholder="${textArea}" class="form-control"></textarea>
					</div>
				</div>
				<c:if test="${sessionScope.sessionID != null}">
					<div class="row mb-3">
						<button type="submit" class="btn btn-outline-primary">등록</button>
					</div>
				</c:if>
			</form>
		</fieldset>
	</div>
	<div class="container mt-5">
		<table class="table">
			<c:forEach var="comm" items="${listcomm}">
				<tr>
					<td>${comm.uwriter}</td>
					<td>${comm.ucontent}</td>
					<td>${comm.udate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</article>
<script>
	$(function() {
		$('#delBtn').click(function() {
			location = 'upboardDelete?num=' + ${vo.num};
		});
		$('#writeBtn').click(function() {
			location = 'upboardForm';
		});
		$('#listBtn').click(function() {
			location = 'upboardList';
		});
	})
</script>