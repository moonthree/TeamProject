<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

 
<style>
.modal.right .modal-dialog {
	position:absolute;
	width:100%;
    top: -10px;
	right:0px;
}

/* 이미지 */
/*이미지 콘테이너 1:1 비율*/
    .img-container{
        overflow: hidden;
    }
    .card_img{
        width: 150px;
        height:150px;
        object-fit: cover;
        transition: all 0.1s linear;
    }
    .card_img:hover{
        transform: scale(1.05);
    }
    .card{
        border: none; 
    }
/* 테이블 css */
table, tr, td{
 border:none;
}
</style>
<script>

$(document).ready (function () {
	$ (".modal a").not (".dropdown-toggle").on ("click", function () {
		$ (".modal").modal ("hide");
	});
});

</script>

</head>
<body>
	
<!-- Sidebar Right modal -->
<div class="modal fade right" id="sidebar-right" tabindex="-1" role="dialog">
<div class="modal-dialog" role="document">
	
	<div class="modal-content">
		<div class="modal-header">
		<div style="font-size: x-large; font : italic 1.5em TmonMonsori;">Messages</div>
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
		</div>
	    <div class="modal-body">
	        
	        
	        <!--알림 & 쪽지 전환버튼-->
              <ul class="nav nav-tabs nav-justified" style="padding:10px 0px;">
                <li class="nav-item" >
                  <a class="nav-link active" data-toggle="tab" href="#notice" style="font-weight: 600; padding:10px">알림</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#note" style="font-weight: 600; padding:10px">쪽지</a>
                </li>
              </ul>
              
              <div class="tab-content" >
                <div class="tab-pane fade show active" id="notice">
                	<table class="table" style="border: none">
						 <c:if test="${permitFunding.size()>0}">
							<c:forEach var="item" items="${permitFunding}">
							<!-- 보낸사람 & 시각  -->
							    <tr>
							    	<th width="150px" style="border-bottom:2px solid black"><img src="<%=request.getContextPath()%>/resources/image/KakaoTalk_20220418_121005755.png" class="login_profile_img"> 관리자</th>
							    	<th style="text-align:right;">보낸시각</th>
							    </tr>
							<!-- 메세지 내용 -->
							    <tr onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'" style="cursor:pointer;">
							      	<th>
								      	<div class="img-container">
				                        	<img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top card_img" alt="funding_img">
				                        </div>
			                        </th>
			                        <th>${ item.funding_title } 이 펀딩목록에 올라갔습니다! 지금 확인해보세요</th>
							    </tr>
						  	</c:forEach>
						</c:if>
					</table>
                </div>
                <div class="tab-pane fade" id="note">
                	레벨 : ${ member.member_level }<br>
                	
                	<table class="table" style="border: none">
						 <c:if test="${dialogue.size()>0}">
							<c:forEach var="item" items="${dialogue}">
							<!-- 보낸사람 & 시각  -->
							    <tr>
							    	<th width="150px" style="border-bottom:2px solid black"><img src="<%=request.getContextPath()%>/resources/upload/${ item.member_photo }" class="login_profile_img"> ${ item.member_name }</th>
							    	<th style="text-align:right;">
							    		소비자 : ${ item.to_member_idx }<br>
										판매자 : ${ item.from_member_idx }<br>
										<fmt:parseDate var="time" value="${item.message_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
				    	                <fmt:formatDate value="${time}" pattern="yyyy.MM.dd a KK:mm:ss " /> 
				    	
							    	</th>
							    </tr>
							<!-- 메세지 내용 -->
							    <tr onclick="window.open('note.do?seller=${item.from_member_idx}&consumer=${item.to_member_idx }&funding_idx=${ item.funding_idx }','PopupWin', 'width=500,height=700');" style="cursor:pointer;">
							      	<th>
								      	
			                        </th>
			                        <th>${ item.message_content }</th>
							    </tr>
						  	</c:forEach>
						</c:if>
					</table>
                	
                </div>
              </div>
	        <!-- 들어가야하는 것 : 일단 회사측에서 보내는것 , 쪽지  -->
	         
	        
				

			<hr>
	    
	    </div>
	</div>
	
</div>
</div>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</body>
</html>