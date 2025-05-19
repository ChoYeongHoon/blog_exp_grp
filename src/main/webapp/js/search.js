/**
 * search.js
 */
// ---------------
// Search Logic
// ---------------
const regionMap = {
	'서울특별시':
	[
		'종로구',
		'중구',
		'용산구',
		'성동구',
		'광진구',
		'동대문구',
		'중랑구',
		'성북구',
		'강북구',
		'도봉구',
		'노원구',
		'은평구',
		'서대문구',
		'마포구',
		'양천구',
		'강서구',
		'구로구',
		'금천구',
		'영등포구',
		'동작구',
		'관악구',
		'서초구',
		'강남구',
		'송파구',
		'강동구'
	],
	'부산광역시':
	[
		'중구',
		'서구',
		'동구',
		'영도구',
		'부산진구',
		'동래구',
		'남구',
		'북구',
		'해운대구',
		'사하구',
		'금정구',
		'강서구',
		'연제구',
		'수영구',
		'사상구',
		'기장군'
	],
	'대구광역시':
	[
		'중구',
		'동구',
		'서구',
		'남구',
		'북구',
		'수성구',
		'달서구',
		'달성군',
		'군위군',
	],
	'인천광역시':
	[
		'중구',
		'동구',
		'미추홀구',
		'연수구',
		'남동구',
		'부평구',
		'계양구',
		'서구',
		'강화군',
		'옹진군'
	],
	'광주광역시':
	[
		'동구',
		'서구',
		'남구',
		'북구',
		'광산구'
	],
	'대전광역시':
	[
		'동구',
		'중구',
		'서구',
		'유성구',
		'대덕구'
	],
	'울산광역시':
	[
		'중구',
		'남구',
		'동구',
		'북구',
		'울주군'
	],
	'세종특별자치시':
	[
		'세종특별자치시'
	],
	'경기도':
	[
		'수원시',
		'용인시',
		'고양시',
		'화성시',
		'성남시',
		'부천시',
		'남양주시',
		'안산시',
		'평택시',
		'안양시',
		'시흥시',
		'파주시',
		'김포시',
		'의정부시',
		'광주시',
		'하남시',
		'광명시',
		'군포시',
		'양주시',
		'오산시',
		'이천시',
		'안성시',
		'구리시',
		'의왕시',
		'포천시',
		'양평군',
		'여주시',
		'동두천시',
		'과천시',
		'가평군',
		'연천군'
	],
	'강원특별자치도':
	[
		'춘천시',
		'원주시',
		'강릉시',
		'동해시',
		'태백시',
		'속초시',
		'삼척시',
		'홍천군',
		'횡성군',
		'영월군',
		'평창군',
		'정선군',
		'철원군',
		'화천군',
		'양구군',
		'인제군',
		'고성군',
		'양양군'
	],
	'충청북도':
	[
		'청주시',
		'충주시',
		'제천시',
		'보은군',
		'옥천군',
		'영동군',
		'증평군',
		'진천군',
		'괴산군',
		'음성군',
		'단양군'
	],
	'충청남도':
	[
		'천안시',
		'공주시',
		'보령시',
		'아산시',
		'서산시',
		'논산시',
		'계룡시',
		'당진시',
		'금산군',
		'부여군',
		'서천군',
		'청양군',
		'홍성군',
		'예산군',
		'태안군'
	],
	'전북특별자치도':
	[
		'전주시',
		'군산시',
		'익산시',
		'정읍시',
		'남원시',
		'김제시',
		'완주군',
		'진안군',
		'무주군',
		'장수군',
		'임실군',
		'순창군',
		'고창군',
		'부안군'
	],
	'전라남도':
	[
		'목포시',
		'여수시',
		'순천시',
		'나주시',
		'광양시',
		'담양군',
		'곡성군',
		'구례군',
		'고흥군',
		'보성군',
		'화순군',
		'장흥군',
		'강진군',
		'해남군',
		'영암군',
		'무안군',
		'함평군',
		'영광군',
		'장성군',
		'완도군',
		'진도군',
		'신안군'
	],
	'경상북도':
	[	'포항시',
		'경주시',
		'김천시',
		'안동시',
		'구미시',
		'영주시',
		'영천시',
		'상주시',
		'문경시',
		'경산시',
		'의성군',
		'청송군',
		'영양군',
		'영덕군',
		'청도군',
		'고령군',
		'성주군',
		'칠곡군',
		'예천군',
		'봉화군',
		'울진군',
		'울릉군'
	],
	'경상남도':
	[
		'창원시',
		'진주시',
		'통영시',
		'사천시',
		'김해시',
		'밀양시',
		'거제시',
		'양산시',
		'의령군',
		'함안군',
		'창녕군',
		'고성군',
		'남해군',
		'하동군',
		'산청군',
		'함양군',
		'거창군',
		'합천군'
	],
	'제주특별자치도':
	[
		'제주시',
		'서귀포시'
	]
};

// value
var campaignsSearch = campaigns; // reuse

// 구/군 업데이트
function updateSubregion() {
	var region = document.getElementById("region");
	var regionValue = region.value.trim();
	var regionText = region.options[region.selectedIndex].text;
	
	var optionValue = 1;
	var subRegion = document.getElementById('subregion');
	subRegion.innerHTML = '<option value="0">전체 구/군</option>';
	(regionMap[regionText] || []).forEach(g => {
		var option = document.createElement('option');
		option.textContent = g;
		option.value = (regionValue * 100) + optionValue;
		subRegion.appendChild(option);
		
		optionValue++;
	});
	
	// 검색
	search();
}

function renderSearchResults(list, resetFlag) {
	var contents = document.getElementById('searchResultContainer');
	
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


/*function renderSearchResults(list) {
	var contents = document.getElementById('searchResultContainer');
	contents.innerHTML = '';
	list.forEach(c => {
		const card = document.createElement('div');
		card.className = 'bg-white rounded-lg shadow p-3 cursor-pointer';
		card.innerHTML = `
			<div class="relative mb-2">
				<span class="absolute top-2 right-2 text-xs text-gray-600">${c.dday}</span>
				<img src="${c.img}" class="w-full h-32 object-cover rounded"/>
			</div>
			<h3 class="font-medium mb-1">${c.title}</h3>
			<p class="text-xs text-gray-500 mb-1">${c.info}</p>
			<div class="flex justify-between text-sm">
				<span>신청 ${c.applied}/${c.capacity}</span>
				<span>❤ ${c.likes}</span>
			</div>
		`;
		card.addEventListener('click', () => window.open(c.url,'_blank'));
		contents.appendChild(card);
	});
}*/

function search() {
	search_pageNo = 1;
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
					renderSearchResults(result, true);
					
					if(result.length > 0) {
						search_pageNo++;
					}
				}
	);
}

function changeSubregion() { search(); }
function changeCategory() { search(); }
function changeChannel() { search(); }
function changeType() { search(); }
function changeSort() { search(); }

document.getElementById('searchBtnSearch').addEventListener('click', () => {
	search();
});
/*document.querySelector('[data-view="searchView"]').addEventListener('click', () => renderSearchResults(campaignsSearch));*/