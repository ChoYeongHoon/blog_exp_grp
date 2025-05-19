/**
 * community.js
 */
// ---------------
// Community Logic
// ---------------
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

const posts = [
	{
		cat:'전체글',
		title:'맛집 후기',
		content:'강남 숨은 맛집...',
		comments:3,
		nick:'홍길동',
		date:'2025.01.02',
		views:123,
		likes:45
	},
	{
		cat:'후기 모음',
		title:'여행 팁 공유',
		content:'이번 제주 여행...',
		comments:5,
		nick:'이영희',
		date:'2025.01.01',
		views:98,
		likes:30
	},
	{
		cat:'서로이웃 구함',
		title:'블로그 이웃',
		content:'정보 공유 원해요',
		comments:2,
		nick:'박민수',
		date:'2025.01.03',
		views:54,
		likes:12
	}
];
const sidebar = document.getElementById('sidebar')
              , contentArea=document.getElementById('content')
              , postList=document.getElementById('postList')
              , btnSearch=document.getElementById('btn-search')
              , searchField=document.getElementById('searchField')
              , searchInput=document.getElementById('searchInput')
              , communityV=document.getElementById('communityView')
              , writeV=document.getElementById('writeView')
              , detailV=document.getElementById('detailView');

function renderList(cat,field = '',text = '') {
	postList.innerHTML = '';
	posts.filter(p => cat === '전체글' || p.cat === cat).filter(p => !text || p[field].includes(text)).forEach(p => {
		const li=document.createElement('li'); li.className='bg-white p-4 rounded-lg shadow cursor-pointer';
		li.innerHTML=`<div class="flex justify-between mb-2"><span class="text-xs bg-blue-100 text-blue-700 px-2 py-0.5 rounded-full">${p.cat}</span><h2 class="font-medium">${p.title} <span class="text-xs text-gray-500">(${p.comments})</span></h2></div><div class="text-xs text-gray-500 flex space-x-4"><span>${p.nick}</span><span>${p.date}</span><span>조회수 ${p.views}</span><span>❤ ${p.likes}</span></div>`;
		li.addEventListener('click', () => {
			document.getElementById('detailTitle').textContent = p.title;
			document.getElementById('detailMeta').textContent = `${p.cat} · ${p.date} · 조회수 ${p.views} · ❤ ${p.likes}`;
			document.getElementById('detailContent').textContent = p.content;
			showView('detailView');
		});
		postList.appendChild(li);
	});
}

document.querySelectorAll('.menu-btn').forEach(btn => btn.addEventListener('click', () => {
	renderList(btn.dataset.cat); sidebar.classList.add('hidden');
	contentArea.classList.replace('w-1/2','w-full');
	btnBack.classList.remove('opacity-0');
}));

btnSearch.addEventListener('click', () => renderList(headerTitle.textContent, searchField.value, searchInput.value.trim()));
btnWrite.addEventListener('click', () => showView('writeView'));
document.getElementById('btn-back').addEventListener('click', () => {
	if(!detailV.classList.contains('hidden')) {
		showView('communityView');
	} else {
		showView('communityView'); sidebar.classList.remove('hidden');
		contentArea.classList.replace('w-full','w-1/2');
	}
	renderList('전체글'); searchInput.value='';
});

btnBack.classList.add('opacity-0');
renderList('전체글');