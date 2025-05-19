<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="${pageContext.request.contextPath}/js/search.js" defer></script> <%-- search js --%>
<script>
document.addEventListener('DOMContentLoaded', function () {
	
	// 무한 스크롤
	var isLoading = false;
	var searchView = document.getElementById('searchView');
	searchView.addEventListener('scroll', function () {
		if(isLoading) return;
		
		if (searchView.scrollTop + searchView.clientHeight >= searchView.scrollHeight - 100) {
			isLoading = true;
			
			var keyword = document.getElementById('searchQuery').value.trim();
			var region1 = document.getElementById("region").value.trim();
			var region2 = document.getElementById("subregion").value.trim();
			var category = document.getElementById("filterCategory").value.trim();
			var channel = document.getElementById("filterChannel").value.trim();
			var type = document.getElementById("filterType").value.trim();
			var sort = document.getElementById("filterSort").value.trim();

			sendRequest(window_origin + "/api/Search/selectSearchInfoList.do",
						{
							"pageNo"   : search_pageNo,
							"keyword"  : keyword,
							"region1"  : region1,
							"region2"  : region2,
							"category" : category,
							"channel"  : channel,
							"type"     : type,
							"sort"     : sort,
						}, function(result) {
							renderSearchResults(result, false);
							
							if(result.length > 0) {
								search_pageNo++;
								isLoading = false;
							}
						}
			);
		}
	});
	
	// 맨 위로 버튼
	var scrollToTopBtn = document.getElementById('scrollToTopBtn');
	searchView.addEventListener('click', function () {
		searchView.scrollTo({ top: 0, behavior: 'smooth' });
	});
	
});
</script>

<!-- Search View -->
<div id="searchView" class="view hidden flex flex-col h-full overflow-y-auto">
	<div class="px-4 py-3 border-b bg-white flex items-center space-x-2">
		<input id="searchQuery" class="flex-1 border rounded-full px-4 py-2 text-sm" placeholder="전체 검색"/>
		<button id="searchBtnSearch" class="px-3 py-2 bg-green-500 text-white rounded text-sm">검색</button>
	</div>
	<div class="px-4 py-2 bg-white space-y-2">
		<select id="region" class="w-full border rounded px-3 py-2 text-sm" onchange="updateSubregion()">
			<option value="0">전체 시/도</option>
			<option value="1">서울특별시</option>
			<option value="2">부산광역시</option>
			<option value="3">대구광역시</option>
			<option value="4">인천광역시</option>
			<option value="5">광주광역시</option>
			<option value="6">대전광역시</option>
			<option value="7">울산광역시</option>
			<option value="8">세종특별자치시</option>
			<option value="9">경기도</option>
			<option value="10">강원특별자치도</option>
			<option value="11">충청북도</option>
			<option value="12">충청남도</option>
			<option value="13">전북특별자치도</option>
			<option value="14">전라남도</option>
			<option value="15">경상북도</option>
			<option value="16">경상남도</option>
			<option value="17">제주특별자치도</option>
		</select>
		<select id="subregion" class="w-full border rounded px-3 py-2 text-sm" onchange="changeSubregion()">
			<option value="0">전체 구/군</option>
		</select>
	</div>
	<div class="grid grid-cols-2 gap-2 px-4 py-2 bg-white">
		<select id="filterCategory" class="border rounded px-3 py-2 text-sm" onchange="changeCategory()">
			<option value="0">전체 카테고리</option>
			<option value="1">맛집</option>
			<option value="2">기타</option>
			<option value="3">뷰티</option>
			<option value="4">식품</option>
			<option value="5">여행</option>
			<option value="6">디지털</option>
			<option value="7">반려동물</option>
			<option value="8">문화</option>
			<option value="9">패션</option>
			<option value="10">생활</option>
		</select>
		<select id="filterChannel" class="border rounded px-3 py-2 text-sm" onchange="changeChannel()">
			<option value="0">전체 채널</option>
			<option value="1">블로그</option>
			<option value="2">릴스</option>
			<option value="3">유튜브</option>
			<option value="4">쇼츠</option>
			<option value="5">블로그+클립</option>
			<option value="6">틱톡</option>
			<option value="7">인스타그램</option>
			<option value="8">클립</option>
		</select>
		<select id="filterType" class="border rounded px-3 py-2 text-sm" onchange="changeType()">
			<option value="0">전체 유형</option>
			<option value="1">방문</option>
			<option value="2">배송</option>
			<option value="3">기자단</option>
			<option value="4">기타</option>
			<option value="5">테이크아웃</option>
			<option value="6">당일지급</option>
		</select>
		<select id="filterSort" class="border rounded px-3 py-2 text-sm" onchange="changeSort()">
			<option value="0">정렬 선택</option>
			<option value="1">최신순</option>
			<option value="2">마감임박순</option>
		</select>
	</div>
	<div id="searchResultContainer" class="grid grid-cols-2 gap-4 p-4 pb-16 bg-gray-50"></div>
	
	<!-- 맨 위로 버튼 -->
	<button id="scrollToTopBtn" style="position: fixed; bottom: 80px; right: 20px;" class="fixed bottom-6 right-6 w-10 h-10 bg-white text-black border border-gray-300 shadow-lg flex items-center justify-center text-sm">
		▲
	</button>
</div>
<!-- Search View -->