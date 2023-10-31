// jQuery 라이브러리를 로드합니다.
const $ = require('jquery');

    // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
    const floatPosition = parseInt($("#floatMenu").css('top'));
    // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

    $(window).scroll(function() {
        // 현재 스크롤 위치를 가져온다.
        const scrollTop = $(window).scrollTop();
        const newPosition = scrollTop + floatPosition + "px";

        $("#floatMenu").stop().animate({
            "top" : newPosition
        }, 100);

    }).scroll();



    //마이크 버튼 누르면 내려오는 창

    function openMicBox() {
    document.getElementById("myMicBox").style.height = "430px";
}

    function closeMicBox() {
    document.getElementById("myMicBox").style.height = "0";
}


const store = {
    texts: '',
    isRecognizing: true
};

(() => {
    /* Speech API start */
    let SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
    if (!("webkitSpeechRecognition" in window)) {
        alert("지원 안되는 브라우저 입니다. !");
    } else {
        const recognition = new SpeechRecognition();
        recognition.interimResults = true; // true면 음절을 연속적으로 인식하나 false면 한 음절만 기록함
        recognition.lang = 'ko-KR'; // 값이 없으면 HTML의 <html lang="en">을 참고합니다. ko-KR, en-US
        recognition.continuous = false; //각 인식에 대해 연속 결과가 반환되는지 아니면 단일 결과만 반환되는지를 제어합니다. 기본값은 단일( false.)
        recognition.maxAlternatives = 20000; // maxAlternatives가 숫자가 작을수록 발음대로 적고, 크면 문장의 적합도에 따라 알맞은 단어로 대체합니다.

        recognition.onspeechend = function() { // 음성 감지가 끝날때 실행될 이벤트
            recognition.stop();
            $('.dictate').classList.remove("on");
            store.isRecognizing = true;
        };

        recognition.onresult = function(e) { //result이벤트는 음성 인식 서비스가 결과를 반환할 때 시작됩니다.
            store.texts = Array.from(e.results)
                .map(results => results[0].transcript).join("");

            console.log(store.texts)
            $('input').value = store.texts;
        };
        /* // Speech API END */

        const active = () => {
            if (store.isRecognizing) {
                $('.dictate').classList.add('on')
                recognition.start();
                store.isRecognizing = false;
            } else {
                $('.dictate').classList.remove('on')
                recognition.stop();
                store.isRecognizing = true;
            }
        };

        const unactive = () => {
            $('.dictate').classList.remove('on')
            recognition.stop();
            store.isRecognizing = true;
        };

    }
})();

// 위치 정보 가져오기 자바스크립트


$(function() {
    // myLocation 버튼에 이벤트 핸들러 바인딩
    const $myLocation = $("#myLocation");

    // $myLocation 요소가 존재하면 이벤트를 바인딩합니다.
    if ($myLocation) {
        $myLocation.click(function() {
            navigator.geolocation.getCurrentPosition(success, error, options);
        });
    }
});