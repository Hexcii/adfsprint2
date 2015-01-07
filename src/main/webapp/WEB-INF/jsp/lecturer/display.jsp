<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h2>${message}</h2>

<table data-role="table" class="ui-responsive" data-mode="columntoggle" id="myTable">
	<thead>
    	<tr>
			<th data-priority="3">Lecturer ID</th>
			<th data-priority="1">First name</th>
			<th data-priority="2">Last name</th>
			<th data-priority="4">Email</th>
			<th data-priority="5">Room Number</th>
			<th data-priority="6">Phone number</th>
			<th data-priority="7">Managed Program ID</th>
			<th data-priority="8">Taught modules</th>
		</tr>
	</thead>
  
  	<tbody>
    	<tr>
	 		<td>${lecturer.id}</td>
			<td>${lecturer.firstName}</td>
			<td>${lecturer.lastName}</td>          
			<td>${lecturer.email}</td>          
			<td>${lecturer.roomNumber}</td>          
			<td>${lecturer.phoneNumber}</td>          
			<td>${lecturer.idManagedProgram}</td>
			<td>
				<c:forEach var="module" items="${lecturer.taughtModules}" varStatus="status">
					<tr>
						<td>${module.name}</td>
					</tr>
				</c:forEach>
			</td>      
		</tr>
  </tbody>   