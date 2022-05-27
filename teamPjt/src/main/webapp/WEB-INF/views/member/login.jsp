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
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
    
    // 비밀번호 확인
    $(document).ready(function(){
        $('.login_input i').on('click',function(){
            $('input').toggleClass('active');
            if($('input').hasClass('active')){
                $(this).attr('class',"bi bi-eye-slash").prev().prev('input').attr('type',"text");
            }else{
                $(this).attr('class',"bi bi-eye").prev().prev('input').attr('type','password');
            }
        });
    });
</script>
    
<title>로그인</title>
</head>
<body>
	<c:import url="/header.do"></c:import>
	<main>
    <div class="container" style="margin: 170px auto;">
		<div class="inner">
			<div class="col-md-8 col-lg-6">
				<form action="login.do" method="post" id="login" name="loginform">
					<div class="wrap">
						<div class="login_container">
							<div class="login_header">
								<div class="login_header_in">
									<div class="login_text">로그인</div>
								</div>
								<div class="login_header_in">
									<p class="login_header_p">
										<button type="button" onclick="Fnkakao()" class="btn btn-outline-warning" >
											<i class="bi bi-chat"></i>
											카카오
										</button>
									</p>
								</div>
							</div>
							<div class="login_input">
								<input type="text" class="login_input_box" name="member_email" id="memEmail" required>
								<label class="login_input_box_placeholder" for="memEmail">이메일</label>
							</div>
							<div class="login_input">
								<input type="password" class="login_input_box" name="member_password" id="memPw"  required>
								<label class="login_input_box_placeholder" for="memPw">비밀번호</label>
								<i class="bi bi-eye"></i>
							</div>
							<div>
								<button class="login_btn" id="login" onclick="loginCheck();">로그인</button>
							</div>
							<div class="find_loca">
								<a href="emailpw_find.do" class="login_find">아이디 · 비밀번호 찾기 ></a>
							</div>
							<div style="text-align: center;">아직 회원이 아니신가요? <a href="join_select.do" class="login_join">회원 가입</a></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
    </main>
     <form id="form-kakao-login" method="post" action="join_kakao.do">
		    			<input type="hidden" name="member_email"/>
		    			<input type="hidden" name="member_name"/>
		    			<input type="hidden" name="member_photo"/>
		    				
	</form>
    <c:import url="/footer.do"></c:import>
</body>
</html>