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
<title>Insert title here</title>
</head>
<body>
	<%-- <%@include file ="../header.jsp" %> --%>
	
	<c:import url="/header.do"></c:import>
	
	
    <div class="container" style="text-align: center; margin-top: 10%;">
        <div class="row">
            <div class="col-sm">
            </div>
            <div class="col-sm">
                <button type="button" class="btn btn-outline-warning" style="width: 49%;">카카오</button>
                <button type="button" class="btn btn-outline-success" style="width: 49%;">네이버</button>
                <br><br>
                <form>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                        <label for="floatingPassword">Password</label>
                    </div>
                    <br>
                    <button type="button" class="btn btn-outline-info" style="width: 100%;">로그인</button>
                    <br>
                    <br>
                    <a href="emailpw_find.do">이메일, 비밀번호 찾기</a> 
                    |
                    <a href="join_select.do">회원가입</a>
                </form>
            </div>
            <div class="col-sm">
            
            </div>
            
        </div>
    </div>
</body>
</html>