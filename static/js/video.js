if (typeof(window.console) == "undefined") { console = {}; console.log = console.warn = console.error = function(a) {}; }

(function(global){
console.log('read js start');
    "use strict";

}(this));

$(function(){
    "use strict";
    // function
    function togglePrevBtn (previous) {
        console.log("previous" + previous);
        var pagerPrev = $('.pager-previous');
        pagerPrev.data('page', previous);
        if (previous) {
            if (pagerPrev.hasClass('video-non-disp')) {
                pagerPrev.removeClass('video-non-disp');
            }
            if (!pagerPrev.hasClass('video-inline-disp')) {
                pagerPrev.addClass('video-inline-disp');
            }
        }
        else {
            if (!pagerPrev.hasClass('video-non-disp')) {
                pagerPrev.addClass('video-non-disp');
            }
            if (pagerPrev.hasClass('video-inline-disp')) {
                pagerPrev.removeClass('video-inline-disp');
            }
        }
    };

    function toggleNextBtn (next) {
        console.log("next" + next);
        var pagerNext = $('.pager-next');
        pagerNext.data('page', next);
        if (next) {
            if (pagerNext.hasClass('video-non-disp')) {
                pagerNext.removeClass('video-non-disp');
            }
            if (!pagerNext.hasClass('video-inline-disp')) {
                pagerNext.addClass('video-inline-disp');
            }
        }
        else {
            if (!pagerNext.hasClass('video-non-disp')) {
                pagerNext.addClass('video-non-disp');
            }
            if (pagerNext.hasClass('video-inline-disp')) {
                pagerNext.removeClass('video-inline-disp');
            }
        }
    };

    // onload event
    toggleNextBtn(2);
    togglePrevBtn(0);

    // actionevent
    $('.pager').click(function(){
        console.log('pager clicked!');
        var page = $(this).data('page');
        console.log(page);

        $.ajax({
            type: "GET",
            url : "/videos_ajax",
            dataType: "json",
            data: {
                page: parseInt(page),
            },
            error: function(data) {
                console.log("!ajax callback error function called.");
                console.log(data);
            },
            success: function(responseData) {
                console.log("ajax callback success function called.");
                console.log(responseData);
                var status = parseInt(responseData.status);
                if (status === 1) {
                    // success
                    $('#video-list').html(responseData.videosHTML);
                    toggleNextBtn(responseData.pager.next);
                    togglePrevBtn(responseData.pager.previous);
                }
                else {
                    // response 200 but error
                }
            },
        });
    });
});
