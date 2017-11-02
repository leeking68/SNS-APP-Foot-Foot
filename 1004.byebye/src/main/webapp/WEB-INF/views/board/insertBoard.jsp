<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>등록 페이지</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="ionicons/css/ionicons.min.css" rel="stylesheet">
<link rel="icon" href="img/circlelogo.png" type="image/x-icon">

<!-- main css -->
<link href="css/style.css" rel="stylesheet">

<!-- modernizr -->
<script src="js/modernizr.js"></script>
<script src="js/jindo_coo_ajax.js"></script>
<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=d9d5aabffb52cda458f3d0c2f07c8553&libraries=services"></script>

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
			<li><a href="insertBoard.do">Insert</a><i class="ion-ios-circle-filled color"></i></li>
			<li><a href=myBoardList.do>MyList</a></li>
			<li><a href="beaconlist.do" id="beacon">Beacon</a></li>
			<li><a href="setting.do">Setting</a></li>
		</ul>
	</nav>
	<!-- end nav -->


    <!-- top bar -->
    <div class="top-bar">
    <div class="h-30"></div>
        <h1>Insert</h1>
    </div>
    <!-- end top bar -->


<div class="col-md-4">
      <h3 class="text-uppercase"></h3>
      <h5>선택된 사진/이미지</h5>
      <div class="contact-info" style="width:100%;height:300px;background-color:#cdcdcd;">
      <img src="" alt="" id="prevImg" style="width:100%;height:100%;"/>
      </div>
   </div>

<!-- main-container -->
<div class="container main-container">
<div class="col-md-6">

<form action="multiInsert.do" method="POST" enctype="multipart/form-data" id="frm">
<h5 class="text-uppercase">위치</h5>
<div class="row">
<div class="col-md-6">
      
<div class="input-contact">
<input type="text" name="place" class="col-md-10"/>
<span></span>
</div>
</div>

<div class="col-md-6">
<div class="input-contact">
<input type="text" name="docTle" class="col-md-10"/>
<span>Title</span>
</div>
</div>
<div class="col-md-12">
<div class="textarea-contact">
<textarea name="docCon"></textarea>
<span>Textarea</span>
</div>
</div>
<br>
<div class="col-md-6">
<div class="input-contact">
<input type="text" name="docTag" class="col-md-10"/>
<span>with who?</span>
</div>
</div>
<div class="col-md-12">

<div class="filebox">
  <input class="upload-name" value="파일선택" disabled="disabled">

  <label for="ex_filename">업로드</label> 
  <input type="file" name="picFile" id="ex_filename" class="upload-hidden" accept="image/*;capture=camera"/> 
</div>
</div>

<br/><div class="col-md-6"><label for="checkbox-2">공개여부 : &nbsp;</label>
<input type="checkbox" name="docTf"  />
<label for="checkbox-2">공개</label>
</div>
<div class="col-md-12" style="float:right;margin-right:2%;">
<a href="#" onclick="document.getElementById('frm').submit();" class="btn btn-box" >등록</a>
	<a type="button" class="btn btn-box" onclick="history.back();" >취소</a>
</div>
</div>
</form>
</div>



</div>
<!-- end main-container -->


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
    $(document).ready(function(){
  var fileTarget = $('.filebox .upload-hidden');

  fileTarget.on('change', function(){  // 값이 변경되면
    if(window.FileReader){  // modern browser
      var filename = $(this)[0].files[0].name;
    } 
    else {  // old IE
      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
    }
    
    // 추출한 파일명 삽입
    $(this).siblings('.upload-name').val(filename);
  });
}); 
</script>  
        <!-- 쿠키에서 주소를 가져와 place에 자동으로 깔기 시작 -->
    <script src="js/jindo_coo_ajax.js"></script>
    <script type="text/javascript">
    $('input[name=place]').val(jindo.$Cookie().get("juso"));
    </script>
    <!-- place 자동 깔기 끝 -->
    
   <!-- 업로드 예정 파일 화면에 띄우기 -->
        <script>
        $(document).ready(function(){
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) { 
                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        $('#prevImg').attr('src', e.target.result);
                        //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                        //(아래 코드에서 읽어들인 dataURL형식)
                    }                    
                    reader.readAsDataURL(input.files[0]);
                    //File내용을 읽어 dataURL형식의 문자열로 저장
                }
            }//readURL()--
    
            //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
            $("#ex_filename").change(function(){
                readURL(this);
            });
         });
   
        
    	if(navigator.userAgent.match('Android')){
    		//안드로이드 링크 붙이기
    		$('#beacon').attr("href","foot://start/");
    	} else {
    		//PC용 링크 붙이기
    		$('#beacon').attr("href","javascript:alert('안드로이드에서만 작동합니다.')");
    	}
  </script>



</body>

</html>