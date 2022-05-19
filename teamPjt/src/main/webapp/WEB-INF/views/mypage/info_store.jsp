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
<title>구매 내역</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
	<c:set var="loginPerson" value="${login.member_idx }"/> <!-- 로그인 한 사람 -->
    <div class="container" style="background-color: white;">
        <div class="row" style="margin-top:10%">
            <div class="col-md-12 col-sm-12">
                <h2>구매 목록</h2>
                <c:if test="${myStoreList.size()>0}">
				<c:forEach var="item" items="${myStoreList}">
	                
	                		<div class="row fundingRow">
			                  <!--이미지-->
				                  <div class="col-md-4 col-sm-12" onclick="location.href='info_store_detail.do?store_idx=${item.store_idx}&store_order_idx=${ item.store_order_idx }'" style="cursor:pointer;">
				                      <div class="card">
			                            <div class="embed-responsive embed-responsive-4by3" style="margin-top:10px">
			                              <img src="../resources/upload/store/${item.store_thumbnail}" class="card-img-top embed-responsive-item" alt="tree">
			                            </div>
				                      </div>
				                  </div>
			                  <!--내용-->
			                  <div class="col-md-8 col-sm-12">
			                    <table class="table">
			                        
			                        <tr>
			                        	<td style="border:none;">
			                        	<div class="row" style="font-size: small; color:#737373">
			                        		<div class="col-md-6">
			                        		구매일
			                        		<fmt:formatDate value="${item.store_order_date}" pattern="yyyy.MM.dd" /> | 
			                        		구매번호
			                        		${ item.store_order_idx }
			                        		</div>
			                        		<div class="col-md-6" style="text-align: right; color:blue;">
			                        		스토어 / 
			                        		${item.store_category eq 0 ? '강아지 용품' : ''}
			                        		${item.store_category eq 1 ? '고양이 용품' : ''}
			                        		${item.store_category eq 2 ? '다른 동물 용품' : ''}
			                        		</div>
			                        	</div>
			                        	</td>
			                       	</tr>
			                        <tr>
			                            <th style="border:none;">
			                            	<h5 style="font-weight: bold; text-align: left;">
			                                	${item.store_title }
			                                </h5>
			                                by. ${ item.member_name }
			                            </th>
			                        </tr>
			                      
			                        <tr>
			                            <td style="border:none; text-align:right;" colspan="2">
			                            ${ item.store_order_total_price }원 결제
			                            
			                            </td>
			                        </tr>
			                                      
			                    
			                    </table>
			                  </div>         
			                </div>
			                <br>
	                
	             	</c:forEach>
	             </c:if>
                
        	</div>
    	</div>
    </div>
</main>
<c:import url="/footer.do"></c:import>

    
</body>
</html>