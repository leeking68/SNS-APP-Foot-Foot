<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jindo_coo_ajax.js"></script>

<title>Insert title here</title>
</head>
<body>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg"
		data-toggle="modal" data-target="#alertModal">Launch demo
		modal</button>
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
		alertAjax();
		
	function alertOff(object,object2){
	var offAjax = new jindo.$Ajax('alertOff.do?docNum='+object, {
		type : 'xhr',
		method : 'get', // GET 방식으로 통신
		onload : function(res) { // 요청이 완료되면 실행될 콜백 함수
			if(object2 == 1){
				window.location.href = 'boardDetail.do?seq='+object;
			} else {
				$('#alertModal').modal('toggle');
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

	</script>
</body>
</html>