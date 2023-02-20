<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
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
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/epCalendarPost",
			success : function(result) {
				var list = result;
				var calendarEl = document.getElementById('calendar');
				var postEvents = list.map(function(item) {
					return {
						title : item.epname,
						start : item.eppost,
						color : 'blue'
					}
				});
				var deadEvents = list.map(function(item) {
					return {
						title : item.epname,
						start : item.epdeadline,
						color : 'red'
					}
				});
				console.log(postEvents);
				console.log(deadEvents);
				var calendar = new FullCalendar.Calendar(calendarEl, {
					handleWindowResize: true,
					aspectRatio : 2,
					windowResizeDelay : 100,
					aspectRatio : 1.8,
					expandRows : true,
					dayMaxEvents : true,
					navLinks : true,
					eventDisplay : 'list-item',
					events : postEvents,
					windowResize: function(arg) {
						location.reload();
					  }
				});
				calendar.render();
			}
		});

	});
</script>
</head>
<body>
	<div id='calendar'></div>
</body>

</html>