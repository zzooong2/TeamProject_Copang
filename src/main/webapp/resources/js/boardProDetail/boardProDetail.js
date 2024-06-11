// /////////////////////////////////////////// 조건 별 표시 설정 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// 카테고리를 표시하는 함수
function displayCategory(category) {
    // 모든 카테고리 숨기기
    var categories = document.querySelectorAll('.categoryTable');
    categories.forEach(function (table) {
        table.style.display = 'none';
    });

    // 카테고리에 따라 해당하는 tbody 영역 표시하기
    switch (category) {
        case "IT·프로그래밍":
            showCategory("IT");
            break;
        case "디자인":
            showCategory("Design");
            break;
        case "영상·사진":
            var middleCategory = "<%= result.boardProMiddleCategory %>";
            if (middleCategory === "사진") {
                showCategory("Photo");
            } else {
                showCategory("Video");
            }
            break;
        case "마케팅":
            showCategory("Marketing");
            break;
        case "교육":
            showCategory("Study");
            break;
        default:
            console.error("Unknown category:", category);
    }
}

// 해당 카테고리 보이기
function showCategory(category) {
    var categoryTable = document.getElementById('Detail_Category_BusinessMenu_' + category);
    if (categoryTable) {
        categoryTable.style.display = 'table-row-group';
    }
}



// ==========================================================================================================




// /////////////////////////////////////////// 단위 쉼표 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// 숫자 천단위 쉼표를 추가하는 함수
function formatUnit(value) {
	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 동일한 클래스를 가진 모든 값에 포맷팅을 적용하는 함수
function formatAllUnitCells() {
	let unitCells = document.querySelectorAll('.businessServicePay'); // .businessServicePay 클래스를 가진 모든 요소 선택
	
	unitCells.forEach(function(cell) {
		let value = cell.textContent;
		cell.textContent = formatUnit(value);
	});
}

// DOM 로드 완료 후 함수 실행
document.addEventListener('DOMContentLoaded', function() {
	formatAllUnitCells();
})

// ==========================================================================================================




// /////////////////////////////////////////// 별점 선택 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
document.addEventListener('DOMContentLoaded', function() {
    var stars = document.querySelectorAll('.Detail_Left_Star_Rating .Detail_Left_Star'); // 별점 관련 전체 영역과 각 별 영역 요소를 선택
    stars.forEach(function(star) { // 각각의 별 요소에 대해 반복문 실행
        star.addEventListener('click', function() { // 별을 클릭시 이벤트 리스너 실행
            stars.forEach(function(s) { 
                s.classList.remove('Detail_Left_Star_On'); // 별 클릭시 별 요소에 'Detail_Left_Star_On' 클래스 제거
            });
            this.classList.add('Detail_Left_Star_On'); // 클릭한 별에 'Detail_Left_Star_On' 클래스 추가
            
			var previousSibling = this.previousElementSibling; 
            while (previousSibling) { // 실행할 요소의 이전 형제 요소를 가져오고, 실행 대상과 동일한 클래스를 부여
                previousSibling.classList.add('Detail_Left_Star_On');
                previousSibling = previousSibling.previousElementSibling;
            }
        });
    });
});
// ==========================================================================================================






// /////////////////////////////////////////// 리뷰 표시 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
function checkUserPurchased() {
    // 여기에 구매 여부를 확인하는 로직을 작성합니다.
    // 구매 여부를 확인한 후, 해당 유저가 게시물을 구매했다면 리뷰 작성을 허용합니다.
}

// 2. 리뷰 등록 후 별점을 표시하고 색칠합니다.
function showRating() {
    // 리뷰 등록 후 별점을 표시하는 로직을 작성합니다.
    const reviewValue = parseInt($('.Detail_Left_Star_Review').val()); // 리뷰 값 가져오기
    const stars = $('.Detail_Left_Star_Rating').find('.Detail_Left_Star'); // 별점 요소 가져오기

    // 별점을 표시하기 위해 이전에 설정된 클래스를 모두 제거합니다.
    stars.removeClass('Detail_Left_Star_On');

    // 별점 값에 따라 색칠된 별을 추가합니다.
    for (let i = 0; i < reviewValue; i++) {
        $(stars[i]).addClass('Detail_Left_Star_On');
    }
}



// ==========================================================================================================



// /////////////////////////////////////////// 리뷰 등록 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
$(document).ready(function() {
    // 리뷰 등록 버튼 클릭 시 AJAX를 통해 리뷰를 서버에 전송합니다.
    $('.Detail_Left_Star_Review_Button').click(function() {
        let reviewContent = $('.Detail_Left_Star_Review').val(); // 리뷰 내용 가져오기
        let starPoint = $('.Detail_Left_Star.Detail_Left_Star_On').length;
        let boardProNo = this.value; // 페이지 번호로 사용되는 값

        $.ajax({
		    type: 'POST',
		    url: '/BoardPro/Detail.do',
		    data: { reviewContent: reviewContent, starPoint: starPoint, boardProNo: boardProNo },
		    success: function(response) {
		        if (Array.isArray(response)) {
		            response.reverse();
		            response.forEach(function(item) {
		                let reviewHtml = `
		                    <tr>
		                        <td>
		                            <div class="Detail_Left_Reviews">
		                                <div class="Detail_Left_ReviewBlock">
		                                    <div class="Detail_Left_ReviewStar">
		                                        <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 1 ? 'Detail_Left_Reviw_Star_On' : ''}" value="1"></span>
		                                        <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 2 ? 'Detail_Left_Reviw_Star_On' : ''}" value="2"></span>
		                                        <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 3 ? 'Detail_Left_Reviw_Star_On' : ''}" value="3"></span>
		                                        <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 4 ? 'Detail_Left_Reviw_Star_On' : ''}" value="4"></span>
		                                        <span name="Detail_Left_Reviw_Star_Point" class="Detail_Left_Reviw_Star ${item.reviewStarPoint >= 5 ? 'Detail_Left_Reviw_Star_On' : ''}" value="5"></span>
		                                        <span class="Detail_Left_Reviw_Star_value">${item.reviewStarPoint}</span>
		                                    </div>
		                                    <div class="Detail_Left_ReviewInfo">
		                                        <span class="Detail_Left_ReviewUser">${item.userName}</span>
		                                        <p class="Detail_Left_ReviewIndate">${item.reviewIndate}</p>
		                                    </div>
		                                </div>
		                                <div class="Detail_Left_ReviewContent">
		                                    <span>${item.reviewContent}</span>
		                                </div>
		                            </div>
		                        </td>
		                    </tr>
		                `;
		                $('.Detail_Left_ReviewTable_box').prepend(reviewHtml);
		            });
		        } else {
		            console.error("Expected an array but got", response);
		        }
		    },
		    error: function(xhr, status, error) {
		        console.error(xhr.responseText);
		    }
		});

    });
});


// ==========================================================================================================




// /////////////////////////////////////////// 리뷰 등록 JavaScript \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
$(document).ready(function() {
    // 평균 별점을 계산하고 표시하는 함수
    function displayAverageRating() {
        // 여기에 실제 평균 별점을 계산하는 로직을 작성합니다.
        // 예를 들어, 서버로부터 평균 별점을 가져오는 API 호출을 할 수 있습니다.
        let averageRating = document.getElementById("Detail_Left_Star_Decision_Average").innerText;
        
        // 별점 요소 가져오기
        let stars = $('.Detail_Left_Star_Decision').find('.Detail_Left_Star_Decision_point');
        
        // 별점 요소 초기화
        stars.removeClass('Detail_Left_Star_Decision_pointOn');
        
        // 평균 별점에 따라 별을 채웁니다 (올림 처리)
        for (var i = 0; i < Math.ceil(averageRating); i++) {
            $(stars[i]).addClass('Detail_Left_Star_Decision_pointOn');
        }
    }
    
    // 페이지 로드 시 평균 별점을 표시합니다.
    displayAverageRating();
});
// ==========================================================================================================
