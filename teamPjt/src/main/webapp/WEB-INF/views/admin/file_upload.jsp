<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${store_idx eq null}">
펀딩 사진 바꾸기
<form action="updateFunThum.do" method="post" enctype="multipart/form-data">
		file_uplaod : <input  name="file_upload" type="file" accept=".jpg, .png">
		<br>
	 <input type="hidden" name="funding_idx"  value="${funding_idx}"/>
		<input type="submit" value="확인">
	</form>

</c:if>
<c:if test="${funding_idx eq null}">
스토어 사진 바꾸기
	<form action="updateStoreThum.do" method="post" enctype="multipart/form-data">
		file_uplaod : <input  name="file_upload" type="file" accept=".jpg, .png">
		<br>
	 <input type="hidden" name="store_idx"  value="${store_idx}"/>
		<input type="submit" value="확인">
	</form>
	</c:if>
</body>
</html>