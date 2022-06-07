<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	    $(document).ready(function() {
	        $(".dropdown-toggle").dropdown();
	    });
	    
    </script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage_css/store_admin.css">
<title>펀딩 관리 페이지</title>
</head>
<body>
<c:import url="/header.do"></c:import>


<c:if test="${check eq 0}"> <!-- 펀딩 진행중인 상품 관리 페이지 -->
	<main>
	<c:if test="${empty listMap}">
	
		<div class="container" style="margin-top: 6%;">
			<div class="containerbox">
				<h1>펀딩 관리</h1>
				<span style="font-family: TmonMonsori;">펀딩 진행중인 상품입니다. 아직 참여자가 없습니다.</span>
				<br>
				<br>
				<br>
				<div class="table_container">
					<table>
	                    <thead>
	                        <tr>
	                            <th>주문 번호</th>
	                            <th>고객 번호</th>
	                            <th>주문 금액</th>
	                            <th>고객 이름</th>
	                            <th width="30%">배송 주소</th> 
	                            <th>주문 상태</th>   
	                            <th>배송인 이름</th>     
	                            <th>배송인 번호</th>
	                                          
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	
	                    		<tr>
		                    		<td colspan="6" style="text-align: center; height: 150px;">주문이 존재하지 않습니다.</td>
		                    	</tr>
	                    	
	                    </tbody>
	                 </table>
	               </div>
	     </div>
	   </div>
	</c:if>
	<c:if test="${!empty listMap}">
		<div class="container" style="margin-top: 6%;">
		<div class="containerbox" style="margin-top: 6%;">
				<h1>펀딩 관리</h1>
				<span style="font-family: TmonMonsori;">펀딩 진행중인 상품입니다.  ${listMap.size() }명 참여 중</span>
				<br>
				<br>
				<br>
				<div class="table_container">
					<table>
	                    <thead>
	                        <tr>
	                            <th>주문 번호</th>
	                            <th>고객 번호</th>
	                            <th>주문 금액</th>
	                            <th>고객 이름</th>
	                            <th width="30%">배송 주소</th> 
	                            <th>주문 상태</th>   
	                            <th>배송인 이름</th>     
	                            <th>배송인 번호</th>                     
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:if test="${empty listMap}">
	                    		<tr>
		                    		<td colspan="6" style="text-align: center; height: 150px;">주문이 존재하지 않습니다.</td>
		                    	</tr>
	                    	</c:if>
	                    	<c:forEach var="listMap" items="${listMap}">
	                        <tr>
	                            <td>${listMap.funding_order_idx}</td>
	                            <td>${listMap.member_idx}</td>
	                            <td>${listMap.funding_order_total_price}</td>
	                            <td>
	                            	${listMap.member_name}
	                            </td>
	                            <td>
	                            	${listMap.addr}
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${listMap.funding_order_pay_state  eq 0}">
	                            			<span>주문 완료</span>
	                            		</c:when>
	                            		<c:when test="${listMap.funding_order_pay_state  eq 2}">
	                            			<span style="color: red;">주문 취소</span>
	                            		</c:when>
	                            	</c:choose>
	                            </td>
	                            <td>
	                            	${listMap.name }
	                            </td>
	                            <td>
	                            	${listMap.phone }
	                            </td>
	                        </tr>
	                    	</c:forEach>
	                    </tbody>
	                </table>
				</div>
			</div>	
		</div>
	</c:if>
	</main>
</c:if> <!-- 펀딩 진행중인 상품 관리 페이지 -->
		
		
<c:if test="${check eq 1}"> <!-- 펀딩 성공한 상품 관리 페이지 -->
	<main>
	<c:if test="${empty listMap}">
	
		<div class="container" style="margin-top: 6%;">
			<div class="containerbox">
				<h1>펀딩 관리</h1>
				<span style="font-family: TmonMonsori;">축하드립니다. 펀딩 성공에 성공한 제품 페이지입니다. ${listMap.size()}명 참여</span>
				<br>
				<br>
				<br>
				<div class="table_container">
					<table>
	                    <thead>
	                        <tr>
	                            <th>주문 번호</th>
	                            <th>고객 번호</th>
	                            <th>주문 금액</th>
	                            <th>고객 이름</th>
	                            <th width="30%">배송 주소</th> 
	                            <th>주문 상태</th>   
	                            <th>배송인 이름</th>     
	                            <th>배송인 번호</th>
	                                          
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	
	                    		<tr>
		                    		<td colspan="6" style="text-align: center; height: 150px;">주문이 존재하지 않습니다.</td>
		                    	</tr>
	                    	
	                    </tbody>
	                 </table>
	               </div>
	     </div>
	   </div>
	</c:if>
	<c:if test="${!empty listMap}">
		<div class="container" style="margin-top: 6%;">
		<div class="containerbox" style="margin-top: 6%;">
				<h1>펀딩 관리</h1>
				<span style="font-family: TmonMonsori;">축하드립니다. 펀딩 성공에 성공한 제품 페이지입니다. ${listMap.size()}명 참여</span>
				<br>
				<div class="table_container">
					<table>
	                    <thead>
	                        <tr>
	                            <th>주문 번호</th>
	                            <th>고객 번호</th>
	                            <th>주문 금액</th>
	                            <th>고객 이름</th>
	                            <th width="30%">배송 주소</th> 
	                            <th>주문 상태</th>   
	                            <th>배송인 이름</th>     
	                            <th>배송인 번호</th>
	                            <th>배송 상태</th>                     
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:if test="${empty listMap}">
	                    		<tr>
		                    		<td colspan="6" style="text-align: center; height: 150px;">주문이 존재하지 않습니다.</td>
		                    	</tr>
	                    	</c:if>
	                    	<c:forEach var="listMap" items="${listMap}">
	                        <tr>
	                            <td>${listMap.funding_order_idx}</td>
	                            <td>${listMap.member_idx}</td>
	                            <td>${listMap.funding_order_total_price}</td>
	                            <td>
	                            	${listMap.member_name}
	                            </td>
	                            <td>
	                            	${listMap.addr}
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${listMap.funding_order_pay_state  eq 0}">
	                            			<span>주문 완료</span>
	                            		</c:when>
	                            		<c:when test="${listMap.funding_order_pay_state  eq 2}">
	                            			<span style="color: red;">주문 취소</span>
	                            		</c:when>
	                            	</c:choose>
	                            </td>
	                            <td>
	                            	${listMap.name }
	                            </td>
	                            <td>
	                            	${listMap.phone }
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${listMap.funding_express_state  eq 0}">
	                            			<c:choose>
	                            				<c:when test="${login.member_level eq 2}">
	                            					<span>배송 준비</span>
	                            				</c:when>
	                            				<c:otherwise>
	                            					<button onclick="fnSuccessEx(${listMap.funding_order_idx})" type="button" class="btn btn-info">배송</button>
	                            				</c:otherwise>
	                            			</c:choose>
	                            		</c:when>
	                            		<c:when test="${listMap.funding_express_state  eq 1}">
	                            			<span style="color: blue;">배송 완료</span>
	                            		</c:when>
										<c:when test="${listMap.funding_express_state  eq 2}">
	                            			<span style="color: red;">배송 실패</span>
	                            		</c:when>
	                            	</c:choose>
	                            	
	                            </td>
	                        </tr>
	                    	</c:forEach>
	                    </tbody>
	                </table>
				</div>
			</div>	
	</div>
	</c:if>
	</main>
</c:if> <!-- 펀딩 진행중인 상품 관리 페이지 -->		
		
		
		
		
		
		
		
		
		
	
<c:import url="/footer.do"></c:import>
</body>
<script type="text/javascript">
	function fnSuccessEx(obj){
		var funding_order_idx = obj;
		$.ajax({
			url:"Success_update_FundingExpress.do",
			type:"post",
			data:"funding_order_idx="+funding_order_idx,
			success:function(result){
				if(result == 0){
					alert("발송 처리 실패");
				}else{
					alert("발송 처리 성공");
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
</html>