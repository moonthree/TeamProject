<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<style>
  .mydiv{
    height: 600px;
    overflow: auto;
    overflow-x: hidden
  }

  card {
    height: 15rem;
    object-fit: cover;
  }

</style>

<title>마이페이지</title>
</head>
<body>
    <div class="container">
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
                  <button type="button" class="btn" style="background-color: rgba(186, 202, 221, 0.051);">공지사항</button>
                  <button type="button" class="btn" style="background-color: rgba(186, 202, 221, 0.051);">고객센터</button>
            </div>

            <!--펀딩&스토어&찜-->
            <div class="col-md-9 col-sm-12" style=" margin-top: 10%;">
              
              <div class="row" style="text-align: right;">
                <div class="col">
                  <button type="button" class="btn btn-outline-secondary">소비자</button>
                  <button type="button" class="btn btn-primary">메이커</button>
                </div>
              </div>
              <!--펀딩&스토어 전환버튼-->
              <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#my_funding">펀딩</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#my_store">스토어</a>
                </li>
              </ul>

              <!--내비게이션 탭 내용-->
              <div class="tab-content">
                <div class="tab-pane fade show active" id="my_funding">
                  <!--펀딩 스크롤-->
                  <div class="mydiv" id="mydiv">

                    <div class="card mb-3" style="max-width: 100%;">
                      <div class="row g-0">
                        <div class="col-md-5">
                          <div class="embed-responsive embed-responsive-16by9">
                            <img src="dog.jpg" class="card-img-top embed-responsive-item" alt="tree">
                          </div>
                        </div>
                        <div class="col-md-7">
                          <div class="card-body">
                            <h5 class="card-title">제목 : 제목제목</h5>
                            <p class="card-text">
                              펀딩 금액 : 1,100,000
                              <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                aria-valuemin="0" aria-valuemax="100" style="width:40%">
                                  40%
                                </div>
                              </div>
                            </p>
                            <p class="card-text"><small class="text-muted">펀딩률 : 40%</small></p>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="card mb-3" style="max-width: 100%;">
                      <div class="row g-0">
                        <div class="col-md-5">
                          <div class="embed-responsive embed-responsive-16by9">
                            <img src="dog.jpg" class="card-img-top embed-responsive-item" alt="tree">
                          </div>
                        </div>
                        <div class="col-md-7">
                          <div class="card-body">
                            <h5 class="card-title">제목 : 제목제목</h5>
                            <p class="card-text">
                              펀딩 금액 : 1,100,000
                              <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                aria-valuemin="0" aria-valuemax="100" style="width:40%">
                                  40%
                                </div>
                              </div>
                            </p>
                            <p class="card-text"><small class="text-muted">펀딩률 : 40%</small></p>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="card mb-3" style="max-width: 100%;">
                      <div class="row g-0">
                        <div class="col-md-5">
                          <div class="embed-responsive embed-responsive-16by9">
                            <img src="dog.jpg" class="card-img-top embed-responsive-item" alt="tree">
                          </div>
                        </div>
                        <div class="col-md-7">
                          <div class="card-body">
                            <h5 class="card-title">제목 : 제목제목</h5>
                            <p class="card-text">
                              펀딩 금액 : 1,100,000
                              <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                aria-valuemin="0" aria-valuemax="100" style="width:40%">
                                  40%
                                </div>
                              </div>
                            </p>
                            <p class="card-text"><small class="text-muted">펀딩률 : 40%</small></p>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                  <div class="row" style="text-align: center;">
                    <div class="col">
                      <button type="button" class="btn btn-primary">새 펀딩 오픈 등록하기</button>
                    </div>
                  </div>
                </div>
                
                <!--스토어 내용-->
                <div class="tab-pane fade" id="my_store">
                  <!--스토어 스크롤-->
                  <div class="mydiv" id="mydiv">

                    <div class="card mb-3" style="max-width: 100%;">
                      <div class="row g-0">
                        <div class="col-md-5">
                          <div class="embed-responsive embed-responsive-16by9">
                            <img src="dog2.png" class="card-img-top embed-responsive-item" alt="tree">
                          </div>
                        </div>
                        <div class="col-md-7">
                          <div class="card-body">
                            <h5 class="card-title">제목 : 제목제목</h5>
                            <p class="card-text">
                              내용내용내용
                            </p>
                            <div class="row" style="text-align: right;">
                              <div class="col">
                                <button type="button" class="btn btn-secondary btn-sm">수정</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="card mb-3" style="max-width: 100%;">
                      <div class="row g-0">
                        <div class="col-md-5">
                          <div class="embed-responsive embed-responsive-16by9">
                            <img src="dog2.png" class="card-img-top embed-responsive-item" alt="tree">
                          </div>
                        </div>
                        <div class="col-md-7">
                          <div class="card-body">
                            <h5 class="card-title">제목 : 제목제목</h5>
                            <p class="card-text">
                              내용내용내용
                            </p>
                            <div class="row" style="text-align: right;">
                              <div class="col">
                                <button type="button" class="btn btn-secondary btn-sm">수정</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                   <div class="card mb-3" style="max-width: 100%;">
                      <div class="row g-0">
                        <div class="col-md-5">
                          <div class="embed-responsive embed-responsive-16by9">
                            <img src="dog2.png" class="card-img-top embed-responsive-item" alt="tree">
                          </div>
                        </div>
                        <div class="col-md-7">
                          <div class="card-body">
                            <h5 class="card-title">제목 : 제목제목</h5>
                            <p class="card-text">
                              내용내용내용
                            </p>
                            <div class="row" style="text-align: right;">
                              <div class="col">
                                <button type="button" class="btn btn-secondary btn-sm">수정</button>
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
    </div>
</body>