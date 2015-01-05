<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h2>${message}</h2>

<table data-role="table" class="ui-responsive" data-mode="columntoggle" id="myTable">
	<thead>
    	<tr>
			<th data-priority="3">deferral ID</th>
			<th data-priority="1">Student ID</th>
			<th data-priority="1">program ID</th>
			<th data-priority="2">Date</th>
			<th data-priority="4">program Deferred</th>
			<th data-priority="5">deferral status</th>
			
			</tr>
	</thead>
  
  	<tbody>
  	<c:forEach var="deferral" items="${deferrals}">
    	<tr>
	 		<td>${deferral.id}</td>
			<td>${deferral.id_student}</td>
			<td>${deferral.id_program}</td> 
			<td>${deferral.deferral_date}</td>         
			<td>${deferral.programDeferred}</td>          
			<td>${deferral.id_deferral_status}</td>          
		</tr>
	</c:forEach>
  </tbody>   