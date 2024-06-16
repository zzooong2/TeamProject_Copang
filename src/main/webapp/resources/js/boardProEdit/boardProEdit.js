// /////////////////////////////////////////// 카테고리 분류 입력 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// 중분류 데이터
const middleCategories = {
    "IT·프로그래밍": ["UX기획", "웹", "프로그램", "커머스"],
    "디자인": ["로고·브랜딩", "인쇄 홍보물", "마케팅 디자인", "웹·모바일 디자인"],
    "영상·사진": ["영상", "사진"],
    "마케팅": ["채널 활성화", "바이럴·체험단", "PR·행사", "업종·목적별"],
    "교육": ["외국어", "미술·글쓰기", "댄스·뮤직"]
};

// 소분류 데이터
const subCategories = {
    "UX기획": ["스토리보드", "기타 기획"],
    "웹": ["홈페이지", "퍼블리싱", "유지보수"],
    "프로그램": ["PC·웹프로그램", "서버·클라우드", "봇·챗봇"],
    "커머스": ["쇼핑몰", "쇼핑몰(웹빌더·CMS)", "쇼핑몰(카페24)", "쇼핑몰 수정·유지보수"],
    "로고·브랜딩": ["로고 디자인", "브랜드 디자인 가이드"],
    "인쇄 홍보물": ["명함", "전단지·포스터·인쇄물", "현수막·X배너", "메뉴판"],
    "마케팅 디자인": ["상세페이지", "SNS·썸네일 디자인", "채널아트 디자인", "방송용 아바타", "배너·배달어플", "블로그·카페 디자인"],
    "웹·모바일 디자인": ["명함", "전단지·포스터·인쇄물", "현수막·X배너", "메뉴판"],
    "영상": ["광고·홍보영상", "업종별 영상", "제품영상", "교육영상", "애니메이션"],
    "사진": ["제품·홍보사진", "개인·프로필사진", "사진보정", "이벤트 사진"],
    "채널 활성화": ["블로그 관리", "카페 관리", "인스타그램 관리", "유튜브 관리"],
    "바이럴·체험단": ["체험단·기자단", "개인 인플루언서", "바이럴·포스팅"],
    "PR·행사": ["언론홍보", "행사·이벤트"],
    "업종·목적별": ["종합광고대행", "스토어 마케팅", "지도 마케팅", "라이브커머스"],
    "외국어": ["영어 레슨", "기타 외국어 레슨"],
    "미술·글쓰기": ["미술·드로잉 레슨", "글쓰기 레슨"],
    "댄스·뮤직": ["댄스 레슨", "음악 레슨"]
};

// 중분류 업데이트 함수
function updateMiddleCategory() {
    const mainCategorySelect = document.getElementById('Detail_right_Contents1_Category_Style');
    const middleCategorySelect = document.getElementById('Detail_right_middleCategory_select');
    const selectedMainCategory = mainCategorySelect.value;

    // 중분류 옵션 초기화
    middleCategorySelect.innerHTML = '<option value="">중분류를 선택해주세요.</option>';

    if (selectedMainCategory && middleCategories[selectedMainCategory]) {
        middleCategories[selectedMainCategory].forEach(category => {
            const option = document.createElement('option');
            option.value = category;
            option.textContent = category;
            middleCategorySelect.appendChild(option);
        });
    }

    // 소분류 옵션 초기화
    updateSubCategory();
}

// 소분류 업데이트 함수
function updateSubCategory() {
    const middleCategorySelect = document.getElementById('Detail_right_middleCategory_select');
    const subCategorySelect = document.getElementById('Detail_right_SubcatCategory_select');
    const selectedMiddleCategory = middleCategorySelect.value;

    // 소분류 옵션 초기화
    subCategorySelect.innerHTML = '<option value="">소분류를 선택해주세요</option>';

    if (selectedMiddleCategory && subCategories[selectedMiddleCategory]) {
        subCategories[selectedMiddleCategory].forEach(category => {
            const option = document.createElement('option');
            option.value = category;
            option.textContent = category;
            subCategorySelect.appendChild(option);
        });
    }
}

// ==========================================================================================================



// /////////////////////////////////////////// 상품 분류(SINGLE) 입력 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// jsp에서 받은 editPageSingle 데이터
// jsp에서 받은 editPageSingle 데이터
var editPageSingle = {
    enroll_ServiceName: "${editPageSingle.businessServiceName}",
    enroll_ServiceGuide: "${editPageSingle.businessServiceGuide}",
    enroll_ServicePay: "${editPageSingle.businessServicePay}",
    enroll_Data: "${editPageSingle.businessServiceData}",
    enroll_Function: "${editPageSingle.businessServiceFunction}",
    enroll_WorkDay: "${editPageSingle.businessServiceWorkDate}",
    enroll_Retouch: "${editPageSingle.businessServiceRetouch}"
};

// 페이지 로드 후 실행되는 함수
window.onload = function() {
    // 제목 입력 필드
    document.getElementById('Single_Title_Input').value = editPageSingle.enroll_ServiceName;

    // 설명 textarea
    document.getElementById('Detail_right_type_box2').value = editPageSingle.enroll_ServiceGuide;

    // 금액 입력 필드
    document.getElementsByName('enroll_ServicePay')[0].value = editPageSingle.enroll_ServicePay;

    // 제공할 자료수
    document.getElementsByName('enroll_Data')[0].value = editPageSingle.enroll_Data;

    // 제공할 페이지수
    document.getElementById('Detail_right_SingleData_IT').value = editPageSingle.enroll_Data;

    // 제공할 시안수
    document.getElementById('Detail_right_SingleData_Design').value = editPageSingle.enroll_Data;

    // 제공할 촬영시간(분)
    document.getElementById('Detail_right_SingleData_Media').value = editPageSingle.enroll_Data;

    // 제공할 A/S기간
    document.getElementById('Detail_right_SingleData_Marketing').value = editPageSingle.enroll_Data;

    // 제공할 기능수
    document.getElementsByName('enroll_Function')[0].value = editPageSingle.enroll_Function;

    // 제공할 기능수
    document.getElementById('Detail_right_SingleFunction_IT').value = editPageSingle.enroll_Function;

    // 제공할 런닝타입(초)
    document.getElementById('Detail_right_SingleFunction_Media').value = editPageSingle.enroll_Function;

    // 제공할 컷수
    document.getElementById('Detail_right_SingleFunction_Photo').value = editPageSingle.enroll_Function;

    // 작업 기간 선택
    var workDaySelect = document.getElementsByName('enroll_WorkDay')[0];
    for (var i = 0; i < workDaySelect.options.length; i++) {
        if (workDaySelect.options[i].value == editPageSingle.enroll_WorkDay) {
            workDaySelect.selectedIndex = i;
            break;
        }
    }

    // 수정 횟수 선택
    var retouchSelect = document.getElementsByName('enroll_Retouch')[0];
    for (var i = 0; i < retouchSelect.options.length; i++) {
        if (retouchSelect.options[i].value == editPageSingle.enroll_Retouch) {
            retouchSelect.selectedIndex = i;
            break;
        }
    }
};



// ==========================================================================================================



// /////////////////////////////////////////// 상품 분류(PACKAGE) 입력 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

// boardProEdit.js 파일의 적절한 위치에서 실행되도록 배치

// 문서가 준비되었을 때 실행되는 함수
$(document).ready(function() {

    // editPageS, editPageD, editPageP가 전역 변수나 스코프 내에 정의되어 있다고 가정합니다.

    // 패키지 데이터를 UI에 업데이트하는 함수
    function updatePackageUI(packageData) {
        // 제목 입력 필드 업데이트
        $('[name="enroll_Standard_Name"]').val(packageData.standard.name);
        $('[name="enroll_Deluxe_Name"]').val(packageData.deluxe.name);
        $('[name="enroll_Premium_Name"]').val(packageData.premium.name);

        // 서비스 가이드 (텍스트 에어리어) 업데이트
        $('[name="enroll_Standard_ServiceGuide"]').val(packageData.standard.serviceGuide);
        $('[name="enroll_Deluxe_ServiceGuide"]').val(packageData.deluxe.serviceGuide);
        $('[name="enroll_Premium_ServiceGuide"]').val(packageData.premium.serviceGuide);

        // 지불 입력 필드 업데이트
        $('[name="enroll_Standard_Pay"]').val(packageData.standard.pay);
        $('[name="enroll_Deluxe_Pay"]').val(packageData.deluxe.pay);
        $('[name="enroll_Premium_Pay"]').val(packageData.premium.pay);

        // 데이터 입력 필드 업데이트
        $('[name="enroll_Standard_Data"]').val(packageData.standard.data);
        $('[name="enroll_Deluxe_Data"]').val(packageData.deluxe.data);
        $('[name="enroll_Premium_Data"]').val(packageData.premium.data);

        // 기능 입력 필드 업데이트
        $('[name="enroll_Standard_Function"]').val(packageData.standard.function);
        $('[name="enroll_Deluxe_Function"]').val(packageData.deluxe.function);
        $('[name="enroll_Premium_Function"]').val(packageData.premium.function);

        // 근무일 선택 업데이트
        $('[name="enroll_Standard_WorkDay"]').val(packageData.standard.workDay);
        $('[name="enroll_Deluxe_WorkDay"]').val(packageData.deluxe.workDay);
        $('[name="enroll_Premium_WorkDay"]').val(packageData.premium.workDay);

        // 리터치 선택 업데이트
        $('[name="enroll_Standard_Retouch"]').val(packageData.standard.retouch);
        $('[name="enroll_Deluxe_Retouch"]').val(packageData.deluxe.retouch);
        $('[name="enroll_Premium_Retouch"]').val(packageData.premium.retouch);
    }

    // editPageS, editPageD, editPageP가 배열이나 객체 형태로 있다고 가정합니다.
    // 패키지 데이터 객체 구성
    var packageData = {
        standard: {
            name: '<%= editPageS.getName() %>',
            serviceGuide: '<%= editPageS.getServiceGuide() %>',
            pay: '<%= editPageS.getPay() %>',
            data: '<%= editPageS.getData() %>',
            function: '<%= editPageS.getFunction() %>',
            workDay: '<%= editPageS.getWorkDay() %>',
            retouch: '<%= editPageS.getRetouch() %>'
        },
        deluxe: {
            name: '<%= editPageD.getName() %>',
            serviceGuide: '<%= editPageD.getServiceGuide() %>',
            pay: '<%= editPageD.getPay() %>',
            data: '<%= editPageD.getData() %>',
            function: '<%= editPageD.getFunction() %>',
            workDay: '<%= editPageD.getWorkDay() %>',
            retouch: '<%= editPageD.getRetouch() %>'
        },
        premium: {
            name: '<%= editPageP.getName() %>',
            serviceGuide: '<%= editPageP.getServiceGuide() %>',
            pay: '<%= editPageP.getPay() %>',
            data: '<%= editPageP.getData() %>',
            function: '<%= editPageP.getFunction() %>',
            workDay: '<%= editPageP.getWorkDay() %>',
            retouch: '<%= editPageP.getRetouch() %>'
        }
    };

    // 대분류 카테고리 선택에 따른 이벤트 처리
    $('.Detail_right_Type2_ON_smallbox2').click(function() {
        var categoryId = $(this).attr('id');

        switch (categoryId) {
            case 'Detail_right_Data_IT': // IT·프로그래밍
                updatePackageUI({
                    standard: packageData.standard,
                    deluxe: {}, // 초기화
                    premium: {} // 초기화
                });
                break;
            case 'Detail_right_Data_Design': // 디자인
                updatePackageUI({
                    standard: {}, // 초기화
                    deluxe: packageData.deluxe,
                    premium: {} // 초기화
                });
                break;
            case 'Detail_right_Data_Media': // 영상·사진
                updatePackageUI({
                    standard: {}, // 초기화
                    deluxe: {}, // 초기화
                    premium: packageData.premium
                });
                break;
            case 'Detail_right_Data_Marketing': // 마케팅
                updatePackageUI({
                    standard: packageData.standard,
                    deluxe: packageData.deluxe,
                    premium: packageData.premium
                });
                break;
            default:
                console.log('Unknown category ID');
        }
    });

});


// ==========================================================================================================




// /////////////////////////////////////////// 상품 분류(PACKAGE) 입력 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

$(document).ready(function() {
    // 메인 이미지 파일 선택 시 미리보기
    $('#Detail_right_Contents4_fileInput1').change(function() {
        readURL(this, '#Detail_right_Contents4_imagePreviews1');
    });

    // 상세페이지 이미지 파일 선택 시 미리보기
    $('#Detail_right_Contents4_fileInput2').change(function() {
        readMultipleURLs(this, '#Detail_right_Contents4_imagePreviews2');
    });

    // 파일 선택 시 미리보기 기능 구현 함수
    function readURL(input, previewDivId) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $(previewDivId).html('<img src="' + e.target.result + '" alt="미리보기">');
            };

            reader.readAsDataURL(input.files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    }

    function readMultipleURLs(input, previewDivId) {
        if (input.files) {
            $(previewDivId).empty(); // 기존 이미지 삭제

            for (var i = 0; i < input.files.length; i++) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $(previewDivId).append('<img src="' + e.target.result + '" alt="미리보기">');
                };

                reader.readAsDataURL(input.files[i]); // 파일을 읽어서 데이터 URL로 변환
            }
        }
    }
});


// ==========================================================================================================