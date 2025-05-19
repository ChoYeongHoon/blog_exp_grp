/**
 * home.js
 */
// ---------------
// Home Logic
// ---------------
function renderPopular(list, resetFlag) {
	var contents = document.getElementById('popularContainer');
	
	if(resetFlag) {
		contents.innerHTML = '';	
	}
	
	if(list.length > 0) {
		list.forEach(item => {
			var card = document.createElement('div');
			var strImg = ``;
			var strDday = ``;
			
			//card.className = 'bg-white rounded-lg shadow overflow-hidden cursor-pointer mb-4';
			card.className = 'bg-white rounded-lg shadow overflow-hidden cursor-pointer mb-4 flex flex-col h-full';

			// 이미지 경로
			if(item.IMAGE_STATUS == 0) {
				strImg = `<img src="${window_origin}/images/no_image.png" class="w-full h-32 object-cover"/>`;
			} else if(item.IMAGE_STATUS == 1) {
				strImg = `<img src="https://pub-9e163efdf1b44d4da9c0acd64c24dccb.r2.dev/${item.IMAGE_KEY}" class="w-full h-32 object-cover"/>`;
			}
			
			// 디데이
			if(item.ORIGIN == 1) {
				strDday = ``;
			} else {
				strDday = `
					<div class="absolute top-0.5 right-0.5 bg-white bg-opacity-90 px-2 py-1">
						<span class="text-sm font-bold">D-${item.DDAY}</span>
					</div>
				`;
			}
			
			card.innerHTML = `
			<div class="relative">
				${strImg}
				${strDday}
			</div>
			<div class="p-3 flex flex-col flex-grow">
				<div class="flex justify-between items-start mb-1">
					<div class="max-w-[80%]">
						<p class="text-xs text-gray-500">${item.ORIGIN_NM}</p>
						<h3 class="font-bold truncate overflow-hidden whitespace-nowrap">${item.TITLE}</h3>
						<p class="text-xs text-gray-500 line-clamp-2">${item.OFFER}</p>
					</div>
				</div>
				<div class="flex justify-between items-center mt-auto pt-2">
      				<span class="text-xs">신청 ${item.APPLIED} / ${item.RECRUIT}</span>
    			</div>
			</div>
			`;
			
			// 카드 클릭 이벤트
			card.addEventListener('click', () => {
				//window.open(item.IMAGE_KEY, '_blank')
				alert('준비중입니다.');
			});
			
			// 
			contents.appendChild(card);
		});
	} else {
		contents.innerHTML = `<div>No Data</div>`;
	}
}

// 좋아요, 좋아요 카운트 ui 있음
function renderPopular_bak(list, resetFlag) {
	var contents = document.getElementById('popularContainer');
	
	if(resetFlag) {
		contents.innerHTML = '';	
	}
	
	if(list.length > 0) {
		list.forEach(item => {
			var card = document.createElement('div');
			var strImg = ``;
			var strDday = ``;
			
			//card.className = 'bg-white rounded-lg shadow overflow-hidden cursor-pointer mb-4';
			card.className = 'bg-white rounded-lg shadow overflow-hidden cursor-pointer mb-4 flex flex-col h-full';

			// 이미지 경로
			if(item.IMAGE_STATUS == 0) {
				strImg = `<img src="${window_origin}/images/no_image.png" class="w-full h-32 object-cover"/>`;
			} else if(item.IMAGE_STATUS == 1) {
				strImg = `<img src="https://pub-9e163efdf1b44d4da9c0acd64c24dccb.r2.dev/${item.IMAGE_KEY}" class="w-full h-32 object-cover"/>`;
			}
			
			// 디데이
			if(item.ORIGIN == 1) {
				strDday = ``;
			} else {
				strDday = `
					<div class="absolute top-0.5 right-0.5 bg-white bg-opacity-90 px-2 py-1">
						<span class="text-sm font-bold">D-${item.DDAY}</span>
					</div>
				`;
			}
			
			card.innerHTML = `
			<div class="relative">
				${strImg}
				${strDday}
			</div>
			<div class="p-3 flex flex-col flex-grow">
				<div class="flex justify-between items-start mb-1">
					<div class="max-w-[80%]">
						<p class="text-xs text-gray-500">${item.ORIGIN_NM}</p>
						<h3 class="font-bold truncate overflow-hidden whitespace-nowrap">${item.TITLE}</h3>
						<p class="text-xs text-gray-500 line-clamp-2">${item.OFFER}</p>
					</div>
					<button class="like-btn p-1" data-id="${item.IMAGE_KEY}">
						<svg class="w-6 h-6 ${item.LIKE_YN != 'N' ? 'text-red-500' : 'text-gray-300'}" fill="currentColor" viewBox="0 0 20 20">
							<path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"/>
						</svg>
					</button>
				</div>
				<div class="flex justify-between items-center mt-auto pt-2">
      				<span class="text-xs">신청 ${item.APPLIED} / ${item.RECRUIT}</span>
      				<span class="text-xs">${item.LIKE_CNT}</span>
    			</div>
			</div>
			`;
		
			// 좋아요 버튼 이벤트
			const likeBtn = card.querySelector('.like-btn');
			likeBtn.addEventListener('click', (e) => {
				e.stopPropagation(); // 카드 클릭 이벤트 전파 방지
				alert('준비중입니다.');
			});
		
			// 카드 클릭 이벤트
			card.addEventListener('click', () => {
				//window.open(item.IMAGE_KEY, '_blank')
				alert('준비중입니다.');
			});
			
			// 
			contents.appendChild(card);
		});
	} else {
		contents.innerHTML = `<div>No Data</div>`;
	}
}

// 검색
document.getElementById('homeBtnSearch').addEventListener('click', () => {
	var keyword = document.getElementById('homeSearch').value.trim();
	//renderPopular(campaigns.filter(c => c.title.includes(kw) || c.info.includes(kw)));
	home_pageNo = 1;
	
	sendRequest(window_origin + "/api/Campaigns/selectCampaignsInfoList.do", {"pageNo":home_pageNo, "keyword":keyword, "category":home_category}, function(result) {
		renderPopular(result, true);
		
		if(result.length > 0) {
			home_pageNo++;
		}
	});
});

// 엔터 검색
document.getElementById('homeSearch').addEventListener('keydown', function(e) {
	if(e.key === "Enter") {
		var keyword = document.getElementById('homeSearch').value.trim();
		//renderPopular(campaigns.filter(c => c.title.includes(kw) || c.info.includes(kw)));
		home_pageNo = 1;
		
		sendRequest(window_origin + "/api/Campaigns/selectCampaignsInfoList.do", {"pageNo":home_pageNo, "keyword":keyword, "category":home_category}, function(result) {
			renderPopular(result, true);
			
			if(result.length > 0) {
				home_pageNo++;
			}
		});
	}
});

// 카테고리(1:맛집 2:기타 3:뷰티 4:식품 5:여행 6:디지털 7:반려동물)
document.querySelectorAll('.home-cat-btn').forEach(btn => btn.addEventListener('click', () => {
	var keyword = document.getElementById('homeSearch').value.trim();
	
	// 제목 바꾸기
	var title = "";
	switch(btn.dataset.cat) {
		case "0" : title = "인기 체험단 - 전체"; break;
		case "1" : title = "인기 체험단 - 맛집"; break;
		case "2" : title = "인기 체험단 - 기타"; break;
		case "3" : title = "인기 체험단 - 뷰티"; break;
		case "4" : title = "인기 체험단 - 식품"; break;
		case "5" : title = "인기 체험단 - 여행"; break;
		case "6" : title = "인기 체험단 - 디지털"; break;
		case "7" : title = "인기 체험단 - 반려동물"; break;
		case "8" : title = "인기 체험단 - 문화"; break;
		case "9" : title = "인기 체험단 - 패션"; break;
		case "10" : title = "인기 체험단 - 생활"; break;
		default : title = "인기 체험단 - 전체"; break;
	}
	document.getElementById('homeTitle').textContent = title;
	
	home_category = btn.dataset.cat;
	home_pageNo = 1;
	sendRequest(window_origin + "/api/Campaigns/selectCampaignsInfoList.do", {"pageNo":home_pageNo, "keyword":keyword, "category":home_category}, function(result) {
		renderPopular(result, true);
		
		if(result.length > 0) {
			home_pageNo++;
		}
	});
}));

// 더보기(보류)
//document.getElementById('homeBtnMore').addEventListener('click', () => showView('likeAllView'));
