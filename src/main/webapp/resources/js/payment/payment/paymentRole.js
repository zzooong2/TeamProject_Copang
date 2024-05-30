function paymentView(checkId) {
    // input 태그
    let accountTransfer = document.getElementById("account-transfer");
    let mobilePayment = document.getElementById("mobile-payment");
    let cardPaymnet = document.getElementById("card-payment");

    // label 태그 
    let at = document.getElementsByClassName("account-label")[0];
    let mp = document.getElementsByClassName("mobile-label")[0];
    let cp = document.getElementsByClassName("card-label")[0];
    

    if(checkId === 'account') {
        at.style.backgroundColor="#ff8e47";
        at.style.color="white";
        mp.style.backgroundColor="white";
        mp.style.color="#4c4c4c";
        cp.style.backgroundColor="white";
        cp.style.color="#4c4c4c";
        mobilePayment.checked = false;
        cardPaymnet.checked = false;

    } else if(checkId === 'mobile') {
        at.style.backgroundColor="white";
        at.style.color="#4c4c4c";
        mp.style.backgroundColor="#ff8e47";
        mp.style.color="white";
        cp.style.backgroundColor="white";
        cp.style.color="#4c4c4c";
        accountTransfer.checked = false;
        cardPaymnet.checked = false;
    } else if (checkId === 'card') {
        at.style.backgroundColor="white";
        at.style.color="#4c4c4c";
        mp.style.backgroundColor="white";
        mp.style.color="#4c4c4c";
        cp.style.backgroundColor="#ff8e47";
        cp.style.color="white";
        accountTransfer.checked = false;
        mobilePayment.checked = false;
    }
}