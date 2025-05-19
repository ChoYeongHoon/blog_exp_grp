<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- Footer --%>
<!-- BOTTOM NAV -->
<nav class="fixed bottom-0 left-0 right-0 bg-black text-white flex justify-between px-6 py-2">
	<button data-view="homeView" class="tab-btn flex flex-col items-center text-xs text-green-400">
		<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M3 12l2-2m0 0l7-7 7 7M13 5v6h6"/></svg>
		home
	</button>
	<%-- <button data-view="communityView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
		<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M4 4h16v16H4z"/></svg>
		커뮤니티
	</button> --%>
	<button data-view="searchView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
		<svg class="h-6 w-6 mb-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16l4-4 4 4"/></svg>
		검색
	</button>
	<%-- <button data-view="likeView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
		<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M5 13l4 4L19 7"/></svg>
		like
	</button> --%>
	<%-- <button data-view="myView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
		<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M12 12a5 5 0 10-5-5"/></svg>
		my
	</button> --%>
</nav>