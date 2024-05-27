function toggleCheckboxes(source) {
            const checkboxes = document.querySelectorAll('.individual-consent');
            checkboxes.forEach(checkbox => checkbox.checked = source.checked);
        }

        function toggleBusinessField() {
            const userType = document.querySelector('input[name="user_type"]:checked').value;
            const checkboxes = document.querySelectorAll('.business-checkbox');

            checkboxes.forEach(checkbox => {
                checkbox.checked = false;
                checkbox.disabled = false;
            });

            if (userType === 'expert') {
                checkboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', CheckboxChange);
                });
            } else {
                checkboxes.forEach(checkbox => {
                    checkbox.removeEventListener('change', CheckboxChange);
                });
            }
        }
        /*  */
        function CheckboxChange(event) {
            const checkboxes = document.querySelectorAll('.business-checkbox');
            const currentCheckbox = event.target;

            if (currentCheckbox.checked) {
                checkboxes.forEach(checkbox => {
                    if (checkbox !== currentCheckbox) {
                        checkbox.checked = false;
                    }
                });
            }
        }