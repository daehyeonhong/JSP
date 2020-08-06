<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Button</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h1>Why do we put a # in the href attribute of the link?</h1>
	<h3>Since we do not have any page to link it to, and we do not want to get a "404" message, we put # as the link in our examples. It should be a real URL to a specific page.</h3>
</div>
<div class="container">
  <h2>Button Styles</h2>
  <button type="button" class="btn" onclick="alert('btn')">Basic</button>
  <button type="button" class="btn btn-default" onclick="alert('btn btn-default')">Default</button>
  <button type="button" class="btn btn-primary" onclick="alert('btn btn-primary')">Primary</button>
  <button type="button" class="btn btn-success" onclick="alert('btn btn-success')">Success</button>
  <button type="button" class="btn btn-info" onclick="alert('btn btn-info')">Info</button>
  <button type="button" class="btn btn-warning" onclick="alert('btn btn-warning')">Warning</button>
  <button type="button" class="btn btn-danger" onclick="alert('btn btn-danger')">Danger</button>
  <button type="button" class="btn btn-link" onclick="alert('btn btn-link')">Link</button>      
</div>

<div class="container">
  <h2>Button Tags</h2>
  <a href="#" class="btn btn-info" role="button" onclick="alert('btn btn-info')">Link Button</a>
  <button type="button" class="btn btn-info" onclick="alert('button')">Button</button>
  <input type="button" class="btn btn-info" value="Input Button" onclick="alert('Input Button')">
  <input type="submit" class="btn btn-info" value="Submit Button" onclick="alert('Submit Button')">
</div>

<div class="container">
  <h2>Button Sizes</h2>
  <button type="button" class="btn btn-primary btn-lg" onclick="alert('btn btn-primary btn-lg')">Large</button>
  <button type="button" class="btn btn-primary" onclick="alert('btn btn-primary')">Normal</button>    
  <button type="button" class="btn btn-primary btn-sm" onclick="alert('btn btn-primary btn-sm')">Small</button>
  <button type="button" class="btn btn-primary btn-xs" onclick="alert('btn btn-primary btn-xs')">XSmall</button>
</div>

<div class="container">
  <h2>Block Level Buttons</h2>
  <button type="button" class="btn btn-primary btn-block" onclick="alert('btn btn-primary btn-block')">Button 1</button>
  <button type="button" class="btn btn-default btn-block" onclick="alert('btn btn-default btn-block')">Button 2</button>

  <h2>Large Block Level Buttons</h2>
  <button type="button" class="btn btn-primary btn-lg btn-block" onclick="alert('btn btn-primary btn-lg btn-block')">Button 1</button>
  <button type="button" class="btn btn-default btn-lg btn-block" onclick="alert('btn btn-default btn-lg btn-block')">Button 2</button>

  <h2>Small Block Level Buttons</h2>
  <button type="button" class="btn btn-primary btn-sm btn-block" onclick="alert('btn btn-primary btn-sm btn-block')">Button 1</button>
  <button type="button" class="btn btn-default btn-sm btn-block" onclick="alert('btn btn-default btn-sm btn-block')">Button 2</button>
</div>

<div class="container">
  <h2>Button States</h2>
  <button type="button" class="btn btn-primary" onclick="alert('btn btn-primary')">Primary Button</button>
  <button type="button" class="btn btn-primary active" onclick="alert('btn btn-primary active')">Active Primary</button>
  <button type="button" class="btn btn-primary disabled" onclick="alert('btn btn-primary disabled')">Disabled Primary</button>
</div>
</body>
</html>