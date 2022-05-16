<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫딩 스토어 메인페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
        
     
    <link rel="stylesheet" type="text/css" href="../resources/css/store_css/store_main.css">
</head>
<body>
	<c:import url="/header.do"></c:import>
	
	<<!-- div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../resources/image/home/dogbob.png" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="main_image_h3"></h3>
                    <p class="main_image_p"></p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../resources/image/home/cattower.png" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="main_image"></h3>
                    <p></p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../resources/image/home/dogbob2.png" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="main_image"></h3>
                    <p></p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
        </button>
    </div> -->
	
	<div class="container">
        <div class="row" id="category">
            <div class="col-sm-3 col-6">
                <a href="#">
                    <img src="../resources/image/img/paws.png" alt="photo" class="rounded-circle"/>
                    <br>
                    펀딩 성공 상품
                </a>
            </div>
            <div class="col-sm-3 col-6">
                <a href="#">
                    <img src="../resources/image/img/dog7.png" alt="photo" class="rounded-circle"/>
                    <br>
                    강아지
                </a>
            </div>
            <div class="col-sm-3 col-6">
                <a href="#">
                    <img src="../resources/image/img/cat.png" alt="photo" class="rounded-circle"/>
                    <br>
                    고양이
                </a>
            </div>
            <div class="col-sm-3 col-6">
                <a href="#">
                    <img src="../resources/image/img/other.png" alt="photo" class="rounded-circle"/>
                    <br>
                    반려 동물
                </a>
            </div>
        </div>

        <div class="row selectRow">
            <div class="col-sm" id="chosenCategory">
                펀딩 성공 상품
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
                        <a class="dropdown-item" href="#">별점순</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row storeRow">
            <div class="col-md-3 col-sm-12">
                <div class="card">
                    <div class="card-img">
                        <a href="store_view.do">
                            <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                        </a>
                        <button class="card-zzim-btn" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart"
                                viewBox="0 0 16 16">
                                <path
                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
                        </button>
                    </div>
                    <div class="card-body">
                        <a href="store_view.do">
                            <div class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</div>
                        </a>
                        <p class="card-price">56,000원</p>
                        <!--별점-->
                        <div>
                            <svg style="display:none;">
                                <defs>
                                    <symbol id="fivestars">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd" />
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                    </symbol>
                                </defs>
                            </svg>
                            <div class="rating">
                                <progress class="rating-bg" value="4.5" max="5"></progress>
                                <svg>
                                    <use xlink:href="#fivestars" />
                                </svg>
                            </div>
                            <div class="starNum">
                                <span class="starAverage">4.5</span> 
                                <span class="starTotal">|&nbsp;(423)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
                <div class="card">
                    <div class="card-img">
                        <a href="#">
                            <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                        </a>
                        <button class="card-zzim-btn" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart"
                                viewBox="0 0 16 16">
                                <path
                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
                        </button>
                    </div>
                    <div class="card-body">
                        <a href="#">
                            <div class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</div>
                        </a>
                        <p class="card-price">56,000원</p>
                        <!--별점-->
                        <div>
                            <svg style="display:none;">
                                <defs>
                                    <symbol id="fivestars">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd" />
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                    </symbol>
                                </defs>
                            </svg>
                            <div class="rating">
                                <progress class="rating-bg" value="4.5" max="5"></progress>
                                <svg>
                                    <use xlink:href="#fivestars" />
                                </svg>
                            </div>
                            <div class="starNum">
                                <span class="starAverage">4.5</span> 
                                <span class="starTotal">|&nbsp;(423)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
                <div class="card">
                    <div class="card-img">
                        <a href="#">
                            <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                        </a>
                        <button class="card-zzim-btn" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart"
                                viewBox="0 0 16 16">
                                <path
                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
                        </button>
                    </div>
                    <div class="card-body">
                        <a href="#">
                            <div class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</div>
                        </a>
                        <p class="card-price">56,000원</p>
                        <!--별점-->
                        <div>
                            <svg style="display:none;">
                                <defs>
                                    <symbol id="fivestars">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd" />
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                    </symbol>
                                </defs>
                            </svg>
                            <div class="rating">
                                <progress class="rating-bg" value="4.5" max="5"></progress>
                                <svg>
                                    <use xlink:href="#fivestars" />
                                </svg>
                            </div>
                            <div class="starNum">
                                <span class="starAverage">4.5</span> 
                                <span class="starTotal">|&nbsp;(423)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-12">
                <div class="card">
                    <div class="card-img">
                        <a href="#">
                            <img src="../resources/image/funding_main/doghome.png" class="card-img-top img2" alt="...">
                        </a>
                        <button class="card-zzim-btn" type="button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart"
                                viewBox="0 0 16 16">
                                <path
                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
                        </button>
                    </div>
                    <div class="card-body">
                        <a href="#">
                            <div class="card-title">밀리옹 베이글백 아이보리 브릭 강아지 고양이 이동가방</div>
                        </a>
                        <p class="card-price">56,000원</p>
                        <!--별점-->
                        <div>
                            <svg style="display:none;">
                                <defs>
                                    <symbol id="fivestars">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd" />
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
                                            viewBox="0 0 24 27">
                                            <path
                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
                                                fill="white" fill-rule="evenodd"/>
                                        </svg>
                                    </symbol>
                                </defs>
                            </svg>
                            <div class="rating">
                                <progress class="rating-bg" value="4.5" max="5"></progress>
                                <svg>
                                    <use xlink:href="#fivestars" />
                                </svg>
                            </div>
                            <div class="starNum">
                                <span class="starAverage">4.5</span> 
                                <span class="starTotal">|&nbsp;(423)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
   </div>
	<c:import url="/footer.do"></c:import>
</body>
</html>