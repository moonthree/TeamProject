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

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/funding_css/funding_main.css">
</head>
<body>
<c:import url="/header.do"></c:import>

    <main>
        <div class="container" style="margin-top: 6%; margin-bottom: 6%;">
            <!-- 검색 제목 -->
            <div class="search-box">
                <div class="search-title">
                    <span class="search_keyword">고양이</span>
                    검색결과
                </div>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      프로젝트
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">전체</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">펀딩</a>
                        <a class="dropdown-item" href="#">스토어</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      카테고리
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">전체</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">강아지</a>
                        <a class="dropdown-item" href="#">고양이</a>
                        <a class="dropdown-item" href="#">다른 동물들</a>
                    </div>
                </div>
            </div>
            <!-- 검색 결과 -->
            <div class="search_result">
                <!-- 펀딩 -->
                <div class="search_result_num">
                    <div>펀딩
                        <span>20</span>개
                    </div>
                </div>
                <div class="row fundingRow">
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="view.do">
                            <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#" class="aimg">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                            </a>
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row fundingRow">
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="text-align: center; padding-top: 20px;">
                    <button class="seemore">
                        더보기
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
                            <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
                          </svg>
                    </button>
                </div>
                <!-- 스토어 -->
                <div class="search_result_num">
                    <div>스토어
                        <span>20</span>개
                    </div>
                </div>
                <div class="row fundingRow">
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="view.do">
                            <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#" class="aimg">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                            </a>
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row fundingRow">
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                            <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="card">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</h5>
                            </a>
                                <p class="card-text">강아지 | (주)강아지용품회사</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="card-text cardtext2">
                                    <span class="fundingProgress">50%</span>
                                    <span>17,609,700원</span>
                                    <span class="remainDay">100일 남음</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="text-align: center; padding-top: 20px;">
                    <button class="seemore">
                        	더보기
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
                            <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"/>
                          </svg>
                    </button>
                </div>
            </div>
        </div>
    </main>
<c:import url="/footer.do"></c:import>
</body>
</html>