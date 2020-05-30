function change_lab_day() {
  var lab_id = $('#laboratory').val();
  var date = $('#date').val();
  window.location = '/laboratorios/' + lab_id + '/' + date;
}

function appointment_mark(id, status) {
  $.post( "/citas/marcar/" + id, { id: id, status: status});
}

$(document).on('change', '#laboratory', function() {
  change_lab_day();
});

$(document).on('change', '#date', function() {
  change_lab_day();
});

$(document).on('click', '.assist', function() {
  appointment_mark($(this).data('id'), 2);
});

$(document).on('click', '.no-assist', function() {
  appointment_mark($(this).data('id'), 3);
});

$(document).on('click', '.remove', function() {
  if (confirm('¿Confirmar?')) {
    appointment_mark($(this).data('id'), 99);	
  } else {
  	return false;
  }
});
