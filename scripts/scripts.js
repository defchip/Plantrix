////General scripts
$(document).ready(function() {
    $('#mainTable').DataTable({
        "dom": 'lrtip'
//		dom: "Tfrtip",
    })
});
$(document).ready(function() {
    var oTable = $('#mainTable').DataTable();
    $('#txtSearch').keyup(function() {
        oTable.search($(this).val()).draw();
    })
});