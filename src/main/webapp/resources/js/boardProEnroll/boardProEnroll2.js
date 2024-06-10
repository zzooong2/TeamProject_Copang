
var toggleSwitch = document.getElementById("right_toggle_slider");
var toggleContentOn = document.getElementById("toggleContentOn");
var toggleContentOff = document.getElementById("toggleContentOff");

toggleSwitch.addEventListener('change', function () {
    if (toggleSwitch.checked) {
        toggleContentOn.style.display = 'block';
        toggleContentOff.style.display = 'none';
    } else {
        toggleContentOn.style.display = 'none';
        toggleContentOff.style.display = 'block';
    }
});




// 요소들의 ID를 변수로 할당
var toggleSwitch = document.getElementById("right_toggle_slider");
var toggleContentOn = document.getElementById("toggleContentOn");
var toggleContentOff = document.getElementById("toggleContentOff");
var mainCategorySelect = document.getElementById("Detail_right_Contents1_Category_Style");
var middleCategorySelect = document.getElementById("Detail_right_middleCategory_select3");

// 요소 표시 여부를 변경하는 함수
function toggleDisplay(element, displayValue) {
    element.style.display = displayValue;
}

// 선택된 옵션 초기화하는 함수
function resetSelectedOptions() {
}

// 토글 스위치 상태에 따라 요소 표시 여부를 변경하는 함수
function toggleElementsDisplay(value) {
    var isToggleSwitchOn = toggleSwitch.checked;

    if (isToggleSwitchOn) {
        handleCategoryChangeForToggleOn(value);
    } else {
        handleCategoryChangeForToggleOff(value);
    }
}

// 토글 스위치 버튼이 ON일 때의 카테고리 선택에 따른 표시 여부를 변경하는 함수
function handleCategoryChangeForToggleOn(value) {
    // Data 항목 표시 여부를 변경
    toggleDisplay(document.getElementById("Detail_right_Data"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Data_IT"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Data_Design"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Data_Media"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Data_Marketing"), 'none');

    // Function 항목 표시 여부를 변경
    toggleDisplay(document.getElementById("Detail_right_Function"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Function_IT"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Function_Design"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Function_Media"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Function_Photo"), 'none');
    toggleDisplay(document.getElementById("Detail_right_Function_Marketing"), 'none');
	

    // 대분류에 따라 표시할 Data 및 Function 항목 결정
    if (value === "IT·프로그래밍") {
        toggleDisplay(document.getElementById("Detail_right_Data_IT"), 'flex');
        toggleDisplay(document.getElementById("Detail_right_Function_IT"), 'flex');
    } else if (value === "디자인") {
        toggleDisplay(document.getElementById("Detail_right_Data_Design"), 'flex');
        toggleDisplay(document.getElementById("Detail_right_function_list_package"), 'none');
		
    } else if (value === "영상·사진") {
        var mediaType = middleCategorySelect.value; // 중분류 선택 변수 사용

        if (mediaType === "영상") {
	        toggleDisplay(document.getElementById("Detail_right_Data_Media"), 'flex');
            toggleDisplay(document.getElementById("Detail_right_Function_Media"), 'flex');
        } else if (mediaType === "사진") {
	        toggleDisplay(document.getElementById("Detail_right_Data_Media"), 'flex');
            toggleDisplay(document.getElementById("Detail_right_Function_Photo"), 'flex');
        }
    } else if (value === "마케팅") {
        toggleDisplay(document.getElementById("Detail_right_Data_Marketing"), 'flex');
    } else if (value === "교육") {

    }
}

// 토글 스위치 버튼이 OFF일 때의 카테고리 선택에 따른 표시 여부를 변경하는 함수
function handleCategoryChangeForToggleOff(value) {
    // Data 항목 표시 여부를 변경
    toggleDisplay(document.getElementById("Detail_right_SingleData"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleData_IT"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleData_Design"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleData_Media"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleData_Marketing"), 'none');

    // Function 항목 표시 여부를 변경
    toggleDisplay(document.getElementById("Detail_right_SingleFunction"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleFunction_IT"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleFunction_Design"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleFunction_Media"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleFunction_Photo"), 'none');
    toggleDisplay(document.getElementById("Detail_right_SingleFunction_Marketing"), 'none');

    // 대분류에 따라 표시할 Data 및 Function 항목 결정
    if (value === "IT·프로그래밍") {
        toggleDisplay(document.getElementById("Detail_right_SingleData_IT"), 'flex');
        toggleDisplay(document.getElementById("Detail_right_SingleFunction_IT"), 'flex');
    } else if (value === "디자인") {
        toggleDisplay(document.getElementById("Detail_right_SingleData_Design"), 'flex');
    } else if (value === "영상·사진") {
        toggleDisplay(document.getElementById("Detail_right_SingleData_Media"), 'flex');
        var mediaType = middleCategorySelect.value; // 중분류 선택 변수 사용
        if (mediaType === "영상") {
            toggleDisplay(document.getElementById("Detail_right_SingleFunction_Media"), 'flex');
        } else if (mediaType === "사진") {
            toggleDisplay(document.getElementById("Detail_right_SingleFunction_Photo"), 'flex');
        }
    } else if (value === "마케팅") {
        toggleDisplay(document.getElementById("Detail_right_SingleData_Marketing"), 'flex');
    } else if (value === "교육") {
    }
}

// 항목의 표시 여부를 변경하는 함수
function toggleDisplay(element, displayValue) {
    if (element) {
        element.style.display = displayValue;
    }
}

// 카테고리 선택 변경 이벤트 핸들러
mainCategorySelect.addEventListener('change', function() {
    resetSelectedOptions(); // 선택된 옵션 초기화
    toggleElementsDisplay(this.value);
});

// 중분류 선택 변경 이벤트 핸들러
middleCategorySelect.addEventListener('change', function() {
    toggleElementsDisplay(mainCategorySelect.value); // 대분류 선택 값 전달
});

// 토글 스위치 변경 이벤트 핸들러
toggleSwitch.addEventListener('change', function () {
    resetSelectedOptions(); // 선택된 옵션 초기화
    toggleElementsDisplay(mainCategorySelect.value);
});






