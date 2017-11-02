<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=scale=1.0,minimum-scale=1.0,user-scalable=no">
<script type="text/javascript" src="js/jindo_coo_ajax.js"></script>
<title>상세내용</title>
<link rel="icon" href="img/circlelogo.png" type="image/x-icon">

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="ionicons/css/ionicons.min.css" rel="stylesheet">

<!-- main css -->
<link href="css/style.css" rel="stylesheet">

<!-- modernizr -->
<script src="js/modernizr.js"></script>
<script src="js/jindo_coo_ajax.js"></script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=d9d5aabffb52cda458f3d0c2f07c8553&libraries=services"></script>

<style type="text/css">
.imagepart {
width: 50px;
height: 50px;
overflow: hidden;
border-radius: 50%;
}
.box-headers {
margin-left: 5%;
}
</style>

</head>
<body>
	<!-- box header -->
	<header class="box-header">
	    <div class="box-logo">
	        <a href="index.do"><img src="img/circlelogo.png" width="100" alt="Logo"></a>
	    </div>
	    <!-- box-nav -->
	<a class="box-primary-nav-trigger" href="#0">
	    <span class="box-menu-text">MENU</span><span class="box-menu-icon"></span>
	</a>
	<!-- box-primary-nav-trigger -->
	</header>
	<!-- end box header -->

	<!-- nav -->
	<nav>
		<ul class="box-primary-nav">
			<li class="box-label">MENU</li>           
			<li><a href="index.do">Home</a></li>
			<li><a href="insertBoard.do">Insert</a></li>
			<li><a href="myBoardList.do">MyList</a><i class="ion-ios-circle-filled color"></i></li>
			<li><a href="beaconlist.do">Beacon</a></li>
			<li><a href="setting.do">Setting</a></li>
		</ul>
	</nav>
	<!-- end nav -->


    <!-- top bar -->
    <c:if test="${sessionScope.userid eq otherUserid }">
    	<div class="top-bar">
    	<div class="h-30"></div>
        	<h1>My Content</h1>
    	</div>
    </c:if>
    
    <c:if test="${sessionScope.userid ne otherUserid }">
    	<div class="top-bar">
    	<div class="h-30"></div>
        	<h1>Other Content</h1>
    	</div>
    </c:if>
	<!-- end top bar -->

<!-- main-container -->
<div class="container main-container">

	<div class="box-headers">
	    <div class="box-logos">
			<c:if test="${!empty otherUserimg}">
				<img alt="프로필 사진 바꾸기" class="imagepart" src="${otherUserimg}">&nbsp;<a href="whoList.do?id=${otherUserid}&nic=${otherNickname}" >${otherNickname}</a>
			</c:if>
			<c:if test="${empty otherUserimg}">
				<img alt="프로필 사진 바꾸기" class="imagepart" src="img/default.png">&nbsp;<a href="whoList.do?id=${otherUserid}&nic=${otherNickname}" >${otherNickname}</a>
			</c:if>
	    </div>
	</div>

		<div class="col-md-6">
           <img src="imgLoad.do?fileName=${picFile}" class="img-responsive" style="width:100%" />
        </div>
        <h5>&nbsp;&nbsp;&nbsp;Where : </h5>&nbsp;&nbsp;&nbsp;${place}
		
		<h5>&nbsp;&nbsp;&nbsp;Contents :</h5>
        <div class="col-md-12">
		<div class="textarea-contact">
           <textarea name="docCon" id="docCon" readonly="readonly">${docCon}</textarea>
		</div>
		</div>
		
		<h5>&nbsp;&nbsp;&nbsp;With :</h5>
		<div class="col-md-6">
		<div class="input-contact">
            <input type="text" name="docTag" id="docTag" value="${docTag}" readonly="readonly">
        </div>
		</div>   
		<script type="text/javascript">
		//alert('sessionScope.userid:${sessionScope.userid},userid:${userid}')
		</script>
			<c:if test="${sessionScope.userid eq otherUserid }">
			<div class="col-md-12" style="text-align: right;">
				<a href="updateContentView.do?seq=${docNum}&seq2=${otherUserid}" class="btn btn-box"
					type="button" >수정</a>  
					<a class="btn btn-box" type="button" onclick="delete_event();">삭제</a>
			</div>
			</c:if>
<br/><hr>

		<!-- comment --><h5>&nbsp;&nbsp;&nbsp;&nbsp;댓글</h5>
		<div class="col-md-12">
		<div class="textarea-contact">
			<div id="replyajax">
			
			</div>
		</div>
		</div><br/>
		
		<div class="col-md-12">
					<div class="textarea-contact2">
					<form id="contact" method="post">
						<fieldset>
							<p>
								<textarea id="message" maxlength="500" placeholder="댓글 입력" ></textarea>
							</p>
						</fieldset>
						
						<div style="float:right;margin-right:2%;">
		<input type="button" id="insertReply" class="btn btn-box" onclick="insertFunc();" value="댓글등록"/>
		<a type="button" class="btn btn-box" onclick="history.back();" >목록</a>
						</div>
					</form>
				
			</div>
		<!-- END comment -->
	</div><br/>
	<div class="h-30"></div>
	<!-- end Main container -->
</div>
	
    <!-- jQuery -->
    <script src="js/jquery-2.1.1.js"></script>
    <!--  plugins -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/menu.js"></script>
    <script src="js/animated-headline.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>

    <!--  custom script -->
    <script src="js/custom.js"></script>
    
<!-- 삭제 알럿창 -->
<script type="text/javascript">
function delete_event() {
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		location.replace("deletePlace.do?seq="+${docNum}+"&seq1="+${userid}+"");
	} else{   //취소
	    return;
	}
}
//
</script>
    
    <!-- 댓글 조회 시작 -->
    <script type="text/javascript">
 // 호출하는 URL이 현재 페이지의 URL과 다른 경우, CORS 방식으로 호출한다. XHR2 객체 또는 IE8,9는 XDomainRequest를 사용한다.
 function loadReply() {   
 var loadAjax = new jindo.$Ajax('replySearch.do?docNum=${docNum}', {
        type : 'xhr',
        method : 'get',     // GET 방식으로 통신
        onload : function(res){ // 요청이 완료되면 실행될 콜백 함수
          $('#replyajax').html(res.text());
        },
        timeout : 0,      // 3초 이내에 요청이 완료되지 않으면 ontimeout 실행 (생략 시 0)
        ontimeout : function(){ // 타임 아웃이 발생하면 실행될 콜백 함수, 생략 시 타임 아웃이 되면 아무 처리도 하지 않음
          alert("Timeout!");
        },
        onerror : function(){ // 타임 아웃이 발생하면 실행될 콜백 함수, 생략 시 타임 아웃이 되면 아무 처리도 하지 않음
          alert("댓글조회error");
        },
        async : true      // 비동기로 호출하는 경우, 생략하면 true
    });
    loadAjax.request();
 }
    </script>
    <!-- 댓글 조회 끝 -->
	<!-- 댓글 등록 시작 -->
	<script type="text/javascript">
	
	function insertFunc() {
		var insertAjax = new jindo.$Ajax('reply.do?reCon='+$('#message').val()+'&docNum=${docNum}', {
		    type : 'xhr',
		    method : 'get',
		    onload : function(res){ // 요청이 완료되면 실행될 콜백 함수
		    	loadReply();
		    	$('#message').val('');
		    },
		    timeout : 3,      // 3초 이내에 요청이 완료되지 않으면 ontimeout 실행 (생략 시 0)
		    ontimeout : function(){ // 타임 아웃이 발생하면 실행될 콜백 함수, 생략 시 타임 아웃이 되면 아무 처리도 하지 않음
		      alert("Timeout!");
		    },
		    async : true      // 비동기로 호출하는 경우, 생략하면 true
		});
		
		insertAjax.request();
	}
	
	loadReply();
	</script>
	<!-- 댓글등록 끝 -->
	
	<!-- 댓글삭제 시작 -->
	<script type="text/javascript">
	function deleteReply(object1, object2){
		var insertAjax = new jindo.$Ajax('replyDelete.do?seq='+object1, {
		    type : 'xhr',
		    method : 'get',
		    onload : function(res){ // 요청이 완료되면 실행될 콜백 함수
		    	loadReply();
		    },
		    timeout : 3,      // 3초 이내에 요청이 완료되지 않으면 ontimeout 실행 (생략 시 0)
		    ontimeout : function(){ // 타임 아웃이 발생하면 실행될 콜백 함수, 생략 시 타임 아웃이 되면 아무 처리도 하지 않음
		      alert("Timeout!");
		    },
		    async : true      // 비동기로 호출하는 경우, 생략하면 true
		});
		
		insertAjax.request();
	}
	
	</script>

</body>

</html>