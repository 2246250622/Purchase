function checkMail(nameFlag, mailFlag, idFlag) {
    //return false;

    var input;
    input = "";
    var tmp_input;
    tmp_input = "";


    if (document.getElementById(nameFlag).value != "") {
        input = document.getElementById(nameFlag).value;
    } else if (document.getElementById(mailFlag).value != "") {
        input = document.getElementById(mailFlag).value;
    } else if (document.getElementById(idFlag).value != "") {
        input = document.getElementById(idFlag).value;
    }

    if (input.indexOf("(") != -1) {
        var schar;
        schar = input.indexOf("(");
        input = input.substring(0, schar);
    }

    var popUrl = 'check_mail.aspx?nameList=' + input + '&mailFlag=' + mailFlag + '&nameFlag=' + nameFlag + '&idFlag=' + idFlag;
    var name = 'Check';
    var appearence = 'dependent=yes,menubar=no,resizable=no,' +
                          'status=no,toolbar=no,titlebar=no,' +
                          'left=5,top=280,width=460px,height=460px';
    var openWindow = window.open(popUrl, name, appearence);
    openWindow.focus();

    return false;
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode != 46 && (charCode < 48 || charCode > 57)))
        return false;
    return true;
}
