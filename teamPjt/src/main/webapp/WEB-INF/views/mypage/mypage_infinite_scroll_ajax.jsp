<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section id="card-list" class="card-list">
	<div class="zzim_cotainer">
			<c:forEach var="item" items="${searchList}">
				<!-- 펀딩 -->
				<c:if test="${ item.zzim_category eq 0 }">
		           <div class="zzim_inner">
		               <div class="zzim_card">
		                   <div class="zzim_image" style="background-image: url(../resources/upload/funding/${item.funding_thumbnail})">
		                       <div class="zzim_cate" style="background: #fa6462;">펀딩</div>
		                       <div class="zzim_cancel">
		           							<button type="button" id="zzimDelBtn" class="zzim_cancel_btn" onclick="alert('찜목록에서 삭제되었습니다'); location.href='deleteZzim.do?funding_idx=${item.funding_idx}'">
		                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
								  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
								</svg>
								</button>
		                       </div>
		                   </div>
		                   <div class="zzim_text" onclick="location.href='../funding/view.do?funding_idx=${item.funding_idx}'">
		                       <div class="zzim_title">${item.funding_title}</div>
		                       <div class="progress">
		                              <div class="progress-bar bg-info progress-bar-striped" role="progressbar" style="width: ${Math.round(item.funding_current_price/item.funding_target_price*100)}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
		                          </div>
							<div class="zzim_about">
								<div class="fund_per">
									${Math.round(item.funding_current_price/item.funding_target_price*100)}%
									<span style="margin: 0px 6px; color: gray;">|</span>
									<fmt:formatNumber value="${item.funding_current_price}" type="number"/>원 달성
								</div>
								<div class="fund_result">
									<c:if test="${item.funding_current_state eq 0}">
										진행 중
									</c:if>
									<c:if test="${item.funding_current_state eq 1}">
										성공
									</c:if>
									<c:if test="${item.funding_current_state eq 2}">
										종료
									</c:if>
								</div>
							</div>
		                   </div>
		               </div>
		           </div>
				</c:if>
				<!-- 스토어 -->
				<c:if test="${ item.zzim_category eq 1 }">
		           <div class="zzim_inner">
		               <div class="zzim_card">
		                   <div class="zzim_image" style="background-image: url(../resources/upload/store/${item.store_thumbnail})">
		                       <div class="zzim_cate" style="background: #edc64f;">스토어</div>
		                       <div class="zzim_cancel">
		           							<button type="button" id="zzimDelBtn" class="zzim_cancel_btn" onclick="alert('찜목록에서 삭제되었습니다'); location.href='deleteZzim.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}'">
		                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
								  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
								</svg>
								</button>
		                       </div>
		                   </div>
		                   <div class="zzim_text" onclick="location.href='../store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding }'">
		                       <div class="zzim_title">${item.store_title}</div>
							<div class="zzim_about2">
								<div class="zzim_price">
									<fmt:formatNumber value="${item.store_price}" type="number"/>원
								</div>
								<div>별점</div>
							</div>
		                   </div>
		               </div>
		           </div>
				</c:if>
			</c:forEach>

	</div>
</section>