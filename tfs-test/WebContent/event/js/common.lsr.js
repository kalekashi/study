var isMobile = {
	Android: function () {
		return navigator.userAgent.match(/Android/i) ? true : false;
	},
	BlackBerry: function () {
		return navigator.userAgent.match(/BlackBerry/i) ? true : false;
	},
	iOS: function () {
		return navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;
	},
	Windows: function () {
		return navigator.userAgent.match(/IEMobile/i) ? true : false;
	},
	any: function () {
		//return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Windows());
		// 일단 카톡 지원하는 기기만 넣기..
		return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS());
	}
};

//Blog Scrap swf Button params
var params = {
    text: 'high',
    image: 'true',
    callbackScript: 'false',
    allowScriptAccess: 'samedomain',
    wmode: 'transparent',
    scale: 'noscale',
    bgcolor: '#ffebea',
    play: 'true',
    loop: 'true',
    salign: ''
}

//Facebook Share
/*
var data = {};
data.link = '';
data.picture = '';
data.name = '';
data.description = '';
facebookShare(data, function (userId, userName, scrapURL) {	
	alert('공유가 완료되었습니다.');
}, function () {
	alert("페이스북 인증 후 사용 가능합니다.");
});
*/
function facebookShare(data, callback, failCallback) {
	FB.getLoginStatus(function (response) {
		if (response.status === 'connected') {
			if (typeof callback == "function") {
				FB.api('/me', function (res) {
					if (isMobile.Android()) {
						$('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0');
					}
					FB.ui({
                		method: 'feed',
                		link: data.link,
                		picture: data.picture,
                		name: data.name,
                		description: data.description,
                		display: data.display
					}, function (resp) {
						if (resp && resp.post_id) {
							var postId = resp.post_id;
                			postId = postId.split("_");
                			var scrapURL = 'https://www.facebook.com/permalink.php?story_fbid=' + postId[1] + '&id=' + postId[0];

                			if (typeof callback == "function") {
                				callback(response.authResponse.userID, res.name, scrapURL);
                			}
                		} else {
                			if (typeof failCallback == "function") {
                				failCallback();
                			}
                		}
					});
				});
			}
		} else {
			FB.login(function (response) {
				if (response.authResponse) {
					facebookShare(data, callback, failCallback);
				} else {
					if (typeof failCallback == "function") {
						failCallback();
					}
				}
			});
		}
	});
}

//Twitter Login
/*
function twitterAfterLogin(response) {
	if (response) {		
	} else {
		alert('트위터 인증 후 사용 가능합니다.');
	}
}
*/
function twitterLogin() {
	var pop = window.open('https://' + location.host + '/Subscription/Twitter/LoginCheck', 'twitterJoin', 'width=1024, height=600');
	if (pop == null) {
		alert('팝업이 차단되어 있어서 정상적인 진행이 어렵습니다. \n[도구 > 팝업차단] 에서 \'팝업 차단 사용 안 함\' 으로 설정해 주시기 바랍니다. ');
		return;
	}
}

//Kakao Talk Share
/*
var data = {};
data.label = '';
data.btnText = '';
data.link = '';
data.image = '';	
kakaotalkShare(data, function () {	
	alert('공유가 완료되었습니다.');
}, function () {
	alert("카카오톡 설치 가능한 모바일기기에서만 사용 가능합니다.");
});
*/
function kakaotalkShare(data, callback, failCallback) {
	if (!isMobile.any()) {
		if (typeof failCallback == "function") {
			failCallback();
		}
	} else {
		Kakao.Link.sendTalkLink({
			label: data.label,
			webButton: {
				text: data.btnText,
				url: data.link
			},
			image: {
				src: data.image,
				width: '300',
				height: '200'
			},
			fail: function () {
				alert('카카오톡 공유는 모바일로만 가능합니다.');
			}
		});
		setTimeout(function () {
			if (typeof callback == "function") {
				callback();
			}
		}, 3000);
	}
}

//Kakao Story Share : Image
/*
var data = {};
data.picture = '';
data.content = '';
kakaostoryShareImage(data, function (userId, userName, scrapURL) {	
	alert('공유가 완료되었습니다.');
}, function (error) {
	alert(error);
});
*/
function kakaostoryShareImage(data, callback, failCallback) {
	var scrapURL = null;
	Kakao.Auth.getStatus(function(statusObj){
		if(statusObj.status == 'connected'){
			Kakao.API.request({
				url: '/v1/api/story/post/photo',
				data: {
					image_url_list: [data.picture],
					content: data.content
				}
			}).then(function (res) {
				scrapURL = 'https://story.kakao.com/' + res.id;

				return Kakao.API.request({
					url: '/v1/user/me'
				});
			}).then(function (res) {
				if (typeof callback == "function") {
					callback(res.id, res.properties.nickname, scrapURL);
				}
			}, function (err) {
				if (typeof failCallback == "function") {
					failCallback(JSON.stringify(err));
				}
			});
		} else {
			Kakao.Auth.login({
				success: function (authObj) {
					kakaostoryShareImage(data, callback, failCallback);
				},
				fail: function (err) {
					if (typeof failCallback == "function") {
						failCallback(JSON.stringify(err));
					}
				}
			});
		}
	});	
}

//Kakao Story Share : Link
/*
var data = {};
data.url = '';
data.content = '';
kakaostoryShareLink(data, function (userId, userName, scrapURL) {	
	alert('공유가 완료되었습니다.');
}, function (error) {
	alert(error);
});
*/
function kakaostoryShareLink(data, callback, failCallback) {
	var scrapURL = null;
	Kakao.Auth.getStatus(function(statusObj){
		if(statusObj.status == 'connected'){
			Kakao.API.request({
				url: '/v1/api/story/linkinfo',
				data: {
					url: data.url
				}
			}).then(function (res) {
				// 이전 API 호출이 성공한 경우 다음 API를 호출합니다.
				return Kakao.API.request({
					url: '/v1/api/story/post/link',
					data: {
						link_info: res,
						content: data.content
					}
				});
			}).then(function (res) {
				scrapURL = 'https://story.kakao.com/' + res.id;

				return Kakao.API.request({
					url: '/v1/user/me'
				});
			}).then(function (res) {
				if (typeof callback == "function") {
					callback(res.id, res.properties.nickname, scrapURL);
				}
			}, function (err) {
				if (typeof failCallback == "function") {
					failCallback(JSON.stringify(err));
				}
			});

		} else{
			Kakao.Auth.login({
				success: function (authObj) {
					kakaostoryShareLink(data, callback, failCallback);			
				},
				fail: function (err) {
					if (typeof failCallback == "function") {
						failCallback(JSON.stringify(err));
					}
				}
			});
		}
	});
	
}