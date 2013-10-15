<html>
<head>
<title>result index</title>
<meta name="layout" content="main" />
</head>
<body>
	<div class="section">batch results</div>
	<div class="rounded-border">
		<div class="table-responsive">
			<table id="table"
				class="table table-condensed table-hover table-striped">
				<tr>
					<th>result</th>
					<th>completed</th>
					<th></th>
				</tr>
				<g:each in="${ctls}" var="ctl">
					<g:if test="${ctl.completed}">
						<tr>
							<td>
								${ctl.name}
							</td>
							<td>
								${ctl.completed}
							</td>
							<td><a href="/g-batch/result/read/${ctl.name}" type="button"
								class="btn btn-default btn-xs"> <span
									class="glyphicon glyphicon-eye-open"></span> view results
							</a></td>
						</tr>
					</g:if>
				</g:each>
			</table>
		</div>
	</div>
</body>
</html>