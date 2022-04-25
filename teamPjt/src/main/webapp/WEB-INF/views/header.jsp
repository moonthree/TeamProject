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
 

 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css">
</head>
<body>

	<div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/index.do">
                <img src="<%=request.getContextPath()%>/resources/image/111.png" width="100" height="75" >
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="navtext" href="<%=request.getContextPath()%>/funding/main.do">펀딩</a>
                    </li>
                    <li class="nav-item">
                    <!-- 여기 임시로 mypage 확인하려고 스토어 버튼 클릭 시 마이페이지로감 -->
                        <a class="navtext" href="<%=request.getContextPath()%>/mypage/mypage.do">스토어</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="navtext dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                            aria-expanded="false">
                            더보기
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">공지사항</a>
                            <a class="dropdown-item" href="#">소개</a>
                            <a class="dropdown-item" href="#">고객센터</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-info my-2 my-sm-0" type="submit">검색</button>
                </form>
                <a href="<%=request.getContextPath()%>/member/login.do" style="margin-left: 10px; margin-right: 10px;">로그인</a>
                <a href="<%=request.getContextPath()%>/member/join_select.do">회원가입</a>
            </div>
        </nav>
    </div>
</body>
</html>