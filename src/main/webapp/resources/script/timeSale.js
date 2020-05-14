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
/*        var timer;
        
        window.onload = function() {
            timer = window.setInterval(
            function(){
                var dat = new Date();
                document.getElementId('test').innerHTML 
                = dat.toLocaleTimeString();
            },1000);
        };*/
        

/*const countDownTimer=function(id,date){
	var vDate=new Date(date);// 전달받은 일자
	var second=1000;
	var minute=second*60;
	var hour=minute*60;
	var day=hour*24;
	var timer;
	
	function showRemaining(){
		var now=new Date();
		var disDt=vDate-now;
		
		if(distDt<0){
				clearInterval(timer);
				document.getElementById(id).textContent='해당 이벤트가 종료되었습니다.'
				return;
		}
		
		var days=Math.floor(distDt/day);
		var hours=Math.floor((distDt%day)/hour);
		var minutes =Math.floor((disDt%hour)/minute);
		var seconds =Math.floor((distDt%minute)/second);
		
		//document.getElementById(id).textContent = date.toLocaleString() + "까지 : ";

		document.getElementById(id).textContent = days + '일 ';
		document.getElementById(id).textContent = hours + '시간 ';
		document.getElementById(id).textContent = minutes + '분 ';
		document.getElementById(id).textContent = seconds + '초 ';
			
	} //end function showRemaining()
	
	var dateObj= new Date();
	dateObj.setDate(dateObj.getDate() + 1);
	
	countDownTimer('sample02','05/15/2020 09:30 AM');
	}
	*
	*/
	
var targetDate = new Date('2020-05-16');
function timeout() {
  var ms = targetDate - new Date();
  var h = Math.floor(ms / (1000*60*60));
  var m = Math.floor((ms - (h*1000*60*60)) / (1000*60));
  var s = Math.floor((ms - (h*1000*60*60) - (m*1000*60)) / 1000);
  
  if(h || m || s) {
    $('.notice').text(h + '시간 ' + m + '분 ' + s + '초');
    setTimeout(timeout, 1000);
  } else {
    alert('이벤트가 종료되었습니다.');
  }
}
timeout();
	
	


