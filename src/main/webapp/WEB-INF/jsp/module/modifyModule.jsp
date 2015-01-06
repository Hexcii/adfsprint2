<%@ include file="/WEB-INF/jsp/include.jsp"%>
		
<h3>Modify module.</h3>

<table data-role="table" class="ui-responsive" data-mode="columntoggle" id="myTable">
	<thead>
		<tr>
		   <th data-priority="1">Module Code</th>
		   <th data-priority="2">Module CRN</th>     
		   <th data-priority="3">Module Name</th>     
		   <th data-priority="4">Module Semester</th> 
		</tr>
	</thead>	
	<tbody>
		<tr>
	      <td>${module.code}</td>
	      <td>${module.crn}</td>
	      <td>${module.name}</td> 
	      <td>${module.semester}</td> 
			<td><a href="<%= request.getContextPath() %>/modifyModule"
						class="ui-btn">Modify Module</a></td>
		</tr>
	</tbody>
</table>
