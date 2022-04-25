<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<title>마이페이지</title>
</head>
<body>
<%-- <%@include file ="../header.jsp" %> --%>
<c:import url="/header.do"></c:import>
	<div style="text-align:center;">
		<table style="border:1px solid black; text-align : center;">
			<thead>		
				<tr>
					<td style="width:20%"><a href="mypage2.do">마이페이지2</a></td>
					<td style="width:20%"><a href="funding_register.do">펀딩 등록 페이지</a></td>
					<td style="width:20%">abcd</td>
					<td style="width:20%">abcd</td>
					<td style="width:20%">abcd</td>
				</tr>
			</thead>
		</table>
	</div>
    <div class="container" >
        <div class="row">
            <!--회원정보-->
            <div class="col-md-3 col-sm-12" style="margin-top: 10%;">
                <div class="row"> 
                    <div class="col-sm-6"><h5>***님</h5></div>
                    <div class="col-sm-6" style="text-align: right;"><button type="button" class="btn btn-light" style="width: 100px;">정보 수정</button></div>
                </div>
            	
                <table class="table">
                    <thead class="table-light">
                      <tr>
                          <th colspan="2">
                              프로필
                          </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                          <td>이름</td>
                          <td>***</td>
                      </tr>
                      <tr>
                          <td>전화번호</td>
                          <td>***</td>
                      </tr>
                      <tr>
                          <td>이메일</td>
                          <td>***</td>
                      </tr>
                    </tbody>
                  </table>
                  <button type="button" class="btn" style="background-color: white;">공지사항</button>
                  <button type="button" class="btn" style="background-color: white;">고객센터</button>
            </div>

            <!--펀딩&스토어&찜-->
            <div class="col-md-8 col-sm-12" style=" margin-top: 10%;">
                <!--펀딩내역-->
                <div class="row"> 
                    <div class="col-md-8"><h5>펀딩 내역</h5></div>
                    <div class="col-md-4" style="text-align: right;"><button type="button" class="btn btn-light">내역 ></button></div>
                </div>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card" style="width: 14rem;">
                          <img src="cat.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">펀딩내역1</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 14rem;">
                          <img src="cat.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">펀딩내역2</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 14rem;">
                          <img src="cat.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">펀딩내역3</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    
                          
                </div>
                <br>
                <!--주문내역-->
                <div class="row "> 
                    <div class="col-sm-8"><h5>주문 내역</h5></div>
                    <div class="col-sm-4" style="text-align: right;"><button type="button" class="btn btn-light">내역 ></button></div>
                </div>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card" style="width: 14rem;">
                          <img src="cat2.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">주문내역1</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 14rem;"">
                          <img src="cat2.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">주문내역2</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 14rem;"">
                          <img src="cat2.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">주문내역3</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    
                          
                </div>
                <br>
                <!--찜내역-->
                <div class="row "> 
                    <div class="col-sm-8"><h5>주문 내역</h5></div>
                    <div class="col-sm-4" style="text-align: right;"><button type="button" class="btn btn-light">내역 ></button></div>
                </div>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card" style="width: 14rem;">
                          <img src="cat2.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">주문내역1</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 14rem;">
                          <img src="cat2.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">주문내역2</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card" style="width: 14rem;">
                          <img src="cat2.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">주문내역3</h5>
                            <p class="card-text">어쩌고 저쩌고</p>
                          </div>
                        </div>
                    </div>
                    
                          
                </div>
                <br>
            
        </div>
    </div>
    </div>
</body>