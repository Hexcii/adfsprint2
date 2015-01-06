<%@ include file="/WEB-INF/jsp/include.jsp"%>
<h2>${message}</h2>

<table data-role="table" data-mode="columntoggle" class="ui-responsive" id="myTable">
  <thead>
	<tr>
		<th data-priority="3">student first name</th>
		<th data-priority="3">student last name</th>
		<th data-priority="5">student number</th>
		<th data-priority="4">deferral id</th>
		<th data-priority="2">program id</th>
		<th data-priority="1">deferral date</th>
		<th data-priority="2">program deferred</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="deferralw" items="${deferrals}" varStatus="status">
		<tr>
			<td>${deferralw.firstName}</td>
			<td>${deferralw.lastName}</td>
			<td>${deferralw.studentNumber}</td>
			<td>${deferralw.id}</td>
			<td>${deferralw.id_program}</td>
			<td>${deferralw.deferral_date}</td>
			<td>${deferralw.programDeferred}</td>
			<td><a href="<%= request.getContextPath() %>/deferral/modifyDeferral/id/${status.current.id}"
						class="ui-btn">modify</a></td>  
		</tr>
	</c:forEach>
	</tbody>
</table>