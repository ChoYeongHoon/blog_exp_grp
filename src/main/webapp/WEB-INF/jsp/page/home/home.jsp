<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="${pageContext.request.contextPath}/js/home.js" defer></script> <%-- home js --%>
<script>
document.addEventListener('DOMContentLoaded', function () {
	
	sendRequest(window_origin + "/api/Campaigns/selectCampaignsInfoList.do", {"pageNo":home_pageNo}, function(result) {
		renderPopular(result, true);
		
		if(result.length > 0) {
			home_pageNo++;
		}
	});
	
	
	// 무한 스크롤
	var isLoading = false;
	var homeView = document.getElementById('homeView');
	homeView.addEventListener('scroll', function () {
		if(isLoading) return;
		
		if (homeView.scrollTop + homeView.clientHeight >= homeView.scrollHeight - 100) {
			isLoading = true;
			
			var keyword = document.getElementById('homeSearch').value.trim();
			sendRequest(window_origin + "/api/Campaigns/selectCampaignsInfoList.do", {"pageNo":home_pageNo, "keyword":keyword, "category":home_category}, function(result) {
				renderPopular(result, false);
				
				if(result.length > 0) {
					home_pageNo++;
					isLoading = false;
				}
			});
		}
	});
	
	// 맨 위로 버튼
	var scrollToTopBtn = document.getElementById('scrollToTopBtn');
	homeView.addEventListener('click', function () {
		homeView.scrollTo({ top: 0, behavior: 'smooth' });
	});
	
});
</script>

<!-- Home View -->
<div id="homeView" class="view flex flex-col h-full overflow-y-auto">

	<!-- 검색 -->
	<div class="px-4 py-3">
		<div class="relative">
			<input id="homeSearch" type="text" placeholder="검색어를 입력해주세요." class="w-full border border-gray-200 rounded-full px-4 py-2"/>
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
		<div class="grid grid-cols-6 gap-x-1 gap-y-3 text-center text-sm">
			<button class="home-cat-btn w-20 text-sm" data-cat="0"><span>전체</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="1"><span>맛집</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="2"><span>기타</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="3"><span>뷰티</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="4"><span>식품</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="5"><span>여행</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="6"><span>디지털</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="7"><span>반려<br>동물</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="8"><span>문화</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="9"><span>패션</span></button>
			<button class="home-cat-btn w-20 text-sm" data-cat="10"><span>생활</span></button>
		</div>
	</div>
	
	<!-- 인기 체험단 -->
	<div class="flex justify-between items-center px-4 mb-2">
		<h2 class="text-lg font-semibold" id="homeTitle">인기 체험단 - 전체</h2>
		<!-- <button id="homeBtnMore" class="text-sm text-green-500">더보기</button> -->
	</div>
	<div id="popularContainer" class="grid grid-cols-2 gap-4 px-4 pb-16"></div>
	
	<!-- 맨 위로 버튼 -->
	<button id="scrollToTopBtn" style="position: fixed; bottom: 80px; right: 20px;" class="fixed bottom-6 right-6 w-10 h-10 bg-white text-black border border-gray-300 shadow-lg flex items-center justify-center text-sm">
		▲
	</button>
</div>
<!-- Home View -->