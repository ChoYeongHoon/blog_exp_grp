<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
	<title>통합 SPA</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 flex flex-col h-screen">

<!-- HEADER -->
<header class="bg-white shadow flex items-center justify-between px-4 py-2">
	<button id="btn-back" class="w-6 opacity-0">
		<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
			<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
		</svg>
	</button>
	<h1 id="headerTitle" class="flex-1 text-center text-lg font-semibold">진짜홈</h1>
	<button id="btn-write" class="px-3 py-1 bg-green-500 text-white rounded text-sm opacity-0">글작성</button>
</header>

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
		
		<!-- 광고 -->
		<div class="bg-white rounded-lg shadow h-28 mx-4 mb-4 flex items-center justify-center text-gray-500">광고</div>
		
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

<!-- BOTTOM NAV -->
<%@ include file="/WEB-INF/jsp/page/common/footer.jsp" %>
<!-- BOTTOM NAV -->

<!-- <nav class="fixed bottom-0 left-0 right-0 bg-black text-white flex justify-between px-6 py-2">
<button data-view="homeView" class="tab-btn flex flex-col items-center text-xs text-green-400">
<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M3 12l2-2m0 0l7-7 7 7M13 5v6h6"/></svg>
home
</button>
<button data-view="communityView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M4 4h16v16H4z"/></svg>
커뮤니티
</button>
<button data-view="searchView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
<svg class="h-6 w-6 mb-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16l4-4 4 4"/></svg>
검색
</button>
<button data-view="likeView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M5 13l4 4L19 7"/></svg>
like
</button>
<button data-view="myView" class="tab-btn flex flex-col items-center text-xs text-gray-400">
<svg class="h-6 w-6 mb-1" fill="currentColor" viewBox="0 0 24 24"><path d="M12 12a5 5 0 10-5-5"/></svg>
my
</button>
</nav> -->


<script>
// 공통: View 전환
const views = document.querySelectorAll('.view');
const tabButtons = document.querySelectorAll('.tab-btn');
const btnBack = document.getElementById('btn-back');
const btnWrite = document.getElementById('btn-write');
const headerTitle = document.getElementById('headerTitle');
function showView(id){
views.forEach(v=>v.classList.add('hidden'));
document.getElementById(id).classList.remove('hidden');
const titles = {homeView:'홈', communityView:'커뮤니티', searchView:'검색', likeView:'LIKE', myView:'내정보'};
headerTitle.textContent = titles[id]||'';
// back/write buttons
btnBack.classList.toggle('opacity-0', id!=='communityView' && id!=='detailView' && id!=='writeView');
btnWrite.classList.toggle('opacity-0', id!=='communityView');
tabButtons.forEach(b=>b.classList.replace('text-green-400','text-gray-400'));
document.querySelector(`[data-view="${id}"]`).classList.replace('text-gray-400','text-green-400');
}
tabButtons.forEach(b=>b.addEventListener('click', ()=> showView(b.dataset.view)));
showView('homeView');

// ---------------
// Home Logic
const campaigns = [
{
url: 'https://www.reviewnote.co.kr/campaigns/658893',
img: 'https://source.unsplash.com/featured/?restaurant',
dday: 'D-10',
title: '강릉 주니삼겹',
location: '강남맛집',
info: '블로그',
reward: '4만원 식사권(2인 기준)',
applied: 48,
capacity: 30,
likes: 200,
category: '맛집'
},
{
url: 'https://www.reviewnote.co.kr/campaigns/658894',
img: 'https://www.reviewnote.co.kr/campaigns/658894',
dday: 'D-5',
title: '천안 떡볶이',
location: '리뷰노트',
info: '인스타그램',
reward: '4만원 식사권(2인 기준)',
applied: 5,
capacity: 10,
likes: 0,
category: '카페'
}
];
function renderPopular(list) {
const cont = document.getElementById('popularContainer');
cont.innerHTML = '';
list.forEach(c => {
const card = document.createElement('div');
card.className = 'bg-white rounded-lg shadow overflow-hidden cursor-pointer mb-4';
card.innerHTML = `
<div class="relative">
<img src="${c.img}" class="w-full h-32 object-cover"/>
<div class="absolute top-0 right-0 bg-white bg-opacity-90 px-2 py-1">
<span class="text-sm font-bold">${c.dday}</span>
</div>
</div>
<div class="p-3">
<div class="flex justify-between items-start mb-1">
<div>
<p class="text-xs text-gray-500">${c.location}</p>
<h3 class="font-bold">${c.title}</h3>
<p class="text-xs text-gray-500">${c.info}</p>
</div>
<button class="like-btn p-1" data-id="${c.url}">
<svg class="w-6 h-6 ${c.likes > 0 ? 'text-red-500' : 'text-gray-300'}" fill="currentColor" viewBox="0 0 20 20">
<path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"/>
</svg>
</button>
</div>
<div class="flex justify-between items-center mt-2">
<span class="text-xs">신청 ${c.applied} / ${c.capacity}</span>
<span class="text-xs">${c.likes}</span>
</div>
</div>`;

// 좋아요 버튼 이벤트
const likeBtn = card.querySelector('.like-btn');
likeBtn.addEventListener('click', (e) => {
e.stopPropagation(); // 카드 클릭 이벤트 전파 방지
alert('좋아요 기능 구현 예정');
});

// 카드 클릭 이벤트
card.addEventListener('click', () => window.open(c.url, '_blank'));
cont.appendChild(card);
});
}
document.getElementById('homeBtnSearch').addEventListener('click', ()=> { const kw=document.getElementById('homeSearch').value.trim(); renderPopular(campaigns.filter(c=>c.title.includes(kw)||c.info.includes(kw))); });
document.querySelectorAll('.home-cat-btn').forEach(btn=> btn.addEventListener('click', ()=> renderPopular(campaigns.filter(c=>c.category===btn.dataset.cat))));
document.getElementById('homeBtnMore').addEventListener('click', ()=> showView('likeAllView'));
renderPopular(campaigns);

// ---------------
// Community Logic
// 글 작성 및 등록 기능
document.getElementById('btnPostSubmit').addEventListener('click', () => {
const title = document.getElementById('postTitle').value.trim();
const content = document.getElementById('postContent').value.trim();
const cat = document.getElementById('postCat').value;

if (!title || !content) {
alert('제목과 내용을 모두 입력해주세요.');
return;
}

// 새 글 객체 생성
const newPost = {
cat: cat,
title: title,
content: content,
comments: 0,
nick: '닉네임', // 현재 로그인한 사용자
date: new Date().toISOString().split('T')[0].replace(/-/g, '.'),
views: 0,
likes: 0
};

// posts 배열 앞에 추가
posts.unshift(newPost);

// 입력 필드 초기화
document.getElementById('postTitle').value = '';
document.getElementById('postContent').value = '';

// 커뮤니티 페이지로 돌아가고 목록 새로고침
alert('글이 등록되었습니다.');
showView('communityView');
renderList('전체글');
});
const posts=[{cat:'전체글',title:'맛집 후기',content:'강남 숨은 맛집...',comments:3,nick:'홍길동',date:'2025.01.02',views:123,likes:45},{cat:'후기 모음',title:'여행 팁 공유',content:'이번 제주 여행...',comments:5,nick:'이영희',date:'2025.01.01',views:98,likes:30},{cat:'서로이웃 구함',title:'블로그 이웃',content:'정보 공유 원해요',comments:2,nick:'박민수',date:'2025.01.03',views:54,likes:12}];
const sidebar=document.getElementById('sidebar'), contentArea=document.getElementById('content'), postList=document.getElementById('postList'), btnSearch=document.getElementById('btn-search'), searchField=document.getElementById('searchField'), searchInput=document.getElementById('searchInput'), communityV=document.getElementById('communityView'), writeV=document.getElementById('writeView'), detailV=document.getElementById('detailView');
function renderList(cat,field='',text=''){
postList.innerHTML='';
posts.filter(p=>cat==='전체글'||p.cat===cat).filter(p=>!text||p[field].includes(text))
.forEach(p=>{
const li=document.createElement('li'); li.className='bg-white p-4 rounded-lg shadow cursor-pointer';
li.innerHTML=`<div class="flex justify-between mb-2"><span class="text-xs bg-blue-100 text-blue-700 px-2 py-0.5 rounded-full">${p.cat}</span><h2 class="font-medium">${p.title} <span class="text-xs text-gray-500">(${p.comments})</span></h2></div><div class="text-xs text-gray-500 flex space-x-4"><span>${p.nick}</span><span>${p.date}</span><span>조회수 ${p.views}</span><span>❤ ${p.likes}</span></div>`;
li.addEventListener('click', ()=>{ document.getElementById('detailTitle').textContent=p.title; document.getElementById('detailMeta').textContent=`${p.cat} · ${p.date} · 조회수 ${p.views} · ❤ ${p.likes}`; document.getElementById('detailContent').textContent=p.content; showView('detailView');});
postList.appendChild(li);
});
}
document.querySelectorAll('.menu-btn').forEach(btn=>btn.addEventListener('click',()=>{
renderList(btn.dataset.cat); sidebar.classList.add('hidden'); contentArea.classList.replace('w-1/2','w-full'); btnBack.classList.remove('opacity-0');
}));
btnSearch.addEventListener('click', ()=> renderList(headerTitle.textContent, searchField.value, searchInput.value.trim()));
btnWrite.addEventListener('click', ()=> showView('writeView'));
document.getElementById('btn-back').addEventListener('click', ()=>{
if(!detailV.classList.contains('hidden')){ showView('communityView'); }
else { showView('communityView'); sidebar.classList.remove('hidden'); contentArea.classList.replace('w-full','w-1/2'); }
renderList('전체글'); searchInput.value='';
});
btnBack.classList.add('opacity-0'); renderList('전체글');
// ---------------
// Search Logic
const regionMap={ '서울특별시':['종로구','중구','용산구','성동구','광진구','동대문구','중랑구','성북구','강북구','도봉구','노원구','은평구','서대문구','마포구','양천구','강서구','구로구','금천구','영등포구','동작구','관악구','서초구','강남구','송파구','강동구'], '경기도':['수원시','성남시','의정부시','안양시','부천시','광명시','평택시','동두천시','안산시','고양시','과천시','구리시','남양주시','오산시','시흥시','군포시','의왕시','하남시','용인시','파주시','이천시','안성시','김포시','화성시','여주시','양주시','연천군','가평군','포천시'], '부산광역시':['중구','서구','동구','영도구','부산진구','동래구','남구','북구','해운대구','사하구','금정구','강서구','연제구','수영구','사상구','기장군'], '대구광역시':['중구','동구','서구','남구','북구','수성구','달서구','달성군'], '인천광역시':['중구','동구','미추홀구','연수구','남동구','부평구','계양구','서구','강화군','옹진군'], '광주광역시':['동구','서구','남구','북구','광산구'], '대전광역시':['동구','중구','서구','유성구','대덕구'], '울산광역시':['중구','남구','동구','북구','울주군'], '세종특별자치시':['세종특별자치시'], '제주특별자치도':['제주시','서귀포시'], '강원도':['춘천시','원주시','강릉시','동해시','태백시','속초시','삼척시','홍천군','횡성군','영월군','평창군','정선군','철원군','화천군','양구군','인제군','고성군','양양군'], '충청북도':['청주시','충주시','제천시','보은군','옥천군','영동군','진천군','괴산군','음성군','단양군'], '충청남도':['천안시','공주시','보령시','아산시','서산시','논산시','계룡시','당진시','금산군','부여군','서천군','청양군','홍성군','예산군','태안군'], '전라북도':['전주시','군산시','익산시','정읍시','남원시','김제시','완주군','진안군','무주군','장수군','임실군','순창군','고창군','부안군'], '전라남도':['목포시','여수시','순천시','나주시','광양시','담양군','곡성군','구례군','고흥군','보성군','화순군','장흥군','강진군','해남군','영암군','무안군','함평군','영광군','장성군','완도군','진도군','신안군'], '경상북도':['포항시','경주시','김천시','안동시','구미시','영주시','영천시','상주시','문경시','경산시','군위군','의성군','청송군','영양군','영덕군','청도군','고령군','성주군','칠곡군','예천군','봉화군','울진군','울릉군'], '경상남도':['창원시','진주시','통영시','사천시','김해시','밀양시','거제시','양산시','의령군','함안군','창녕군','고성군','남해군','하동군','산청군','함양군','거창군','합천군'] };
function updateSubregion(){ const sub=document.getElementById('subregion'); sub.innerHTML='<option value="">전체 구/군</option>'; (regionMap[document.getElementById('region').value]||[]).forEach(g=>{const o=document.createElement('option');o.textContent=g;sub.appendChild(o);}); }
const campaignsSearch=campaigns; // reuse
function renderSearchResults(list){
const cont=document.getElementById('searchResultContainer'); cont.innerHTML='';
list.forEach(c=>{ const card=document.createElement('div'); card.className='bg-white rounded-lg shadow p-3 cursor-pointer'; card.innerHTML=`<div class="relative mb-2"><span class="absolute top-2 right-2 text-xs text-gray-600">${c.dday}</span><img src="${c.img}" class="w-full h-32 object-cover rounded"/></div><h3 class="font-medium mb-1">${c.title}</h3><p class="text-xs text-gray-500 mb-1">${c.info}</p><div class="flex justify-between text-sm"><span>신청 ${c.applied}/${c.capacity}</span><span>❤ ${c.likes}</span></div>`; card.addEventListener('click', ()=> window.open(c.url,'_blank')); cont.appendChild(card); });
}
document.getElementById('searchBtn').addEventListener('click', ()=>{
let res=campaignsSearch.slice(), kw=document.getElementById('searchQuery').value.trim();
if(kw)res=res.filter(c=>c.title.includes(kw)||c.info.includes(kw));
renderSearchResults(res);
});
document.querySelector('[data-view="searchView"]').addEventListener('click', ()=> renderSearchResults(campaignsSearch));

// ---------------
// Like Logic
const likeCampaigns=[...campaigns], favoriteSites=[{name:'리뷰노트',url:'https://reviewnote.co.kr'},{name:'인플렉서',url:'https://inflexer.net'}];
function renderLikeCampaigns(){ const c=document.getElementById('likeCampaigns'); c.innerHTML=''; likeCampaigns.slice(0,2).forEach((x)=>{const d=document.createElement('div');d.className='bg-white rounded-lg shadow p-3 cursor-pointer';d.innerHTML=`<img src="${x.img}" class="w-full h-32 object-cover rounded mb-2"/><p class="text-xs text-green-500">${x.dday}</p><h3 class="font-medium">${x.title}</h3><p class="text-xs text-gray-500">${x.info}</p><p class="mt-1 text-sm flex justify-between">신청 ${x.applied}/${x.capacity}<span>❤ ${x.likes}</span></p>`; d.addEventListener('click', ()=> window.open(x.url,'_blank')); c.appendChild(d);}); }
function renderFavoriteSites(){ const s=document.getElementById('favoriteSites'); s.innerHTML=''; favoriteSites.slice(0,2).forEach(x=>{const a=document.createElement('a');a.href=x.url; a.target='_blank'; a.className='bg-white rounded-lg shadow p-4 text-center'; a.textContent=x.name; s.appendChild(a);}); }
document.getElementById('likeMore').addEventListener('click', ()=> showView('likeAllView'));
document.getElementById('favMore').addEventListener('click', ()=> showView('favAllView'));
renderLikeCampaigns(); renderFavoriteSites();

// Like All
const cardContainer=document.getElementById('cardContainer');
const TOTAL=100; for(let i=1;i<=TOTAL;i++){const card=document.createElement('div');card.className='bg-white rounded-lg shadow p-3 cursor-pointer';const dday=(i%10)+1,ap=Math.floor(Math.random()*100),cap=ap+Math.floor(Math.random()*50+10),lk=Math.floor(Math.random()*500);card.innerHTML=`<img src="https://source.unsplash.com/featured/?food&sig=${i}" class="w-full h-32 object-cover rounded mb-2"/><p class="text-xs text-green-500">D-${dday}</p><h3 class="font-medium">캠페인 ${i}</h3><p class="text-xs text-gray-500">플랫폼 · 보상 정보</p><p class="mt-1 text-sm flex justify-between">신청 ${ap}/${cap}<span>❤ ${lk}</span></p>`; card.addEventListener('click', ()=> window.open('https://www.reviewnote.co.kr/campaigns/658893','_blank')); cardContainer.appendChild(card);}
document.getElementById('likeCountHeader').textContent=TOTAL;

// Fav All
const siteList=document.getElementById('siteList');
const allSites=favoriteSites.concat([{name:'레뷰',url:'https://revu.net'},{name:'디너의여왕',url:'https://dinnerqueen.net'}]);
allSites.forEach(s=>{const a=document.createElement('a');a.href=s.url;a.target='_blank';a.className='bg-white rounded-lg shadow p-3 flex items-center justify-center';a.textContent=s.name;siteList.appendChild(a);});
document.getElementById('favCountHeader').textContent=allSites.length;

// My Tags
const tags=['#맛집','#여행','#문화'];
const myTags=document.getElementById('myTags');
tags.forEach(t=>{const b=document.createElement('button');b.className='px-3 py-1 bg-gray-200 rounded-full text-sm';b.textContent=t;myTags.appendChild(b);});
// Dummy counts
document.getElementById('myLikeCount').textContent=likeCampaigns.length;
document.getElementById('myRecentCount').textContent=5;
</script>
</body>
</html>