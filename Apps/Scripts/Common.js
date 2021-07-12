 
$(function () {
    // Prevent the backspace key from navigating back.
    $(document).unbind('keydown').bind('keydown', function (event) {
        var doPrevent = false;
        if (event.keyCode === 8) {
            var d = event.srcElement || event.target;
            if ((d.tagName.toUpperCase() === 'INPUT' && 
                 (
                     d.type.toUpperCase() === 'TEXT' ||
                     d.type.toUpperCase() === 'PASSWORD' || 
                     d.type.toUpperCase() === 'FILE' || 
                     d.type.toUpperCase() === 'EMAIL' || 
                     d.type.toUpperCase() === 'SEARCH' || 
                     d.type.toUpperCase() === 'DATE' )
                 ) || 
                 d.tagName.toUpperCase() === 'TEXTAREA') {
                doPrevent = d.readOnly || d.disabled;
            }
            else {
                doPrevent = true;
            }
        }

        if (doPrevent) {
            event.preventDefault();
        }
    });

    $(".aspNetDisabled").attr("disabled", "disabled");

    
});

function BeginProcessing(showSpinner, element)
{
    if($(element).attr("disabled") != "disabled")
    {
        $(".jqPostbackElement").attr("disabled", "disabled")
        if (showSpinner) { $('#divProcessing').show(); }
    }
  
    return true;
}

function BeginFormProcessing(showSpinner) {
    
        $(".jqPostbackElement").attr("disabled", "disabled")
        if (showSpinner) { $('#divProcessing').show(); }
  
    return false;
}

function StopProcessing() {
    $(".jqPostbackElement").removeAttr("disabled")
    $('#divProcessing').hide();

}

function VerifyDelete()
{
    var agree = false;
    agree = confirm('Are you sure you want to delete this item? Press OK to Delete');
    return agree; 
}


function GetParameterValueByName(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location);
    if (results == null)
        return "";
    else
        return decodeURIComponent(results[1].replace(/\+/g, " "));
}