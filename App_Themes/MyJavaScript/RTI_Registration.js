// Java script used in the RTI_Registration file

// Not using now 26/11/2016
function passwordChanged(pwdID ) {
    //alert('hi1:' + pwdID);
    
    var strength = document.getElementById('strength');
    var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})", "g");
    var mediumRegex = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{7,})", "g");
    var enoughRegex = new RegExp("(?=.{6,}).*", "g");
    //var pwd = document.getElementById('<%= txtPassword.ClientID %>');
    var pwd = document.getElementById(pwdID);
   // alert('hi2:' + pwd);
    if (pwd.value.length == 0) {
        strength.innerHTML = ''; 
    }
        //else if (false == enoughRegex.test(pwd.value)) {
        //   strength.innerHTML = 'More Characters';
        //}
    else if (strongRegex.test(pwd.value)) {
        strength.innerHTML = '<span style="color:green">Strong!</span>';
    } else if (mediumRegex.test(pwd.value)) {
        strength.innerHTML = '<span style="color:orange">Medium!</span>';
    } else {
        strength.innerHTML = '<span style="color:red">Weak!</span>';
    }
}
// Not using now 26/11/2016
function checkPassword(txtPassword, txtPasswordConfirm) {
    //alert('hi');
    //var txtPassword = '<%= txtPassword.ClientID %>';
    //var txtPasswordConfirm = '<%= txtPasswordConfirm.ClientID %>';
    if (document.getElementById(txtPassword).value.length != 0 && document.getElementById(txtPasswordConfirm).value.length != 0) {
        if (document.getElementById(txtPassword).value != document.getElementById(txtPasswordConfirm).value) {
            alert("Password and confirm password should be same");
            document.getElementById(txtPassword).value = "";
            document.getElementById(txtPasswordConfirm).value = "";
        }
    }

}



