<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		var pop = '${pop}';
		var select = confirm(msg);
		if (select) {
			if (opener) {
				if (url == "close") {
					window.opener.location.reload();
					window.close();
				} else {
					if (pop == "pop") {
						location.href = '${pageContext.request.contextPath}/'
								+ url;
					} else {
						window.opener.location.href = '${pageContext.request.contextPath}/'
								+ url;
						window.close();
					}
				}
			} else {
				location.href = '${pageContext.request.contextPath}/' + url;
			}
		} else {
			history.back();
		}
	</script>
</body>
</html>