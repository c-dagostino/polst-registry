
$(function () {
    
    $(".jqGetError").live('click', function () {
        var id = $(this).attr("epid");
        GetErrors(id);
    })

    $("#dialogFormsContainer").dialog({
        autoOpen: false,
        height: 350,
        width: 300,
        modal: true,
        title: "Submission Errors",
        buttons: [{
            id: "close-button",
            name: "Close",
            text: "Close",
            click: function () {

                $(this).dialog("close");
            }

        }],

        close: function () {
           //do nothing
        }

    });

   

});


function GetErrors(id) {
    
    $.get(rootPath + "/api/EParticipantError?id=" + id, {}, function (result) {
        if (result.Success) {
            LoadEParticipantErrors(result.ParticipantErrors);
            $("#dialogFormsContainer").dialog("open");

        }
        else {

            alert(result.Message);
        }
    });
}

function LoadEParticipantErrors(participantErrors)
{
    var html = "";
    $.each(participantErrors, function () {
        html += "<li>" + this["error"] + "</li>";
    });

    $("#ulErrors").html(html);
}

function EditRegistrant(val) {

    RWOnShow();
    window.radopen("../Forms/EditRegistrant.aspx?ea=0&pid=" + val.toString(), "rwEditRegistrant");


}

function refreshGrid(arg) {
    __doPostBack('registrant', 'refresh')

}