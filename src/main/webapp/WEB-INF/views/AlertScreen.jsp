<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert</title>
</head>
<body>
	<script type="text/javascript">
		var msg = '${msg}';
		var url = '${url}';
		console.log(msg);
		console.log(url);
		alert(msg);
		location.href=url;
	</script>
</body>
</html>