<h2>The following deferral has been successfully added to the system</h2>

<table data-role="table" data-mode="columntoggle" class="ui-responsive" id="myTable">
  <thead>
    <tr>
    <th data-priority="3">Student ID</th>
    <th data-priority="4">program ID</th>
    <th data-priority="1">program deferred</th>
    <th data-priority="2">date</th>     
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>${deferral.id_student}</td>
      <td>${deferral.id_program}</td>
      <td>${deferral.programDeferred}</td>
      <td>${deferral.deferral_date}</td>          
    </tr>
  </tbody>               