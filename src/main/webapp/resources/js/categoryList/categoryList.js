document.addEventListener("DOMContentLoaded", function() {
    const categoryArea = document.querySelector('.category_area');

    categoryArea.addEventListener('click', function(event) {
        if (event.target.tagName === 'P') {
            const type = event.target.getAttribute('data-type');
            const middleCategory = event.target.getAttribute('data-middle');
            const subCategory = event.target.getAttribute('data-sub');

            /*let url = '/category/list.do';*/
			let url = '/category/list.do?';
            let params = new URLSearchParams();

            if (type && middleCategory === null && subCategory === null) {
				params.append('type', type); // /category/list.do?type='IT프로그래밍'
				params.append('middleCategory', ''); // /category/list.do?type='IT프로그래밍'&middleCategory=
				params.append('subCategory', '');  // /category/list.do?type='IT프로그래밍'&middleCategory=&subCategory=
			} else if (middleCategory && subCategory === null) {
				params.append('type', type); // /category/list.do?type='IT프로그래밍'
				params.append('middleCategory', middleCategory); // /category/list.do?type='IT프로그래밍'&middleCategory='UX 기획'
				params.append('subCategory', ''); // /category/list.do?type='IT프로그래밍'&middleCategory='UX 기획'&subCategory=
			} else {
				params.append('type', type);
				params.append('middleCategory', middleCategory);
				params.append('subCategory', subCategory);
			}
            
			window.location.href = url+params.toString();
        }
    });
});