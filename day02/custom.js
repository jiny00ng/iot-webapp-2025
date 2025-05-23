$(document).ready(function() {
    $("#btnEffect").mouseenter(function() {
        alert("클릭함!");
    });
    
    // 박스변형 이벤트
    $("#box").css({
        width: 100,
        height: 100,
        backgroundColor: 'orange',
    }).on('click', function() { // 클릭 이벤트
        $(this).css({
            backgroundColor: 'red'
        });
    }).on('click', function() { // 마우스엔터 이벤트
        $(this).css({
            backgroundColor: 'blue',
            borderRadius: '50%',
        });
    }).on('mouseleave', function() { // 마우스리브 이벤트
        $(this).css({
            backgroundColor: 'orange',
            borderRadius: '0',
        });
    })

    // 시각효과
    $("#btnToggle").click(function() {
        // 토글효과
        $(".page").fadeToggle("slow");
    });
    
    // 애니메이션 효과
    $(".box").css({
        width: 100,
        height: 50,
        backgroundColor: 'red'
    });
    $("#btnAnimate").click(function() {
        $(".box").animate({
            width: 400,
            opacity: 0.6,
        }, 1000);
    });
});