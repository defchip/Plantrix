	$(document).ready(function() {
	    $("#addDialog").dialog({
	        autoOpen: false,
	        draggable: false,
	        resizable: false,
	        modal: true,
	        height: "auto",
	        width: "auto",
	        show: {
	            effect: "clip",
	            duration: 200
	        },
	        hide: {
	            effect: "clip",
	            duration: 200
	        }
	    });
	});

	$(document).ready(function() {
	    $("#removeErrorDialog").dialog({
	        open: function(event, ui) {
	            $(".ui-dialog-titlebar-close", ui.dialog).hide();
	        },
	        autoOpen: false,
	        draggable: false,
	        resizable: false,
	        modal: true,
	        height: "auto",
	        width: "250px",
	        show: {
	            effect: "clip",
	            duration: 200
	        },
	        hide: {
	            effect: "clip",
	            duration: 200
	        },
	        buttons: {
	            OK: function() {
	                $(this).dialog("close");
	            }
	        }
	    });
	});

	$(document).ready(function() {
	    $("#removeSuccessDialog").dialog({
	        open: function(event, ui) {
	            $(".ui-dialog-titlebar-close", ui.dialog).hide();
	        },
	        autoOpen: false,
	        draggable: false,
	        resizable: false,
	        modal: true,
	        height: "auto",
	        width: "250px",
	        show: {
	            effect: "clip",
	            duration: 200
	        },
	        hide: {
	            effect: "clip",
	            duration: 200
	        },
	        buttons: {
	            OK: function() {
	                $(this).dialog("close");
					location.reload();

	            }
	        }
	    });
	});

	$(document).ready(function() {
	    $("#removeDialog").dialog({
	        autoOpen: false,
	        draggable: false,
	        resizable: false,
	        modal: true,
	        height: "auto",
	        width: "auto",
	        show: {
	            effect: "clip",
	            duration: 200
	        },
	        hide: {
	            effect: "clip",
	            duration: 200
	        },
	        buttons: {
	            OK: function() {
	                $(this).dialog("close");
	                $.ajax({
	                    url: 'scripts/removeConsultant.php',
	                    method: 'GET',
	                    data: {
	                        data: consultantId
	                    },
	                    success: function() {
	                        $("#removeSuccessDialog").dialog("open");
	                    },
	                    error: function() {
	                        $("#removeErrorDialog").dialog("open");
	                    }
	                });
	            },
	            Cancel: function() {
	                $(this).dialog("close");
	            }
	        }
	    });
	});

	$(document).ready(function() {
	    $("#editDialog").dialog({
	        autoOpen: false,
	        draggable: false,
	        resizable: false,
	        modal: true,
	        height: "auto",
	        width: "auto",
	        show: {
	            effect: "clip",
	            duration: 200
	        },
	        hide: {
	            effect: "clip",
	            duration: 200
	        }
	    });
	});

	var consultantId;

	$(document).ready(function() {
	    $(document).on("click", ".editButton",
	        function() {
	            consultantId = $(this).parents('tr').attr('id');
	            var surname = $.trim($(this).parents("tr").children("td:eq(0)").text());
	            var forenames = $.trim($(this).parents("tr").children("td:eq(1)").text());
	            var team = $.trim($(this).parents("tr").children("td:eq(3)").text());
	            var teamId = $.trim($(this).parents("tr").children("td:eq(2)").text());
	            var salary = $.trim($(this).parents("tr").children("td:eq(4)").text());
				var postcode = $.trim($(this).parents("tr").children("td:eq(5)").text());
	            $("#editDialog").dialog("open");
	            ShowSelectedConsultant(consultantId, forenames, surname, salary, team, teamId, postcode);
	        });
	});

	function ShowSelectedConsultant(consultantId, forenames, surname, salary, team, teamId, postcode) {
	    document.getElementById("fn").value = forenames;
	    document.getElementById("sn").value = surname;
	    document.getElementById("tm").value = teamId;
	    document.getElementById("tm").text = team;
	    document.getElementById("ct").value = salary;
		document.getElementById("pc").value = postcode;
	    document.getElementById("cId").value = consultantId;
	}

	$(document).ready(function() {
	    $(document).on("click", ".removeButton",
	        function() {
	            consultantId = $(this).closest('tr').attr('id');
	            $("#removeDialog").dialog("open");
	        });
	});

	$(document).ready(function() {
	    $(document).on("click", ".addButton",
	        function() {
	            $("#addDialog").dialog("open");
	        });
	});