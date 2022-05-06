<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_view.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/modal.css">

    <!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
    </script>
 
</head>
<body>
	<c:import url="/header.do"></c:import>
	<main>
	<!-- 썸네일 -->
    <div class="card bg-dark text-white topcard">
        <img src="../resources/image/funding_main/${read.funding_thumbnail }" class="card-img FVtitleImg" alt="...">
        <div class="card-img-overlay">
            <br>
            <h5 class="card-category">
	           	<c:if test="${read.funding_category == 0 }">
	           		강아지 용품
	           	</c:if>
	           	<c:if test="${read.funding_category == 1 }">
	           		고양이 용품
	           	</c:if>
	           	<c:if test="${read.funding_category == 2 }">
	           		반려동물 용품
	           	</c:if>
            </h5>
            <br>
            <h3 class="card-title">${read.funding_title }</h3>
        </div>
    </div>
    <!-- -->
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12">
                <img src="../resources/image/funding_main/${read.funding_thumbnail }" class="mainIMG" alt="...">
            </div>
            <div class="col-md-4 col-sm-12 topContent">
            
            	<!-- 남은 날짜 계산 -->
                <c:set var="now" value="<%=new java.util.Date()%>"/>
                <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

                <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/>
                <fmt:parseDate var="end" value="${read.funding_end_date }" pattern="yyyy-MM-dd"/>
                <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" />
                <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
                <!-- 남은 날짜 계산 끝 -->
            
                <h3>${endDate - nowDate}일 남음</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${read.funding_current_price/read.funding_target_price*100}%" aria-valuenow="50"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h3>${Math.round(read.funding_current_price/read.funding_target_price*100)}<span class="smalltext"> %달성</span></h3>
                <h3><fmt:formatNumber value="${read.funding_current_price}" type="number" /><span class="smalltext"> 원 펀딩</span></h3>
                <h3>500<span class="smalltext"> 명의 서포터</span></h3>
                
                <!-- 로그인 처리 -->
                <c:if test="${login eq null}">
                	<!-- Button trigger modal -->
					<button type="button" class="btn btn-info FVbtn" data-toggle="modal" data-target="#loginModal">
					  펀딩하기
					</button>
					<button type="button" class="FVbtn2" data-toggle="modal" data-target="#loginModal">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart"
	                        viewBox="0 0 16 16">
	                        <path
	                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
	                    </svg>
	                    찜하기
	                </button>  
                </c:if>
                <c:if test="${login ne null}">
	                <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/option.do'" class="btn btn-info FVbtn">펀딩하기</button>
	                <button type="button" class="FVbtn2">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart"
	                        viewBox="0 0 16 16">
	                        <path
	                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
	                    </svg>
	                    찜하기
	                </button>       
                </c:if>
                <!-- 로그인 처리 끝 -->
                <div class="fundingGoal">
                    목표금액 : <fmt:formatNumber value="${read.funding_target_price}" type="number" />원<br>
                    펀딩기간 : ${read.funding_start_date }~${read.funding_end_date }<br>
                    <span class="fundingGoalText">*100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</span>
                </div>
            </div>
        </div>



        <!-- 프로젝트/스토어/커뮤니티/Q&A탭 -->
        <ul class="nav nav-tabs ulviewTab" id="myTab" role="tablist">
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link active" data-toggle="tab" href="#FVproject" role="tab" aria-controls="FVproject"
                    aria-selected="true">프로젝트</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVnotice" role="tab" aria-controls="FVnotice"
                    aria-selected="false">공지</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVcommu" role="tab" aria-controls="FVcommu"
                    aria-selected="false">커뮤니티</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVQnA" role="tab" aria-controls="FVQnA"
                    aria-selected="false">Q&A</a>
            </li>
        </ul>
        <!--프로젝트/스토어/커뮤니티/Q&A상세-->
        <div class="tab-content" id="myTabContent">
            <!--프로젝트-->
            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">
                PDF 파일 올라올 예정
            </div>
            <!--공지-->
            <div class="tab-pane fade" id="FVnotice" role="tabpanel" aria-labelledby="FVnotice-tab">
                PDF 파일 올라올 예정
            </div>
            <!--커뮤니티-->
            <div class="tab-pane fade" id="FVcommu" role="tabpanel" aria-labelledby="FVcommu-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h4>${login.member_idx}응원 · 의견 · 체험리뷰</h4>
                        <span style="opacity: 0.7;">펀딩 종료전에 남긴 글입니다.</span>
                    </div>
                    <div class="col-md-3 col-sm-12" style="text-align: right;">
                    	<c:if test="${login eq null}">
                    		<button type="button" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#loginModal">글 남기기</button>
                    	</c:if>
                    	<c:if test="${login ne null}">
                    		<button type="button" id="commuWriteBtn" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#writeModal">글 남기기</button>
                    		<button type="button" id="commuModifyBtn" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#modifyModal" style= "display:none;">수정하기</button>                    		
                    	</c:if>
                    </div>
                </div>
                <!-- 현재 시간 계산 -->
                <c:set var="commuNow"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>				
                <fmt:parseDate var="commuNow2" value="${commuNow }" pattern="yyyy-MM-dd HH:mm:ss"/>     
				<fmt:parseNumber var="commuNowHour" value="${commuNow2.time / (1000*60*60)}" integerOnly="true" />
				<fmt:parseNumber var="commuNowMinute" value="${commuNow2.time / (1000*60)}" integerOnly="true" />
				<!-- 현재 시간 계산 끝 -->
				
				<!-- 댓글 작성 여부를 위해 사용 -->
				<input type="text" id="loginMember" value="${login.member_idx}" style="display:none;"/>
				
				
                <table class="table commutable">
                    <tbody>
                    	
                    	<c:forEach items="${fundingCommunityCommentList }" var="commentList">
                    	
                		<!-- 댓글 작성 여부를 위해 사용 -->    	
                    	<input type="text" class="writeMember" value="${commentList.member_idx}" style="display:none;"/>
                    	
                    	
                    	<!-- 등록 날짜 계산 -->    				
		                <fmt:parseDate var="commuRegDate" value="${commentList.funding_detail_community_regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
		                <fmt:parseNumber var="commuRegHour" value="${commuRegDate.time / (1000*60*60)}" integerOnly="true" />
		                <fmt:parseNumber var="commuRegMinute" value="${commuRegDate.time / (1000*60)}" integerOnly="true" />
		                <!-- 등록 날짜 계산 끝 -->
						
						
                    		<tr>
                    			<th scope="row" style= "width: 10%; border-radius: 70%">
                    				<c:choose>
			                        	<c:when test="${commentList.memberVO.member_photo eq 'http://k.kakaocdn.net/dn/dpk9l1/btqmGhA2lKL/Oz0wDuJn1YV2DIn92f6DVK/img_110x110.jpg,'}">
			                        		<div class="profile_div">
			                        			<img src="../resources/image/111.png" alt="profile_img" class="profile_img">
			                        		</div>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<div class="profile_div">
												<img src="../resources/image/funding_main/${commentList.memberVO.member_photo }" alt="profile_img" class="profile_img">
											</div>
			                        	</c:otherwise>
			                        </c:choose>
                    			</th>
                    				
	                            <th scope="row" style= "width: 90%;">
	                                <span class="commuName">${commentList.memberVO.member_name }</span>
	                                &nbsp;
	                                <span class="state">펀딩 참여자${commentList.member_idx}</span>
	                                &nbsp;
	                                
	                                
	                                <fmt:parseDate var="commuregdate1" value="${commentList.funding_detail_community_regdate }" pattern="yyyy-MM-dd"/>
	                                <fmt:formatDate var="commuregdate2" value="${commuregdate1 }" pattern="yy.MM.dd"/>
	                                <span class="minute">
	                                <c:if test = "${commentList.funding_detail_community_category eq 0}">
	                                	응원
	                                </c:if>
	                                <c:if test = "${commentList.funding_detail_community_category eq 1}">
	                                	의견
	                                </c:if>
	                                <c:if test = "${commentList.funding_detail_community_category eq 2}">
	                                	체험
	                                </c:if>
	                                &nbsp;
	                                <c:if test = "${commuNowHour - commuRegHour < 1}">
	                                	방금 전
	                                </c:if>
	                                <c:if test = "${commuNowHour - commuRegHour >= 1 && commuNowHour - commuRegHour <= 24}">
	                                	${commuNowHour - commuRegHour}시간 전
	                                </c:if>
	                                <c:if test = "${commuNowHour - commuRegHour > 24}">
	                                	${commuregdate2}
	                                </c:if>
	                                </span>
	                                <br>
	                                <br>
	                                <span class="commuContent">
	                                    ${commentList.funding_detail_community_content }
	                                </span>    
	                            <th>
	                        </tr>
                    	</c:forEach>
<!--                         <tr>
                            <th scope="row">
                                <span class="commuName">이름</span>
                                &nbsp;
                                <span class="state">펀딩 참여자</span>
                                &nbsp;
                                <span class="minute">응원•10분전</span>
                                <br>
                                <br>
                                <span class="commuContent">
                                    댓글 내용
                                </span>    
                            <th>
                        </tr>
                        <tr>
                            <th scope="row">
                                <span class="commuName">이름</span>
                                &nbsp;
                                <span class="state">펀딩 참여자</span>
                                &nbsp;
                                <span class="minute">응원•10분전</span>
                                <br>
                                <br>
                                <span class="commuContent">
                                    댓글 내용
                                </span>
                            </th>
                        </tr> -->
                    </tbody>
                </table>
            </div>
            <!--Q&A-->
            <div class="tab-pane fade" id="FVQnA" role="tabpanel" aria-labelledby="FVQnA-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h3 style="padding-top: 10px;">Q&A</h3>
                    </div>
                    <div class="col-md-3 col-sm-12" style="text-align: right;">
                        <c:if test="${login eq null}">
                    		<button type="button" class="btn btn-outline-info btn-lg commubtn" data-toggle="modal" data-target="#loginModal">상품 Q&A 작성하기</button>
                    	</c:if>
                    	<c:if test="${login ne null}">
                    		<button type="button" class="btn btn-outline-info btn-lg commubtn">상품 Q&A 작성하기</button>
                    	</c:if>
                    </div>
                </div>

                <table class="table QnAtable">
                    <thead>
                        <tr>
                            <th scope="col">답변상태</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 15%;">답변대기</td>
                            <td style="width: 55%;">비밀글입니다.
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
                                    viewBox="0 0 16 16">
                                    <path
                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
                                </svg>
                            </td>
                            <td style="width: 15%;">abcd*******</td>
                            <td style="width: 15%;">2022.04.25</td>
                        </tr>
                        <tr>
                            <td style="width: 15%;">답변완료</td>
                            <td style="width: 55%;">배송 언제 시작하나요?</td>
                            <td style="width: 15%;">ewrwe****</td>
                            <td style="width: 15%;">2022.04.24</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
	</main>
	
	<!-- Modal -->
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content login_modal_content">
	      <div class="modal-header login_modal_header">
	        <button type="button" class="login_modal_close close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body login_modal_body">
	      	<h4>로그인이 필요합니다.</h4>
	      </div>
	      <div class="modal-footer login_modal_footer">
	        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/member/join_select.do'" class="login_modalBtn btn btn-outline-info btn-lg">회원가입</button>
	        <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/member/login.do'" class="login_modalBtn btn btn-info btn-lg">로그인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	 <!-- 커뮤니티 글 남기기 모달 -->
    <div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form id="commuform" method="post">
            <div class="modal-dialog">
                <div class="modal-content write_modal_content">
                    <div class="modal-header write_modal_header">
                        <button type="button" class="write_modal_close close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body write_modal_body">
                        <h4>글 남기기</h4>
                        <p>응원∙의견∙체험리뷰를 남겨주세요.
                            판매자의 답변이 필요한 문의 글은 ‘Q&A’를 이용해야 답변을 받을 수 있습니다</p>
                            
                            <button type="button" name="" class="div2 btn btn-outline-info" value=0>
                                응원
                            </button>
                            
                            <button type="button" name="" class="div2 btn btn-outline-info" value=1>
                                의견
                            </button>

                            <button type="button" name="" class="div2 btn btn-outline-info" value=2>
                                체험
                            </button>
							<input type=text name="funding_detail_community_category" value="" style="display:none;"/>
							<input type=text name="funding_idx" value="${read.funding_idx}" style="display:none;"/>
							<input type=text name="member_idx" value="${member.member_idx}" style="display:none;"/>

                            <textarea name="funding_detail_community_content" id="funding_detail_community_content" cols="60" rows="10"></textarea>
                            

                    </div>
                    <div id="result">
                    </div>
                    <div class="modal-footer write_modal_footer">
                        <button type="button" id="SubmitBtn" class="write_modalBtn btn btn-outline-info">등록</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
	<!-- 커뮤니티 글 수정 모달 -->
	<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content login_modal_content">
	      <div class="modal-header login_modal_header">
	        <button type="button" class="login_modal_close close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body login_modal_body">
	      	<h4>구현 필요</h4>
	      </div>
	      <div class="modal-footer login_modal_footer">
	      </div>
	    </div>
	  </div>
	</div>
    

    <c:import url="/footer.do"></c:import>
    
<script type="text/javascript">
// 글 남기기 모달 카테고리 클릭 이벤트 시작
var div2 = document.getElementsByClassName("div2");

function handleClick(event) {
    console.log(event.target);
    // console.log(this);
    // 콘솔창을 보면 둘다 동일한 값이 나온다
    
    console.log(event.target.parentElement);

    if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
    } else {
        for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
        }

        event.target.classList.add("clicked");
    }
    
}

function init() {
    for (var i = 0; i < div2.length; i++) {
        div2[i].addEventListener("click", handleClick);
    }
}

init();
 // 글 남기기 모달 카테고리 클릭 이벤트 끝

 
 // 글 남기기 모달 글 작성 시작
var writeModal = $("#writeModal");
    var writeModalInput = writeModal.find("textarea[name='funding_detail_community_content']");
    var writeModalSubmit = $("#SubmitBtn");
    var writeModalCategory = "";
    var ModalCategory = "";

    writeModalSubmit.on("click", function(e){
    	var writeModalValue = writeModalInput.val();
        console.log(writeModalValue);
        writeModalCategory = document.getElementsByClassName('clicked')[0].value
        modalCategory = document.getElementsByClassName('clicked')[0].innerText
        console.log(modalCategory)
        console.log(writeModalCategory)
		$('input[name=funding_detail_community_category]').attr('value',writeModalCategory);
        
        if(writeModalValue == ""){
        	alert("글을 작성해주세요")
        }else{
        	$.ajax({	
                url: "serialize",
                type: "POST",
                data: $("#commuform").serialize(),
           	   success: function(data){
                      //$('#result').text(data);
                      $('#writeModal').modal('hide')
                      window.alert(modalCategory + ' 작성에 성공했습니다!')
                      location.reload();
                  },
                  error: function(){
                      alert("serializeerr");
                  }   
            });	
        }      
    });
 // 글 남기기 모달 글 작성 끝
 
 // 페이지 로드시 이벤트 시작
 // 로그인 한 아이디에 커뮤니티 글 작성한 게 있으면 작성하기 버튼 숨기고 수정하기 버튼 보임
 window.addEventListener('load', function () {
	 var writeMember = document.getElementsByClassName("writeMember");
	 var login = document.getElementById('loginMember').value;
	 console.log(writeMember.length)
	 console.log(login)
	 
  	 for (var i = 0; i < writeMember.length; i++) {
  		 if(writeMember[i].value == login){
  			document.getElementById('commuWriteBtn').style.display = "none"; // hide
  			document.getElementById('commuModifyBtn').style.display = "block"; // hide
  		 }
  	 }
})
 
</script>
</body>
</html>