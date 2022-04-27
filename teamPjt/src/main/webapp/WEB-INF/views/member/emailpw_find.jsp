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
<style>
	main {
        height: auto;
        min-height: 100%;
        padding-bottom: 300px;
    }
    th{
        width: 90px;
    }
    td, input{
        width: 80%;
    }
</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="/header.do"></c:import>
	<main>
    <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
        <div class="row" style="width: 100%;">
            <div class="col-xs-12">
                <div><h5 style="margin-bottom: 30px; font-weight: 600; text-align: center;">이메일 / 비밀번호 찾기</h5></div>
            </div>
        </div>
        <div class="row" style="border: 1px solid lightgray; border-radius: 5px; padding: 20px;">
            <div class="col-md-6">
                <div style="font-weight: 600; color: #22577E; padding-bottom: 5px; margin-bottom: 15px; border-bottom: 2px solid #22577E;">이메일 찾기</div>
                <table style="margin: 20px; border-collapse: separate; border-spacing: 0 10px;">
                    <tr>
                        <th>이름</th>
                        <td><input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름을 입력해주세요" ></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                            <div class="form-inline">
                            <select class="custom-select" style="width: 30%;">
                                <option selected>010</option>
                                <option value="1">011</option>
                                <option value="2">017</option>
                            </select>
                            &nbsp;-&nbsp;<input type="number" class="form-control" id="exampleFormControlInput1" style="width: 30%;">
                            &nbsp;-&nbsp;<input type="number" class="form-control" id="exampleFormControlInput1" style="width: 30%;">  
                            </div>
                        </td>
                    </tr>
                </table>
                <div style="text-align: center; margin-bottom: 15px;">
                    <button type="button" class="btn btn-primary" style="background-color: #5584AC; border: none;">이메일 찾기</button>
                </div>
            </div>
            <div class="col-md-6">
                <div style="font-weight: 600; color: #22577E; padding-bottom: 5px; margin-bottom: 15px; border-bottom: 2px solid #22577E;">비밀번호 찾기</div>
                <table style="margin: 20px; border-collapse: separate; border-spacing: 0 10px;">
                    <tr>
                        <th>이메일</th>
                        <td><input type="email" class="form-control" id="exampleFormControlInput1" placeholder="이메일을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" class="form-control" id="exampleFormControlInput1" placeholder="이름을 입력해주세요" ></td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>
                            <div class="form-inline">
                            <select class="custom-select" style="width: 30%;">
                                <option selected>010</option>
                                <option value="1">011</option>
                                <option value="2">017</option>
                            </select>
                            &nbsp;-&nbsp;<input type="number" class="form-control" id="exampleFormControlInput1" style="width: 30%;">
                            &nbsp;-&nbsp;<input type="number" class="form-control" id="exampleFormControlInput1" style="width: 30%;">  
                            </div>
                        </td>
                    </tr>
                </table>
                <div style="text-align: center; margin-bottom: 15px;">
                    <button type="button" class="btn btn-primary" style="background-color: #5584AC; border: none;">비밀번호 찾기</button>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 50px;">
            <div class="col-xs-12" style="width: 100%;">
                <div style="font-weight: 600; margin-bottom: 10px;">이메일 / 비밀번호 조회결과</div>
                <div style="border: 1px solid lightgray; border-radius: 5px; padding: 20px; line-height: 3;">
                    &#183; 고객님께서 검색하신 이메일에 대한 결과값이 여기에 보여집니다.<br>
                    &#183; 검색하신 비밀번호는 회원가입 시 등록된 이메일 주소로 발송됩니다.<br>
                    &#183; 비밀번호 찾기는 이메일, 이름, 전화번호를 모두 입력하셔야 조회가 가능합니다.
                </div>
            </div>
        </div>
    </div>
    </main>
    <c:import url="/footer.do"></c:import>
</body>
</html>