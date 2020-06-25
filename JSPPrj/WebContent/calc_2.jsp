<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
	<%@include file="include_calc.jsp"%>
	<form action="" method="post">
		<table>
			<tr>
				<td><input type="button" name="num" value="7" /></td>
				<td><input type="button" name="num" value="8" /></td>
				<td><input type="button" name="num" value="9" /></td>
				<td><input type="button" name="operator" value="-" /></td>
			</tr>
			<tr>
				<td><input type="button" name="num" value="4" /></td>
				<td><input type="button" name="num" value="5" /></td>
				<td><input type="button" name="num" value="6" /></td>
				<td rowspan="2"><input type="button" name="operator" value="+" /></td>
			</tr>
			<tr>
				<td><input type="button" name="num" value="1" /></td>
				<td><input type="button" name="num" value="2" /></td>
				<td><input type="button" name="num" value="3" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" name="num" value="0" /></td>
				<td><input type="button" name="num" value="." /></td>
				<td><input type="button" name="operator" value="=" /></td>
			</tr>
		</table>
	</form>
</body>
</html>