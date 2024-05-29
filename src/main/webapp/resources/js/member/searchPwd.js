document.getElementById('find-id-button').addEventListener('click', function() {
    document.getElementById('id-form').classList.remove('hidden');
    document.getElementById('pw-form').classList.add('hidden');
});

document.getElementById('find-pw-button').addEventListener('click', function() {
    document.getElementById('pw-form').classList.remove('hidden');
    document.getElementById('id-form').classList.add('hidden');
});