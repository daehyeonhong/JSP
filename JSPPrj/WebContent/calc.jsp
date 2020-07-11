<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Calculator</title>
<style type="text/css">
input {
	width: 50px;
	height: 50px;
}

#zero {
	width: 104px;
	height: 50px;
}

.output {
	height: 50px;
	background: #e9e9e9;
	font-size: 24px;
	font-weight: bold;
	text-align: right;
	padding: 0px 5px;
}
</style>
</head>
<body>
	<form action="calculatorPage" method="post">
		<table>
			<tr>
				<td class="output" colspan="4">0</td>
			</tr>
			<tr>
				<td><input type="submit" name="operator" value="CE" /></td>
				<td><input type="submit" name="operator" value="C" /></td>
				<td><input type="submit" name="operator" value="BS" /></td>
				<td><input type="submit" name="operator" value="÷" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="value" value="7" /></td>
				<td><input type="submit" name="value" value="8" /></td>
				<td><input type="submit" name="value" value="9" /></td>
				<td><input type="submit" name="operator" value="×" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="value" value="4" /></td>
				<td><input type="submit" name="value" value="5" /></td>
				<td><input type="submit" name="value" value="6" /></td>
				<td><input type="submit" name="operator" value="－" /></td>
			</tr>
			<tr>
				<td><input type="submit" name="value" value="1" /></td>
				<td><input type="submit" name="value" value="2" /></td>
				<td><input type="submit" name="value" value="3" /></td>
				<td><input type="submit" name="operator" value="＋" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="value" value="0"
					id="zero"
				/></td>
				<td><input type="submit" name="operator" value="." /></td>
				<td><input type="submit" name="operator" value="＝" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
