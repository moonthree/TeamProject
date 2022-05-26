

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<!--     <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
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


<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>


 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage2.css">
	<script type="text/javascript">
	
	
	function Fnalert1(idx) {
			var funding_idx = idx;
		    window.location.href = "funding_modify.do?funding_idx="+funding_idx;
	}
	
	function Fnalert2(idx) {
		if(confirm("수정 시 제품 설명 pdf 파일을 다시 업로드 해야합니다. 그래도 하시겠습니까?")) {
		
			var funding_idx = idx;
			
		    window.location.href = "funding_modify_content.do?funding_idx="+funding_idx+"&check="+0;
		}
	}
	
	function Fnalert3(idx) {
		if(confirm("수정 시 공지 사항 사진 파일을 다시 업로드 해야합니다 그래도 하시겠습니까?")) {
		
			var funding_idx = idx;
			
		    window.location.href = "funding_modify_notice.do?funding_idx="+funding_idx+"&check="+1;
		}
	}
	
	function StoreSubmit(idx){
		var flag  = false;
		var path = '<%= request.getContextPath()%>';
		$.ajax({
			url:path+"/store/check_store.do?funding_idx="+idx,
			type:"get",
			success:function(data){
				console.log(data);
				if(data >= 1){
					
					alert('이미 스토어에 등록된 상품입니다.');
				}
				else{
					if(confirm("스토어 제품 신청 시 입력 양식을 다시 작성하셔야 합니다.")) {
						
						var funding_idx = idx;
						
					    window.location.href = path+"/store/store_registerFun.do?funding_idx="+funding_idx;
					}
					
				}
			},
			error:function(){	
				alert('오류 발생');
			}
		});
		
	
	}
	
	</script>
<!-- 스토어 스크립트 -->
<script type="text/javascript">
var path = '<%= request.getContextPath()%>';
//수량 추가
function Storealert1(idx) {
	
	var store_idx = idx;
    window.location.href = path+"/store/store_modify.do?store_idx="+store_idx;
}
//이미지 변경
function Storealert2(idx) {
	
	if(confirm("수정 시 제품 설명 pdf 파일을 다시 업로드 해야합니다. 그래도 하시겠습니까?")) {
		
		var store_idx = idx;
		
	    window.location.href = path+"/store/store_modify_content.do?store_idx="+store_idx+"&check="+0;
	}
}

//공지사항 변경
function Storealert3(idx) {
if(confirm("수정 시 제품 설명 pdf 파일을 다시 업로드 해야합니다. 그래도 하시겠습니까?")) {
		
		var store_idx = idx;
		
	    window.location.href = path+"/store/store_modify_notice.do?store_idx="+store_idx+"&check="+1;
	
}
}


</script>
<title>마이페이지</title>
</head>
<body>
<c:import url="/header.do"></c:import>

<main>
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
		
		<div class="mypage_background"></div>
            <div class="row">
            	<div class="col-md-12 mypage_header">
            		<c:if test="${member.member_level eq 1}">
	            		<div class="tabs">
		            		<a href="mypage.do" class="tab" style="text-decoration: none;">소비자</a>
		            		<a href="mypage2.do" class="tab_check" style="text-decoration: none;">판매자</a>
	            		</div>
            		</c:if>
            	</div>
                <div class="col-md-3 cols-sm-12">
                    <div class="my_top">
                        <c:choose>
                               <c:when test="${ empty member.member_photo }">
                                   <img src="../resources/image/111.png" alt="profile_img" class="profile_img">
                               </c:when>
                               <c:otherwise>
                                <img src="../resources/upload/${member.member_photo }" alt="profile_img" class="profile_img">
                               </c:otherwise>
                        </c:choose>
                        <p>${login.member_name}님</p>
                    </div>
                    <div class="my_middle">
                        <h5>판매 MY</h5>
                        <!-- <a href="info_funding.do">내가 펀딩한 상품<span></span></a><br>
                        <a href="info_store.do">내가 구매한 상품<span></span></a><br> -->
                        
		                <button type="button" class="button-59" onclick="location.href='funding_register.do'"><span style="display : block;">새 펀딩 오픈</span></button>
		               	 <button type="button" class="button-59" onclick="location.href='<%=request.getContextPath()%>/store/store_register.do'"><span style="display : block;">새 스토어 오픈</span></button>
		              
                    </div>
                    <div class="my_bottom">
                        <p>
                            <a href="my_info.do">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person"
                                    viewBox="0 0 16 20">
                                    <path
                                        d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                </svg>
                                &nbsp;<span>내 정보</span>
                            </a>
                        </p>
                        <p>
                            <a href="#">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-megaphone"
                                    viewBox="0 0 16 20">
                                    <path
                                        d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z" />
                                </svg>
                                &nbsp;공지사항
                            </a>
                        </p>
                        <p>
                            <a href="#">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-question-circle"
                                    viewBox="0 0 16 20">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path
                                        d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
                                </svg>
                                &nbsp;고객센터
                            </a>
                        </p>
                    </div>
                </div>
                <div class="col-md-9 cols-sm-12">
                	<div class="right_container">
                		<ul id="myTab1" role="tablist" class="nav nav-tabs nav-pills with-arrow flex-column flex-sm-row text-center">
				            <li class="nav-item flex-sm-fill">
				             	<a id="funding-tab" data-toggle="tab" href="#funding" role="tab" aria-controls="funding" aria-selected="true" class="nav-link text-uppercase font-weight-bold mr-sm-3 border active">
				             		<div class="box_title">펀딩 제품 관리</div>
<%-- 				             		<div class="box_num">${ countFunding }</div> --%>
				             	</a>
				            </li>
				            <li class="nav-item flex-sm-fill">
								<a id="store-tab" data-toggle="tab" href="#store" role="tab" aria-controls="store" aria-selected="false" class="nav-link text-uppercase font-weight-bold mr-sm-3 border">
									<div class="box_title">스토어 제품 관리</div>
<%-- 				             		<div class="box_num">${ countStore }</div> --%>
								</a>
				            </li>
				        </ul>
				          
				          <div id="myTab1Content" class="tab-content">
				          	<!-- 펀딩 -->
				             <!--펀딩 스크롤-->
				            <div id="funding" role="tabpanel" aria-labelledby="funding-tab" class="tab-pane fade px-4 py-5 show active">
				                  <div class="mydiv" id="mydiv">
									<c:if test="${sellerFundingList.size()>0}">
									<c:forEach var="item" items="${sellerFundingList}">
									
					                    <div class="card mb-3">
					                      <div class="row item" onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'" style="cursor:pointer;">
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
					                            <div style="font-weight:100">
					                            <div>
					                            	<c:choose>
					                            		<c:when test="${ item.funding_category eq 0 }"><span style="font-weight: bold; color: grey;">강아지 용품</span></c:when>
					                            		<c:when test="${ item.funding_category eq 1 }"><span style="font-weight: bold; color: grey;">고양이 용품</span></c:when>
					                            		<c:when test="${ item.funding_category eq 2 }"><span style="font-weight: bold; color: grey;">다른 동물 용품</span></c:when>
					                            	</c:choose>
					                            </div>
					                            <div style="text-align: right;">
					                            	<c:choose>
					                            		<c:when test="${ item.funding_current_state eq 0 }"><span style="font-weight: bold">펀딩 진행중</span></c:when>
					                            		<c:when test="${ item.funding_current_state eq 1 }"><span style="font-weight: bold; color: blue">펀딩 성공</span></c:when>
					                            		<c:when test="${ item.funding_current_state eq 2 }"><span style="font-weight: bold; color: #4E342E">펀딩 실패</span></c:when>
					                            	</c:choose>
					                            </div>
					                            </div>
					                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.funding_title }</h5>
					                            <p class="card-text" >
					                                          
					                              <div class="row" style="position: absolute; bottom: 10px; right:50px">
					                                <div class="col" style=" font-weight: 600; color:red;">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>              	
					                              </div>
					                            </p>
					                       	 </div>
					                        </div> 
					                      </div>
					                      <c:choose>
					                      	<c:when test="${item.funding_current_state == 0}">
					                      	  <div class="row">
					                      	  <!-- 펀딩 진행중 -->
											    <div class="col" align="right">
											    	<button class="btn button-6" onclick="Fnalert1(${item.funding_idx})">수량 추가</button>
											     	<button class="btn button-6" onclick="Fnalert2(${item.funding_idx})">제품 설명 변경</button>
											     	<button class="btn button-6" onclick="Fnalert3(${item.funding_idx})" style="margin-right: 10px">공지사항 변경</button> 
											    </div>
											 </div>
					                      	</c:when>
					                      	<c:when test="${item.funding_current_state == 1}">
					                      		<div class="row">
					                      			<!-- 펀딩 성공 시 -> 스토어 신청 가능버튼 나오게 -->
											    <div class="col" align="right">
											    	 <button class="btn btn-outline-info" onclick="StoreSubmit(${item.funding_idx})" style="margin-right: 10px">스토어로 제품 신청</button>
											    </div>
											    </div>
					                      	</c:when>
					                     	<c:otherwise>
					                     		<div class="row">
					                     			<div class="col">
											    	 	<span style="font-weight: bold; color: grey;">해당 제품은 펀딩에 실패하였습니다.</span>
											    	</div>
					                     		</div>
					                     	</c:otherwise>
					                      </c:choose>
					                    </div>
					                     <hr class="hrTag">
				                    	<br>
				                    </c:forEach>
				                    </c:if>
				                  </div>
				                </div>
               	
				 <!-- 스토어 -->
				<div id="store" role="tabpanel" aria-labelledby="store-tab" class="tab-pane fade px-4 py-5">
				         <div class="mydiv" id="mydiv">
					<c:if test="${sellerStoreList.size()>0}">
					<c:forEach var="item" items="${sellerStoreList}">
                    <div class="card mb-3">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <!--이미지-->
	                      <div class="card img-container">
                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
                              <img src="../resources/upload/store/${item.store_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
                            </div>
	                      </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">
                            	<c:choose>
                            		<c:when test="${ item.store_category eq 0 }">강아지 용품</c:when>
                            		<c:when test="${ item.store_category eq 1 }">고양이 용품</c:when>
                            		<c:when test="${ item.store_category eq 2 }">다른 동물 용품</c:when>
                            	</c:choose>
                            </div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.store_title }</h5>
                            <p class="card-text" >
                              <div class="row">
                                <div class="col">${ item.store_content }</div>
                              </div>                             
                              <div class="row" >
                                <div class="col">
                                 
                                 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
									 <button type="button" class="button-6" onclick="location.href='<%= request.getContextPath()%>/mypage/store_admin.do?store_idx=${item.store_idx}'">관리</button>
									
									  <div class="btn-group" role="group">
									    <button id="btnGroupDrop1" type="button" class="btn button-6 dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									      Dropdown
									    </button>
									    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
									      <a class="dropdown-item"  href='javascript:void(0);' onclick="Storealert1(${item.store_idx})">수량 추가</a>
									      <a class="dropdown-item"  href='javascript:void(0);' onclick="Storealert2(${item.store_idx})">제품 설명 변경</a>
									       <a class="dropdown-item"  href='javascript:void(0);' onclick="Storealert3(${item.store_idx})">공지 사항 변경</a>
									    </div> 

									  </div>
									</div>
                                </div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>
                    </c:forEach>
                    </c:if>
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



 <%-- div class="container">
        <div class="row" style="margin-top: 10%;">
          <div class="col-md-4 col-sm-12" >
            <div style="box-shadow: 0px 0px 20px 5px rgba(0,0,0,0.05); border-radius: 10px;">
                <div class="row"> 
                    <div class="col-sm-12">
                     
                    </div>
                </div>
              
              <table class="table">
              	<thead>
              	<tr style="cursor:pointer;" onclick="location.href='my_info.do'">
              		<th colspan="3">
              			<h5>${login.member_name}님 > </h5>
              			${login.member_email}
                    </th>
              	</tr>
              		
              	</thead>
                <tbody>
                  <tr>
                      <td>이름</td>
                      <td>${member.member_name}</td>
                  </tr>
<%--                   <tr> --%>
<%--                       <td>전화번호</td>
                      <td>${member.member_phone}</td>
                  </tr>
                  <tr>
                      <td>이메일</td>
                      <td>${member.member_email}</td>
                  </tr>
                </tbody>
              </table>

              </div>
            
            <!--소비자 & 메이커 전환-->
            <div class="row mt-3">
              <div class="col">
                <button type="button" class="button-13" onclick="location.href='mypage.do'">서포터 페이지</button>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <button type="button" class="button-13" onclick="location.href='mypage2.do'">메이커 페이지</button>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <button type="button" class="button-59" onclick="location.href='funding_register.do'"><span style="display : block;">새 펀딩 오픈</span></button>
              </div>
              <div class="col">
                <button type="button" class="button-59" onclick="location.href='<%=request.getContextPath()%>/store/store_register.do'"><span style="display : block;">새 스토어 오픈</span></button>
              </div>
            </div>
          </div>
            <div class="col-md-8 col-sm-12 scroll_item">
              

              <!--펀딩&스토어 전환버튼-->
              <ul class="nav nav-tabs nav-justified" style="padding:10px 0px;">
                <li class="nav-item" >
                  <a class="nav-link active" data-toggle="tab" href="#my_funding" style="font-weight: 600; padding:10px">내 펀딩</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#my_store" style="font-weight: 600; padding:10px">내 스토어</a>
                </li>
              </ul>

              <!--내비게이션 탭 내용-->
              <div class="tab-content" >
                <div class="tab-pane fade show active" id="my_funding">
                  <!--펀딩 스크롤-->
                  <div class="mydiv" id="mydiv">
					<c:if test="${sellerFundingList.size()>0}">
					<c:forEach var="item" items="${sellerFundingList}">
					
	                    <div class="card mb-3">
	                      <div class="row item" onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'" style="cursor:pointer;">
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
	                            <div style="font-weight:100">
	                            <div>
	                            	<c:choose>
	                            		<c:when test="${ item.funding_category eq 0 }"><span style="font-weight: bold; color: grey;">강아지 용품</span></c:when>
	                            		<c:when test="${ item.funding_category eq 1 }"><span style="font-weight: bold; color: grey;">고양이 용품</span></c:when>
	                            		<c:when test="${ item.funding_category eq 2 }"><span style="font-weight: bold; color: grey;">다른 동물 용품</span></c:when>
	                            	</c:choose>
	                            </div>
	                            <div style="text-align: right;">
	                            	<c:choose>
	                            		<c:when test="${ item.funding_current_state eq 0 }"><span style="font-weight: bold">펀딩 진행중</span></c:when>
	                            		<c:when test="${ item.funding_current_state eq 1 }"><span style="font-weight: bold; color: blue">펀딩 성공</span></c:when>
	                            		<c:when test="${ item.funding_current_state eq 2 }"><span style="font-weight: bold; color: #4E342E">펀딩 실패</span></c:when>
	                            	</c:choose>
	                            </div>
	                            </div>
	                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.funding_title }</h5>
	                            <p class="card-text" >
	                                          
	                              <div class="row" style="position: absolute; bottom: 10px; right:50px">
	                                <div class="col" style=" font-weight: 600; color:red;">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>              	
	                              </div>
	                            </p>
	                       	 </div>
	                        </div> 
	                      </div>
	                      <c:choose>
	                      	<c:when test="${item.funding_current_state == 0}">
	                      	  <div class="row">
	                      	  <!-- 펀딩 진행중 -->
							    <div class="col" align="right">
							    	<button class="btn button-6" onclick="Fnalert1(${item.funding_idx})">수량 추가</button>
							     	<button class="btn button-6" onclick="Fnalert2(${item.funding_idx})">제품 설명 변경</button>
							     	<button class="btn button-6" onclick="Fnalert3(${item.funding_idx})" style="margin-right: 10px">공지사항 변경</button> 
							    </div>
							 </div>
	                      	</c:when>
	                      	<c:when test="${item.funding_current_state == 1}">
	                      		<div class="row">
	                      			<!-- 펀딩 성공 시 -> 스토어 신청 가능버튼 나오게 -->
							    <div class="col" align="right">
							    	 <button class="btn btn-outline-info" onclick="StoreSubmit(${item.funding_idx})" style="margin-right: 10px">스토어로 제품 신청</button>
							    </div>
							    </div>
	                      	</c:when>
	                     	<c:otherwise>
	                     		<div class="row">
	                     			<div class="col">
							    	 	<span style="font-weight: bold; color: grey;">해당 제품은 펀딩에 실패하였습니다.</span>
							    	</div>
	                     		</div>
	                     	</c:otherwise>
	                      </c:choose>
	                    </div>
	                     <hr class="hrTag">
                    	<br>
                    </c:forEach>
                    </c:if>
                  </div>
                </div>
                
                <!--스토어 내용-->
                <div class="tab-pane fade" id="my_store">
                  <!--스토어 스크롤-->
                  <div class="mydiv" id="mydiv">
					<c:if test="${sellerStoreList.size()>0}">
					<c:forEach var="item" items="${sellerStoreList}">
                    <div class="card mb-3">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <!--이미지-->
	                      <div class="card img-container">
                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
                              <img src="../resources/image/funding_main/${item.store_thumbnail}" class="card-img-top embed-responsive-item" alt="funding_img">
                            </div>
	                      </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">
                            	<c:choose>
                            		<c:when test="${ item.store_category eq 0 }">강아지 용품</c:when>
                            		<c:when test="${ item.store_category eq 1 }">고양이 용품</c:when>
                            		<c:when test="${ item.store_category eq 2 }">다른 동물 용품</c:when>
                            	</c:choose>
                            </div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">${ item.store_title }</h5>
                            <p class="card-text" >
                              <div class="row">
                                <div class="col">${ item.store_content }</div>
                              </div>                             
                              <div class="row" >
                                <div class="col">
                                 
                                 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
									 <button type="button" class="button-6" onclick="location.href='<%= request.getContextPath()%>/mypage/store_admin.do?store_idx=${item.store_idx}'">관리</button>
									
									  <div class="btn-group" role="group">
									    <button id="btnGroupDrop1" type="button" class="btn button-6 dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									      Dropdown
									    </button>
									    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
									      <a class="dropdown-item"  href='javascript:void(0);' onclick="Storealert1(${item.store_idx})">수량 추가</a>
									      <a class="dropdown-item"  href='javascript:void(0);' onclick="Storealert2(${item.store_idx})">제품 설명 변경</a>
									       <a class="dropdown-item"  href='javascript:void(0);' onclick="Storealert3(${item.store_idx})">공지 사항 변경</a>
									    </div> 

									  </div>
									</div>
                                </div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>
                    </c:forEach>
                    </c:if>
            </div>
            </div>
            </div>
            </div>
        </div>
    </div> 
</main> --%>
<c:import url="/footer.do"></c:import>
</body>
</html>