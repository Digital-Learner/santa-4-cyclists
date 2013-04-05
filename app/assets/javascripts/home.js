// Initiate Countdown
jQuery(document).ready(function() {
  $('#countdown_dashboard').countDown({
    targetOffset: {
      'day':    0,
      'month':  0,
      'year':   0,
      'hour':   0,
      'min':    0,
      'sec':    0
    }
  });
});

// Set by specific date/time
function set_by_date() {
  $('#countdown_dashboard').stopCountDown();
  $('#countdown_dashboard').setCountDown({
    targetDate: {
      'day':    15,
      'month':  1,
      'year':   2011,
      'hour':   12,
      'min':    0,
      'sec':    0
    }
  });
  $('#countdown_dashboard').startCountDown();
}

// Set by date/time offset
function set_by_offset() {
  $('#countdown_dashboard').stopCountDown();
  $('#countdown_dashboard').setCountDown({
    targetOffset: {
      'day':    1,
      'month':  1,
      'year':   0,
      'hour':   1,
      'min':    1,
      'sec':    1
    }
  });
  $('#countdown_dashboard').startCountDown();
}