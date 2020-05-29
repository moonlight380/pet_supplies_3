
function timeout() {
	var targetDate = new Date("2020-05-30");
	var ms = targetDate - new Date;

	 var h = Math.floor(ms / (1000*60*60));
	 var m = Math.floor((ms -(h*1000*60*60)) / (1000*60));
	 var s = Math.floor((ms - (h*1000*60*60) -(m*1000*60)) / 1000);

/*	var h = 0;
	var m = 0;
	var s = 0;*/
	 
	var ids = [];

	if (h || m || s) {
		$('.notice').text(h + '시간 ' + m + '분 ' + s + '초');
		setTimeout(timeout, 1000);
		$(".oriprice").css("display", "none");

	} else if (h == 0 && m == 0 && s == 0) {
		$(".sale_display_none").css("display", "none");
		clearTimeout(timeout);
		$(".pnum").each(function() {
			var n = $(this).attr("title");
			n = n*1;
			ids.push(n);
		});
		console.log(ids);

		$.ajax({
			type : "get",
			traditional : true,
			url : "./timeSaleUpdate",
			data : {
				ids : ids
			},success:function(){
				alert("성공");
				/*location.reload();*/
			}
		});

	}// end else if
}// end timeout()
timeout();

/*			error : function(request, status, error) {
alert("code = " + request.status + " message = "
		+ request.responseText + " error = " + error);
}*/
