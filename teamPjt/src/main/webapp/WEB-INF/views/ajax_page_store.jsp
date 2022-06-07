<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		        		<div class="row storeRow">
			        		<c:forEach var="item" items="${searchStoreList}" varStatus="status">
			        			<div class="col-md-3 col-sm-12">
					                <div class="card">
					                    <div class="card-img">
					                        <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
					                            <img src="resources/upload/store/${item.store_thumbnail}" class="card-img-top img2" alt="...">
					                        </a>
					                    </div>
					                    <div class="card-body store_title">
					                        <a href="store/store_view.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}">
					                            <div class="card-title">${item.store_title}</div>
					                        </a>
					                        <p class="card-price"><fmt:formatNumber value="${item.store_price }" type="number" />원</p>
					                        <input type="number" id="idx${status.index}" value="${item.store_idx}" style="display:none;">
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
					                                <progress id="rating-bg${status.index }" class="rating-bg" value="${item.avg_star }" max="5"></progress>
					                                <svg>
					                                    <use xlink:href="#fivestars" />
					                                </svg>
					                            </div>
					                            <div class="starNum">
					                                <c:if test="${item.avg_star > 0}">
					                            		<span class="starAverage">${item.avg_star }</span>
					                            	</c:if>
					                                <c:if test="${item.avg_star eq null}">
					                            		<span class="starAverage">0</span>
					                            	</c:if>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
			        		</c:forEach>
			        	</div>