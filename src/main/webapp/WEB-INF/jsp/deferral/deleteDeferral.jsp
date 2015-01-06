<%@ include file="/WEB-INF/jsp/include.jsp"%>
<h2>${message}</h2>

<table data-role="table" data-mode="columntoggle" class="ui-responsive" id="myTable">
  <thead>
	<tr>
		<th data-priority="3">student first name</th>
		<th data-priority="3">student last name</th>
		<th data-priority="5">student id</th>
		<th data-priority="4">deferral id</th>
		<th data-priority="1">deferral date</th>
		<th data-priority="2">program id</th>
		<th data-priority="2">program deferred</th>
		<th data-priority="2">program status</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="deferalw" items="${deferalws}" varStatus="status">
		<tr>
			<td>${deferalw.firstName}</td>
			<td>${deferalw.lastName}</td>
			<td>${deferalw.studentNumber}</td>
			<td>${deferalw.id}</td>
			<td>${deferalw.id_student}</td>
			<td>${deferalw.id_program}</td>
			<td>${deferalw.deferral_date}</td>
			<td>${deferalw.programDeferred}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>