/**
 * 
 */

/* Timer 
function countdown( elementId, seconds ){
  var element, endTime, hours, mins, msLeft, time;

  function updateTimer(){
    msLeft = endTime - (+new Date);
    if ( msLeft < 0 ) {
      console.log('done');
    } else {
      time = new Date( msLeft );
      hours = time.getUTCHours();
      mins = time.getUTCMinutes();
      element.innerHTML = (hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2);
      setTimeout( updateTimer, time.getUTCMilliseconds());
      // if you want this to work when you unfocus the tab and refocus or after you sleep your computer and come back, you need to bind updateTimer to a $(window).focus event^^
    }
  }

  element = document.getElementById( elementId );
  endTime = (+new Date) + 1000 * seconds;
  updateTimer();
}

countdown('countdown', 43200);	 // second base
*/
        var timer;
        
        window.onload = function() {
            timer = window.setInterval(
            function(){
                var dat = new Date();
                document.getElementsByClassName("test").innerHTML 
                = dat.toLocaleTimeString();
            },1000);
        };


