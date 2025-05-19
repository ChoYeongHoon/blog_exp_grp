<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Home</title>
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="${pageContext.request.contextPath}/js/common.js" defer></script> <%-- 공통 js --%>
	
	<%-- <script src="${pageContext.request.contextPath}/js/community.js" defer></script> community js
	<script src="${pageContext.request.contextPath}/js/like.js" defer></script> like js
	<script src="${pageContext.request.contextPath}/js/mypage.js" defer></script> mypage js --%>
</head>

<body class="bg-gray-50 flex flex-col h-screen">

<!-- Header -->
<%@ include file="/WEB-INF/jsp/page/common/header.jsp" %>


<!-- VIEWS CONTAINER -->
<div id="views" class="flex-1 overflow-hidden">
	<%@ include file="/WEB-INF/jsp/page/main.jsp" %>
</div>

<!-- Footer -->
<%@ include file="/WEB-INF/jsp/page/common/footer.jsp" %>

</body>
</html>