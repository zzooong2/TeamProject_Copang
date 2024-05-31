var directionL = document.getElementById("boardProEnroll_Next_Button1");
var directionR = document.getElementById("boardProEnroll_Next_Button2");
var boardEnroll1 = document.getElementById("Detail_right_Contents1");
var boardEnroll2 = document.getElementById("Detail_right_Contents2");

var boardguide1 = document.getElementById("Detail_left_guide_Change1");
var boardguide2 = document.getElementById("Detail_left_guide_Change2");
var boardguide3 = document.getElementById("Detail_left_guide_Change3");
var boardguide4 = document.getElementById("Detail_left_guide_Change4");
var boardguide5 = document.getElementById("Detail_left_guide_Change5");

var boardtitle1 = document.getElementById("Detail_left_Chane_text1");
var boardtitle2 = document.getElementById("Detail_left_Chane_text2");
var boardtitle3 = document.getElementById("Detail_left_Chane_text3");
var boardtitle4 = document.getElementById("Detail_left_Chane_text4");
var boardtitle5 = document.getElementById("Detail_left_Chane_text5");

document.getElementsByClassName

directionR.addEventListener('click', function() {
    if(directionL.style.display = 'none') {
        directionL.style.display = 'block';
        boardEnroll1.style.display = 'none';
        boardEnroll2.style.display = 'block';
        boardguide1.style.backgroundColor = '';
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






