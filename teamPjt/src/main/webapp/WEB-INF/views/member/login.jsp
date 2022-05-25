<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- //git 넘기기용 -->
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member_css/login.css">
<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
     <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 카카오 로그인 메소드 -->
    <script type="text/javascript">
    
	    //카카오 앱키 등록 
	  	 Kakao.init('64ed36d1841e64546a5f0ad441b1cfe8');
	   
	    function Fnkakao() {
	    	Kakao.Auth.login({
	    		success: function(auth) {
	    		    Kakao.API.request({
	    		        url: '/v2/user/me',
	    		        success: function(response) {
	    		           /*  console.log(response); */
	    		            var account = response.kakao_account;
							
							$('#form-kakao-login input[name=member_email]').val(account.email);
							$('#form-kakao-login input[name=member_name]').val(account.profile.nickname);
							
							/* //섬네일 이미지
							console.log(account.profile.thumbnail_image_url);
							
							//프로필 이미지
							console.log(account.profile.profile_image_url);
							 */
							
							$('#form-kakao-login input[name=member_photo]').val(account.profile.thumbnail_image_url);
							// 사용자 정보가 포함된 폼을 서버로 제출한다.
							  document.querySelector('#form-kakao-login').submit();
	    		            
	    		        },
	    		        fail: function(error) {
	    		            console.log(error);
	    		        }
	    		    });
	    		    
	    		  },
	    		  fail: function(error) {
	    		    console.log("카카오 로그인 실패");
	    		  },

	    	});
	    	
		  
		}
	    
    // 아이디 비밀번호 입력 안 한 경우
    function loginCheck(){
    	var loginForm = document.loginForm;
    	var memEmail = document.getElementById('memEmail').value;
    	var memPw = document.getElementById('memPw').value;
    	
    	if(memEmail == ""){
    	} else if (memPw == ""){
    	} else {
    		loginForm.submit();
    	}
    }
</script>
    
<title>로그인</title>
<style>
	main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    }
</style>
</head>
<body>
	<c:import url="/header.do"></c:import>
	
	<main>
    <div class="container" style="text-align: center; margin-top: 10%;">
	    <div class="row">
	        <div class="col-sm-12">
	        <form action="login.do" method="post" id="login" name="loginform">
	        	<div class="card">
	        		<h1 class="title">SNS 로그인</h1>
	        		<div class="input-container" style="margin_bottom: 60px">
	        			<button type="button" onclick="Fnkakao()" class="btn btn-outline-warning" style="width: 70%; height: 50px;">카카오</button>
<!-- 		        		<button type="button" onclick="Fnkakao()" class="btn_img"> -->
<%-- 		        			<img src="<%=request.getContextPath()%>/resources/image/member/kakao_login_medium_narrow.png" style="height: 48px"> --%>
<!-- 		        		</button> -->
	        		</div>
					<h1 class="title">로그인</h1>
					<div class="input-container">
						<input type="text" class="login-input" name="member_email" id="memEmail" required="required"/>
						<label for="memId">이메일</label>
						<div class="bar"></div>
					</div>
					<div class="input-container">
						<input type="password" class="login-input" name="member_password" id="memPw" autocomplete="off" required="required">
						<label for="memPw">비밀번호</label>
						<div class="bar"></div>
					</div>
					<div class="button-container">
						<button id="login" onclick="loginCheck();"><span>로그인</span></button>
					</div>
					<div class="footer-join">
						<a href="emailpw_find.do">이메일, 비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;
						<a href="join_select.do">회원가입</a>
					</div>
				</div>
			</form>
	        </div>
	    </div>
    </div>
<!--     <div class="content"> -->
<!--         Nav pills -->
<!--         <ul class="nav nav-pills" role="tablist"> -->
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link active" data-toggle="pill" href="#login">Login</a> -->
<!--           </li> -->
<!--           <li class="nav-item"> -->
<!--             <a class="nav-link" data-toggle="pill" href="#regis">Register</a> -->
<!--           </li> -->
<!--         </ul> -->
    
<!--         Tab panes -->
<!--         <div class="tab-content"> -->
<!--           <div id="login" class="container tab-pane active"> -->
<!--             <form> -->
<!--               <div class="form-group"> -->
<!--                 <label for="exampleFormControlInput1">Email address</label> -->
<!--                 <input type="email" class="form-control is-valid" id="exampleFormControlInput1" placeholder="name@example.com"> -->
<!--                 <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
<!--               </div> -->
<!--               <div class="form-group"> -->
<!--                 <label for="exampleInputPassword1">Password</label> -->
<!--                 <input type="password" class="form-control is-invalid" id="exampleInputPassword1" placeholder="Password"> -->
<!--                 <small id="emailHelp" class="form-text text-muted">Password incorrect.</small> -->
<!--               </div> -->
<!--               <button type="submit" class="btn btn-primary">Submit</button> -->
<!--             </form> -->
<!--           </div> -->
<!--           <div id="regis" class="container tab-pane fade"> -->
<!--             <form> -->
<!--               <div class="form-group"> -->
<!--                 <label for="InputName">Full Name</label> -->
<!--                 <input type="text" class="form-control is-valid" id="InputName" placeholder="Full Name"> -->
<!--                 <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
<!--               </div> -->
<!--               <div class="form-group"> -->
<!--                 <label for="InputUsername">Username</label> -->
<!--                 <input type="text" class="form-control is-valid" id="InputUsername" placeholder="Username"> -->
<!--                 <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
<!--               </div> -->
<!--               <div class="form-group"> -->
<!--                 <label for="exampleFormControlInput2">Email address</label> -->
<!--                 <input type="email" class="form-control is-valid" id="exampleFormControlInput2" placeholder="name@example.com"> -->
<!--                 <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
<!--               </div> -->
<!--               <div class="form-group"> -->
<!--                 <label for="exampleInputPassword2">Password</label> -->
<!--                 <input type="password" class="form-control is-invalid" id="exampleInputPassword2" placeholder="Password"> -->
<!--                 <small id="emailHelp" class="form-text text-muted">Password incorrect.</small> -->
<!--               </div> -->
<!--               <div class="form-group"> -->
<!--                 <label for="exampleInputPasswordVer">Verify Password</label> -->
<!--                 <input type="password" class="form-control is-invalid" id="exampleInputPasswordVer" placeholder="Password"> -->
<!--               </div> -->
<!--               <button type="submit" class="btn btn-primary">Submit</button> -->
<!--             </form> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
    </main>
     <form id="form-kakao-login" method="post" action="join_kakao.do">
		    			<input type="hidden" name="member_email"/>
		    			<input type="hidden" name="member_name"/>
		    			<input type="hidden" name="member_photo"/>
		    				
	</form>
    <c:import url="/footer.do"></c:import>
</body>
</html>