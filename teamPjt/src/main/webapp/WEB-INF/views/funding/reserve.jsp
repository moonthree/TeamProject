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
    .step_circle{
        display: table-cell;
        vertical-align: middle;
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
    .card {
        border-radius: 2px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    }
    .table td, .table th {
        padding: 20px;
        vertical-align: middle;
    }
    
    table td{
        text-align: right;
    }

    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    
</style>
<script>
    function handleOnInput(el, maxlength) {
        if(el.value.length > maxlength)  {
            el.value 
            = el.value.substr(0, maxlength);
        }
    }

</script>
<title>Insert title here</title>
</head>
<body>
	<c:import url="/header.do"></c:import>
    <main>
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
                <table style="margin: 0px auto; width: 100%; border-top: 1px solid black; border-bottom: 1px solid black; line-height: 2; vertical-align: middle;" class="table">
                    <tr>
                        <th width="70%" style="border-top: 1px solid black;">
                            <div style="min-height: 50px;">
                                <div style="color: #4E944F;">
                                    5050WORKSHOP 반려동물 캠핑의자 M 사이즈 싱글 세트 (블랙 컬러)
                                </div>
                                <div style="color: gray; font-weight: lighter; font-size: 14px;">
                                    본체 프레임 + 의자 스킨 + 전용 가방
                                </div>
                            </div>
                        </th>
                        <td style="border-top: 1px solid black;">
                            <div>
                                수량: 1개
                            </div>
                        </td>
                        <td style="border-top: 1px solid black;">
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
        <div class="row" style="margin-top: 30px;">
            <!-- 구매자 정보 -->
            <div class="col-md-6" style="padding: 30px;">
                <table style="margin: 0px auto; width: 100%; line-height: 2; vertical-align: middle; background-color:#E9EFC0; border-radius: 3px; " class="table table-borderless card">
                    <thead">
                      <tr>
                        <th scope="col" colspan="2">
                            <div style="font-size: 20pt;">구매자 정보</div>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row" width="30%">이름</th>
                        <td>강아지</td>
                      </tr>
                      <tr>
                        <th scope="row">이메일</th>
                        <td>dog@google.com</td>
                      </tr>
                      <tr>
                        <th scope="row">연락처</th>
                        <td>01011112222</td>
                      </tr>
                      <tr>
                          <td colspan="2" style="padding-top: 0px">
                              <hr>
                            <div class="form-check" style="text-align: left;">
                                <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                <label class="form-check-label" for="defaultCheck1">
                                  <span style="font-weight: bold;">(필수)</span> 펀딩 진행에 대한 새소식 및 결제 관련 안내를 받습니다.
                                </label>
                              </div>
                          </td>
                      </tr>
                    </tbody>
                </table>
            </div>
            <!-- 배송지 정보 -->
            <div class="col-md-6" style="padding: 30px;">
                <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;">배송지 정보</div>
                <div class="form-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                        <label class="form-check-label" for="inlineRadio1">새로 입력</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                        <label class="form-check-label" for="inlineRadio2">기존 주소</label>
                    </div>
                </div>
                <hr>
                <div>
                    <form>
                        <div class="form-group row">
                          <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">이름</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">연락처</label>
                          <div class="col-sm-9">
                            <input type="number" class="form-control" id="">
                          </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label" style="font-weight: bold;">주소</label>
                            <div class="col-sm-4">
                              <input type="number" class="form-control" id="" placeholder="우편번호">
                            </div>
                            <div class="col-sm-5">
                                <button type="submit" class="btn btn-primary" style="background-color: #83BD75; border: none;">주소 찾기</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                              <input type="number" class="form-control" id="" placeholder="기본 주소">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 col-form-label"></label>
                            <div class="col-sm-9">
                              <input type="number" class="form-control" id="" placeholder="상세 주소">
                            </div>
                        </div>
                      </form>
                </div>
                <hr>
                <div>
                    <div style="font-weight: bold; margin-bottom: 10px;">배송 시 요청사항 (선택)</div>
                    <div>
                        <input type="text" class="form-control" id="">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- 결제 정보 -->
            <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px;" class="col-md-12">결제 정보</div>
            <div class="col-lg-8">
                <div class="form-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                        <label class="form-check-label" for="inlineRadio1">직접 입력</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                        <label class="form-check-label" for="inlineRadio2">네이버 페이</label>
                    </div>
                </div>
                <hr>
                <div>
                    <form>
                        <div class="form-group">
                            <label for="formGroupExampleInput" style="font-weight: bold;">신용(체크)카드번호</label>
                            <div class="row">
                                <div class="col">
                                    <input type="number" oninput='handleOnInput(this, 4)' class="form-control">
                                </div>
                                <div class="col">
                                    <input type="password" class="form-control" maxlength="4">
                                </div>
                                <div class="col">
                                    <input type="password" class="form-control" maxlength="4">
                                </div>
                                <div class="col">
                                    <input type="number" oninput='handleOnInput(this, 4)' class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="" style="font-weight: bold;">유효기간</label>
                                <input type="text" class="form-control validdate" id="" placeholder="MM/YY" maxlength="5">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="" style="font-weight: bold;">카드 비밀번호</label>
                                <input type="password" class="form-control" id="" placeholder="앞 2자리" maxlength="2">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" style="font-weight: bold; margin-bottom: 0px;">생년월일 (주민번호 앞 6자리)</label>
                            <small id="" class="form-text text-muted" style="margin-top: 0px; margin-bottom: 10px;">무기명 법인카드는 사업자등록번호 10자리를 입력하세요.</small>
                            <input type="text" class="form-control" id="" maxlength="10">
                        </div>   
                    </form>
                </div>
            </div>
            <div class="col-lg-4">
                <div style="font-weight: 600;">[ 결제 예약시 유의사항 ]</div>
                <div style="padding: 10px; line-height: 2;">
                    <ul style="padding-left: 10px; list-style: circle;">
                        <li>
                            결제실행일에 결제자 귀책사유(한도초과, 이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제수단이 유효한지 한번 확인하세요
                        </li>
                        <li>
                            1차 결제 실패 시 실패일로부터 3 영업일 동안 재 결제를 실행합니다.
                        </li>
                        <li>
                            결제 예약 이후, 결제 정보를 변경하려면 마이페이지 > 나의 펀딩의 결제 정보에서 결제 정보를 변경해주세요.
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        
        <!-- 동의 -->
        <div class="row">
            <div class="col-xs-12" style="width: 100%;">
                <div style="font-size: 20pt; font-weight: bold; padding: 20px 0px; margin: 20px 0 auto;" class="col-md-12">약관 동의</div>
            </div>
            <div class="col-xs-12" style="width: 100%;">
                <table style="border: 1px solid lightgray;" cellpadding="20px" width="100%">
                    <thead>
                      <tr>
                        <th scope="col" colspan="2">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">전체 동의하기</label>
                            </div>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td scope="row" style="text-align: left;">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck2">
                                <label class="custom-control-label" for="customCheck2">개인정보 제3자 제공 동의</label>
                            </div>
                        </td>
                        <td>
                            <a href="#" style="text-decoration: underline; color: gray;">보기</a>
                        </td>
                      </tr>
                      <tr>
                        <td scope="row" style="text-align: left;">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customCheck3">
                                <label class="custom-control-label" for="customCheck3">책임 규정에 대한 동의</label>
                            </div>
                        </td>
                        <td>
                            <a href="#" style="text-decoration: underline; color: gray;">보기</a>
                        </td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>
        <div style="text-align: center; margin-top: 60px;">
            <button type="button" class="btn btn-success" onclick="javascript:location.href='<%= request.getContextPath()%>/funding/reserve_complete.do'" style="height: 60px; width: 200px; font-size: 15pt; font-weight: bold;">결제 예약하기</button>
        </div>
    </div>
    </main>
</body>
</html>