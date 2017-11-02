<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=scale=1.0,minimum-scale=1.0,user-scalable=no">
<title>Error</title>

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
<style type="text/css">
.mhdiv {
margin:0px auto;
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
                <span class="box-menu-text">Menu</span><span class="box-menu-icon"></span>
            </a>
            <!-- box-primary-nav-trigger -->
        </header>
        <!-- end box header -->

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
        <!-- end nav -->


<div data-role="content">

	<!-- top bar -->
	<div class="top-bar">
	<div class="h-30"></div>
		<h1>Error</h1>
	</div>
	<!-- end top bar -->


	<div class="clearfix">
		<!-- service-box -->
		<div class="col-md-4 service-box">
	<div class="container main-container mhdiv" >
		<c:if test="${!empty message}">	
			<h4>${message} 이전페이지로 이동하세요. </h4>
		</c:if>
		<c:if test="${empty message}">	
			<h4>잘못된 접근입니다. 이전페이지로 이동하세요. </h4>
		</c:if>
		<a href="#" onclick="history.back();" class="btn btn-box">Return</a>
		</div>
	</div>
</div>

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
<script type="text/javascript">
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