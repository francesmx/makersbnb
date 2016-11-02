$(document).ready(function() {

  $("#available_from").datepicker({
    dateFormat: 'dd-mm-yy'
  });

  $("#available_to").datepicker({
    dateFormat: 'dd-mm-yy'
  });

  $("#check_in, #check_out").datepicker({
    dateFormat: 'dd-mm-yy',
    minDate: new Date(2016, 11 - 1, 08),
    maxDate: new Date(2016, 11 - 1, 15)
  });

});
