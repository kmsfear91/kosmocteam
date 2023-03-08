<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>kosmo</title>
</head>
<body>
	<script>
		function deviceCheck() {
			// javascript 영역
			// javascript : 클라이언트에서 해석되는 인터프리터 언어이고, 객체 지향 언어이다.
			// 브라우저마다 엔진이 다르기 때문에 약간의 파싱의 차이가 있을 수 있다.
			// HTML5 부터 표준화 된 버전 => ECMA5 ~ 7시리즈
			// 변수 선언은 var, let 으로 한다.

			// userAgent : mozilla/5.0 (windows nt 10.0; win64; x64) applewebkit/537.36 (khtml, like gecko) chrome/108.0.0.0 safari/537.36
			// userAgent : mozilla/5.0 (linux; android 8.0.0; sm-g955u build/r16nw) applewebkit/537.36 (khtml, like gecko) chrome/87.0.4280.141 mobile safari/537.36
			var userAgent = navigator.userAgent.toLowerCase();
			// alert(userAgent);
			// console.log("userAgent : " + userAgent);

			// platform : win32
			var platform = navigator.platform.toLowerCase();
			// alert(platform);
			// console.log("platform : " + platform);
			// indexOf() -> 찾지 못하면 -1
			console.log("indexOf() => " + userAgent.indexOf('android'))
			if (userAgent.indexOf('android') > -1 || userAgent.indexOf('iphone') > -1) {
				console.log("mobile");
				// location = "이동할 url";
				location = "mobile/";
			} else {
				console.log("PC");
				location = "web/";
			}
		}
		deviceCheck();
	</script>
</body>
</html>