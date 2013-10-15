<html>
<head>
<title>result index</title>
<meta name="layout" content="main" />
</head>
<body>
	<div class="section">batch results for [${params.id}]</div>
	<div class="rounded-border">
		<div class="table-responsive">
			<table id="table"
				class="table table-condensed table-hover table-striped">
				<tr>
					<th>result</th>
				</tr>
				<g:each in="${results}" var="rslt">
					<tr>
						<td>
							${rslt.result}
						</td>
					</tr>
				</g:each>
			</table>
		</div>
	</div>
</body>
</html>