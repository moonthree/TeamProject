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
    .step_circle{
        display: table-cell;
        vertical-align: middle;
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
    table td{
        text-align: right;
    }
</style>
<title>Insert title here</title>
</head>
<body>
<c:import url="/header.do"></c:import>
    <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
                <div><h3 style="text-align: center; font-weight: bold;">어머니 아버지, 이제 이 바닥을 떠나고 싶어요. 반려동물 캠핑의자</h3></div>
                <div class="wrap" style="margin: 30px 0px 10px auto;">
                    <div class="step" style="text-align: center; width: 280px; margin: 0 auto; font-weight: 600;">
                        <div class="step_circle" style="background: #fff; border: 1px dashed #979797;">옵션 선택</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle" style="color: #fff; border: none; background: #4E944F;">결제 예약</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 옵션 정보 -->
        <div class="row" style="margin-top: 30px;">
            <div class="col-xs-12" style="width: 100%;">
                <table style="margin: 0px auto; width: 80%; border-top: 1px solid black; border-bottom: 1px solid black; line-height: 2; vertical-align: middle;" class="table">
                    <tr>
                        <th width="70%">
                            <div style="min-height: 50px;">
                                <div style="color: #4E944F;">
                                    5050WORKSHOP 반려동물 캠핑의자 M 사이즈 싱글 세트 (블랙 컬러)
                                </div>
                                <div style="color: gray; font-weight: lighter; font-size: 14px;">
                                    본체 프레임 + 의자 스킨 + 전용 가방
                                </div>
                            </div>
                        </th>
                        <td>
                            <div>
                                수량: 1개
                            </div>
                        </td>
                        <td>
                            60,000원
                        </td>
                    </tr>
                    <tr height="50px">
                        <th style="border-top: 1px dashed gray;">
                            <div>
                                추가 후원금</th>
                            </div>
                        <td style="border-top: 1px dashed gray;" colspan="2">3000원</td>
                    </tr>
                    <tr height="50px">
                        <th style="border-top: 1px dashed gray;">배송비</th>
                        <td style="border-top: 1px dashed gray;" colspan="2">0원</td>
                    </tr>
                    <tr class="thead-light">
                        <th scope="col" style="border-top: 1px solid gray;">최종 결제가</th>
                        <th scope="col" style="border-top: 1px solid gray; text-align: right;" colspan="2">63,000원</th>
                    </tr>
                    <div>

                    </div>
                </table>
            </div>
        </div>
        <!-- 구매자 정보 -->
        <!-- 배송지 정보 -->
        <!-- 결제 정보 -->
        <!-- 동의 -->
    </div>
</body>
</html>