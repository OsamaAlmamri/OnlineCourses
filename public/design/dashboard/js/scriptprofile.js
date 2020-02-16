/*
found this function here 
http://stackoverflow.com/a/26831113
*/

function inViewport($el) {
    var H=$(window).height(),
        r = $el[0].getBoundingClientRect(), t=r.top, b=r.bottom;
    return Math.max(0, t>0? H-t : (b<H?b:H));
}

$(window).on("scroll resize", function(){
    var window_offset=inViewport($('.intro'));
    $(".overlay").height(window_offset);
    $(".caption").css("bottom", (window_offset/ 4) );
});