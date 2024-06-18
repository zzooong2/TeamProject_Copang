document.addEventListener('DOMContentLoaded', function() {
    // Get all elements with the class `Index_Header_Category_List_text`
    const categoryItems = document.querySelectorAll('.Index_Header_Category_List_text');
    categoryItems.forEach(item => {
        item.addEventListener('click', function() {
            const href = this.getAttribute('data-href');
            if (href) {
                window.location.href = href;
            }
        });
    });

    // Get elements with class `Index_Header_Login` and `Index_Header_Register`
    const login = document.querySelector('.Index_Header_Login');
    const register = document.querySelector('.Index_Header_Register');

    login.addEventListener('click', function() {
        const href = this.getAttribute('data-href');
        if (href) {
            window.location.href = href;
        }
    });

    register.addEventListener('click', function() {
        const href = this.getAttribute('data-href');
        if (href) {
            window.location.href = href;
        }
    });

    // Get buttons for NOTICE and SERVICE
    const noticeButton = document.querySelector('.Index_Footer_Left_Notification');
    const serviceButton = document.querySelector('.Index_Footer_Left_ServiceCenter');

    noticeButton.addEventListener('click', function() {
        const href = this.getAttribute('data-href');
        if (href) {
            window.location.href = href;
        }
    });

    serviceButton.addEventListener('click', function() {
        const href = this.getAttribute('data-href');
        if (href) {
            window.location.href = href;
        }
    });
});


    document.addEventListener('DOMContentLoaded', function() {
        const observerOptions = {
            root: null,
            rootMargin: '0px',
            threshold: 0.5
        };

        const observerCallback = (entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('show');
                }
            });
        };

        const observer = new IntersectionObserver(observerCallback, observerOptions);

        // 대상 요소들을 모두 찾아서 observer에 추가
        const targets = document.querySelectorAll('.Index_Main_CategoryContents2_text, .Index_Main_CategoryContents3_text, .Index_Main_CategoryContents4_text, .Index_Main_CategoryContents5_text, .Index_Main_CategoryContents6_text, .Index_Main_CategoryContents2_img, .Index_Main_CategoryContents3_img, .Index_Main_CategoryContents4_img, .Index_Main_CategoryContents5_img, .Index_Main_CategoryContents6_img');

        targets.forEach(target => {
            observer.observe(target);
        });
    });
