<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> -->
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    
    <!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".dropdown-toggle").dropdown();
        });
    </script>
    
    <link rel="stylesheet" type="text/css" href="../resources/css/mypage_css/approval.css">
</head>
<body>

	<c:import url="/header.do"></c:import>
<main id="wrapper">
	<div class="container">
        <h2 class="apptitle">승인 대기 페이지</h2>
        <ul class="nav nav-tabs ulviewTab" id="myTab" role="tablist">
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link active" data-toggle="tab" href="#fundingApproval" role="tab" aria-controls="fundingApproval"
                    aria-selected="true"><span class="atab">펀딩승인</span></a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#storeApproval" role="tab" aria-controls="storeApproval"
                    aria-selected="false"><span class="toptab">스토어</span></a>
            </li>
        </ul>
        
        <div class="tab-content" id="myTabContent">
           
           	<!-- 펀딩 -->
            <div class="tab-pane fade active show " id="fundingApproval" role="tabpanel" aria-labelledby="fundingApproval-tab">
                <table class="table">
                    <thead class="thead">
                        <tr>
                            <th scope="col">펀딩 번호</th>
                            <th class="tdtitle scope="col" style="width : 55%">제목</th>
                            <th scope="col">상태</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${listFun ne null}">
                    	<c:forEach var="funList" items="${listFun}">
	                        <tr>
	                            <th>${funList.funding_idx}</th>
	                            <td class="tdtitle">
		                            <a href="<%=request.getContextPath()%>/funding/view.do?funding_idx=${funList.funding_idx}">
		                            		${funList.funding_title}
		                            </a>
	                            </td>
	                            <td>
	                           		<c:if test="${funList.funding_permit_state eq 0}">
	                           		<span style="color: blue;">승인 대기</span>
	                           		</c:if>
	                            </td>
	                            <td>
	                            	<c:if test="${funList.funding_category eq 0}">강아지</c:if>
	                            	<c:if test="${funList.funding_category eq 1}">고양이</c:if>
	                            	<c:if test="${funList.funding_category eq 2}">기타동물</c:if>
	                            </td>
	                            <td>
	                                <button type="button" onclick="updateStateFn(this)" class="btn btn-outline-success">승인 허가</button>
	                                <button type="button" class="btn btn-outline-danger">승인 거절</button>
	                            </td>
	                        </tr>
                        </c:forEach>
                       </c:if>
                    </tbody>
                </table>
            </div>
           
           <!-- 스토어 -->
            <div class="tab-pane fade" id="storeApproval" role="tabpanel" aria-labelledby="storeApproval-tab">
                <table class="table">
                    <thead class="thead">
                        <tr>
                            <th scope="col">번호</th>
                            <th class="tdtitle" style="width : 60%">제목</th>
                            <th scope="col">상태</th>
                            <th scope="col">버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td class="tdtitle">Mark</td>
                            <td>승인대기</td>
                            <td>
                                <button type="button"  class="btn btn-outline-success">승인 허가</button>
                                <button type="button" class="btn btn-outline-danger">승인 거절</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
     <div>
        	<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <c:if test="${pageMaker.prev}">
				    	<li class="page-item"><a class="page-link" href="main_cat.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li class="page-item"><a class="page-link" href="main_cat.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li class="page-item"><a class="page-link" href="main_cat.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
			 </nav>
		</div>
</main>
<script type="text/javascript">
function updateStateFn(obj) {
	
	//funding 번호 찾기
	var f_idx = $(obj).parent().parent().children().first().text();
	
	$.ajax({
		url:"update_FundingState.do",
		type:"post",
		data:"f_idx="+f_idx,
		success:function(result){
			
			if(result == 0){
				alert("승인요청 실패하였습니다.");
			}else{
				alert("승인 요청 성공");
				//현재 페이지 새로고침
				location.reload();
			}
			
		},
		error:function(result){
			alert("오류 발생");
		}
	
	});
} 


</script>
<c:import url="/footer.do"></c:import>
</body>
</html>