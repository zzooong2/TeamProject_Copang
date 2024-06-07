// 해당하는 카테고리만 보이도록 설정하는 함수
function displayCategory(category) {
    // 모든 카테고리 숨기기
    var categories = document.querySelectorAll('.categoryTable');
    categories.forEach(function (table) {
        table.style.display = 'none';
    });

    // 해당 카테고리 보이기
    var categoryTable = document.getElementById('Detail_Category_BusinessMenu_' + category);
    if (categoryTable) {
        categoryTable.style.display = 'table-row-group';
    }
}

// 카테고리에 따라 보이도록 설정
document.addEventListener('DOMContentLoaded', function () {
    // 여기에 카테고리에 대한 정보를 가져와서 해당하는 함수 호출하는 코드 작성
    var category = "<%= result.boardProCategory %>";
    displayCategory(category);
});



/*const money = $('#rightBox_businessMenuPay').text();
const money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
$('#rightBox_businessMenuPay').text(money2);
*/
