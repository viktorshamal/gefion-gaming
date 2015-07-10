/**
 * Created by shamal on 09-07-15.
 */
setInterval(function(){updateTime()},1000);

function updateTime(){
    var countdownToParty = countdown(Date.now(),new Date(gon.eventtime));
    if (true){
        $('#countdown-box').show();
        $('.unit').each(function () {
            var count = countdownToParty[$(this).data('count')];
            var singular = $(this).data('singular');
            var plural = $(this).data('plural');

            $(this).find('h2').html(function () {
                return count;
            });

            $(this).find('p').html(function () {
                if (count == 1) {
                    return singular;
                }
                else {
                    return plural;
                }
            });
        });
    }else if(countdownToParty.value < -36000000) {
        $('#more-info').show();
    }else{
        $('#playing-now').show();
    }

}
updateTime();
