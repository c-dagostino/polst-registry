$(function () {


    $("#rblCPR_0").live('click', function () {
        SetCPRColor();
    });
    $("#rblCPR_1").live('click', function () {
        SetCPRColor();
    });
    $("#rblCPR_2").live('click', function () {
        SetCPRColor();
    });
    SetCPRColor();


    $("#rblMedIntervention_0").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblMedIntervention");
    });
    $("#rblMedIntervention_1").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblMedIntervention");
    });
    $("#rblMedIntervention_2").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblMedIntervention");
    });
    $("#rblMedIntervention_3").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblMedIntervention");
    });
    SetSelectedColor("ctl00$ContentPlaceHolder1$rblMedIntervention");


    $("#rblAANutrition_0").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAANutrition");
    });
    $("#rblAANutrition_1").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAANutrition");
    });
    $("#rblAANutrition_2").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAANutrition");
    });
    $("#rblAANutrition_3").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAANutrition");
    });
    SetSelectedColor("ctl00$ContentPlaceHolder1$rblAANutrition");


    $("#rblAntibiotics_0").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAntibiotics");
    });
    $("#rblAntibiotics_1").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAntibiotics");
    });
    $("#rblAntibiotics_2").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAntibiotics");
    });
    $("#rblAntibiotics_3").live('click', function () {
        SetSelectedColor("ctl00$ContentPlaceHolder1$rblAntibiotics");
    });
    SetSelectedColor("ctl00$ContentPlaceHolder1$rblAntibiotics");

//    $('#ddlScannedForm').focus();

    $("#chkSignerVerified").live('change', function () {
        if ($("#chkSignerVerified")[0].checked) {

            var clientSideObject = $find("txtLicenseExpireDate");
            clientSideObject.enable();
        }
        else {

            var clientSideObject = $find("txtLicenseExpireDate");
            clientSideObject.disable();
            clientSideObject.set_value("");
        }
    });

    $('.jqHCPFiller').live('change', function () {
        var radioButtons = document.getElementsByName("ctl00$ContentPlaceHolder1$rblHCPFiller");
        for (var x = 0; x < radioButtons.length; x++) {
            if (radioButtons[x].checked) {
                if (radioButtons[x].value == "1") {
                    $('#ddlHCPTitle').removeAttr('disabled');

                }
                else {
                    $('#ddlHCPTitle').attr('disabled', 'disabled');
                    document.getElementById('ddlHCPTitle').selectedIndex = 0;

                }
            }
        }
    });

    $('#aspnetForm').submit(function () {
        BeginFormProcessing(true);
    });
});

function ShowInsertForm() {
    RWOnShow();
    window.radopen("EditRegistrant.aspx?ea=0&pid=" + participantId, "rwEditRegistrant");
    return false;
}


function refreshGrid(arg) {
    __doPostBack('registrant', 'refresh')

}

function refreshPage(arg) {
    __doPostBack('scannedForm', arg)

}


function goToRelationship() {
    document.getElementById('ddlSignedRelationship').focus();
}





function GoToFormIsSigned2() {

    var radioButtons = document.getElementsByName("ctl00$ContentPlaceHolder1$rblFormSigned");
    for (var x = 0; x < radioButtons.length; x++) {
        if (radioButtons[x].checked) {
            if (radioButtons[x].value == "1") {
                document.getElementById('ddlSignedRelationship').disabled = '';
            }
            else {
                document.getElementById('ddlSignedRelationship').disabled = 'disabled';
                document.getElementById('ddlSignedRelationship').selectedIndex = 0;
                document.getElementById('pnlSigRelationDesc').disabled = 'disabled';
                document.getElementById('pnlSigRelationDesc').disabled = 'disabled';
                document.getElementById('txtSigRelationDesc').disabled = 'disabled';
                document.getElementById('txtSigRelationDesc').value = '';


            }
        }
    }
}



function GoToAdditionalInformation(Sender, EventArgs) {
    $("#txtAdditionalInformation").focus();

}

function ShowUploadForm() {
    RWOnShow();
    window.radopen("NewScannedForm.aspx?rid=1", "rwNewScannedForm");
    return false;
}

function SetCPRColor() {
    var radioButtons = document.getElementsByName("ctl00$ContentPlaceHolder1$rblCPR");
    for (var x = 0; x < radioButtons.length; x++) {

        var label = $("#" + radioButtons[x].id).next();
        if (radioButtons[x].value == "2") {
            if (radioButtons[x].checked) {
                $(label).addClass(redClass);
            }
            else {
                $(label).removeClass(redClass);
            }
        }
        if (radioButtons[x].value == "1") {
            if (radioButtons[x].checked) {
                $(label).addClass(greenClass);
            }
            else {
                $(label).removeClass(greenClass);
            }
        }
        if (radioButtons[x].value == "3") {
            if (radioButtons[x].checked) {
                $(label).addClass(blueClass);
            }
            else {
                $(label).removeClass(blueClass);
            }
        }
    }
}

function SetSelectedColor(placeHolderName) {
    var radioButtons = document.getElementsByName(placeHolderName);
    for (var x = 0; x < radioButtons.length; x++) {

        var label = $("#" + radioButtons[x].id).next();
        if (radioButtons[x].value == "1") {
            if (radioButtons[x].checked) {
                $(label).addClass(redClass);
            }
            else {
                $(label).removeClass(redClass);
            }
        }
        if (radioButtons[x].value == "2") {
            if (radioButtons[x].checked) {
                $(label).addClass(yellowClass);
            }
            else {
                $(label).removeClass(yellowClass);
            }
        }
        if (radioButtons[x].value == "3") {
            if (radioButtons[x].checked) {
                $(label).addClass(greenClass);
            }
            else {
                $(label).removeClass(greenClass);
            }
        }
        if (radioButtons[x].value == "4") {
            if (radioButtons[x].checked) {
                $(label).addClass(blueClass);
            }
            else {
                $(label).removeClass(blueClass);
            }
        }
    }
}


var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function (sender, args) {
    SetCPRColor();
    SetSelectedColor("ctl00$ContentPlaceHolder1$rblMedIntervention");
    SetSelectedColor("ctl00$ContentPlaceHolder1$rblAANutrition");
    SetSelectedColor("ctl00$ContentPlaceHolder1$rblAntibiotics");
});