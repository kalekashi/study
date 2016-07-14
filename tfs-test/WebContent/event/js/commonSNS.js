
function facebookShare(data, callback, failCallback) {
    FB.getLoginStatus(function (response) {
        if (response.status === 'connected') {
            if (typeof callback == "function") {
                FB.api('/me', function (res) {
                    
					if (isMobile && mobileDeviceFlag == 'android') {
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
								$('.loading').hide();
                            }
                        } else {
                            if (typeof failCallback == "function") {
                                failCallback();
								$('.loading').hide();
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
						$('.loading').hide();
                    }
                }
            });
        }
    });
}


function kakakotalkShare(data, callback, failCallback) {
    if (!isMobile) {
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
				$('.loading').hide();
            }
        });
        setTimeout(function () {
            if (typeof callback == "function") {
                callback();
            }
        }, 3000);
    }
}

function kakaostoryShareLink(data, callback, failCallback) {
    var scrapURL = null;
    Kakao.Auth.getStatus(function (statusObj) {
        if (statusObj.status == 'connected') {
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
				$('.loading').hide();
                if (typeof failCallback == "function") {
                    failCallback(JSON.stringify(err));
                }
            });

        } else {
            Kakao.Auth.login({
                success: function (authObj) {
                    kakaostoryShareLink(data, callback, failCallback);
                },
                fail: function (err) {
					$('.loading').hide();
                    if (typeof failCallback == "function") {
                        failCallback(JSON.stringify(err));
                    }
                }
            });
        }
    });

}

function kakaoApiLogin(){
	var pop = window.open("/event/common/oauth/front.jsp", "pop", "width=400, height=400");
	if (pop){
		pop.focus();
	}
}

// data : imgData, contentData
function kakaoApiPhotoShare(data, callback){
	$.ajax({
		dataType: 'json',
		url: '/event/common/oauth/photoShare.jsp', 
		data: {
			scrapImg: data.imgData,
			scrapContent: data.contentData
		},
		cache: false,
		async: false,
		success: function(data) {
			callback(data);
		},
		error: function() {
			alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		}
	});
}

// data : imgData, contentData
function kakaoApiLinkShare(data, callback ){
	$.ajax({
		dataType: 'json',
		url: '/event/common/oauth/linkShare.jsp', 
		data: {
			scrapContent: data.scrapContent,
			scrapURL: data.scrapURL,
			requested_url: data.requested_url,
			scrapImg: data.scrapImg,
			scrapDescription: data.scrapDescription,
		},
		cache: false,
		async: false,
		success: function(data) {
			callback(data);
		},
		error: function() {
			alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		}
	});
}
