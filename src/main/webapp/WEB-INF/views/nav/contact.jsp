<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 위치 안내</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">

<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#store-bigtitle {
	min-height: 30px;
	margin: 35px 0 25px;
	position: relative;
	text-align: center;
}

#map {
	height: 50%;
	width: 50%;
	margin: 0 auto;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

<body style="padding-top: 150px;">
	<div id="store-bigtitle" style="padding-bottom: 20px;">
		<h1>매장 위치 안내</h1>
	</div>
	<div id="map"></div>
	<script>
		var map;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 37.5565506,
					lng : 126.9194975
				},
				zoom : 18
			});

			var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
			var beachMarker = new google.maps.Marker({
				position : {
					lat : 37.5565506,
					lng : 126.9194975
				},
				map : map,
				icon : image
			});
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&callback=initMap"
		async defer></script>
</body>

<div class="section"></div>
<c:import url="../template/footer.jsp"></c:import>

</body>


</html>