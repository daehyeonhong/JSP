<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Progress Bar</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
long start = System.currentTimeMillis(), checkPoint = start + 1000;
%>
<div class="container">
  <h2>Loading Bar</h2>
  <div class="progress">
    <div class="progress-bar progress-bar-striped active progress-bar-success " role="progressbar" style="width:40%">
      Free Space
    </div>
  </div>
</div>
</body>
</html>