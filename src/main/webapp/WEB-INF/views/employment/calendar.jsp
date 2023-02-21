<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			customButtons : {
				myCustomButton : {
					text : 'Home',
					click : function() {
						location.href = "${pageContext.request.contextPath}/";
					}
				}
			},
			headerToolbar : {
				left : 'myCustomButton',
				center : 'title',
				right : 'prevYear,prev,next,nextYear today'
			},
			aspectRatio : 1.8,
			expandRows : true,
			stickyHeaderDates : true,
			selectable : true,
			eventDisplay: 'list-item',
			dayMaxEvents : true,
			events:function(info, successCallback, failureCallback){
				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath}/epCalendarPost",
					async: false,
					success: function(result){
						var list = result;
						var events = [];
						var postEvent = list.map(function(item){
							return{
								title: item.epname,
								start: item.eppost,
								end: item.epdeadline,
								color: 'blue'
							}
						});
						console.log(postEvent);
						var deadEvent = list.map(function(item){
							return{
								title: item.epname,
								start: item.epdeadline,
								color: 'red'
							}
						});
						console.log(deadEvent);
						/* for(var i=0;i<postEvent.lengh;i++){
							
						} */
						successCallback(events);
					}
				});
			}
		});
		calendar.render();
	});

	function callPostDate(){
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/epCalendarPost",
			async: false,
			success: function(result){
				var list = result;
				var postEvent = list.map(function(item){
					return{
						title: item.epname,
						start: item.eppost
					}
				});
				console.log(postEvent);
			}
		});
	}
	
	function callDeadLineDate(){
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/epCalendarDeadLine",
			async: false,
			success: function(result){
				
				var list = result;
				var deadLineEvent = list.map(function(item){
					return{
						title: item.epname,
						start: item.epdeadline
					}
				});
				console.log(deadLineEvent);
			}
		});
	}
</script>
<style type="text/css">
.fc-day-sun a {
	color: red;
	text-decoration: none;
}

.fc-day-sat a {
	color: blue;
	text-decoration: none;
}

#calendar {
	width: 100%;
}
</style>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<button onclick="callPostDate()">Post</button>
	<button onclick="callDeadLineDate()">DeadLine</button>
	<div id='calendar'></div>
</body>

</html>