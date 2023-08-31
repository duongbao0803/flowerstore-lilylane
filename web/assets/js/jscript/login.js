// function show password
//const togglePassword = document.querySelector('#showPassword');
//const password = document.querySelector('#password-text');
//
//togglePassword.addEventListener('click', showPassword);
//
//function showPassword() {
//    // toggle the type attribute
//    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
//    password.setAttribute('type', type);
//    // toggle the eye slash icon
//    const icon = togglePassword.getAttribute('class') === 'fa-solid fa-eye' ? 'fa-solid fa-eye-slash' : 'fa-solid fa-eye';
//    togglePassword.setAttribute('class', icon);
//}


//    function login_regis() {
//    var text1 = document.getElementById('dangky');
//    var text2 = document.getElementById('dangnhap');
//    var text3 = document.getElementById('login');
//    var text4 = document.getElementById('register');
//    
//    if (text1.style.display === "none") {
//        text1.style.display = 'flex';
//        text4.style.zIndex = '0';
//        text2.style.display = 'none';
//        text3.style.display = 'block';
//        localStorage.setItem('login_regis_state', 'signup');
//    } else {
//        text1.style.display = 'none';
//        text3.style.display = 'none';
//        text4.style.zIndex = '1';
//        text2.style.display = 'flex';
//        localStorage.setItem('login_regis_state', 'signin');
//    }
//}
//
//document.addEventListener("DOMContentLoaded", function() {
//    var loginRegisState = localStorage.getItem('login_regis_state');
//    if (loginRegisState === 'signup') {
//        var text1 = document.getElementById('dangky');
//        var text2 = document.getElementById('dangnhap');
//        var text3 = document.getElementById('login');
//        var text4 = document.getElementById('register');
//        text1.style.display = 'flex';
//        text4.style.zIndex = '0';
//        text2.style.display = 'none';
//        text3.style.display = 'block';
//    } else if (loginRegisState === 'signin') {
//        var text1 = document.getElementById('dangky');
//        var text2 = document.getElementById('dangnhap');
//        var text3 = document.getElementById('login');
//        var text4 = document.getElementById('register');
//        text1.style.display = 'none';
//        text3.style.display = 'none';
//        text4.style.zIndex = '1';
//        text2.style.display = 'flex';
//    }
//});


function showPassword() {
    var x = document.getElementById("password-text");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function change() {
    var changebtn = document.getElementById("change");
    var slidebox = document.querySelector(".slide-box");
    var slideboxp1 = document.querySelector(".slide-box-p1");
    var slideboxp2 = document.querySelector(".slide-box-p2");
    let data = changebtn.innerHTML;
    if (slidebox.classList.contains("right")) {
        slideboxp1.innerHTML = "You bring the love. We’ll bring the flowers.";
        slideboxp2.innerHTML = "If you don't have acount before, please touch button below";
        changebtn.innerHTML = "Create new Account";
        slidebox.classList.remove("right");
    } else {
        slideboxp1.innerHTML = "Let us help you with all your flower needs.";
        slideboxp2.innerHTML = "If you already have an account, click blow button to login";
        changebtn.innerHTML = "Go to Login";
        slidebox.classList.add("right");
    }

}
fill();

function fill() {

    if ($('.slide-box').hasClass('right')) {
        $('.slide-box-p1').html("Let us help you with all your flower needs.");

        $('.slide-box-p2').html("If you already have an account, click blow button to login");
        $('#change').html('Go to Login');
    } else {
        $('.slide-box .slide-box-p1').text("You bring the love. We’ll bring the flowers.");
        $('.slide-box-p2').html("If you don't have acount before, please touch button below");
        $('#change').html('Create new Account');
    }

}


var onloadCallback = function () {
    grecaptcha.render('html_element', {
        'sitekey': '6LfFfrAmAAAAAAoVKML2RbJgTbneNmLVmpWs0HU1'
    });
};

function forgot_pass() {
    var forgot = document.getElementById('forgot-pass');
    var show = document.getElementById('popup');

    if (forgot) {
        show.style.display = 'block';
    }
}

function hide() {
    var show = document.getElementById('popup');
    var close = document.getElementById('close');
    if (close) {
        show.style.display = 'none';
    }
}


function onSubmit(token) {
    document.getElementById("demo-form").submit();
}






