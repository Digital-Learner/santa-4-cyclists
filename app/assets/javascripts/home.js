// Initiate Countdown

jQuery(document).ready(function() {
    $('#countdown_dashboard').countDown({
        targetOffset: {
            'day':      28,
            'month':    3,
            'year':     2013,
            'hour':     0,
            'min':      0,
            'sec':      0
        }
    });
});

// Set by specific date/time
function set_by_date() {
    $('#countdown_dashboard').stopCountDown();
    $('#countdown_dashboard').setCountDown({
        targetDate: {
            'day':      25,
            'month':    12,
            'year':     2013,
            'hour':     12,
            'min':      0,
            'sec':      0
        }
    });
    $('#countdown_dashboard').startCountDown();
}
