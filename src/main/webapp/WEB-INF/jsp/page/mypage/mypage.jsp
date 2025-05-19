<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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