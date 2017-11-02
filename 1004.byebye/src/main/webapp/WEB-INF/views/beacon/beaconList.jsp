<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=scale=1.0,minimum-scale=1.0,user-scalable=no">
<title>BEACON LIST</title>

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
<script type="text/javascript"
		src="http://apis.daum.net/maps/maps3.js?apikey=d9d5aabffb52cda458f3d0c2f07c8553&libraries=services"></script>

</head>
<body>

        <!-- box header -->
        <header class="box-header">
            <div class="box-logo">
                <a href="index.do"><img src="img/circlelogo.png" width="100" alt="Logo"></a>
            </div>
            <!-- box-nav -->
            <a class="box-primary-nav-trigger" href="#0">
                <span class="box-menu-text">Menu</span><span class="box-menu-icon"></span>
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
				<li><a href="myBoardList.do">MyList</a></li>
				<li><a href="beaconlist.do" id="beacon">Beacon</a><i class="ion-ios-circle-filled color"></i></li>
				<li><a href="setting.do">Setting</a></li>
            </ul>
        </nav>
        <!-- end nav -->

<div data-role="content">

	<!-- top bar -->
	<div class="top-bar">
	<div class="h-30"></div>
		<h1>BEACON</h1>
	</div>
	<!-- end top bar -->




	<div class="clearfix">
		<!-- service-box -->
		<div class="col-md-4 service-box">
		<div class="h-10"></div>
		
	<div class="container">
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>No.1</th>
	        <th>Beacon</th>
	        <th>Location</th>
	      </tr>
	    </thead>
	    <tbody>
	     <c:choose>
	             <c:when test="${!empty list}">
				<c:forEach var="dto" items="${list}">
	    	 <tr>
					<td><h4>${dto.B_IDX}</h4></td>
					<td><a  data-target="#modal_test" type="button" data-toggle="modal" onclick="modalC('${dto.B_SPOTNAME}','${dto.B_LOCACTION}','${dto.B_PAGE}','${dto.B_ID}','${dto.B_IMG}');">${dto.B_SPOTNAME}</a></td>
					<td><a  type="button" href="${dto.B_PAGE}">${dto.B_LOCACTION}</a></td>
			</tr>
	    </c:forEach>
				</c:when>
				<c:otherwise>
				<h4 class="uppercase">인식된 정보가 없습니다.</h4>
				<div class="h-30"></div>
				</c:otherwise>
	       </c:choose>
			</tbody>
	  </table>
	</div>
		<!-- end service-box -->
	</div>
</div>
</div>

<!-- div 종료 -->

<!-- back to top -->
<a href="#0" class="cd-top"><i class="ion-android-arrow-up"></i></a>
<!-- end back to top -->

<!-- jQuery -->
<script src="js/jquery-2.1.1.js"></script>
<!--  plugins -->
<script src="js/bootstrap.min.js"></script>
<script src="js/menu.js"></script>
<script src="js/animated-headline.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<!--  custom script -->
<script src="js/custom.js"></script>

<div class="modal" id="modal_test">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
		<a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a>
		<h2 class="modal-title text-center fc-orange" id="bigName1">메인</h2>
	</div>
	
	<div class="modal-body">
		<!-- main-container -->
		<div class="content">
			<div class="col-md-3">
			<h3 class="text-uppercase" id="bigName2">대 제목</h3>
			<h5 id="bigName4">소 제목</h5>
				<div class="h-30"></div>
				<p><img id="imgSrc" style="width:100%;"></p>
				<div class="contact-info">
<!-- 				<p><i class="ion-android-call"></i>전화번호 넣을자리</p> -->
				<i class="ion-ios-email"></i><p id="bigName3"></p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
function modalC(object1,object2,object3,object4,object5){
	$('#bigName1').html(object1);
	$('#bigName2').html(object2);
	$('#bigName3').html(object3);
	$('#bigName4').html(object4);
	$('#imgSrc').attr("src",object5);
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