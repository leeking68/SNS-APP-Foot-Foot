<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum=scale=1.0,minimum-scale=1.0,user-scalable=no">
<title>LOGIN</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="img/circlelogo.png" type="image/x-icon">

<!-- main css -->
<link href="css/login.css" rel="stylesheet">

<!-- API -->
<script src="http://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<div class="divbody">
<div class="wrapper">
<div class="container">
<hr style="height:30px; background-color:transparent; border:none;">
   <img class="profile-img-card" src="img/circlelogo.png" />

<form class="form" action="login.do">
<hr style="height:25px; background-color:transparent; border:none;">
   <!-- Kakao Login Api -->
   <tr class="tl_formtr">
   <td class="tl_formtd">
    <a id="custom-login-btn" href="javascript:loginWithKakao()"> 
      <img src="img/kakao.png" width="226" height="49" />
   </a>
   <script type="text/javascript">
   Kakao.init('397aabd494fcce05ada8693f67c2c1fa');
   function loginWithKakao() {
    Kakao.Auth.login({
    success: function(authObj) {
    Kakao.API.request({
   url: '/v1/user/me',
   success: function(res) {
      console.log(res.id)
      console.log(res.properties.nickname)
      console.log(res.properties.profile_image)
       window.location.href = 'http://<%=request.getServerName()%>:8090/byebye/kakaoLogin.do?userid=' + res.id 
             + '&nickname=' + res.properties.nickname
             + '&userimg=' + res.properties.profile_image;
       },
       fail : function(error) {
          alert(JSON.stringfy(error));
       }
     });
    },
    fail : function(err) {
       alert(JSON.stringfy(err));
    }
  });
 }
   function kakaologout() {
      Kakao.Auth.logout(function() {
         console.log("logged out.");
      });
   }
   </script>
   </td>
   </tr>

<hr style="height:15px; background-color:transparent; border:none;">

   <!-- Naver Login Api -->
   <tr class="tl_formtr">
   <td class="tl_formtd">
   <div id="naver_id_login" class="tl_btn"></div> 
   <script type="text/javascript">
   var naver_id_login = new naver_id_login("GH_SzlC7NpwkTA2bByHO", "http://<%=request.getServerName()%>:8090/byebye/login.do");
   var state = naver_id_login.getUniqState();
   naver_id_login.setButton("green", 3, 49);
   naver_id_login.setDomain(".service.com");
   naver_id_login.setState(state);
   naver_id_login.init_naver_id_login();
   function naverSignInCallback() {
      window.location.href = 'http://<%=request.getServerName()%>:8090/byebye/naverLogin.do?userid=' 
            + naver_id_login.getProfileData('id')
            + '&nickname=' + naver_id_login.getProfileData('nickname')
            + '&userimg=' + naver_id_login.getProfileData('profile_image');
   }
   naver_id_login.get_naver_userprofile("naverSignInCallback()");
   </script>
   </td>
   </tr>

<hr style="height:15px; background-color:transparent; border:none;">

   <!-- facebook login -->
   <tr class="tl_formtr">
   <td class="tl_formtd">
   <script>
   function statusChangeCallback(response) {
      if (response.status === 'connected') {
         testAPI();
   } else if (response.status === 'not_authorized') {
        document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
      } else {
        document.getElementById('status').innerHTML = 'Please log ' +
          'into Facebook.';
        alert(response.status);
      }
   }
   
    function checkLoginState() {
      FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
      });
    }
   
    window.fbAsyncInit = function() {
    FB.init({
      appId      : '{1338492349518851}',
      cookie     : true,  
                          
      xfbml      : true,  
      version    : 'v2.8' 
    });
    };
   
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=1338492349518851";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    
    function testAPI() {
      FB.api('/me', function(response) {
         var userImg = "http://graph.facebook.com/"+response.id+"/picture"
         window.location.href = 'http://<%=request.getServerName()%>:8090/byebye/facebookLogin.do?userid=' + response.id + '&nickname=' + response.name + '&userimg=' + userImg;
      });
    }
   </script>
   
<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" v="2" size="xlarge"> -->
<!-- 페북으로 로그인 -->
<!-- </fb:login-button> -->
<a href="#" onclick="checkLoginState();"><img src="img/facebook.png" width="229" height="49"></a>

<div id="status">
</div>

   </td>
   </tr>
   
   
   </form>
</div>
</div>
</div>
</body>
</html>