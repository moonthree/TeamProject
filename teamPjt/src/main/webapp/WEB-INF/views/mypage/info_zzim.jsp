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
    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_view.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/modal.css">
<style>
  .embed-responsive {
    border-radius: 12px;
  }
  .card{
    border : none;
  }
  h2{
    color : burlywood;
    font-weight : bold;
  }
  .jb-wrap {
        padding: 20px 0px;
      }
</style>
<title>찜 목록</title>
</head>
<body>
<c:import url="/header.do"></c:import> 
<main id="wrapper">
	<c:set var="loginPerson" value="${login.member_idx }"/> <!-- 로그인 한 사람 -->
    <div class="container" style="background-color: white;">
        <div class="row">
            <!--펀딩&스토어&찜-->
            <div class="col-md-12 col-sm-12" style=" margin-top: 10%;">
                <!--찜 목록-->
                <h2>찜 목록</h2>
                <br>
                
                <c:if test="${myZzimList.size()>0}">
				<c:forEach var="item" items="${myZzimList}">
                <div class="row fundingRow">
                  <!--이미지-->
                  <div class="col-md-5 col-sm-12 jb-wrap" onclick="location.href='view.do?funding_idx=${item.funding_idx}'">
                      <div class="card">
                          <a href="#">
                            <div class="embed-responsive embed-responsive-4by3">
                              <img src="../resources/image/funding_main/${ item.funding_thumbnail }" class="card-img-top embed-responsive-item" alt="tree">
                            </div>
                            </a>
                      </div>
                  </div>
                  <!--내용-->
                  <div class="col-md-7 col-sm-12">
                    <table class="table">
                      <thead class="table-light" style="border-bottom: 2px solid gray;">
                        <tr>
                            <th colspan="2" style="text-align: center;">
                              <h4 style="font-weight: bold; text-align: left;">${ item.funding_title }</h4>
                            </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td style="border-top:none;" colspan="2">
                              <div class="row">
                              
                              <!-- 남은 날짜 계산 -->
				                <c:set var="now" value="<%=new java.util.Date()%>"/>
				                <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
				
				                <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/>
				                <fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
				                <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" />
				                <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
				              <!-- 남은 날짜 계산 끝 -->
                              
                                <div class="col-md-6">${endDate - nowDate}일 남음</div>
                                <div class="col-md-6" style="text-align: right;">${Math.round(item.funding_current_price/item.funding_target_price*100)}% 달성</div>
                              </div>
                              <div class="progress" style="height: 10px;">
                                <div class="progress-bar bg-info" role="progressbar" style="width: ${Math.round(item.funding_current_price/item.funding_target_price*100)}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="border-top:none;" colspan="2">
                              <h4>${ item.funding_current_price }원 펀딩</h4>
                            </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <h4>${Math.round(item.funding_current_price/item.funding_target_price*100)} 명의 서포터</h4>
                          </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <div style="text-align: right;">
		                
		                <button type="button" id="zzimDelBtn" class="FVbtn2 notZzim" data-id="${loginPerson }" data-id2="${item.funding_idx }" onclick="location.href='deleteZzim.do?funding_idx=${item.funding_idx}'">
		                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-heart"
		                        viewBox="0 0 16 16">
		                        <path
		                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		                    </svg>
		                    	찜 취소하기
		                </button> 
                            
                            </div>
                            
                          </th>
                      </tr>
                      </tbody>
                    </table>
                  </div>         
                </div>
                <br>
                <hr>
                </c:forEach>
                </c:if>
                
        </div>
    </div>
    
        
      </div>
</main>

<c:import url="/footer.do"></c:import>
    
</body>
</html>