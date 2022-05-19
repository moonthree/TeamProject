<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

	<script type="text/javascript">
	// Accㄴㄴ
	$(document).on("click", ".menu div", function() {
	  var numberIndex = $(this).index();
	
	  if (!$(this).is("active")) {
	    $(".menu div").removeClass("active");
	    $(".nacc li").removeClass("active");
	
	    $(this).addClass("active");
	    $(".nacc").find("li:eq(" + numberIndex + ")").addClass("active");
	  }
	});
	$(document).ready(function() {
	    $(".dropdown-toggle").dropdown();
	});
	</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage2.css">

<style>
/* 프사 */
.profile_img{
	width:110px;
	height:110px;
	border-radius: 70px;
}
/* 버튼 */
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    background-color:transparent;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.02);
    cursor: pointer;
}
.w-btn-brown {
    border: 2px solid black;
}
.button-6{
	white-space: nowrap;
}

#messageModal {
  position: fixed;
  right: 15px;
  bottom: 15px;
  cursor : pointer;
}
@media screen and (min-width: 991px) { .smaller { width:575px; } }
@media screen and (max-width: 991px) { .smaller { width:415px; } }
@media screen and (max-width: 767px) { .smaller { width:455px; } }
</style>
<title>마이페이지</title>
</head>
<body>
<%-- <%@include file ="../header.jsp" %> --%>
<c:import url="/header.do"></c:import>
<c:import url="/message.do"></c:import>


<main id="wrapper">
<div class="container">

	<div style="text-align:center;">
		<table style="border:1px solid black; text-align : center; font-size : 20px;">
			<thead>		
				<tr>
					<td style="width:20%"><a href="mypage2.do">마이페이지2</a></td>
					<td style="width:20%"><a href="<%=request.getContextPath()%>/admin/approval.do">상품 승인 페이지(관리자)</a></td>
					<td style="width:20%"><a href="<%=request.getContextPath()%>/admin/management_product.do">상품 관리 페이지(관리자)</a></td>
					<td style="width:20%"><a href="<%=request.getContextPath()%>/admin/management_member.do?check=3">회원 관리 페이지(관리자)</a></td>
				</tr>
			</thead>
		</table>
	</div>
	
  
        <!--회원정보 & 갯수-->
        <div class="row" style="margin-top: 10%;">
            <div class="col-md-3 col-sm-12">
              <div style="box-shadow: 0px 0px 20px 5px rgba(0,0,0,0.05); border-radius: 10px;">
                <div class="row"> 
                    <div class="col-sm-12">
                     
                    </div>
                </div>
              
              <table class="table" style="background-color: white; text-align: center; cursor:pointer;" onclick="location.href='my_info.do'">
              	
              	<tr>
              		<th colspan="3"  style="border-bottom:none;">
              		<div class="profile-image">
                        <c:choose>
                        	<c:when test="${ empty member.member_photo }">
                        		<img src="../resources/image/111.png" alt="profile_img" class="profile_img">
                        	</c:when>
                        	<c:otherwise>
								<img src="../resources/upload/${member.member_photo }" alt="profile_img" class="profile_img">
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    
                    </th>
              	</tr>
              	<tr>
             		<th  style="border-top:none;">
	           			<h5>${login.member_name}님 > </h5>
	           			${login.member_email}
           			</th>
              	</tr>
              		
               
              </table>

              </div>
                  
              <div class="row row-cols-3 row-cols-md-3" id="outer">
                    <button type="button" class="button-6" onclick="location.href='info_funding.do'">${ countFunding }<br><br>펀딩</button>
                  	<button type="button" class="button-6" onclick="location.href='info_store.do'">${ countStore }<br><br>구매</button>
                  	<button type="button" class="button-6" onclick="location.href='info_zzim.do'">${ countZzim }<br><br>찜</button>
              </div>
              <!--공지사항 & 고객센터-->
                <div class="row mt-1">
                    <button type="button" class="btn" style="background-color: white; width:120px" onclick="location.href='notice_list.do'">공지사항</button>
                    <button type="button" class="btn" style="background-color: white; width:120px;">고객센터</button>
                </div>
                
            </div>
              <div class="col-md-9 cols-sm-12">
              <!--펀딩&스토어 전환버튼-->
              <ul class="nav nav-tabs nav-justified" style="padding:10px 0px;">
                <li class="nav-item" >
                  <a class="nav-link active" data-toggle="tab" href="#my_funding" style="font-weight: 600; padding:10px">펀딩</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#my_store" style="font-weight: 600; padding:10px">구매</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#my_zzim" style="font-weight: 600; padding:10px">찜</a>
                </li>
              </ul>

              <!--내비게이션 탭 내용-->
              <div class="tab-content" >
                <div class="tab-pane fade show active" id="my_funding">
                  <!--펀딩 스크롤-->
                  <div class="mydiv" id="mydiv">
					<c:if test="${select3Funding.size()>0}">
					<c:forEach var="item" items="${select3Funding}">
					
	                    <div class="card mb-3">
	                      <div class="row item" onclick="location.href='info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }'" style="cursor:pointer;">
	                        <div class="col-lg-5 col-md-6">
	                          <!--이미지-->
	                      <div class="card img-container">
                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
                              <img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
                            </div>
	                      </div>
	                        </div>
	                        <div class="col-lg-7 col-md-6">
	                          <div class="card-body" style="margin-left: -20px;">
	                          <div class="row">
	                          	<div class="col-md-6">
	                          		<c:choose>
	                            		<c:when test="${ item.funding_category eq 0 }">강아지 용품</c:when>
	                            		<c:when test="${ item.funding_category eq 1 }">고양이 용품</c:when>
	                            		<c:when test="${ item.funding_category eq 2 }">다른 동물 용품</c:when>
	                            	</c:choose>
	                          	</div>
	                          	<div class="col-md-6" style="text-align:right;">
	                          		<fmt:formatDate value="${item.funding_order_date}" pattern="yyyy.MM.dd" /> 펀딩
	                          	</div>
	                          </div>
	                            <div style="font-weight:100">
	                            	
	                            </div>
	                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.funding_title }</h5>
	                            
	                            <p class="card-text" >
	                              <div class="row">
	                                <div class="col">by. ${ item.member_name }
	                              </div>
	                              <div class="row" style=" position: absolute; bottom: 10px; right:65px">
                                	<c:choose>
	                            		<c:when test="${item.funding_order_pay_state eq 0}">
							                <fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
		                            		<fmt:formatDate value="${end}" pattern="yyyy.MM.dd" /> 일 
		                          			${ item.funding_order_total_price }원 결제 예약
	                          			</c:when>
	                            		<c:when test="${item.funding_order_pay_state eq 1}">${ item.funding_order_total_price }원 결제 완료</c:when>
	                            		<c:when test="${item.funding_order_pay_state eq 2}">결제 예약이 취소되었습니다.</c:when>			                            		
	                            	</c:choose>
	                              </div>           
	                              <div class="row" style="position: absolute; bottom: 30px; right:50px">
	                                <div class="col" style=" font-weight: 600; color:red;">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>              	
	                              </div>
	                            </p>
	                       	 </div>
	                        </div> 
	                      </div>
	                    </div>
	                    </div>
                    </c:forEach>
                    </c:if>
                    
				    <div class="row" style="text-align: right">
	                    <div class="col">
	                      <button type="button" class="button-6" onclick="location.href='info_funding.do'">펀딩내역 전체보기</button>
	                    </div>
                    </div>
                    
                  </div>
                </div>
                
                <!--스토어 내역-->
                <div class="tab-pane fade" id="my_store">
                  <!--스크롤-->
                  <div class="mydiv" id="mydiv">
					<c:if test="${select3Store.size()>0}">
						<c:forEach var="item" items="${select3Store}">
                    <div class="card mb-3"  onclick="location.href='../funding/view.do?funding_idx=${item.store_idx}'" style="cursor:pointer;">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <!--이미지-->
	                      <div class="card img-container">
                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
                              <img src="../resources/upload/funding/${item.store_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
                            </div>
	                      </div>
	                        </div>
	                        <div class="col-lg-7 col-md-6">
	                          <div class="card-body" style="margin-left: -20px;">
	                          <div class="row">
	                          	<div class="col-md-6">
	                          		<c:choose>
	                            		<c:when test="${ item.store_category eq 0 }">강아지 용품</c:when>
	                            		<c:when test="${ item.store_category eq 1 }">고양이 용품</c:when>
	                            		<c:when test="${ item.store_category eq 2 }">다른 동물 용품</c:when>
	                            	</c:choose>
	                          	</div>
	                          	<div class="col-md-6" style="text-align:right;">
	                          		<fmt:formatDate value="${item.store_order_date}" pattern="yyyy.MM.dd" /> 구매
	                          	</div>
	                          </div>
	                            <div style="font-weight:100">
	                            	
	                            </div>
	                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.store_title }</h5>
	                            
	                            <p class="card-text" >
	                              <div class="row">
	                                <div class="col">by. ${ item.member_name }</div>
	                                <div></div>
	                              </div>               
	                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>
                    </c:forEach>
                    </c:if>
                    <div class="row" style="text-align: right">
	                    <div class="col">
	                      <button type="button" class="button-6" onclick="location.href='info_store.do'">구매목록 전체보기</button>
	                    </div>
                    </div>
            	</div>
            </div>
                
                <!--찜 내역-->
                <div class="tab-pane fade" id="my_zzim">
                  <!--스크롤-->
                  <div class="mydiv" id="mydiv">
					<c:if test="${select3Zzim.size()>0}">
						<c:forEach var="item" items="${select3Zzim}">
                    <div class="card mb-3"  onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'" style="cursor:pointer;">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <!--이미지-->
	                      <div class="card img-container">
                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
                              <img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
                            </div>
	                      </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div class="row">
	                          	<div class="col-md-6">
	                          		<c:choose>
	                            		<c:when test="${ item.funding_category eq 0 }">강아지 용품</c:when>
	                            		<c:when test="${ item.funding_category eq 1 }">고양이 용품</c:when>
	                            		<c:when test="${ item.funding_category eq 2 }">다른 동물 용품</c:when>
	                            	</c:choose>
	                          	</div>
	                          	
	                          </div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.funding_title }</h5>
                            
                          </div>
                        </div> 
                      </div>
                    </div>
                    </c:forEach>
                    </c:if>
                    <div class="row" style="text-align: right">
	                    <div class="col">
	                      <button type="button" class="button-6" onclick="location.href='info_zzim.do'">찜목록 전체보기</button>
	                    </div>
                    </div>
            	</div>
            </div>
            
            </div>
                
              </div>

            </div>
</div>
            
                
              
<!--메세지 모탈 팝업 버튼 -->
    <div id="messageModal" data-toggle="modal" data-target="#sidebar-right"><img src="../resources/image/message/message.png" width="70px"/></div>     
</main>
<c:import url="/footer.do"></c:import>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>