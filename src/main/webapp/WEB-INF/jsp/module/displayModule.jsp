<%@ include file="/WEB-INF/jsp/include.jsp"%>

<h2>The following module has been successfully added to the system</h2>

<table data-role="table" data-mode="columntoggle" class="ui-responsive" id="myTable">
  <thead>
    <tr>
	   <th data-priority="1">Module ID</th>
	   <th data-priority="2">Module Code</th>
	   <th data-priority="3">Module CRN</th>     
	   <th data-priority="4">Module Name</th>     
	   <th data-priority="5">Module Semester</th>          
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${id_module}</td>
      <td>${code_module}</td>
      <td>${crn_module}</td>
      <td>${name_module}</td> 
      <td>${semester_module}</td>          
    </tr>
  </tbody>               