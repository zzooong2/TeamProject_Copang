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
