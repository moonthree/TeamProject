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
  .embed-responsive {
    border-radius: 12px;
  }
  .card{
    border : none;
  }
  h2{
    color : burlywood;
    font-weight : bold;
  }
  .jb-wrap {
        padding: 20px 0px;
      }
</style>
<title>찜 목록</title>
</head>
<body>
<c:import url="/header.do"></c:import> 

    <div class="container" style="background-color: white;">
        <div class="row">
            <!--펀딩&스토어&찜-->
            <div class="col-md-12 col-sm-12" style=" margin-top: 10%;">
                <!--찜 목록-->
                <h2>찜 목록</h2>
                <br>
                <div class="row fundingRow">
                  <!--이미지-->
                  <div class="col-md-5 col-sm-12 jb-wrap">
                      <div class="card">
                          <a href="#">
                            <div class="embed-responsive embed-responsive-4by3">
                              <img src="cat4.jpg" class="card-img-top embed-responsive-item" alt="tree">
                            </div>
                            </a>
                      </div>
                  </div>
                  <!--내용-->
                  <div class="col-md-7 col-sm-12">
                    <table class="table">
                      <thead class="table-light" style="border-bottom: 2px solid gray;">
                        <tr>
                            <th colspan="2" style="text-align: center;">
                              <h4 style="font-weight: bold; text-align: left;"> [5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요? </h4>
                            </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td style="border-top:none;" colspan="2">
                              <div class="row">
                                <div class="col-md-6">21일 남음</div>
                                <div class="col-md-6" style="text-align: right;">40%</div>
                              </div>
                              <div class="progress" style="height: 10px;">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="border-top:none;" colspan="2">
                              <h4>4,514,000원 펀딩</h4>
                            </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <h4>110 명의 서포터</h4>
                          </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <div style="text-align: right;"><button type="button" class="btn btn-outline-danger">♥</button></div>
                          </th>
                      </tr>
                      </tbody>
                    </table>
                  </div>         
                </div>
                <br>
                <hr>
                
                <div class="row fundingRow">
                  <!--이미지-->
                  <div class="col-md-5 col-sm-12 jb-wrap">
                      <div class="card">
                          <a href="#">
                            <div class="embed-responsive embed-responsive-4by3">
                              <img src="cat4.jpg" class="card-img-top embed-responsive-item" alt="tree">
                            </div>
                            </a>
                      </div>
                  </div>
                  <!--내용-->
                  <div class="col-md-7 col-sm-12">
                    <table class="table">
                      <thead class="table-light" style="border-bottom: 2px solid gray;">
                        <tr>
                            <th colspan="2" style="text-align: center;">
                              <h4 style="font-weight: bold; text-align: left;"> [5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요? </h4>
                            </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td style="border-top:none;" colspan="2">
                              <div class="row">
                                <div class="col-md-6">21일 남음</div>
                                <div class="col-md-6" style="text-align: right;">40%</div>
                              </div>
                              <div class="progress" style="height: 10px;">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="border-top:none;" colspan="2">
                              <h4>4,514,000원 펀딩</h4>
                            </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <h4>110 명의 서포터</h4>
                          </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <div style="text-align: right;"><button type="button" class="btn btn-outline-danger">♥</button></div>
                          </th>
                      </tr>
                      </tbody>
                    </table>
                  </div>         
                </div>
                <br>
                <hr>

                <div class="row fundingRow">
                  <!--이미지-->
                  <div class="col-md-5 col-sm-12 jb-wrap">
                      <div class="card">
                          <a href="#">
                            <div class="embed-responsive embed-responsive-4by3">
                              <img src="cat4.jpg" class="card-img-top embed-responsive-item" alt="tree">
                            </div>
                            </a>
                      </div>
                  </div>
                  <!--내용-->
                  <div class="col-md-7 col-sm-12">
                    <table class="table">
                      <thead class="table-light" style="border-bottom: 2px solid gray;">
                        <tr>
                            <th colspan="2" style="text-align: center;">
                              <h4 style="font-weight: bold; text-align: left;"> [5점만점 앵콜] 먼지없는 에이스 고양이모래 아직도 안 써보셨어요? </h4>
                            </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                            <td style="border-top:none;" colspan="2">
                              <div class="row">
                                <div class="col-md-6">21일 남음</div>
                                <div class="col-md-6" style="text-align: right;">40%</div>
                              </div>
                              <div class="progress" style="height: 10px;">
                                <div class="progress-bar bg-info" role="progressbar" style="width: 40%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="border-top:none;" colspan="2">
                              <h4>4,514,000원 펀딩</h4>
                            </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <h4>110 명의 서포터</h4>
                          </th>
                        </tr>
                        <tr>
                          <th style="border-top:none;" colspan="2">
                            <div style="text-align: right;"><button type="button" class="btn btn-outline-danger">♥</button></div>
                          </th>
                      </tr>
                      </tbody>
                    </table>
                  </div>         
                </div>
                <br>
                <hr>


        </div>
    </div>
    
        
      </div>

    
</body>