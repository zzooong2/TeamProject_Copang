document.addEventListener("DOMContentLoaded", function() {
    // HTML 요소들을 자바스크립트로 선택
    const titleInput = document.getElementById('Detail_right_Contents1_Title_Input');
    const categoryMainSelect = document.getElementById('Detail_right_Contents1_Category_Style');
    const categoryMiddleSelect = document.getElementById('Detail_right_middleCategory_select');
    const categorySubcatSelect = document.getElementById('Detail_right_SubcatCategory_select');
    const serviceSelect = document.getElementById('Detail_right_Contents1_Service_Style');
    const companyNameInput = document.getElementById('Detail_right_Contents1_Company_Input');

    // 서버로부터 전달된 데이터를 HTML 요소들에 설정
    titleInput.value = initialData.title;
    categoryMainSelect.value = initialData.category;
    categoryMiddleSelect.value = initialData.middleCategory;
    categorySubcatSelect.value = initialData.subCategory;
    serviceSelect.value = initialData.service;
    companyNameInput.value = initialData.company;

    // 추가적으로 businessServiceType에 따라 필요한 데이터 설정
    const serviceType = initialData.serviceType;

    if (serviceType === 'SINGLE') {
    document.getElementById('Single_Title_Input').value = initialData.serviceName;
    document.getElementById('GuideText1').value = initialData.serviceGuide;
    document.querySelector('input[name="enroll_ServicePay"]').value = initialData.servicePay;
} else if (serviceType === 'STANDARD' || serviceType === 'DELUXE' || serviceType === 'PREMIUM') {
    // 해당 서비스 유형에 따라 필드 설정
    document.querySelector(`input[name="enroll_${serviceType}_Name"]`).value = initialData[`${serviceType.toLowerCase()}Name`];
    document.querySelector(`textarea[name="enroll_${serviceType}_ServiceGuide"]`).value = initialData[`${serviceType.toLowerCase()}Guide`];
    document.querySelector(`input[name="enroll_${serviceType}_Pay"]`).value = initialData[`${serviceType.toLowerCase()}Pay`];
}

    // 기타 필요한 데이터 초기화 로직 추가

    // 예시로 추가된 필드에 대해 카운터 기능 구현 예시
    function Counter(element, maxLength) {
        const countDisplay = element.nextElementSibling;
        const currentLength = element.value.length;
        countDisplay.textContent = `${currentLength}/${maxLength}`;
    }

    // 예시: 서버로부터 받은 초기 데이터에서 근무일수와 리터치 여부 필드 설정
    const workDaySelect = document.querySelector('select[name="enroll_WorkDay"]');
    const retouchSelect = document.querySelector('select[name="enroll_Retouch"]');

    // 근무일수 옵션 설정 예시 (서버에서 옵션을 동적으로 설정할 수 있음)
    const workDayOptions = ['월~금', '월~토', '주 3회', '주 5회'];
    workDayOptions.forEach(option => {
        const optionElement = document.createElement('option');
        optionElement.value = option;
        optionElement.textContent = option;
        workDaySelect.appendChild(optionElement);
    });
    workDaySelect.value = initialData.workDay; // 초기 값 설정

    // 리터치 여부 옵션 설정 예시 (서버에서 옵션을 동적으로 설정할 수 있음)
    const retouchOptions = ['있음', '없음'];
    retouchOptions.forEach(option => {
        const optionElement = document.createElement('option');
        optionElement.value = option;
        optionElement.textContent = option;
        retouchSelect.appendChild(optionElement);
    });
    retouchSelect.value = initialData.retouch; // 초기 값 설정
});

