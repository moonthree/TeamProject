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
        $(document).ready(function () {
            $(".dropdown-toggle").dropdown();
        });
    </script>
    
    <link rel="stylesheet" type="text/css" href="../resources/css/mypage_css/management_product.css">
</head>
<body>
	<c:import url="/header.do"></c:import>
	<div class="container" >
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <h2 class="apptitle">상품 관리 페이지</h2>
            </div>
            <div class="col-md-6 col-sm-12">
                <form class="form-inline my-2 my-lg-0 PMsearch">
                    <input class="form-control mr-sm-2"  type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
        <ul class="nav nav-tabs ulviewTab" id="myTab" role="tablist">
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link active" data-toggle="tab" href="#fundingApproval" role="tab"
                    aria-controls="fundingApproval" aria-selected="true"><span class="atab">펀딩승인</span></a>
            </li>
            <li class="nav-item nav-pills viewtab" role="presentation">
                <a class="nav-link" data-toggle="tab" href="#storeApproval" role="tab" aria-controls="storeApproval"
                    aria-selected="false"><span class="toptab">스토어</span></a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <!--펀딩-->
            <div class="tab-pane fade active show " id="fundingApproval" role="tabpanel"
                aria-labelledby="fundingApproval-tab">
                <table class="table">
                    <thead class="thead">
                        <tr>
                            <th scope="col" class="PMtable">번호</th>
                            <th class="tdtitle scope=" col" style="width : 60%">제목</th>
                            <th scope="col">
                                <div class="dropdown stateDropdown">
                                    <a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
                                        aria-expanded="false">
                                        상태
                                    </a>                   
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">전체</a>
                                        <a class="dropdown-item" href="#">펀딩 진행중</a>
                                        <a class="dropdown-item" href="#">펀딩 종료</a>
                                    </div>
                                </div>
                            </th>
                            <th scope="col">버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td class="tdtitle">Mark</td>
                            <td>펀딩 진행중</td>
                            <td>
                                <button type="button" class="btn btn-outline-success">보류</button>
                                <button type="button" class="btn btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <th>1</th>
                            <td class="tdtitle">Mark</td>
                            <td>펀딩 종료</td>
                            <td>
                                <button type="button" class="btn btn-outline-success">보류</button>
                                <button type="button" class="btn btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--스토어-->
            <div class="tab-pane fade" id="storeApproval" role="tabpanel" aria-labelledby="storeApproval-tab">
                <table class="table">
                    <thead class="thead">
                        <tr>
                            <th scope="col">번호</th>
                            <th class="tdtitle" scope="col" style="width : 60%">제목</th>
                            <th scope="col">
                                <div class="dropdown">
                                    <a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                        data-toggle="dropdown" aria-expanded="false">
                                        상태
                                    </a>
                                
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">전체</a>
                                        <a class="dropdown-item" href="#">판매중</a>
                                        <a class="dropdown-item" href="#">판매 중지</a>
                                    </div>
                                </div>
                            </th>
                            <th scope="col">버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td class="tdtitle">Mark</td>
                            <td>판매중</td>
                            <td>
                                <button type="button" class="btn btn-outline-success">보류</button>
                                <button type="button" class="btn btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <th>1</th>
                            <td class="tdtitle">Mark</td>
                            <td>판매 중지</td>
                            <td>
                                <button type="button" class="btn btn-outline-success">보류</button>
                                <button type="button" class="btn btn-outline-danger">삭제</button>
                            </td>
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