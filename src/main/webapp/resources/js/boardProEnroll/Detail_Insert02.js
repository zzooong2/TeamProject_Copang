var directionL = document.getElementById("boardProEnroll_Next_Button1");
var directionR = document.getElementById("boardProEnroll_Next_Button2");
var submitButton = document.getElementById("boardProEnroll_Next_Button3");
var boardEnroll1 = document.getElementById("Detail_right_Contents1");
var boardEnroll2 = document.getElementById("Detail_right_Contents2");
var boardEnroll3 = document.getElementById("Detail_right_Contents3");
var boardEnroll4 = document.getElementById("Detail_right_Contents4");
var boardEnroll5 = document.getElementById("Detail_right_Contents5");

var boardGuide1 = document.getElementById("Detail_left_guide1");
var boardGuide2 = document.getElementById("Detail_left_guide2");
var boardGuide3 = document.getElementById("Detail_left_guide3");
var boardGuide4 = document.getElementById("Detail_left_guide4");
var boardGuide5 = document.getElementById("Detail_left_guide5");

var boardTitle1 = document.getElementById("Detail_left_text1");
var boardTitle2 = document.getElementById("Detail_left_text2");
var boardTitle3 = document.getElementById("Detail_left_text3");
var boardTitle4 = document.getElementById("Detail_left_text4");
var boardTitle5 = document.getElementById("Detail_left_text5");

directionR.addEventListener('click', function() {

    if (boardEnroll4.style.display == 'block') {
        boardEnroll5.style.display = 'block';
        boardEnroll4.style.display = 'none';
        boardEnroll3.style.display = 'none';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'none';

        directionL.style.display = "block";
        directionR.style.display = "none";
        submitButton.style.display = "block";

        boardGuide5.style.backgroundColor = '#ff8e47';
        boardGuide5.style.color = 'white';
        boardTitle5.style.color = 'black';
        boardGuide4.style.backgroundColor = 'white';
        boardGuide4.style.color = 'gray';
        boardTitle4.style.color = 'lightgray';
    } else if (boardEnroll3.style.display == 'block') {
        boardEnroll5.style.display = 'none';
        boardEnroll4.style.display = 'block';
        boardEnroll3.style.display = 'none';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'none';
        
        directionL.style.display = 'block';
        directionR.style.display = 'block';
        submitButton.style.display = "none";

        boardGuide4.style.backgroundColor = '#ff8e47';
        boardGuide4.style.color = 'white';
        boardTitle4.style.color = 'black';
        boardGuide3.style.backgroundColor = 'white';
        boardGuide3.style.color = 'gray';
        boardTitle3.style.color = 'lightgray';
    } else if (boardEnroll2.style.display == 'block') {
        boardEnroll5.style.display = 'none';
        boardEnroll4.style.display = 'none';
        boardEnroll3.style.display = 'block';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'none';
        
        directionL.style.display = 'block';
        directionR.style.display = 'block';
        submitButton.style.display = "none";

        boardGuide3.style.backgroundColor = '#ff8e47';
        boardGuide3.style.color = 'white';
        boardTitle3.style.color = 'black';
        boardGuide2.style.backgroundColor = 'white';
        boardGuide2.style.color = 'gray';
        boardTitle2.style.color = 'lightgray';
    } else if (boardEnroll1.style.display == 'block') {
        boardEnroll5.style.display = 'none';
        boardEnroll4.style.display = 'none';
        boardEnroll3.style.display = 'none';
        boardEnroll2.style.display = 'block';
        boardEnroll1.style.display = 'none';
        
        directionL.style.display = 'block';
        directionR.style.display = 'block';
        submitButton.style.display = "none";

        boardGuide2.style.backgroundColor = '#ff8e47';
        boardGuide2.style.color = 'white';
        boardTitle2.style.color = 'black';
        boardGuide1.style.backgroundColor = 'white';
        boardGuide1.style.color = 'gray';
        boardTitle1.style.color = 'lightgray';
    }

});

directionL.addEventListener('click', function() {
    
    if (boardEnroll5.style.display == 'block') {
        boardEnroll5.style.display = 'none';
        boardEnroll4.style.display = 'block';
        boardEnroll3.style.display = 'none';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'none';

        directionL.style.display = "block";
        directionR.style.display = "block";
        submitButton.style.display = "none";

        boardGuide4.style.backgroundColor = '#ff8e47';
        boardGuide4.style.color = 'white';
        boardTitle4.style.color = 'black';
        boardGuide5.style.backgroundColor = 'white';
        boardGuide5.style.color = 'gray';
        boardTitle5.style.color = 'lightgray';
    } else if (boardEnroll4.style.display == 'block') {
        boardEnroll5.style.display = 'none';
        boardEnroll4.style.display = 'none';
        boardEnroll3.style.display = 'block';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'none';
        
        directionL.style.display = 'block';
        directionR.style.display = 'block';
        submitButton.style.display = "none";

        boardGuide3.style.backgroundColor = '#ff8e47';
        boardGuide3.style.color = 'white';
        boardTitle3.style.color = 'black';
        boardGuide4.style.backgroundColor = 'white';
        boardGuide4.style.color = 'gray';
        boardTitle4.style.color = 'lightgray';
    } else if (boardEnroll3.style.display == 'block') {
        boardEnroll5.style.display = 'none';
        boardEnroll4.style.display = 'none';
        boardEnroll3.style.display = 'none';
        boardEnroll2.style.display = 'block';
        boardEnroll1.style.display = 'none';
        
        directionL.style.display = 'block';
        directionR.style.display = 'block';
        submitButton.style.display = "none";

        boardGuide2.style.backgroundColor = '#ff8e47';
        boardGuide2.style.color = 'white';
        boardTitle2.style.color = 'black';
        boardGuide3.style.backgroundColor = 'white';
        boardGuide3.style.color = 'gray';
        boardTitle3.style.color = 'lightgray';
    } else if (boardEnroll2.style.display == 'block') {
        boardEnroll5.style.display = 'none';
        boardEnroll4.style.display = 'none';
        boardEnroll3.style.display = 'none';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'block';
        
        directionL.style.display = 'none';
        directionR.style.display = 'block';
        submitButton.style.display = "none";

        boardGuide1.style.backgroundColor = '#ff8e47';
        boardGuide1.style.color = 'white';
        boardTitle1.style.color = 'black';
        boardGuide2.style.backgroundColor = 'white';
        boardGuide2.style.color = 'gray';
        boardTitle2.style.color = 'lightgray';
    }

})

var toggleSwitch = document.getElementById("right_toggle_slider");
var toggleSwitchContents = document.getElementById("toggleContent");
var toggleContentOn = document.getElementById("toggleContentOn");
var toggleContentOff = document.getElementById("toggleContentOff");

toggleSwitch.addEventListener('change', function () {
    if (toggleSwitch.checked) {
        toggleContentOn.style.display = 'block';
        toggleSwitchContents.style.display = 'block';
        toggleContentOff.style.display = 'none';
    } else {
        toggleContentOn.style.display = 'none';
        toggleSwitchContents.style.display = 'none';
        toggleContentOff.style.display = 'block';
    }
});