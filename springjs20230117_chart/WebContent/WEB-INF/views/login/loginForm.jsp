<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<header>
		<h1>LoginProcess Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<form action="loginProcess" method="post" id="loginInfo">
			<input type="hidden" name="reip" value="<%=request.getRemoteAddr()%>">
			<div class="form-group">
				<label for="id">ID</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력 (5-10)" maxlength="10" required="required" pattern=".{4,10}">
			</div>
			<div class="form-group">
				<label for="pwd">PWD</label>
				<input type="password" class="form-control" id="pwd" placeholder="******" name="pwd" required="required" maxlength="10" pattern=".{1,10}">
			</div>
			<div class="form-group" style="text-align: right; margin-top: 10px;">
				<button type="submit" class="btn btn-primary">등록</button>&nbsp;
				<button type="button" class="btn btn-primary">아이디/비번찾기</button>
			</div>
		</form>
	</div>
</article>