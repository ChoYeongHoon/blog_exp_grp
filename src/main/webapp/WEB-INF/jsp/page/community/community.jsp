<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Community View -->
<div id="communityView" class="view hidden flex flex-col h-full overflow-hidden">

	<!-- 검색 및 카테고리 -->
	<div class="bg-white px-4 py-3 border-b flex items-center space-x-2">
		<select id="searchField" class="border px-2 py-1 rounded text-sm">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input id="searchInput" type="text" placeholder="검색어를 입력하세요" class="flex-1 border rounded px-3 py-2 text-sm"/>
		<button id="btn-search" class="px-3 py-2 bg-green-500 text-white rounded text-sm">검색</button>
	</div>
	<div class="flex flex-1 overflow-hidden">
		<aside id="sidebar" class="w-1/2 bg-white border-r overflow-y-auto">
			<nav class="py-4"><ul class="space-y-1">
				<li><button class="menu-btn w-full text-left px-4 py-2 bg-green-100" data-cat="전체글">전체글</button></li>
				<li><button class="menu-btn w-full text-left px-4 py-2" data-cat="후기 모음">후기 모음</button></li>
				<li><button class="menu-btn w-full text-left px-4 py-2" data-cat="서로이웃 구함">서로이웃 구함</button></li>
				<li><button class="menu-btn w-full text-left px-4 py-2" data-cat="맞팔·구독 교환">맞팔·구독 교환</button></li>
				<li><button class="menu-btn w-full text-left px-4 py-2" data-cat="꿀팁·Q&A">꿀팁·Q&A</button></li>
				<li><button class="menu-btn w-full text-left px-4 py-2" data-cat="사장님 코너">사장님 코너</button></li>
			</ul></nav>
		</aside>
		<main id="content" class="w-1/2 bg-gray-50 overflow-y-auto p-4 transition-all duration-300">
			<ul id="postList" class="space-y-3"></ul>
		</main>
	</div>
	
</div>
<!-- Community View -->

<!-- Write View -->
<div id="writeView" class="view hidden flex flex-col p-4 bg-gray-50 overflow-auto">
	<div class="flex justify-center mt-4">
		<button id="btnPostSubmit" class="px-4 py-2 bg-green-500 text-white rounded">등록하기</button>
	</div>
	<label>카테고리</label>
	<select id="postCat" class="w-full border rounded px-3 py-2 mb-4 text-sm">
		<option>전체글</option>
		<option>후기 모음</option>
		<option>서로이웃 구함</option>
		<option>맞팔·구독 교환</option>
		<option>꿀팁·Q&A</option>
		<option>사장님 코너</option>
	</select>
	<label>제목</label>
	<input id="postTitle" class="w-full border rounded px-3 py-2 mb-4 text-sm"/>
	<label>내용</label>
	<textarea id="postContent" rows="6" class="w-full border rounded px-3 py-2 text-sm"></textarea>
</div>
<!-- Write View -->

<!-- Detail View -->
<div id="detailView" class="view hidden flex flex-col p-4 bg-gray-50 overflow-auto">
	<h2 id="detailTitle" class="text-xl font-semibold mb-2"></h2>
	<div id="detailMeta" class="text-xs text-gray-500 mb-4"></div>
	<div id="detailContent" class="flex-1 overflow-auto text-sm whitespace-pre-wrap"></div>
</div>
<!-- Detail View -->