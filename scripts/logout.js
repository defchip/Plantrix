$(document).ready(function() {
	$("#logoutDialog").dialog({
		draggable: false,
        closeOnEscape: false,
		resizable: false,
		modal: true,
		height: "auto",
		width: "auto",
        open: function(event, ui) { $(".ui-dialog-titlebar-close", ui.dialog | ui).hide(); },
		show: {
			effect: "fold",
			duration: 100
		},
		hide: {
			effect: "fold",
			duration: 100
		},
		buttons: {
			OK: function() {
				$(this).dialog("close");
				window.location.assign("index.php");
			}
		}
	});
});

$("#div2").dialog({
   closeOnEscape: false,
   open: function(event, ui) { $(".ui-dialog-titlebar-close", ui.dialog | ui).hide(); }
});