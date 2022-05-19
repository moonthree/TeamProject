<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_main.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<style>
 
  .card{
    border : none;
  }
  h2{
    color : burlywood;
    font-weight : bold;
  }
  .fundingRow{
  	border: 1px solid #D5D5D5;
  	border-radius: 8px;
  	padding: 20px;
  	margin : 0px 5px;
  	box-shadow: 1px 3px 3px 4px #D5D5D5;
  }
  
  *{
  	font-family: Verdana, Arial, Helvetica, sans-serif;
  }
</style>
<title>펀딩 내역</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
	<c:set var="loginPerson" value="${login.member_idx }"/> <!-- 로그인 한 사람 -->
    <div class="container" style="background-color: white;">
        <div class="row" style="margin-top:10%">
            <!--펀딩&스토어&찜-->
            <div class="col-md-12 col-sm-12">
                <!--펀딩내역-->
                <h2>펀딩 내역</h2>
                <div class="row" style=" padding-bottom:40px">
                <!-- 드롭 다운  -->
                    <div class="col-sm" style="text-align: right;">            
                        <select id="condition" name="condition" class="condition form-select" onchange="if(this.value) location.href=(this.value);">
			                <option value="info_funding.do">전체 펀딩</option>
			                <option value="info_funding.do?funding_state=0" ${param.funding_state eq 0 ? 'selected' : ''}>결제 예약</option>
			                <option value="info_funding.do?funding_state=1" ${param.funding_state eq 1 ? 'selected' : ''}>결제 완료</option>
			                <option value="info_funding.do?funding_state=2" ${param.funding_state eq 2 ? 'selected' : ''}>결제 취소</option>
			            </select>
                    </div>
                </div>
               
                <c:if test="${myFundingList.size()>0}">
				<c:forEach var="item" items="${myFundingList}">
						<div <c:if test="${param.funding_state ne null and item.funding_order_pay_state ne param.funding_state}">style="display:none"</c:if>>
	                	<div class="row fundingRow">
			                  <!--이미지-->
				                  <div class="col-md-4 col-sm-12" onclick="location.href='info_funding_detail.do?funding_idx=${item.funding_idx}&funding_order_idx=${ item.funding_order_idx }'" style="cursor:pointer;">
				                      <div class="card">
			                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
			                              <img src="../resources/upload/funding/${item.funding_thumbnail}" class="card-img-top embed-responsive-item" alt="tree">
			                            </div>
				                      </div>
				                  </div>
			                  <!--내용-->
			                  <div class="col-md-8 col-sm-12">
			                    <table class="table"> 
			                        <tr>
			                        	<td style="border:none;">
			                        	<div class="row" style="font-size: small; color:#737373">
			                        		<div class="col-md-6 col-sm-6">
			                        			<div class="row">
			                        				<div class="col-sm-12">
						                        		후원일
						                        		<fmt:formatDate value="${item.funding_order_date}" pattern="yyyy.MM.dd" />			
			                        				</div>
			                        				<div class="col-sm-12">
			                        					후원번호
			                        					${ item.funding_order_idx }
			                        				</div>
			                        			</div>
			                        		</div>
			                        		<div class="col-md-6 col-sm-6" style="text-align: right; color:blue;">
			                        		스토어 / 
			                        		${item.funding_category eq 0 ? '강아지 용품' : ''}
			                        		${item.funding_category eq 1 ? '고양이 용품' : ''}
			                        		${item.funding_category eq 2 ? '다른 동물 용품' : ''}
			                        		</div>
			                        	</div>
			                        	</td>
			                       	</tr>
			                        <tr>
			                            <th style="border:none;">
			                            	<h5 style="font-weight: bold; text-align: left;">
			                                	${item.funding_title }
			                                </h5>
			                                by. ${ item.member_name }
			                            </th>
			                        </tr>
			                     
			                      	<tr>
			                            <td  style="border:none;">
			                              <div class="row">
			                              <!-- 남은 날짜 계산 -->
							                <c:set var="now" value="<%=new java.util.Date()%>"/>
							                <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
							
							                <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/>
							                <fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
							                <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" />
							                <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
							              <!-- 남은 날짜 계산 끝 -->    
			                                <div class="col-md-6">${endDate - nowDate} 일 남음</div>
			                                <div class="col-md-6" style="text-align: right; color:red;">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>
			                              </div>
			                              <div class="progress" style="height: 7px;">
			                                <div class="progress-bar bg-info" role="progressbar" style="width: ${Math.round(item.funding_current_price/item.funding_target_price*100)}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
			                              </div>
			                            </td>
			                        </tr>
                                 
			                        <tr>
			                            <td style="border:none;">
				                            <div class="row">
					                            <div class="col-md-4 col-sm-3">
					                            	<c:choose>
					                            		<c:when test="${ item.funding_current_state == 0}">펀딩 진행중</c:when>
					                            		<c:when test="${ item.funding_current_state == 1}">펀딩 성공</c:when>
					                            		<c:otherwise>펀딩 종료</c:otherwise>
					                            	</c:choose>
					                            </div>
					                            <div class="col-md-8 col-sm-9" style="text-align: right;">
					                            	<c:choose>
					                            		<c:when test="${item.funding_order_pay_state eq 0}">${ item.funding_order_total_price }원 결제 예약</c:when>
					                            		<c:when test="${item.funding_order_pay_state eq 1}">${ item.funding_order_total_price }원 결제 완료</c:when>
					                            		<c:when test="${item.funding_order_pay_state eq 2}">결제 예약이 취소되었습니다.</c:when>			                            		
					                            	</c:choose>
					                            </div> 
				                            </div>
			                            </td>
			                        </tr>
			                    </table>
			                  </div>         
			                </div>
			                <br>
	                	
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