<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=scale=1.0,minimum-scale=1.0,user-scalable=no">
<title>HOME</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="img/circlelogo.png" type="image/x-icon">

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="ionicons/css/ionicons.min.css" rel="stylesheet">

<!-- main css -->
<link href="css/style.css" rel="stylesheet">

<!-- modernizr -->
<script src="js/modernizr.js"></script>
<script src="js/jindo_coo_ajax.js"></script>

<style type="text/css">
#map_wrap {
   position: relative;
   width: 250px;
   height: 350px;
}
#overlay {
   position: absolute;
   left: 48.5%;
   top: 24%;
   background: rgba(255, 255, 255, 0);
   z-index: 999;
}
</style>
</head>
<body>
<div class="top-bars">
        <!-- box header -->
        <header class="box-header">
            <div class="box-logo">
                <a href="index.do"><img src="img/circlelogo.png" width="100" alt="Logo"></a>
            </div>
            <a class="box-primary-nav-trigger" href="#0">
                <span class="box-menu-text">MENU</span><span class="box-menu-icon"></span>
            </a>
        </header>

        <!-- nav -->
        <nav>
            <ul class="box-primary-nav">
                <li class="box-label">MENU</li>           
				<li><a href="index.do">Home</a><i class="ion-ios-circle-filled color"></i></li>
				<li><a href="insertBoard.do">Insert</a></li>
				<li><a href="myBoardList.do">MyList</a></li>
				<li><a href="beaconlist.do" id="beacon">Beacon</a></li>
				<li><a href="setting.do">Setting</a></li>
            </ul>
        </nav>

<div class="h-30"></div>
<div class="main-container portfolio-inner clearfix">
	<section class="box-intro">
	<div class="table-cell">
	<div class="tl_locationborder col-md-12">
		<a type="button" class="btn btn-default btn-sm">재탐색</a>
		<a type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">수동수정</a>
	</div>
	
	<div class="tl_locationborder col-md-12">
	<span id="jusoView" class="tlspan" data-toggle="modal" data-target="#myModal">현재 위치를 찾고 있습니다.</span>
	</div>
	
	<div class="tl_locationborder col-md-12">
		<h5 style="font-size:14px;">${nickname}님 환영합니다.</h5>
	</div>
	</div>
	</section>
</div>
</div>

<div class="portfolio-div">
<div class="portfolio">
<div class="h-30"></div>
<div class="no-padding portfolio_container clearfix">
	<!-- single work -->
	<c:forEach var="dto" items="${requestScope.list}"> 
	<div class="col-md-4 col-sm-6  fashion logo">
	<a href="otherBoardDetail.do?seq=${dto.getDocNum()}" class="portfolio_item">
	<img src="imgLoad.do?fileName=${dto.getPicFile()}" alt="image" class="img-responsive" />
		<div class="portfolio_item_hover">
			<div class="portfolio-border clearfix">
				<div class="item_info">
<%-- 				<span>${dto.getPlace()}</span> --%>
<%-- 				<p>${dto.getPlace()}</p> --%>
				<em>${dto.getPlace()}</em>
				</div>
			</div>
		</div>
	</a>
	</div>
	</c:forEach>
</div>

</div>
</div>

<a href="#0" class="cd-top"><i class="ion-android-arrow-up"></i></a>


<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/menu.js"></script>
<script src="js/animated-headline.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/custom.js"></script>

<!-- 현재 위치를 고칠 수 있는 지도 모달 시작 + 스크립트랑 같이 다녀야 함-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<a type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</a>
<h4 class="modal-title" id="myModalLabel">현재 위치 변경</h4>
</div>
<div class="modal-body">
<div>
<form class="form-inline" onsubmit="return false;">
<input type="text" class="form-control" id="keyword" style="width: 50%" placeholder="검색어 입력">
<a class="btn btn-primary" id="searchButton">검색</a>
<a class="btn" id="zoomIn">줌인+</a>
<a class="btn" id="zoomOut">줌아웃-</a>
</form>
</div>
<div>
<input id="nowjuso" class="form-control" type="text" placeholder="지도를 움직이면 화살표 속 주소가 입력됩니다." readonly>
</div>
<div id="map" style="width: 100%; height: 300px;">
<span id="overlay" style="font-size: 200%;color:red;"><img src="img/locationIcon.png"/></span>
</div>
</div>
<div class="modal-footer">
<a type="button" class="btn btn-default" data-dismiss="modal">Close</a>
<a type="button" class="btn btn-primary" id="saveButton">Save changes</a>
</div>
</div>
</div>
</div>
<!-- 현재위치를 고칠 수 있는 지도 모달 끝 + 스크립트랑 같이 다녀야 함-->

<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=d9d5aabffb52cda458f3d0c2f07c8553&libraries=services"></script>

<!-- 현재위치 잡기 시작 -->
<script type="text/javascript">
var tempLatLng;
var tempLat;
var tempLng;
var cookie = jindo.$Cookie();
var navGeo = navigator.geolocation;
var geocoder = new daum.maps.services.Geocoder(); 
var mapContainer = document.getElementById('map');
var ps = new daum.maps.services.Places();
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
      
//주소 저장 프로세스
function setJuso(juso, lat, lng) {
	$('#jusoView').html(juso);
	cookie.set("lon", lng.toFixed(13));
	cookie.set("lat", lat.toFixed(13));
	cookie.set("juso", juso);
	alertAjax();
}
      
//성공시 메소드 바인딩용
function onSucessGeo(position){
	var tempLat = position.coords.latitude;
	var tempLng = position.coords.longitude;
	var tempJuso;
	tempLatLng = new daum.maps.LatLng(tempLat, tempLng);
	var callback = function(status, result) {
		if (status === daum.maps.services.Status.OK) {
		   tempJuso = result[0].jibunAddress.name;
		   setJuso(tempJuso, tempLat, tempLng);
		}
	}
	geocoder.coord2detailaddr(tempLatLng, callback);
}
      
//실패시 메소드 바인딩용
function onFailGeo(position){
	$('#jusoView').html("현재위치 측정실패! 수동입력요청");
}
      
//현재위치 측정메소드
function getCurrent() {
	if (navGeo) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navGeo.getCurrentPosition(onSucessGeo, onFailGeo);
	} else {
		$('#jusoView').html("현재위치 측정실패! 수동입력요청");
	}
}

//현재위치 측정메소드 호출
getCurrent();
      
//재탐색버튼 바인딩
$('#re_search').click(function(){
	$('#jusoView').html("재탐색합니다.");            
	getCurrent();
});

</script>
<!-- 현재 위치 잡기 끝 -->
   
<!-- 현재위치를 고칠 수 있는 지도 스크립트 시작 -->   
<script type="text/javascript">
var mapOption = {};

$("#myModal").on(
	'shown.bs.modal',
	function() {
		var mapOption;
		if(cookie.get("lat") == null) {
			mapOption = { 
				center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
		} else {
			mapOption = { 
			center: new daum.maps.LatLng(cookie.get("lat"), cookie.get("lon")), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
			};
		}   
               
		//지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);
		map.addControl(new daum.maps.ZoomControl(),
		daum.maps.ControlPosition.RIGHT);
		
		daum.maps.event.addListener(map, 'idle', function() {
			geocoder.coord2detailaddr(map.getCenter(), displayCenterInfo);
		});
               
		$("#searchButton").click(
			function() {
				ps.keywordSearch(document.getElementById('keyword').value, placesSearchCB);
			});

			function displayCenterInfo(status, result) {
				if (status === daum.maps.services.Status.OK) {
					var infoDiv = document.getElementById('nowjuso');
					infoDiv.value = result[0].jibunAddress.name;
					tempJuso = result[0].jibunAddress.name;
					tempLat = map.getCenter().getLat();
					tempLng = map.getCenter().getLng();
				}
			}
			
			function placesSearchCB(status, data, pagination) {
				if (status === daum.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new daum.maps.LatLngBounds();
				for (var i = 0; i < data.places.length; i++) {
					displayMarker(data.places[i]);
					bounds.extend(new daum.maps.LatLng(
						data.places[i].latitude,
						data.places[i].longitude));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
				} else {
					alert("검색에 실패하였습니다. 결과가 없는 것 같습니다.");
				}
			}

			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {

				// 마커를 생성하고 지도에 표시합니다
				var imageSrc = 'img/locationIcon.png',
				imageSize = new daum.maps.Size(40, 70),
				imageOption = {offset: new daum.maps.Point(27, 69)};
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
	                  
				var marker = new daum.maps.Marker({
					map : map,
					position : new daum.maps.LatLng(place.latitude,
					place.longitude),
					image: markerImage
				});

				// 마커에 클릭이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'click',
				function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
					map.setCenter(marker.getPosition());
					map.setLevel(3);
				});
			}

			$("#zoomIn").click(function() {
				// 현재 지도의 레벨을 얻어옵니다
				var level = map.getLevel();
	
				// 지도를 1레벨 올립니다 (지도가 축소됩니다)
				map.setLevel(level - 1);
			});

			$("#zoomOut").click(function() {
				// 현재 지도의 레벨을 얻어옵니다
				var level = map.getLevel();

				// 지도를 1레벨 올립니다 (지도가 축소됩니다)
				map.setLevel(level + 1);
			});
               
			$("#saveButton").click(function() {
				if (tempJuso != null) {
				//$('#jusoView').html(tempJuso);
				//                      $('#resultLng').html(tempLng);
				//                      $('#resultLat').html(tempLat);
					setJuso(tempJuso, tempLat, tempLng);
				}
				$("#myModal .close").click();
			});
	});
</script>
<!-- 현재위치를 고칠 수 있는 스크립트 끝 -->
<!-- 여기서부터 바디 앞까지 복사해서 붙여두면  저절로 검색해서 뜹니다.-->
	<!-- Modal -->
	<div class="modal fade" id="alertModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">기억나시나요?</h4>
				</div>
				<div class="modal-body">
				<span id="lately">ㅁㄴㅇㄹ</span>에 <span id="distance">ㅁㄴㅇㄹ</span> 거리에 올렸던 사진입니다. 사진 클릭시 글 내용을 보실 수 있습니다.
				<a id="picLink"><img style="width:100%;" id="picFile" alt="" src=""></a>
					<!-- <div id="json"></div> -->
				</div>
				<div class="modal-footer">
					<button type="button" id="close" class="btn btn-default" data-dismiss="modal" onclick="">3개월 뒤 다시 보기</button>
<!-- 					<button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var json;
		function alertAjax() {
		var oAjax = new jindo.$Ajax('alert.do', {
			type : 'xhr',
			method : 'get', // GET 방식으로 통신
			onload : function(res) { // 요청이 완료되면 실행될 콜백 함수
				json = jindo.$Json(res.text());
			if(json.get('docNum') != ''){
				
				//이미지 클릭시 페이지 이동
				$('#picLink').attr("href",'javascript:alertOff('+json.get("docNum")+',1);');
				
				//그냥 닫기
				$('#close').attr("onclick",'alertOff('+json.get("docNum")+');');
				
				//이미지 띄우기
				$('#picFile').attr("src",'imgLoad.do?fileName='+json.get("picFile"));
				
				//거리 띄우기
				$('#distance').html(distance(json.get("distance")));
				
				//기간 띄우기
				$('#lately').html(how(json.get("lately")));
				
				//테스트
				$('#json').html(res.text());
				
				//모달 띄우기
				$('#alertModal').modal('show');
			}
			},
			onerror : function() {
				alert(error);
			},
			timeout : 0, // 3초 이내에 요청이 완료되지 않으면 ontimeout 실행 (생략 시 0)
			ontimeout : function() { // 타임 아웃이 발생하면 실행될 콜백 함수, 생략 시 타임 아웃이 되면 아무 처리도 하지 않음
				alert("Timeout!");
			},
			async : true
		// 비동기로 호출하는 경우, 생략하면 true
		});
		oAjax.request();
		}
		
		
	function alertOff(object,object2){
	var offAjax = new jindo.$Ajax('alertOff.do?docNum='+object, {
		type : 'xhr',
		method : 'get', // GET 방식으로 통신
		onload : function(res) { // 요청이 완료되면 실행될 콜백 함수
			if(object2 == 1){
				window.location.href = 'otherBoardDetail.do?seq='+object;
			} else {
				$('#alertModal').modal('hide');
			}
		},
		onerror : function() {
			alert(error);
		},
		timeout : 0, // 3초 이내에 요청이 완료되지 않으면 ontimeout 실행 (생략 시 0)
		ontimeout : function() { // 타임 아웃이 발생하면 실행될 콜백 함수, 생략 시 타임 아웃이 되면 아무 처리도 하지 않음
			alert("Timeout!");
		},
		async : true
	// 비동기로 호출하는 경우, 생략하면 true
	});
	offAjax.request();
	}
	
	function distance(object) {
		if (Math.floor(object) > 0) {
			return '약' + Math.floor(object) + 'km 인근';
		} else if (1 > object && object > 0.1) {
			return '약' + Math.floor(object * 10) + '00m 인근';
		} else {
			return '약 100m 이내';
		}
	}

	function how(object) {
		if (Math.floor(object / 365) > 0) {
			return '약' + Math.floor(object / 365) + '년전';
		} else {
			return '약' + Math.floor(object / 30) + '개월전';
		}
	}
	
	if(navigator.userAgent.match('Android')){
		//안드로이드 링크 붙이기
		$('#beacon').attr("href","start://foot/");
	} else {
		//PC용 링크 붙이기
		$('#beacon').attr("href","javascript:alert('안드로이드에서만 작동합니다.')");
	}

	</script>

</body>
</html>