<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });

    </script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css">
    
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

</head>
<body>
	<div style="box-shadow: 0 0 10px rgb(0 0 0 / 35%);">
	<div class="container">
        <div class="header">
            <nav class="navbar navbar-expand-lg navbar-light">
                <!-- 로고 -->
                <a class="navbar-brand" href="<%=request.getContextPath()%>/index.do">
                    <img src="<%=request.getContextPath()%>/resources/image/111.png" style="width: 120px; height: 60px; padding: 5px;">
                </a>
                
                <!-- 로그인 전 -->
    			<c:if test="${login eq null}">
                <div class="before_login2">
                    <div>
                        <div class="mypage_box">
                            <div class="mypage_name">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="gray" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                </svg>
                                <a href="<%=request.getContextPath()%>/member/login.do">&nbsp;&nbsp;로그인 / 회원가입</a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:if>
                
                <!-- 로그인 후 -->
                <c:if test="${login ne null}">
                <div class="after_login2">
                    <div class="mypage_box">
                        <div type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="black" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                </svg>&nbsp;&nbsp;
                                <span style="font-weight: bold;">${login.member_name}</span>
                        </div>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/mypage.do">프로필</a>
                            <li><hr class="dropdown-divider"></li>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/info_funding.do">펀딩 내역</a>
                            <a class="dropdown-item" href="#">스토어 내역</a>
                            <li><hr class="dropdown-divider"></li>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a>
                        </div>
                    </div>
                </div>
                </c:if>
                
            <!-- 토글바 -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- 펀딩 스토어 기획전 더보기 -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="navtext" href="<%=request.getContextPath()%>/funding/main.do">펀딩</a>
                    </li>
                    <li class="nav-item">
                        <a class="navtext" href="<%=request.getContextPath()%>/mypage/mypage.do">스토어</a>
                    </li>
                    <li class="nav-item">
                        <a class="navtext" href="#">기획전</a>
                    </li>
                    <li class="nav-item dropdown">
                    	<div class="more">
                            <a class="navtext dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                            aria-expanded="false">더보기</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">공지사항</a>
                                <a class="dropdown-item" href="#">소개</a>
                                <a class="dropdown-item" href="#">고객센터</a>
                            </div>
                    	</div>
                    </li>
                </ul>
                <!-- 검색창 -->
                <div class="search_container">
                    <div class="search_box">
                        <input type="text" placeholder="검색" style="border: none;" class="search_input">
                        <a href="<%=request.getContextPath()%>/search.do" style="float: right;">
                            <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'><path d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/><path d='M0 0h24v24H0z' fill='none'/></svg>
                        </a>
                    </div>
                </div>
                <!-- 로그인 전 -->
				<c:if test="${login eq null}">
                <!-- 로그인 회원가입 버튼 -->
                <div class="before_login">
                    <div>
                        <div class="mypage_box">
                            <div class="mypage_name">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="gray" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                </svg>
                                <a href="<%=request.getContextPath()%>/member/login.do">&nbsp;&nbsp;로그인 / 회원가입</a>
                            </div>
                        </div>
                    </div>
                </div>
                </c:if>
                
                <!-- 로그인 후 -->
                <c:if test="${login ne null}">
                <!-- 회원 정보 -->
                <div class="after_login">
                    <div class="mypage_box">
                        <div type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="black" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                </svg>&nbsp;&nbsp;
                                <span style="font-weight: bold;">${login.member_name}</span>
                        </div>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/mypage.do">프로필</a>
                            <li><hr class="dropdown-divider"></li>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/info_funding.do">펀딩 내역</a>
                            <a class="dropdown-item" href="#">스토어 내역</a>
                            <li><hr class="dropdown-divider"></li>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a>
                        </div>
                    </div>
                </div>
                </c:if>
            </div>
            </nav>
        </div>
    </div>
    </div>
</body>
</html>
