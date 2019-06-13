//= require datatables/jquery.dataTables

// optional change '//' --> '//=' to enable

// require datatables/extensions/AutoFill/dataTables.autoFill
// require datatables/extensions/Buttons/dataTables.buttons
// require datatables/extensions/Buttons/buttons.html5
// require datatables/extensions/Buttons/buttons.print
// require datatables/extensions/Buttons/buttons.colVis
// require datatables/extensions/Buttons/buttons.flash
// require datatables/extensions/ColReorder/dataTables.colReorder
// require datatables/extensions/FixedColumns/dataTables.fixedColumns
// require datatables/extensions/FixedHeader/dataTables.fixedHeader
// require datatables/extensions/KeyTable/dataTables.keyTable
// require datatables/extensions/Responsive/dataTables.responsive
// require datatables/extensions/RowGroup/dataTables.rowGroup
// require datatables/extensions/RowReorder/dataTables.rowReorder
// require datatables/extensions/Scroller/dataTables.scroller
//= require datatables/extensions/Select/dataTables.select

//= require datatables/dataTables.bootstrap4
// require datatables/extensions/AutoFill/autoFill.bootstrap4
// require datatables/extensions/Buttons/buttons.bootstrap4
// require datatables/extensions/Responsive/responsive.bootstrap4


//Global setting and initializer

$.extend( $.fn.dataTable.defaults, {
  responsive: true,
  language: {
    processing:     "Traitement en cours...",
    search:         "Rechercher&nbsp;:",
    lengthMenu:    "Afficher _MENU_ &eacute;l&eacute;ments",
    info:           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
    infoEmpty:      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
    infoFiltered:   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
    infoPostFix:    "",
    loadingRecords: "Chargement en cours...",
    zeroRecords:    "Aucun &eacute;l&eacute;ment &agrave; afficher",
    emptyTable:     "Aucune donnée disponible dans le tableau",
    paginate: {
        first:      "Premier",
        previous:   "Pr&eacute;c&eacute;dent",
        next:       "Suivant",
        last:       "Dernier"
    },
    aria: {
        sortAscending:  ": activer pour trier la colonne par ordre croissant",
        sortDescending: ": activer pour trier la colonne par ordre décroissant"
    },
    select: {
      rows: {
        _: "%d lignes séléctionnées",
        0: "Aucune ligne séléctionnée",
        1: "1 ligne séléctionnée"
      } 
    }
  }
  //dom:
  //  "<'row'<'col-sm-4 text-left'f><'right-action col-sm-8 text-right'<'buttons'B> <'select-info'> >>" +
  //  "<'row'<'dttb col-12 px-0'tr>>" +
  //  "<'row'<'col-sm-12 table-footer'lip>>"
});


$(document).on('preInit.dt', function(e, settings) {
  var api, table_id, url;
  api = new $.fn.dataTable.Api(settings);
  table_id = "#" + api.table().node().id;
  url = $(table_id).data('source');
  if (url) {
    return api.ajax.url(url);
  }
});


// init on turbolinks load
$(document).on('turbolinks:load', function() {
  if (!$.fn.DataTable.isDataTable("table[id^=dttb-]")) {
    var t = $("table[id^=dttb-]").DataTable();
    t.on('order.dt search.dt', function () {
      t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
          cell.innerHTML = i + 1;
      });
    }).draw();
  }
});

// turbolinks cache fix
$(document).on('turbolinks:before-cache', function() {
  var dataTable = $($.fn.dataTable.tables(true)).DataTable();
  if (dataTable !== null) {
    dataTable.clear();
    dataTable.destroy();
    return dataTable = null;
  }
});
