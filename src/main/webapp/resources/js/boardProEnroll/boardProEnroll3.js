document.addEventListener('DOMContentLoaded', function() {
    var boldButton = document.querySelector('.Detail_right_Contents3_Boldbutton');
    var italicButton = document.querySelector('.Detail_right_Contents3_Italicbutton');
    var underlineButton = document.querySelector('.Detail_right_Contents3_Underlinebutton');
    var contentEditableDiv = document.querySelector('.Detail_right_Contents3_Textbox');
    
    boldButton.addEventListener('click', function() {
        applyStyle('bold');
        contentEditableDiv.focus();
        boldButton.classList.toggle('active');
    });

    italicButton.addEventListener('click', function() {
        applyStyle('italic');
        contentEditableDiv.focus();
        italicButton.classList.toggle('active');
    });

    underlineButton.addEventListener('click', function() {
        applyStyle('underline');
        contentEditableDiv.focus();
        underlineButton.classList.toggle('active');
    });

    function applyStyle(style) {
        
        contentEditableDiv.focus();
        document.execCommand(style, false, null);
    }
});


var directionL = document.getElementById("boardProEnroll_Next_Button1");
var directionR = document.getElementById("boardProEnroll_Next_Button2");
var submitButton = document.getElementById("boardProEnroll_Next_Button3");
var boardEnroll1 = document.getElementById("Detail_right_Contents1");
var boardEnroll2 = document.getElementById("Detail_right_Contents2");
var boardEnroll3 = document.getElementById("Detail_right_Contents3");
var boardEnroll4 = document.getElementById("Detail_right_Contents4");

var boardGuide1 = document.getElementById("Detail_left_guide1");
var boardGuide2 = document.getElementById("Detail_left_guide2");
var boardGuide3 = document.getElementById("Detail_left_guide3");
var boardGuide4 = document.getElementById("Detail_left_guide4");

var boardTitle1 = document.getElementById("Detail_left_text1");
var boardTitle2 = document.getElementById("Detail_left_text2");
var boardTitle3 = document.getElementById("Detail_left_text3");
var boardTitle4 = document.getElementById("Detail_left_text4");

directionR.addEventListener('click', function() {

        if (boardEnroll3.style.display == 'block') {
        boardEnroll4.style.display = 'block';
        boardEnroll3.style.display = 'none';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'none';
        
        directionL.style.display = 'block';
        directionR.style.display = 'none';
        submitButton.style.display = "block";

        boardGuide4.style.backgroundColor = '#ff8e47';
        boardGuide4.style.color = 'white';
        boardTitle4.style.color = 'black';
        boardGuide3.style.backgroundColor = 'white';
        boardGuide3.style.color = 'gray';
        boardTitle3.style.color = 'lightgray';
    } else if (boardEnroll2.style.display == 'block') {
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
    
        if (boardEnroll4.style.display == 'block') {
        boardEnroll4.style.display = 'none';
        boardEnroll3.style.display = 'block';
        boardEnroll2.style.display = 'none';
        boardEnroll1.style.display = 'none';
        
        directionL.style.display = "block";
        directionR.style.display = "block";
        submitButton.style.display = "none";

        boardGuide3.style.backgroundColor = '#ff8e47';
        boardGuide3.style.color = 'white';
        boardTitle3.style.color = 'black';
        boardGuide4.style.backgroundColor = 'white';
        boardGuide4.style.color = 'gray';
        boardTitle4.style.color = 'lightgray';
    } else if (boardEnroll3.style.display == 'block') {
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

});


function Counter(text, limit) {
	let detailByte = 0;
	var patten1 = /[가-힣ㄱ-ㅎㅏ-ㅣ]/;
	var str = text.value;
	var strValueSplit = str.split("");
	
	for(i=0; i<strValueSplit.length; i++) {
		if(patten1.test(strValueSplit[i])){
			detailByte += 3;
		} else {
			detailByte += 1;
		}
	}
	if(detailByte>limit) {
		text.value = str.substring(0, limit);
		text.focus();
	}
}


