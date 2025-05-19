<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- Header --%>
<!-- HEADER -->
<header class="bg-white shadow flex items-center justify-between px-4 py-2">
	<button id="btn-back" class="w-6 opacity-0">
		<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
			<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
		</svg>
	</button>
	<h1 id="headerTitle" class="flex-1 text-center text-lg font-semibold">홈</h1>
	<button id="btn-write" class="px-3 py-1 bg-green-500 text-white rounded text-sm opacity-0">글작성</button>
</header></nav>