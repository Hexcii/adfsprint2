<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h2>${message}</h2>

<table data-role="table" class="ui-responsive" data-mode="columntoggle" id="studentTable">
	<thead>
    	<tr>
			<th data-priority="1">Student ID</th>
			<th data-priority="2">First Name</th>
			<th data-priority="3">Last Name</th>
			<th data-priority="4">Student Number</th>
			<th data-priority="5">Email</th>
			<th data-priority="6">Phone number</th>
			<th data-priority="7">Address1</th>
			<th data-priority="8">Address2</th>
		</tr>
	</thead>
  
  	<tbody>
    	<tr>
	 		<td>${id}</td>
			<td>${student.firstName}</td>
			<td>${student.lastName}</td>          
			<td>${student.studentNumber}</td>          
			<td>${student.email}</td>          
			<td>${student.phoneNumber}</td>          
			<td>${student.addressLine1}</td>
			<td>${student.addressLine2}</td>     
		</tr>
  </tbody> 
 </table>  