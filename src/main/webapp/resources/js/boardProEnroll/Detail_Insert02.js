
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








































