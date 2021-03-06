<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- 주석 version13 -->
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
      		<li class="nav-item nav-pills viewtab" role="presentation" > 
                  <a id="alink1" class="nav-link active taaa" data-toggle="tab"  role="tab" href="#tab1"
                    aria-controls="tab1"  aria-selected="true">펀딩</a>  
            </li>
             <li class="nav-item nav-pills viewtab" role="presentation">
      
                <a id="alink2" class="nav-link" data-toggle="tab"   role="tab" aria-controls="tab2" href="#tab2"
                    aria-selected="false"><span class="toptab">스토어</span></a>
            </li>
        </ul>
        
        <div class="tab-content" id="myTabContent">
           
           	<!-- 펀딩 페이징1-->
           <div class="tab-pane fade active show" id="tab1" role="tabpanel"
                aria-labelledby="tab1-tab"> 
                <c:if test="${listFun.size() eq 0}">
                   
            
                  <span style="color: gray; font-weight: bold;">등록된 펀딩 제품이 없습니다.</span>
             
				</c:if>
				 <c:if test="${listFun.size() ne 0}">
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
	                                <button type="button" onclick="updateStateFunding(this)" class="btn btn-outline-success">승인 허가</button>
	                                <button type="button" onclick="updateStateFunding2(this)" class="btn btn-outline-danger" >승인 거절</button>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                    </table>
                <div>
                <!-- 펀딩 페이징 기법 -->
	        	<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <c:if test="${pageOne.prev}">
					    	<li class="page-item"><a class="page-link" href="approval.do${pageOne.makeQuery(pageOne.startPage - 1)}#tab1">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageOne.startPage}" end="${pageOne.endPage}" var="idx">
					    	<li class="page-item"><a class="page-link" href="approval.do${pageOne.makeQuery1(idx)}#tab1">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageOne.next && pageOne.endPage > 0}">
					    	<li class="page-item"><a class="page-link" href="approval.do${pageOne.makeQuery(pageOne.endPage + 1)}#tab1">다음</a></li>
					    </c:if> 
					  </ul>
				 </nav>
				</div>
				</c:if>
            </div>
           
           <!-- 스토어 페이징2-->
           <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
           	<c:if test="${listStore.size() eq 0}">
                   
                   <span style="color: gray; font-weight: bold;">등록된 스토어 제품이 없습니다.</span>
             
			</c:if>
			 <c:if test="${listStore.size() ne 0}">
                <table class="table">
                    <thead class="thead">
                        <tr>
                            <th scope="col" style="width :5%">번호</th>
                            <th class="tdtitle" style="width : 40%">제목</th>
                            <th scope="col" style="width : 10%">상태 </th>
                            <th scope="col"style="width : 20%">카테고리</th>
                            <th scope="col"style="width : 24%">버튼</th>
                        </tr>
                    </thead>
					 <tbody>
					 	<c:forEach var="StoreList" items="${listStore}">
	                        <tr>
	                            <th>${StoreList.store_idx}</th>
	                            <td class="tdtitle">
	                            
		                            		<a href="<%=request.getContextPath()%>/store/store_view.do?store_idx=${StoreList.store_idx}&store_funding=${StoreList.store_funding}">
		                            			${StoreList.store_title}
		                            		</a>
	                            </td>
	                            <td>
	                           		<c:if test="${StoreList.store_permit_state eq 0}">
	                           		<span style="color: blue;">승인 대기</span>
	                           		</c:if>
	                            </td>
	                            <td>
	                            	<c:if test="${StoreList.store_category eq 0}">강아지</c:if>
	                            	<c:if test="${StoreList.store_category eq 1}">고양이</c:if>
	                            	<c:if test="${StoreList.store_category eq 2}">기타동물</c:if>
	                            </td>
	                            <td>
	                                <button type="button" onclick="updateStateStore(this)" class="btn btn-outline-success">승인 허가</button>
	                                <button type="button" onclick="updateStateStore2(this)" class="btn btn-outline-danger" >승인 거절</button>
	                            </td>
	                        </tr>
                        </c:forEach>
                        </tbody>
               		</table>
                        <!-- 스토어 페이징 기법 -->
			              <div>
			                 <nav aria-label="Page navigation example">
			                    <ul class="pagination justify-content-center">
			                      <c:if test="${pageTwo.prev}">
			                         <li class="page-item"><a class="page-link" href="approval.do${pageTwo.makeQuery1(pageTwo.startPage - 1)}#tab2">이전</a></li>
			                      </c:if> 
			                  
			                      <c:forEach begin="${pageTwo.startPage}" end="${pageTwo.endPage}" var="idx2">
			                         <li class="page-item"><a class="page-link" href="approval.do${pageTwo.makeQuery1(idx2)}#tab2">${idx2}</a></li>
			                      </c:forEach>
			                  
			                      <c:if test="${pageTwo.next && pageTwo.endPage > 0}">
			                         <li class="page-item"><a class="page-link" href="approval.do${pageTwo.makeQuery1(pageTwo.endPage + 1)}#tab2">다음</a></li>
			                      </c:if> 
			                    </ul>
			                </nav>
			            </div>	
			             </c:if> 	
            </div>
        </div>
        </div>

</main>
<script type="text/javascript">


$('#myTab #alink1').click(function(e) {
	e.preventDefault();
	history.replaceState({}, null, location.pathname);
	loaction.href=location.pathname;
//	window.location.reload();
    $(this).tab('show');
    window.scrollTo(100, 100);
  });
  
$('#myTab #alink2').click(function(e) {
    e.preventDefault();
    history.replaceState({}, null, location.pathname);
    loaction.href=location.pathname;
    $(this).tab('show');
    window.scrollTo(100, 100);
  });
  
  
  // store the currently selected tab in the hash value
  $("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
    var id = $(e.target).attr("href").substr(1);
    window.location.hash = id;
    window.scrollTo(100, 100);
  });
  
  // on load of the page: switch to the currently selected tab
  var hash = window.location.hash;
  $('#myTab a[href="' + hash + '"]').tab('show'); 

</script>


<script type="text/javascript">
//펀딩 승인 허용
function updateStateFunding(obj) {
	
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
//펀딩승인 거절
function updateStateFunding2(obj) {
	
	//funding 번호 찾기
	var f_idx = $(obj).parent().parent().children().first().text();
	
 	$.ajax({
		url:"update_FundingState2.do",
		type:"post",
		data:"f_idx="+f_idx,
		success:function(result){
			
			if(result == 0){
				alert("승인거절 실패하였습니다.");
			}else{
				alert("승인 거절 성공");
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

<script type="text/javascript">
//스토어
function updateStateStore(obj) {
	
	//store 번호 찾기
	var store_idx = $(obj).parent().parent().children().first().text();
	
	$.ajax({
		url:"update_StoreState.do",
		type:"post",
		data:"store_idx="+store_idx,
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
//스토어 승인 거절
function updateStateStore2(obj) {
	
	//store 번호 찾기
	var store_idx = $(obj).parent().parent().children().first().text();
 	$.ajax({
		url:"update_StoreState2.do",
		type:"post",
		data:"store_idx="+store_idx,
		success:function(result){
			
			if(result == 0){
				alert("승인거절 실패하였습니다.");
			}else{
				alert("승인 거절 성공");
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