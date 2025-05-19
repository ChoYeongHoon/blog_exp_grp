/**
 * common.js
 */


// View 전환
const views = document.querySelectorAll('.view');
const tabButtons = document.querySelectorAll('.tab-btn');
const btnBack = document.getElementById('btn-back');
const btnWrite = document.getElementById('btn-write');
const headerTitle = document.getElementById('headerTitle');

function showView(id) {
	views.forEach(v => v.classList.add('hidden'));
	document.getElementById(id).classList.remove('hidden');
	const titles = {homeView:'홈', communityView:'커뮤니티', searchView:'검색', likeView:'LIKE', myView:'내정보'};
	headerTitle.textContent = titles[id] || '';
	
	// back/write buttons
	btnBack.classList.toggle('opacity-0', id !== 'communityView' && id !== 'detailView' && id !== 'writeView');
	btnWrite.classList.toggle('opacity-0', id !== 'communityView');
	tabButtons.forEach(b => b.classList.replace('text-green-400','text-gray-400'));
	document.querySelector(`[data-view="${id}"]`).classList.replace('text-gray-400','text-green-400');
}

tabButtons.forEach(b => b.addEventListener('click', () => showView(b.dataset.view)));
showView('homeView');

// 공통변수
var campaigns = []; // 체험단 데이터
var home_pageNo = 1;
var home_category  = "0";

var search_pageNo = 1;

var window_protocol = window.location.protocol;
var window_hostname = window.location.hostname;
var window_port = window.location.port;
var window_origin = window.location.origin;

var contextPath = "${pageContext.request.contextPath}";

/**
 * sendRequest
 * 
 * apiUrl : API 주소
 * method: POST, GET
 * data : object 타입
 */
function sendRequest(apiUrl, data, callback) {
	if(apiUrl == null || apiUrl == "") {
		alert("apiUrl 오류");
		return false;
	}
	if(data == null || data == "") {
		alert("data 오류");
		return false;
	}
	
	// fetch
	fetch(apiUrl, {
		method: "POST",
		headers: { 'Content-Type' : 'application/json', 'Accept' : 'application/json' },
		body: JSON.stringify(data)
	})
	.then(response => {
		// 응답 상태 확인
		if (!response.ok) {
			throw new Error('네트워크 응답에 문제가 있습니다');
		}
		return response.json(); // 또는 .text() 등
	})
	.then(data => {
		// 서버로부터 받은 데이터를 처리
		if(callback && typeof callback === 'function') {
			callback(data); // 콜백에 응답 데이터 전달
		}
	})
	.catch(error => {
		// 에러 처리
		console.error('에러 발생:', error);
	});
}