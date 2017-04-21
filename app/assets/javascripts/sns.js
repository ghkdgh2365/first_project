$(document).ready(function(){

    // 페이스북 - https://developers.facebook.com
    // 페이스북 개발자 페이지 로그인후 설정해야함
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.6&appId=398218593862248";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    $('.fshare').click(function(){
      var message_id  = $(this).data("id");
      var message = $("#" + message_id).text();

      FB.ui({
          method: 'share',
          name: '테스트 문구1',
          href: page_url,
          caption: '테스트 문구2',
          description: message
      });
    });

});