$(function () {
    $("#activateDialogForm").dialog({
        autoOpen: false,
        height: 430,
        width: 575,
        modal: true,
        buttons: {
            "Activate": function () {

                __doPostBack('ctl00$ContentPlaceHolder1$btnActivate', '');

            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        close: function () {

        }
    });

    $("#btnActivate").click(function () {
        $("#lblSubmitPatientName").html($("#tclName").html());
        $("#lblSubmitDOB").html($("#tclDOB").html());

        $("#lblSubmitCPR").html($("#tclCPR").html());

        $("#lblSubmitMedIntervention").html($("#tclMedIntervention").html());
        $("#lblSubmitMedInterventionAO").html($("#lblMedInterventionAO").html());


        $("#lblSubmitAAN").html($("#tclAANutrition").html());
        $("#lblSubmitAANAO").html($("#lblAANutritionAO").html());

        $("#tclSubmitSignerName").html($("#lblSigningPhys").html());
        $("#tclSubmitDateSigned").html($("#lblDateSigned").html());


        $("#activateDialogForm").dialog("open");
        RWOnShow();

    });

   


});
function refreshPage() {
    __doPostBack('page', 'refreshData');
}