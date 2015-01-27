if (typeof(window.console) == "undefined") { console = {}; console.log = console.warn = console.error = function(a) {}; }

(function(global){
console.log('read js start');
    "use strict";

}(this));

$(function(){
    "use strict";
    var $pagerNext = $('.pager-next');
    var $pagerPrev = $('.pager-previous');
    // function
    function togglePrevBtn (previous) {
        console.log("previous" + previous);
        $pagerPrev.data('page', previous);
        if (previous) {
            if (!$pagerPrev.hasClass('pager')) {
                $pagerPrev.addClass('pager');
            }
        }
        else {
            $pagerPrev.removeClass('pager');
        }
    };

    function toggleNextBtn (next) {
        console.log("next" + next);
        $pagerNext.data('page', next);
        if (next) {
            if (!$pagerNext.hasClass('pager')) {
                $pagerNext.addClass('pager');
            }
        }
        else {
            $pagerNext.removeClass('pager');
        }
    };

    // onload event
    toggleNextBtn(2);
    togglePrevBtn(0);

    // actionevent
    $('.video-pager-event').on('click', '.pager', function(){
        console.log('pager clicked!');
        var page = $(this).data('page');
        console.log("clicked" + page);

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
