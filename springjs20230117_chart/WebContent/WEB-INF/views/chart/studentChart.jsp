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
		<h1>Chart Demo</h1>
	</header>
	<ul class="list-unstyled">
		<li class="border-top my-3"></li>
	</ul>
	<div class="container">
		<div id="chart"></div>
	</div>
</article>
<script>
// 서버측 json을 파싱한 가상 데이터
const students = [];
students.push({ name: '구름', kor: 87, eng: 98, math: 88, scien: 90 });
students.push({ name: '별이', kor: 86, eng: 97, math: 87, scien: 91 });
students.push({ name: '겨울', kor: 85, eng: 96, math: 86, scien: 92 });
students.push({ name: '바다', kor: 84, eng: 95, math: 85, scien: 93 });
console.log(students);

// bar차트 : 데이터에서 사용자의 이름을 axis.x.category
var chart = c3.generate({
    bindto: '#chart',
    // data.json
    data: {
    	json: students,
    	keys: {
    		// x: 'name', // it's possible to specify 'x' when category axis
    		value: ['kor', 'eng', 'math', 'scien']
    	},
    	type: 'bar'
    },
    // 
    axis: {
    	x: {
        	type: 'category',
        	categories: [students[0].name, students[1].name, students[2].name, students[3].name]
    	}
    }
});
</script>