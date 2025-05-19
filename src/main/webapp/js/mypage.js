/**
 * mypage.js
 */
// My Tags
const tags = ['#맛집','#여행','#문화'];
const myTags = document.getElementById('myTags');
tags.forEach(t => {
	const b=document.createElement('button');
	b.className='px-3 py-1 bg-gray-200 rounded-full text-sm';
	b.textContent=t;myTags.appendChild(b);
});

// Dummy counts
document.getElementById('myLikeCount').textContent = likeCampaigns.length;
document.getElementById('myRecentCount').textContent = 5;
