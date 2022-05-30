<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 상세</title>
</head>
<body>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage_css/profilePhoto.css">
<style>
    /*이미지 콘테이너 1:1 비율*/
    .img-container{
        overflow: hidden;
    }
    .card_img{
        width: 300px;
        height:200px;
        object-fit: cover;
        transition: all 0.1s linear;
    }
    .card_img:hover{
        transform: scale(1.05);
    }
    .setting_img:hover{
        transform: scale(1.1);
        cursor: pointer;

    }
    .card{
        border: none; 
    }
    @media screen and (max-width: 991.5px) { #outer { display: none; } }
</style>
<title>내 정보</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
        <div class="container" >
            <div class="row" style="width: 100%;">
                <!--회원정보-->
                <div class="col-lg-9 col-md-9 col-sm-12">
                    
            <!--회원정보-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <h2>내 정보</h2> 
                <div class="profile">
                    <div class="profile-image">
                        <c:choose>
                        	<c:when test="${ empty member.member_photo }">
                        		<img src="../resources/image/111.png" alt="profile_img" class="profile_img">
                        	</c:when>
                        	<c:otherwise>
                        		<c:set var="photo" value="${member.member_photo }"></c:set>
								<c:choose>
									
									<c:when test="${fn:contains(photo, 'http')}">
										<img src="${photo}" class="profile_img">
									</c:when>
									<c:otherwise>
										<img src="<%=request.getContextPath()%>/resources/upload/${member.member_photo }" class="profile_img">
									</c:otherwise>
								</c:choose>
                        	</c:otherwise>
                        </c:choose>
                        
                    </div>
                    <div class="profile-user-settings">
                        <h1 class="profile-user-name">${ member.member_name }</h1>
                        <h5>
                        	<c:choose>
                           		<c:when test="${ member.member_level eq 0 }">
                           			일반 회원
                           		</c:when>
                           		<c:when test="${ member.member_level eq 1 }">
                           			판매자
                           		</c:when>
                           		<c:otherwise>
                           			관리자
                           		</c:otherwise>
                           	</c:choose>
                        </h5>
                        <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog" aria-hidden="true"></i></button>
                    </div>
                </div>
                    <table class="table" style="border-top: 2px solid #22577E; border-bottom:2px solid #22577E; ">
                        <tbody>
                            <tr>
                                <td>이메일</td>
                                <td>${ member.member_email }</td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td>
                                    ${ member.member_phone }
                                </td>
                            </tr>
                            <tr>
                                <td>배송지</td>
                                <td>
                                    ${ member.member_addr }
                                </td>
                            </tr>
                            <tr>
                                <td>선호 동물</td>
                                <td>
                                	<c:choose>
                                		<c:when test="${ member.member_pet eq 0 }">
                                			강아지
                                		</c:when>
                                		<c:when test="${ member.member_pet eq 1 }">
                                			고양이
                                		</c:when>
                                		<c:otherwise>
                                			다른 동물
                                		</c:otherwise>
                                	</c:choose>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
    
            </div>
            <br>
           	<br>
            <!--펀딩 내역-->
           	<div class="row" style="width: 100%; margin-left: 3%" >
                <div class="col-xs-12">
                    <div>
                    <h5 style="margin-bottom: 30px; font-weight: 600;" >
                    펀딩 내역 ▷ 상위4개의 펀딩 내역만 가져옵니다.</h5>
                    </div>
                </div>
                </div>
               <div class="row g-3" style="width: 100%; margin-left: 3%;">
                <c:if test="${select4Funding.size()>0}">
                 <c:forEach var="item" items="${select4Funding}">
               	 <div class="col-lg-3 col-md-12" style="border-radius: 5px; padding: 20px; box-shadow: 1px 1px 100px 1px rgb(239, 239, 239);">
                           	<div class="card-img-top">
                                <div class="" style="cursor:pointer;">
                                    <img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top" alt="funding_img" width="100%">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">
                                    	<c:choose>
                                    		<c:when test="${ item.funding_category eq 0 }">강아지 용품</c:when>
                                    		<c:when test="${ item.funding_category eq 1 }">고양이 용품</c:when>
                                    		<c:when test="${ item.funding_category eq 2 }">다른동물 용품</c:when>
                                    	</c:choose>
                                    </div>
                                    <div>
                                    	 <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.funding_title }</h5> 
                                    </div>
                                </div>
							</div>
					
                 </div>
                 </c:forEach>
                  </c:if>
         	 </div>
           	<br>
           	<br>
            <!--스토어 내역-->
           	<div class="row" style="width: 100%; margin-left: 3%">
                <div class="col-xs-12">
                    <div><h5 style="margin-bottom: 30px; font-weight: 600; ">스토어 내역 ▷ 상위4개의 스토어 주문 내역만 가져옵니다.</h5></div>
                </div>
                </div>
               <div class="row g-3" style="width: 100%; margin-left: 3%">
                <c:if test="${select4Store.size()>0}">
                 <c:forEach var="item" items="${select4Store}">
               	 <div class="col-lg-3 col-md-12" style="border-radius: 5px; padding: 20px; box-shadow: 1px 1px 100px 1px rgb(239, 239, 239);">
                           	<div class="card-img-top">
                                <div class=""  style="cursor:pointer;">
                                    <img src="../resources/upload/store/${item.store_thumbnail}" class="card-img-top" alt="funding_img" width="100%">
                                </div>
                                <div class="card-body" style="margin-left: -20px;">
                                    <div style="font-weight:100">
                                    	<c:choose>
                                    		<c:when test="${ item.store_category eq 0 }">강아지 용품</c:when>
                                    		<c:when test="${ item.store_category eq 1 }">고양이 용품</c:when>
                                    		<c:when test="${ item.store_category eq 2 }">다른동물 용품</c:when>
                                    	</c:choose>
                                    </div>
                                    <div>
                                    	 <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.store_title }</h5> 
                                    </div>
                                </div>
							</div>
					
                 </div>
                 </c:forEach>
                  </c:if>
         	 </div>            
        </div>
       </div>
    </main>
<c:import url="/footer.do"></c:import>
</body>

</html>