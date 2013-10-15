<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<!-- 
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		 -->
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'sticky-footer-navbar.css')}"
	type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"
	type="text/css">
<g:layoutHead />
<r:layoutResources />
</head>
<body>

	<div id="wrap">
		<!-- Fixed navbar -->
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/g-batch"><span
						class="glyphicon glyphicon-road"></span> BatchRunr</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav nav-pills">
						<li class="${controllerName.equals('control') ? 'active' : ''}"><a
							href="/g-batch/control">controls</a></li>
						<li class="${controllerName.equals('result') ? 'active' : ''}"><a
							href="/g-batch/result">results</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>

		<div class="container">
			<g:layoutBody />
		</div>
	</div>
	<!-- wrap -->

	<!-- <div class="footer" role="contentinfo"></div>-->
	<div id="footer">
		<div class="muted credit rounded-corner">
			Powered by Groovy, Grails and Quartz <span
				class="glyphicon glyphicon-time pull-right time"> <g:formatDate
					format="MM-dd-yy HH:mm:ss" date="${new Date()}" /></span>
		</div>
	</div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<g:javascript library="application" />
	<g:javascript src="jquery.min.js" />
	<g:javascript src="bootstrap.min.js" />
	<script>
		$(function() {
			$("a[data-toggle='tooltip']").tooltip();
		});
	</script>
	<r:layoutResources />
</body>
</html>
