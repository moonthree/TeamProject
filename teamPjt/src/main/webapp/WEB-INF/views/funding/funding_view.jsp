<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/funding_css/funding_view.css">
</head>
<body>
	<c:import url="/header.do"></c:import>
	
	<!-- 썸네일 -->
    <div class="card bg-dark text-white topcard">
        <img src="image/doghome.png" class="card-img FVtitleImg" alt="...">
        <div class="card-img-overlay">
            <br>
            <h5 class="card-category">강아지 용품</h5>
            <br>
            <h3 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h3>
        </div>
    </div>
    <!-- -->
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-12">
                <img src="image/doghome.png" class="mainIMG" alt="...">
            </div>
            <div class="col-md-4 col-sm-12 topContent">
                <h3>100일 남음</h3>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%" aria-valuenow="50"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <h3>50<span class="smalltext"> %달성</span></h3>
                <h3>17,609,700<span class="smalltext"> 원 펀딩</span></h3>
                <h3>500<span class="smalltext"> 명의 서포터</span></h3>
                <button type="button" class="btn btn-info FVbtn">펀딩하기</button>
                <button type="button" class="FVbtn2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart"
                        viewBox="0 0 16 16">
                        <path
                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                    </svg>
                    찜하기
                </button>
                <div class="fundingGoal">
                    목표금액 : 35,219,400원<br>
                    펀딩기간 : 2022.04.25~2022.07.25<br>
                    <span class="fundingGoalText">*100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</span>
                </div>
            </div>
        </div>



        <!-- 프로젝트/스토어/커뮤니티/Q&A탭 -->
        <ul class="nav nav-tabs ulviewTab" id="myTab" role="tablist">
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link active" data-toggle="tab" href="#FVproject" role="tab" aria-controls="FVproject"
                    aria-selected="true">프로젝트</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVnotice" role="tab" aria-controls="FVnotice"
                    aria-selected="false">공지</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVcommu" role="tab" aria-controls="FVcommu"
                    aria-selected="false">커뮤니티</a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#FVQnA" role="tab" aria-controls="FVQnA"
                    aria-selected="false">Q&A</a>
            </li>
        </ul>
        <!--프로젝트/스토어/커뮤니티/Q&A상세-->
        <div class="tab-content" id="myTabContent">
            <!--프로젝트-->
            <div class="tab-pane fade active show " id="FVproject" role="tabpanel" aria-labelledby="FVproject-tab">
                PDF 파일 올라올 예정
            </div>
            <!--공지-->
            <div class="tab-pane fade" id="FVnotice" role="tabpanel" aria-labelledby="FVnotice-tab">
                PDF 파일 올라올 예정
            </div>
            <!--커뮤니티-->
            <div class="tab-pane fade" id="FVcommu" role="tabpanel" aria-labelledby="FVcommu-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h4>응원 · 의견 · 체험리뷰</h4>
                        <span style="opacity: 0.7;">펀딩 종료전에 남긴 글입니다.</span>
                    </div>
                    <div class="col-md-3 col-sm-12" style="text-align: right;">
                        <button type="button" class="btn btn-outline-info btn-lg commubtn">글 남기기</button>
                    </div>
                </div>

                <table class="table commutable">
                    <tbody>
                        <tr>
                            <th scope="row">
                                <span class="commuName">이름</span>
                                &nbsp;
                                <span class="state">펀딩 참여자</span>
                                &nbsp;
                                <span class="minute">응원•10분전</span>
                                <br>
                                <br>
                                <span class="commuContent">
                                    댓글 내용
                                </span>    
                            <th>
                        </tr>
                        <tr>
                            <th scope="row">
                                <span class="commuName">이름</span>
                                &nbsp;
                                <span class="state">펀딩 참여자</span>
                                &nbsp;
                                <span class="minute">응원•10분전</span>
                                <br>
                                <br>
                                <span class="commuContent">
                                    댓글 내용
                                </span>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--Q&A-->
            <div class="tab-pane fade" id="FVQnA" role="tabpanel" aria-labelledby="FVQnA-tab">
                <div class="row">
                    <div class="col-md-9 col-sm-12">
                        <h3 style="padding-top: 10px;">Q&A</h3>
                    </div>
                    <div class="col-md-3 col-sm-12" style="text-align: right;">
                        <button type="button" class="btn btn-outline-info btn-lg commubtn">상품 Q&A 작성하기</button>
                    </div>
                </div>

                <table class="table QnAtable">
                    <thead>
                        <tr>
                            <th scope="col">답변상태</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 15%;">답변대기</td>
                            <td style="width: 55%;">비밀글입니다.
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock"
                                    viewBox="0 0 16 16">
                                    <path
                                        d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z" />
                                </svg>
                            </td>
                            <td style="width: 15%;">abcd*******</td>
                            <td style="width: 15%;">2022.04.25</td>
                        </tr>
                        <tr>
                            <td style="width: 15%;">답변완료</td>
                            <td style="width: 55%;">배송 언제 시작하나요?</td>
                            <td style="width: 15%;">ewrwe****</td>
                            <td style="width: 15%;">2022.04.24</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    

    <div style="height: 300px; background-color: antiquewhite; margin-top: 50px;">
        footer자리
    </div>
</body>
</html>