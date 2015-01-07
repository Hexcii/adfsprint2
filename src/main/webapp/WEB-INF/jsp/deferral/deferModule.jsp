<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h2>${message}</h2>

<table data-role="table" data-mode="columntoggle" class="ui-responsive" id="myTable">
<thead>
   	<tr>
   		<th data-priority="1">Module ID</th>
	   <th data-priority="1">Module Code</th>
	   <th data-priority="2">Module CRN</th>     
	   <th data-priority="3">Module Name</th>     
	   <th data-priority="4">Module Semester</th> 
	</tr>
</thead>
<tbody>
	<c:forEach var="module" items="${modules}">
   		<tr>
   		  <td>${module.id}</td>
	      <td>${module.code}</td>
	      <td>${module.crn}</td>
	      <td>${module.name}</td> 
	      <td>${module.semester}</td> 
	      <td><a href="<%= request.getContextPath() %>/deferral/deferModule/modid/${status.current.id}/defid/${deferralid}"
						class="ui-btn">modify</a></td>       
		</tr>
	</c:forEach>
</tbody>