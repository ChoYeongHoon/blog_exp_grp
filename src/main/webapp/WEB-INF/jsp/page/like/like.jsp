<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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