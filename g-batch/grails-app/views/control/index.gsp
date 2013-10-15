<html>
<head>
<title>control index</title>
<meta name="layout" content="main" />
<meta http-equiv="refresh" content="5">
</head>
<body>
	<div class="section">batch controls</div>
	<div class="rounded-border">
		<div class="table-responsive">
			<table id="table"
				class="table table-condensed table-hover table-striped">
				<tr>
					<th>name</th>
					<th>requested</th>
					<th>initiated</th>
					<th>completed</th>
					<th>duration</th>
					<th>status</th>
				</tr>
				<g:each in="${controls}" var="ctl">
					<tr>
						<td>
							${ctl.name}
						</td>
						<td><g:if test="${ctl.requested}">
								${ctl.requested}
							</g:if> <g:else>
								<a href="/g-batch/control/request?name=${ctl.name}"
									type="button" class="btn btn-default btn-xs"> <span
									class="glyphicon glyphicon-bell"></span> request
								</a>
							</g:else></td>
						<td>
							${ctl.initiated}
						</td>
						<td>
							${ctl.completed}
						</td>
						<td><g:if test="${ctl.completed}">
								${(ctl.completed.time - ctl.initiated.time)} ms
						</g:if></td>
						<td><g:if test="${ctl.status}">
								<a href="#" data-toggle="tooltip" title="${ctl.status}"
									placement="bottom">FAILED</a>
							</g:if> <g:elseif test="${ctl.completed}">
								<a href="/g-batch/result/read/${ctl.name}" type="button"
									class="btn btn-default btn-xs"> <span
									class="glyphicon glyphicon-eye-open"></span> view results
								</a>
							</g:elseif></td>
					</tr>
				</g:each>
			</table>
		</div>
	</div>
</body>
</html>