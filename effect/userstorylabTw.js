$(document).ready(function() {
    var cb = new Codebird;
    cb.setConsumerKey();
    cb.setToken();
    var params = {
        'screen_name': 'userstorylab',
        'count':1
    };
    cb.__call(
        'statuses_userTimeline',
        params,
        function (reply) {
//            console.log(reply);
//            alert(autolink(reply[0].text));
//            alert(getAgoDate(reply[0].created_at));
            
            $("#recent_tweet p").html(autolink(reply[0].text));
//          $("#recent_tweet span").html(getAgoDate(reply[0].created_at));
        }
    );

    
});

function autolink(doc) {
    var regURL = new RegExp("(http|https|ftp|telnet|news|irc)://([-/.a-zA-Z0-9_~#%$?&=:200-377()]+)","gi");
    var regEmail = new RegExp("([xA1-xFEa-z0-9_-]+@[xA1-xFEa-z0-9-]+\\.[a-z0-9-]+)","gi");
    return doc.replace(regURL,"<a href='$1://$2' target='_blank\'>$1://$2</a>").replace(regEmail,"<a href='mailto:$1'>$1</a>");
}

var getAgoDate = function (stamp) {
    return parseAgoDate(new Date(Date.parse(stamp)));
}
var parseAgoDate = function (date) {

    var now = new Date();
    var diff = Math.floor((now.getTime() - date.getTime()) / 1000);

    if (diff < 60) {
        return diff + '초 전';

    } else if (diff < 60 * 60) {
        return Math.floor(diff / 60) + '분 전';

    } else if (diff < 60 * 60 * 24) {
        return Math.floor(diff / (60 * 60)) + '시간 전';

    } else if (diff < 60 * 60 * 24 * 7) {
        return Math.floor(diff / (60 * 60 * 24)) + '일 전';

    } else {
        var temp = now.getFullYear() - date.getFullYear();
        if (temp > 0) {
            return temp + '년 전';
        }
        temp = now.getMonth() - date.getMonth();
        if (temp > 0) {
            return temp + '개월 전'
        }
        return Math.floor(diff / (60 * 60 * 24 * 7)) + '주일 전';
    }
}