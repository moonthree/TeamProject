<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../resources/css/funding_css/funding_view.css">
    
<title>펀딩 상세 내역</title>
<style>
    main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    } 
    .bg-text {
        color: white;
        font-weight: bold;
        position: absolute;
        top: 13%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 2;
        width: 80%;
        padding: 30px;
        text-align: center;
    }
</style>
</head>
<body>
<main id="wrapper">
<c:import url="/header.do"></c:import>
   <!-- 썸네일 -->
    <div class="card bg-dark text-white topcard">
        <img src="../resources/image/funding_main/${ detail.funding_thumbnail }" class="card-img FVtitleImg" alt="...">
        <div class="card-img-overlay">
            <br>
            <h5 class="card-category">
            	<c:choose>
            		<c:when test="${ detail.funding_category eq 0 }">강아지 용품</c:when>
            		<c:when test="${ detail.funding_category eq 1 }">고양이 용품</c:when>
            		<c:when test="${ detail.funding_category eq 2 }">다른 동물 용품</c:when>
            	</c:choose>
            </h5>
            <br>
            <h3 class="card-title">${ detail.funding_title }</h3>
        </div>
    </div>
    <!-- -->    
    <div class="container" >
        
    <!--본문-->
        <div class="row">
            <!--펀딩 내역-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                	펀딩 내역
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>펀딩 번호</td>
                            <td>${ detail.funding_idx }</td>
                        </tr>
                        <tr>
                            <td>펀딩 예약 날짜</td>
                            <td>
                               
                                <fmt:formatDate type="time" value="${detail.funding_order_date}" pattern="yyyy-MM-dd" />
                               
                            </td>
                        </tr>
                        <tr>
                            <td>펀딩 종료일</td>
                            <td>
                                ${ detail.funding_end_date }
                            </td>
                        </tr>
                        <tr>
                            <td>펀딩 상태</td>
                            <td>
                                <c:choose>
                                	<c:when test="${ detail.funding_current_state eq 0 }">진행중</c:when>
                                	<c:when test="${ detail.funding_current_state eq 1 }">성공</c:when>
                                	<c:when test="${ detail.funding_current_state eq 2 }">실패</c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>펀딩 옵션</td>
                            <td>
                                ***
                            </td>
                        </tr>
                        <tr>
                            <td>펀딩 가격 / 수량</td>
                            <td>
                                ***
                            </td>
                        </tr>
                        <tr>
                            <td>발송 시작일</td>
                            <td>
                                ${ detail.funding_express_date }
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <!--결제 내역-->
            <div class="col-md-6 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                결제 내역
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>결제 금액</td>
                            <td>${ detail.funding_order_total_price - detail.funding_express_fee }</td>
                        </tr>
                        <tr>
                            <td>추가 후원금</td>
                            <td>
                                ***
                            </td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>
                                ${ detail.funding_express_fee }
                            </td>
                        </tr>
                        <tr>
                            <td>최종 결제 금액</td>
                            <td>
                                ${ detail.funding_order_total_price }
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!--결제 정보-->
            <div class="col-md-6 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                결제 정보
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>결제 방법</td>
                            <td>신용카드</td>
                        </tr>
                        <tr>
                            <td>카드번호</td>
                            <td>
                                ***
                            </td>
                        </tr>
                        <tr>
                            <td>할부 기간</td>
                            <td>
                                일시불
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

        <div class="row">
            <!--배송지 정보-->
            <div class="col-md-12 col-sm-12" style="margin-top: 10%;">
                <table class="table">
                    <thead class="table-light" style="border-bottom: 3px solid #06113C;">
                        <tr>
                            <th colspan="2">
                                배송지 정보
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- 로그인(MemberVO)에서 가져오는게 아니라 다른 배송 테이블을 만들어야함  -->
                        <tr>
                            <td>이름</td>
                            <td>${ login.member_name }</td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>
                                ${ login.member_phone }
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                (${login.member_postnum})${ login.member_addr }<br>
                                ${ login.member_addr2 }
                                
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!--버튼-->
        <div class="row"> 
            <div class="col-sm-12" style="text-align: right;"><button type="button" class="btn btn-outline-dark" style="width: 250px;">배송지 정보 변경하기</button></div>
        </div>
        <div class="row" style="margin-top:100px"> 
            <div class="col-sm-12"><button type="button" class="btn btn-outline-dark" style="width: 100%; height:70px" onclick="location.href='info_funding.do'">펀딩 목록 돌아가기</button></div>
        </div>
    </div>
    
</main>
<c:import url="/footer.do"></c:import>
</body>