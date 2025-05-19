/**
 * like.js
 */
// ---------------
// Like Logic
// ---------------
var likeCampaigns = [...campaigns];
var favoriteSites = [{name:'리뷰노트',url:'https://reviewnote.co.kr'},{name:'인플렉서',url:'https://inflexer.net'},{name:'레뷰', url:'https://revu.net'}, {name:'디너의여왕', url:'https://dinnerqueen.net'}];

function renderLikeCampaigns() {
	const c = document.getElementById('likeCampaigns');
	c.innerHTML = '';
	likeCampaigns.slice(0,2).forEach((x) => {
		const d = document.createElement('div');
		d.className = 'bg-white rounded-lg shadow p-3 cursor-pointer';
		d.innerHTML = `
			<img src="${x.img}" class="w-full h-32 object-cover rounded mb-2"/>
			<p class="text-xs text-green-500">${x.dday}</p>
			<h3 class="font-medium">${x.title}</h3>
			<p class="text-xs text-gray-500">${x.info}</p>
			<p class="mt-1 text-sm flex justify-between">신청 ${x.applied}/${x.capacity}<span>❤ ${x.likes}</span></p>
		`;
		d.addEventListener('click', () => window.open(x.url,'_blank'));
		c.appendChild(d);
	});
}

function renderFavoriteSites() {
	const s = document.getElementById('favoriteSites');
	s.innerHTML = '';
	favoriteSites.forEach(x => {
		const a = document.createElement('a');
		a.href = x.url;
		a.target = '_blank';
		a.className = 'bg-white rounded-lg shadow p-4 text-center';
		a.textContent = x.name;
		s.appendChild(a);
	});
}

document.getElementById('likeMore').addEventListener('click', () => showView('likeAllView'));
document.getElementById('favMore').addEventListener('click', () => showView('favAllView'));
renderLikeCampaigns();
renderFavoriteSites();

// Like All
const cardContainer = document.getElementById('cardContainer');
const TOTAL = 100;
for(let i = 1; i <= TOTAL; i++) {
	const card = document.createElement('div');
	card.className = 'bg-white rounded-lg shadow p-3 cursor-pointer';
	const dday = (i % 10) + 1, ap = Math.floor(Math.random() * 100), cap = ap + Math.floor(Math.random() * 50 + 10), lk = Math.floor(Math.random() * 500);
	card.innerHTML = `
		<img src="https://source.unsplash.com/featured/?food&sig=${i}" class="w-full h-32 object-cover rounded mb-2"/>
		<p class="text-xs text-green-500">D-${dday}</p>
		<h3 class="font-medium">캠페인 ${i}</h3>
		<p class="text-xs text-gray-500">플랫폼 · 보상 정보</p>
		<p class="mt-1 text-sm flex justify-between">신청 ${ap}/${cap}<span>❤ ${lk}</span></p>
	`;
	card.addEventListener('click', () =>  window.open('https://www.reviewnote.co.kr/campaigns/658893', '_blank'));
	cardContainer.appendChild(card);
}
document.getElementById('likeCountHeader').textContent = TOTAL;

// Fav All
const siteList = document.getElementById('siteList');
const allSites = favoriteSites;
allSites.forEach(s => {
	const a=document.createElement('a');
	a.href=s.url;a.target='_blank';
	a.className='bg-white rounded-lg shadow p-3 flex items-center justify-center';
	a.textContent=s.name;
	siteList.appendChild(a);
});
document.getElementById('favCountHeader').textContent = allSites.length;