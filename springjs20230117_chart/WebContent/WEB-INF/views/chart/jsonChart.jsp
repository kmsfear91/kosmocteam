<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Load c3.css --%>
<link href="${pageContext.request.contextPath}/resources/css/c3.css" rel="stylesheet">
<!-- Load d3.js and c3.js -->
<script src="${pageContext.request.contextPath}/resources/js/d3-5.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/c3.min.js"></script>
<article>
	<header>
		<h1>Chart JSON Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div id="chart"></div>
	</div>
	<div>
		<button type="button" onclick="location='javascript:history.back()'">¸®½ºÆ®</button>
	</div>
</article>
<script>
$.ajaxSetup({
	cache: false
});
$.ajax({
	url: "../surveyJsonObj?num=" + ${num},
	success: function(jsondata) {
		var chart = c3.generate({
		    bindto: '#chart',
		    data: {
		    	json: jsondata[1],
		    	key: {
		    		value: Object.keys(jsondata[1])
		    	},
		    	type: 'donut'
		    },
		    donut: {
		        title: jsondata[0].sub
		    }
		});
	}
});
</script>