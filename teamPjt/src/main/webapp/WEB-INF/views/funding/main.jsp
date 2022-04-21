<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/funding_css/funding_main.css">
</head>
<body>
	<c:import url="/header.do"></c:import>
	
	<div class="container">
        <div class="row" id="category">
            <div class="col-md-4 col-sm-12">
                <a href="#">
                    <img src="../resources/image/funding_main/dog123.png" alt="photo" class="rounded-circle" width="300" height="300" />
                    <br>
                    강아지abcd
                </a>
            </div>
            <div class="col-md-4 col-sm-12">
                <a href="#">
                    <img src="../resources/image/funding_main/cat123.png" alt="photo" class="rounded-circle" width="300" height="300" />
                    <br>
                    고양이
                </a>
            </div>
            <div class="col-md-4 col-sm-12">
                <a href="#">
                    <img src="../resources/image/funding_main//other123.png" alt="photo" class="rounded-circle" width="300" height="300" />
                    <br>
                    기타
                </a>
            </div>
        </div>

        <div class="row">
            <div class="col-sm" id="chosenCategory">
                강아지
            </div>
            <div class="col-sm" style="text-align: right">
                <div class="dropdown">
                    <button class="btn btn-outline-info btn-lg dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                        aria-expanded="false">
                        최신순
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="dropdown">
                        <a class="dropdown-item" href="#">최신순</a>
                        <a class="dropdown-item" href="#">인기순</a>
                        <a class="dropdown-item" href="#">펀딩액순</a>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <hr>
        </div>
      
           
    
        <div class="row fundingRow">
            <div class="col-md-4 col-sm-12">
                <div class="card">
                    <a href="#">
                    <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
                        <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
                        <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
                    <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
                        <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
                        <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
        <div class="row fundingRow">
            <div class="col-md-4 col-sm-12">
                <div class="card">
                    <a href="#">
                        <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
                        <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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
                        <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
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

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
      
    </div>
    
    <div style="height: 300px; background-color: bisque; text-align: center; font-size: 30px; margin-top: 30px;">
        footer 자리
    </div>
</body>
</html>