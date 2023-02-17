<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm</title>
</head>
<body>
	<script type="text/javascript">
		var msg = '${msg}';
		var url = '${url}';
		console.log(msg);
		console.log(url);
		var select = confirm(msg);
		if(select){
			location.href='${pageContext.request.contextPath}/'+url;			
		} else{
			history.back();			
		}
	</script>
</body>
</html>