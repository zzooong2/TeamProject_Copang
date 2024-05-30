var directionL = document.getElementById("boardProEnroll_Next_Button1");
var directionR = document.getElementById("boardProEnroll_Next_Button2");
var boardEnroll1 = document.getElementById("Detail_right_Contents1");
var boardEnroll2 = document.getElementById("Detail_right_Contents2");




directionR.addEventListener('click', function() {
    if(directionL.style.display = 'none') {
        directionL.style.display = 'block';
        boardEnroll1.style.display = 'none';
        boardEnroll2.style.display = 'block';
    } else if (boardEnroll1.style.display = 'none') {
        boardEnroll2.style.display = 'none';
        boardEnroll3.style.display = 'block';
    } else if (boardEnroll2.style.display = 'none') {
        boardEnroll3.style.display = 'none';
        boardEnroll4.style.display = 'block';
    }
})

directionL.addEventListener('click', function() {
    if(boardEnroll2.style.display = 'block') {
        directionL.style.display = 'none';
        boardEnroll1.style.display = 'block';
        boardEnroll2.style.display = 'none';
    }
})










var toggleSwitch = document.getElementById("right_toggle_slider");
var toggleSwitchContects = document.getElementById("toggleContent");
var toggleContentOn = document.getElementById("toggleContentOn");
var toggleContentOff = document.getElementById("toggleContentOff");

toggleSwitch.addEventListener('change', function () {
    if (toggleSwitch.checked) {
        toggleContentOn.style.display = 'block';
        toggleSwitchContects.style.display = 'block';
        toggleContentOff.style.display = 'none';
    } else {
        toggleContentOn.style.display = 'none';
        toggleSwitchContects.style.display = 'none';
        toggleContentOff.style.display = 'block';
    }
});






