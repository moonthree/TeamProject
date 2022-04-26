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
                        <div class="step_circle" style="color: #fff; border: none; background: #4E944F;">옵션 선택</div>
                        <div style=" display: table-cell; vertical-align: middle; color: #979797">------------</div>
                        <div class="step_circle" style="background: #fff; border: 1px dashed #979797;">결제 예약</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- 옵션 선택 -->
            <div style="width: 90%; margin: 20px auto;">
                <h5 style="font-weight: 600;">옵션 선택</h5>
                <p>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</p>
                <div class="option_select">
                    <div class="custom-control custom-checkbox" style="border: 1px solid lightgray; border-radius: 5px; padding: 20px; padding-left: 60px; margin-bottom: 20px;">
                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                        <label class="custom-control-label" for="customCheck1">
                            <div class="price" style="font-weight: 600;">66,000원 펀딩합니다.</div>
                            <div class="detail" style="font-size: 14px; line-height: 2; color: gray;">
                                5050WORKSHOP 반려동물 캠핑의자 M 사이즈 싱글 세트 (블랙 컬러)<br>
                                본체 프레임 + 의자 스킨 + 전용 가방<br>
                                배송비 없음 | 리워드 제공 예상일 : 2022년 05월 초 (1~10일) 예정
                            </div><br>
                            <div>수량 &nbsp; <input type="number" min="0" class="" id="exampleFormControlInput1" value="1" style="border: 1px solid gray; border-radius: 5px; padding-left: 10px; width: 100px;"></div>
                        </label>
                    </div>
                    <div class="custom-control custom-checkbox" style="border: 1px solid lightgray; border-radius: 5px; padding: 20px; padding-left: 60px; margin-bottom: 20px;">
                        <input type="checkbox" class="custom-control-input" id="customCheck2">
                        <label class="custom-control-label" for="customCheck2">
                            <div class="price" style="font-weight: 600;">139,000원 펀딩합니다.</div>
                            <div class="detail" style="font-size: 14px; line-height: 2; color: gray;">
                                5050WORKSHOP 반려동물 캠핑의자 M, L 사이즈 트윈 세트 (29개 남음) <br>
                                작은 댕댕이와 큰 댕댕이가 있는 보호자님에게 추천.<br>
                                블랙, 그린 컬러 중 원하는 컬러와 각각의 사이즈를 골라서 총 2개 선택.<br>
                                본체 프레임*2 + 의자 스킨 *2 + 전용 가방*2<br>
                                배송비 없음 | 리워드 제공 예상일 : 2022년 05월 초 (1~10일) 예정<br>
                            </div><br>
                            <div>수량 &nbsp; <input type="number" min="0" class="" id="exampleFormControlInput1" value="1" style="border: 1px solid gray; border-radius: 5px; padding-left: 10px; width: 100px;"></div>
                        </label>
                    </div>
                </div>
            </div>
            <!-- 후원금 -->
            <div style="width: 90%; margin: 20px auto;">
                <h5 style="font-weight: 600; float: left; text-align: left; width: 200px; height: 100px;">후원금 (선택)</h5>
                <div>
                    후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?<br>
                    <input type="number" value="0" min="0">원을 추가로 후원합니다.
                </div>
            </div>
        </div>
        <!-- 선택 금액, 버튼 -->
        <div class="row">
            <div style="margin: 50px auto; text-align: center;">
                <div style="font-weight: bold; font-size: 20px;">
                    어머니 아버지, 이제 이 바닥을 떠나고 싶어요. 반려동물 캠핑의자에 <span style="color:#83BD75; text-decoration: underline;">100,000</span>원을 펀딩합니다.
                </div>
                <br>
                <div>
                    <button type="button" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/reserve.do'" class="btn btn-secondary" style="background-color: #83BD75; border: none; width: 150px; height: 50px; font-weight: bold;">다음 단계로 ></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>