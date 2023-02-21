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
				right : 'prevYear,prev,today,next,nextYear'
			},
			aspectRatio : 1.8,
			expandRows : true,
			stickyHeaderDates : true,
			selectable : true,
			eventDisplay : 'list-item',
			dayMaxEvents : true,
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/epSchedule",
					async : false,
					success : function(result) {
						var list = result;
						console.log(list);
						successCallback(list);
					}
				});
			}
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

.fc-event-title {
	color: black;
	text-decoration: none;
	font-size: 9px;
	width:35px;
	overflow:hidden;
	text-overflow:ellipsis;
}

#calendar {
	width: 100%;
}
</style>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
	<div id='calendar'></div>
</body>

</html>