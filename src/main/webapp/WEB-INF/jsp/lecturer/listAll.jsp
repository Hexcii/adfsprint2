<%@ include file="/WEB-INF/jsp/include.jsp"%>

<c:if test="${not empty lecturers}">
<table data-role="table" class="ui-responsive" data-mode="columntoggle" id="myTable">
  <thead>
    <tr>
    <th data-priority="5">Image </th>
    <th data-priority="3">Lecturer ID</th>
    <th data-priority="4">First name</th>
    <th data-priority="1">Last name</th>     
    </tr>
  </thead>

  <tbody>
    <c:forEach var="lecturer" items="${lecturers}">
    <tr>
   	  <td><img alt="lecturer" width="24" border="0" align="middle" src="<c:url value="/resources/images/songwriter1.jpg"/>"></td>
      <td>${songwriter.id}</td>
      <td>${songwriter.firstName}</td>
      <td>${songwriter.lastName}</td>          
    </tr>
     </c:forEach>
  </tbody>

</table>
	</c:if>
	
	<c:if test="${empty lecturers}">
	<div class="notification warning">
		No lecturer.
	</div>
	</c:if>