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
<title>스토어 관리 페이지</title>
</head>
<body>
<c:import url="/header.do"></c:import>
	<main>
		<div class="containerbox">
			<h1>스토어 관리</h1>
			<div class="table_container">
				<table>
                    <thead>
                        <tr>
                            <th>주문 번호</th>
                            <th>구매자 정보</th>
                            <th>받는 분 정보</th>
                            <th width="35%">배송지 주소</th>
                            <th>결제 상태</th>
                            <th>배송 상태</th>
                            <th>발송 처리</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${empty admin}">
                    		<tr>
	                    		<td colspan="7" style="text-align: center; height: 150px;">주문이 존재하지 않습니다.</td>
	                    	</tr>
                    	</c:if>
                    	<c:forEach var="admin" items="${admin}">
                        <tr>
                            <td>${admin.store_order_idx}</td>
                            <td style="text-align: left">
                            	${admin.member_name}<br>
                            	${admin.member_phone}
                            </td>
                            <td style="text-align: left">
                            	${admin.store_express_name}<br>
                            	${admin.store_express_phone}
                            </td>
                            <td style="text-align: left">
                            	[${admin.store_express_postnum}]<br>
                            	${admin.store_express_addr1} ${admin.store_express_addr2}
                            </td>
                            <td>
                            	<c:if test="${admin.store_order_pay_state eq 0}">
                            		결제 완료
                            	</c:if>
                            	<c:if test="${admin.store_order_pay_state eq 1}">
                            		<span style="color: red">결제 취소</span>
                            	</c:if>
                            </td>
                            <td>
                            	<c:if test="${admin.store_express_state eq 0}">
                            		상품 준비 중
                            	</c:if>
                            	<c:if test="${admin.store_express_state eq 1}">
                            		배송 완료
                            	</c:if>
                            	<c:if test="${admin.store_express_state eq 2}">
                            		취소
                            	</c:if>
                            </td>
                            <td>
                            	<c:if test="${admin.store_express_state eq 0}">
	                            	<c:choose>
                            				<c:when test="${login.member_level eq 2}">
                            					<span>배송 준비 중</span>
                            				</c:when>
                            				<c:otherwise>
                            					<button type="button" onclick="updateExpress(this)" class="btn btn-outline-warning" style="font-size: 15px;">배송 시작</button>
                            				</c:otherwise>
                            			</c:choose>
                            	</c:if>
                            	<c:if test="${admin.store_express_state eq 1}">
                            		발송 완료
                            	</c:if>
                            </td>
                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
			</div>
		</div>
	</main>
<c:import url="/footer.do"></c:import>
</body>
<script type="text/javascript">
	function updateExpress(obj){
		
		var store_order_idx = parseInt($(obj).parent().parent().children().first().text());
		console.log(store_order_idx);
		$.ajax({
			url:"update_Express.do",
			type:"post",
			data:"store_order_idx="+store_order_idx,
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