<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- 부트스트랩 드랍다운 작동하게 해주는 자바스크립트 -->
    <script type="text/javascript">
       $(document).ready(function() {
           $(".dropdown-toggle").dropdown();
       });
    </script>


 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mypage_css/mypage2.css">


<title>마이페이지</title>
</head>
<body>
<c:import url="/header.do"></c:import>
<main id="wrapper">
 <div class="container">
        <div class="row" style="margin-top: 10%;">
          <div class="col-md-3 col-sm-12" >
            <div style="box-shadow: 0px 0px 20px 5px rgba(0,0,0,0.05); border-radius: 10px;">
              <div class="row"> 
                  <div class="col-sm-12">
                    <button type="button" class="btn"><h5>***님 ></h5></button>
                    &nbsp;&nbsp;abcd@naver.com
                  </div>
              </div>
            
            <table class="table">
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

            </div>
            
            <!--소비자 & 메이커 전환-->
            <div class="row mt-3">
              <div class="col">
                <button type="button" class="button-13">서포터 페이지</button>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <button type="button" class="button-13">메이커 페이지</button>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <button type="button" class="button-59" onclick="location.href='funding_register.do'"><span style="display : block;">새 펀딩 오픈</span></button>
              </div>
            </div>
          </div>
            <div class="col-md-9 col-sm-12 scroll_item">
              

              <!--펀딩&스토어 전환버튼-->
              <ul class="nav nav-tabs nav-justified" style="padding:10px 0px;">
                <li class="nav-item" >
                  <a class="nav-link active" data-toggle="tab" href="#my_funding" style="font-weight: 600; padding:10px">내 펀딩</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#my_store" style="font-weight: 600; padding:10px">내 스토어</a>
                </li>
              </ul>

              <!--내비게이션 탭 내용-->
              <div class="tab-content" >
                <div class="tab-pane fade show active" id="my_funding">
                  <!--펀딩 스크롤-->
                  <div class="mydiv" id="mydiv">

                    <div class="card mb-3">
                      <div class="row item">
                        <div class="col-lg-5 col-md-6">
                          <div class="img-container">
                              <img src="../resources/image/cat5.png" class="card-img-top " alt="funding_img">
                          </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">고양이 용품</div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                            <p class="card-text" >
                              <div class="row">
                                <div class="col">악취와 세균을 흡착 하는 미래자원 일라이트 함유 25번 먼지 공정 먼지제거 99.9%</div>
                              </div>                             
                              <div class="row" style="position: absolute; bottom: 10px; right:50px">
                                <div class="col" style="color:red; font-weight: 600;">40% 달성</div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>

                    <div class="card mb-3">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <div class="img-container">
                              <img src="../resources/image/cat5.png" class="card-img-top " alt="funding_img">
                          </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">고양이 용품</div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                            <p class="card-text">
                              <div class="row">
                                <div class="col" >악취와 세균을 흡착 하는 미래자원 일라이트 함유 25번 먼지 공정 먼지제거 99.9%</div>
                              </div>                             
                              <div class="row" style="position: absolute; bottom: 10px; right:50px">
                                <div class="col" style="color:red; font-weight: 600;">40% 달성</div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>

                    <div class="card mb-3">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <div class="img-container">
                              <img src="../resources/image/cat5.png" class="card-img-top " alt="funding_img">
                          </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">고양이 용품</div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                            <p class="card-text" >
                              <div class="row">
                                <div class="col" >악취와 세균을 흡착 하는 미래자원 일라이트 함유 25번 먼지 공정 먼지제거 99.9%</div>
                              </div>                             
                              <div class="row" style="position: absolute; bottom: 10px; right:50px">
                                <div class="col" style="color:red; font-weight: 600;">40% 달성</div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>
                    
                  </div>
                </div>
                
                <!--스토어 내용-->
                <div class="tab-pane fade" id="my_store">
                  <!--스토어 스크롤-->
                  <div class="mydiv" id="mydiv">

                    <div class="card mb-3">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <div class="img-container">
                              <img src="../resources/image/cat5.png" class="card-img-top " alt="funding_img">
                          </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">고양이 용품</div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                            <p class="card-text" >
                              <div class="row">
                                <div class="col" >악취와 세균을 흡착 하는 미래자원 일라이트 함유 25번 먼지 공정 먼지제거 99.9%</div>
                              </div>                             
                              <div class="row" style="position: absolute; bottom: 5px; right:50px">
                                <div class="col">
                                  <button type="button" class="button-6">수정</button>
                                </div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>
                    
                    <div class="card mb-3">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <div class="img-container">
                              <img src="../resources/image/cat5.png" class="card-img-top " alt="funding_img">
                          </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">고양이 용품</div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                            <p class="card-text" >
                              <div class="row">
                                <div class="col" >악취와 세균을 흡착 하는 미래자원 일라이트 함유 25번 먼지 공정 먼지제거 99.9%</div>
                              </div>                             
                              <div class="row" style="position: absolute; bottom: 5px; right:50px">
                                <div class="col">
                                  <button type="button" class="button-6">수정</button>
                                </div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>

                    <div class="card mb-3">
                      <div class="row g-0">
                        <div class="col-lg-5 col-md-6">
                          <div class="img-container">
                              <img src="../resources/image/cat5.png" class="card-img-top" alt="funding_img">
                          </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                          <div class="card-body" style="margin-left: -20px;">
                            <div style="font-weight:100">고양이 용품</div>
                            <h5 class="card-title"style="font-weight: 600; margin-bottom: 10px;">먼지없는 에이스</h5>
                            <p class="card-text" >
                              <div class="row">
                                <div class="col" >악취와 세균을 흡착 하는 미래자원 일라이트 함유 25번 먼지 공정 먼지제거 99.9%</div>
                              </div>                             
                              <div class="row" style="position: absolute; bottom: 5px; right:50px">
                                <div class="col">
                                  <button type="button" class="button-6">수정</button>
                                </div>
                              </div>
                            </p>
                          </div>
                        </div> 
                      </div>
                    </div>
            </div>
            </div>
            </div>
            </div>
        </div>
    </div>
</main>
<c:import url="/footer.do"></c:import>
</body>
</html>