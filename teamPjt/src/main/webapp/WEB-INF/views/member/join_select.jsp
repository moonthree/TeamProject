<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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

<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
    
<style>
	main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    }

    .btnmargin{
        margin-top: 20px;
    }
    
</style>
<title>Insert title here</title>
</head>
<body>
	
	<c:import url="/header.do"></c:import>
	<main>
    <div class="container" style="text-align: center; margin-top: 6%; margin-bottom: 6%;">
        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-10 col-md-10">
                <h3 style="margin-bottom: 100px; font-weight: 600;">Petdding에 오신 것을 환영합니다</h3>
            </div>
            <div class="col-sm-1 col-md-1"></div>
        </div>
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-sm-12 col-md-6 col-lg-5">
                <div class="card" style="width: 20rem; height: 270px; margin: 0 auto; border-top: 3px solid #FF8C32; margin-bottom: 30px;">
                    <div class="card-body">
                        <h5 class="card-title" style="font-weight: 600; color: #FF8C32;">일반 회원가입</h5>
                        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/member/join_company.do'" class="btn btn-outline-dark btnmargin" style="width: 60%;">이메일로 회원가입</button>
                        <button type="button" class="btn btn-outline-warning btnmargin" style="width: 60%;">카카오</button><br>
                        <button type="button" class="btn btn-outline-success btnmargin" style="width: 60%;">네이버</button><br>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-5">
                <div class="card" style="width: 20rem; height: 270px; margin: 0 auto; border-top: 3px solid #06113C">
                    <div class="card-body">
                        <h5 class="card-title" style="font-weight: 600; color: #06113C;">판매자 회원가입</h5>
                        <button type="button" class="btn btn-outline-dark btnmargin" style="width: 60%;">이메일로 회원가입</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div style="margin-top: 80px;">회원가입 후 Petdding의 다양한 혜택을 누려보세요!</div>
                <div style="margin-top: 20px; font-size: small;">
                    이미 계정이 있으신가요?
                    <a href="login.do" style="margin-left: 16px; color:blue">로그인</a>
                </div>
            </div>
        </div>
    </div>
    </main>
    <c:import url="/footer.do"></c:import>
</body>
</html>