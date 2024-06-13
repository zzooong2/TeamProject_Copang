document.addEventListener("DOMContentLoaded", function() {
    const categoryArea = document.querySelector('.category_area');

    categoryArea.addEventListener('click', function(event) {
        if (event.target.tagName === 'P') {
            const type = event.target.getAttribute('data-type');
            const middleCategory = event.target.getAttribute('data-middle');
            const subCategory = event.target.getAttribute('data-sub');

            let url = '/category/list.do';
            let params = new URLSearchParams();

            if (type) params.append('type', type);
            if (middleCategory) params.append('middleCategory', middleCategory);
            if (subCategory) params.append('subCategory', subCategory);

            window.location.href = `${url}?${params.toString()}`;
        }
    });
});
