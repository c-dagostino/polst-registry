$(function () {

    document.onkeydown = checkKeyCode

    $("#txtBirthMonth").live("keyup", function () {

        if ($(this).val().length == 2) {
            $("#txtBirthDay").focus();
        }
    });

    $("#txtBirthDay").live("keyup", function () {
        if ($(this).val().length == 2) {
            $("#txtBirthYear").focus();
        }
    });

    $("#txtBirthYear").live("keyup", function () {
        if ($(this).val().length == 4) {
            $("#txtAge").focus();
        }
    });

    $(".jqNumberOnly").live("keydown", function (event) {
        // Allow: backspace, delete, tab, escape, and enter
        if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
        // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
        // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                event.preventDefault();
            }
        }

      
    });

   
   
});



function clearBirthYear() {
    $("#txtBirthYear").val("");
  
}

function clearAge() {
    $("#txtAge").val("");

}

function checkKeyCode(evt) {
    var evt = (evt) ? evt : ((event) ? event : null);
    var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
    if (event.keyCode == 116) { evt.keyCode = 0; return false; }

    if (event.keyCode == 13) {
        // cancel the default submit
        event.returnValue = false;
        event.cancel = true;
        // submit the form by programmatically clicking the specified button
        var el = document.getElementById('btnSearch');
        el.click();
    }

}


function resetForm() {
    window.location = "SearchRegistrants.aspx";
}

function getCFID() {
    return $("#txtCallFormID").val();
}

function OpenNPF() {

    RWOnShow();
    var oWindow = window.radopen("NPF_CallForm.aspx?cfid=" + getCFID(), "rwNPF");
    //oWindow.setUrl(oWindow.get_navigateUrl());
    return false;

}

function OpenNPFOnCancel(CallFormID) {

    RWOnShow();
    var oWindow = window.radopen("NPF_CallForm.aspx?cfid=" + CallFormID, "rwNPF");



}


function PolstFormView(pid) {

    RWOnShow();
    var oWindow = window.radopen("PolstFormView.aspx?pid=" + pid.toString() + "&cfid=" + getCFID(), "rwPolstFormView");
    //oWindow.setUrl(oWindow.get_navigateUrl());


}

