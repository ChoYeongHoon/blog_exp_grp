<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Home</title>
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="${pageContext.request.contextPath}/js/common.js" defer></script> <%-- 공통js --%>
	<script src="${pageContext.request.contextPath}/js/home.js" defer></script>
</head>

<body class="bg-gray-50 flex flex-col h-screen">

<!-- HEADER -->
<%@ include file="/WEB-INF/jsp/page/common/header.jsp" %>


<!-- VIEWS CONTAINER -->
<div id="views" class="flex-1 overflow-hidden">

	<!-- Home View -->
	<div id="homeView" class="view flex flex-col h-full overflow-y-auto">
	
		<!-- 검색 -->
		<div class="px-4 py-3">
			<div class="relative">
				<input id="homeSearch" type="text" placeholder="이벤트, 카페를 검색하세요..." class="w-full border border-gray-200 rounded-full px-4 py-2"/>
				<button id="homeBtnSearch" class="absolute right-3 top-1/2 transform -translate-y-1/2">
					<svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
					</svg>
				</button>
			</div>
		</div>
		
		<!-- 광고(현재 미사용) -->
		<!-- <div class="bg-white rounded-lg shadow h-28 mx-4 mb-4 flex items-center justify-center text-gray-500">광고</div> -->
		
		<!-- 카테고리 -->
		<div class="bg-white rounded-lg shadow mb-4 mx-4 px-2 py-3">
			<div class="grid grid-cols-5 gap-2 text-center">
				<button class="home-cat-btn" data-cat="맛집"><span>맛집</span></button>
				<button class="home-cat-btn" data-cat="여행"><span>여행</span></button>
				<button class="home-cat-btn" data-cat="숙박"><span>숙박</span></button>
				<button class="home-cat-btn" data-cat="카페"><span>카페</span></button>
				<button class="home-cat-btn" data-cat="배송"><span>배송</span></button>
			</div>
		</div>
		
		<!-- 인기 체험단 -->
		<div class="flex justify-between items-center px-4 mb-2">
			<h2 class="text-lg font-semibold">인기 체험단</h2>
			<button id="homeBtnMore" class="text-sm text-green-500">더보기</button>
		</div>
		<div id="popularContainer" class="grid grid-cols-2 gap-4 px-4 pb-16"></div>
		
	</div>
	<!-- Home View -->

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

	<div id="detailView" class="view hidden flex flex-col p-4 bg-gray-50 overflow-auto">
		<h2 id="detailTitle" class="text-xl font-semibold mb-2"></h2>
		<div id="detailMeta" class="text-xs text-gray-500 mb-4"></div>
		<div id="detailContent" class="flex-1 overflow-auto text-sm whitespace-pre-wrap"></div>
	</div>

	<!-- Search View -->
	<div id="searchView" class="view hidden flex flex-col h-full overflow-y-auto">
		<div class="px-4 py-3 border-b bg-white flex items-center space-x-2">
			<input id="searchQuery" class="flex-1 border rounded-full px-4 py-2 text-sm" placeholder="전체 검색"/>
			<button id="searchBtn" class="px-3 py-2 bg-green-500 text-white rounded text-sm">검색</button>
		</div>
		<div class="px-4 py-2 bg-white space-y-2">
			<select id="region" class="w-full border rounded px-3 py-2 text-sm" onchange="updateSubregion()">
				<option>전체 시/도</option>
				<option>서울특별시</option>
				<option>경기도</option>
				<option>부산광역시</option>
				<option>대구광역시</option>
				<option>인천광역시</option>
				<option>광주광역시</option>
				<option>대전광역시</option>
				<option>울산광역시</option>
				<option>세종특별자치시</option>
				<option>제주특별자치도</option>
				<option>강원도</option>
				<option>충청북도</option>
				<option>충청남도</option>
				<option>전라북도</option>
				<option>전라남도</option>
				<option>경상북도</option>
				<option>경상남도</option>
				<!-- … 나머지 -->
			</select>
			<select id="subregion" class="w-full border rounded px-3 py-2 text-sm">
				<option>전체 구/군</option>
			</select>
		</div>
		<div class="grid grid-cols-2 gap-2 px-4 py-2 bg-white">
			<select id="filterCategory" class="border rounded px-3 py-2 text-sm">
				<option>전체 카테고리</option>
				<option>맛집</option>
				<option>여행</option>
				<option>기타</option>
			</select>
			<select id="filterChannel" class="border rounded px-3 py-2 text-sm">
				<option>전체 채널</option>
				<option>블로그</option>
				<option>클립</option>
				<option>인스타</option>
				<option>유튜브</option>
				<option>쇼츠</option>
				<option>릴스</option>
				<option>틱톡</option>
			</select>
			<select id="filterType" class="border rounded px-3 py-2 text-sm">
				<option>전체 유형</option>
				<option>방문형</option>
				<option>포장</option>
				<option>구매형</option>
				<option>배송형</option>
				<option>기자단</option>
				<option>당일지급</option>
			</select>
			<select id="filterSort" class="border rounded px-3 py-2 text-sm">
				<option value="">정렬 선택</option>
				<option>최신순</option>
				<option>마감임박순</option>
			</select>
		</div>
		<div id="searchResultContainer" class="grid grid-cols-2 gap-4 p-4 pb-16 bg-gray-50"></div>
	</div>
	<!-- Search View -->

	<!-- Like View -->
	<div id="likeView" class="view hidden flex flex-col h-full overflow-y-auto">
	
		<!-- 즐겨찾기 / 좋아요 섹션 -->
		<section class="px-4 pt-4">
			<div class="flex justify-between items-center mb-2">
				<h2 class="text-lg font-semibold">❤️ 체험단</h2>
				<button id="likeMore" class="text-sm text-green-500">더보기</button>
			</div>
			<div id="likeCampaigns" class="grid grid-cols-2 gap-4"></div>
		</section>
		<section class="px-4 pt-6">
			<div class="flex justify-between items-center mb-2">
				<h2 class="text-lg font-semibold">⭐ 즐겨찾기</h2>
				<button id="favMore" class="text-sm text-green-500">더보기</button>
			</div>
			<div id="favoriteSites" class="grid grid-cols-2 gap-4"></div>
		</section>
	</div>
	<!-- Like View -->

	<!-- Like All View -->
	<div id="likeAllView" class="view hidden flex flex-col h-full overflow-y-auto">
		<header class="relative bg-white shadow flex items-center justify-center px-4 py-2">
			<button class="absolute left-4" onclick="showView('likeView')">←</button>
			<h1 class="text-lg font-semibold">❤️ LIKE <span id="likeCountHeader" class="text-green-500"></span></h1>
		</header>
		<main class="flex-1 overflow-y-auto pb-16 p-4">
			<div id="cardContainer" class="grid grid-cols-2 gap-4"></div>
		</main>
	</div>
	<!-- Like All View -->

	<!-- Fav All View -->
	<div id="favAllView" class="view hidden flex flex-col h-full overflow-y-auto">
		<header class="bg-white shadow flex items-center px-4 py-2">
			<button class="w-6" onclick="showView('likeView')">←</button>
			<h1 class="flex-1 text-center text-lg font-semibold">⭐ 즐겨찾기 <span id="favCountHeader" class="text-green-500"></span></h1>
		</header>
		<main class="flex-1 overflow-y-auto p-4 pb-16">
			<div id="siteList" class="grid grid-cols-2 gap-3"></div>
		</main>
	</div>
	<!-- Fav All View -->

	<!-- My View -->
	<div id="myView" class="view hidden flex flex-col h-full overflow-y-auto">
		<div class="bg-white p-4 flex items-center space-x-4 mb-4">
			<img src="https://via.placeholder.com/64" class="w-16 h-16 rounded-full"/>
			<div>
				<div class="flex items-center space-x-2">
					<span class="font-medium text-lg">닉네임</span>
					<span class="px-2 py-0.5 bg-yellow-200 text-xs rounded">🥇 Lv.3</span>
				</div>
				<div class="flex space-x-3 mt-2 text-sm text-gray-600">
					<span>📘</span><span>📷</span><span>🎥</span>
				</div>
			</div>
		</div>
		<div class="grid grid-cols-2 gap-4 px-4 mb-4">
			<div class="bg-white p-4 rounded-lg shadow text-center">
				<p class="text-sm text-gray-500">좋아요 수</p><p class="text-xl font-semibold" id="myLikeCount">0</p>
			</div>
			<div class="bg-white p-4 rounded-lg shadow text-center">
				<p class="text-sm text-gray-500">최근 본</p><p class="text-xl font-semibold" id="myRecentCount">0</p>
			</div>
		</div>
		<div class="px-4 mb-4">
			<div class="flex justify-between mb-2">
				<h2 class="font-semibold">📌 신청한 체험단</h2>
				<button onclick="alert('TODO')" class="text-sm text-green-500">더보기</button>
			</div>
			<ul class="space-y-2">
				<li class="bg-white p-3 rounded-lg shadow text-sm">체험단 캘린더</li>
			</ul>
		</div>
		<div class="px-4 mb-4">
			<div class="flex justify-between mb-2">
				<h2 class="font-semibold">🔖 해시태그 설정</h2>
				<button onclick="alert('해시태그 관리')" class="text-sm text-green-500">더보기</button>
			</div>
			<div class="flex flex-wrap gap-2 mb-3" id="myTags"></div>
			<div class="flex items-center text-sm">
				<label class="mr-2">추천 ON</label>
				<input type="checkbox" checked class="toggle toggle-sm toggle-green"/>
			</div>
		</div>
		<div class="px-4 mb-8">
			<h2 class="font-semibold mb-2">⚙️ 설정 & 기타</h2>
			<ul class="space-y-2 text-sm">
				<li class="bg-white p-3 rounded-lg shadow"><a href="#">회원 정보 수정</a></li>
				<li class="bg-white p-3 rounded-lg shadow"><a href="#">SNS 연동 관리</a></li>
				<li class="bg-white p-3 rounded-lg shadow"><a href="#">로그아웃</a></li>
				<li class="bg-white p-3 rounded-lg shadow text-red-500"><a href="#">회원 탈퇴</a></li>
			</ul>
		</div>
	</div>
	<!-- My View -->

</div>
<!-- VIEWS CONTAINER -->

<!-- footer -->
<%@ include file="/WEB-INF/jsp/page/common/footer.jsp" %>

</body>
</html>