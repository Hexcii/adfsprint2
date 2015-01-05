<%@ include file="/WEB-INF/jsp/include.jsp"%>

 
<html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>CIT Online
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.js"></script>
<!-- <link href="<c:url value="/resources/css/citonline.css" />" rel="stylesheet">  -->
<style>
.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 600px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
th {
    border-bottom: 1px solid #d6d6d6;
}

tr:nth-child(even) {
    background: #e9e9e9;
}
</style>
</head>

<body>
<div data-role="page">
<!--header--> 
<div data-role="header" data-position="fixed" data-theme="b" > 	
		<tiles:insertAttribute name="header"  />
</div> 
<!--main body with a panel to the left -->
<div data-role="main" class="ui-content" id="pageone">	
	<a href="#myPanelDefault" class="ui-btn ui-btn-inline ui-corner-all ui-shadow">Menu Options</a>
	<tiles:insertAttribute name="body" />
</div>			
		
<!--footer-->	
<div  data-role="footer" data-position="fixed" data-theme="b">
	<tiles:insertAttribute name="footer" />
</div>


<!-- Panel -->
<div data-role="panel" id="myPanelDefault" style="text-align:center;"> 
<div data-role="collapsibleset">
  <div data-role="collapsible">
    <h1 data-icon="plus">Add</h1>
    <ul data-role="listview" data-inset="true">
      <li><a href="<%= request.getContextPath() %>/lecturer/addNew">Lecturer</a></li>
      <li><a href="<%= request.getContextPath() %>/student/addNewStudent">Student</a></li>
      <li><a href="<%= request.getContextPath() %>/deferral/addNewDeferral">Deferral</a></li>
      <li><a href="<%= request.getContextPath() %>/module/addModule">Module</a></li>
 	</ul>
  </div>
   <div data-role="collapsible">
    <h1 data-icon="delete">Remove</h1>
    <ul data-role="listview" data-inset="true">
      <li><a href="#">Lecturer</a></li>
      <li><a href="#">Student</a></li>
      <li><a href="#">Deferral</a></li>
      <li><a href="#">Module</a></li>
 	</ul> 
 	</div>
 	<div data-role="collapsible">
    <h1 data-icon="search">list</h1>
    <ul data-role="listview" data-inset="true">
      <li><a href="<%= request.getContextPath() %>/lecturer/listall">Lecturer</a></li>
      <li><a href="#">Student</a></li>
      <li><a href="#">Deferral</a></li>
      <li><a href="<%= request.getContextPath() %>/module/displayModule">>Module</a></li>
 	</ul>     
  </div>
  
  <div data-role="collapsible">
    <h1 data-icon="search">List All</h1>
    <ul data-role="listview" data-inset="true">
      <li><a href="#">Lecturer</a></li>
      <li><a href="<%= request.getContextPath() %>/student/displayStudents">Student</a></li>
      <li><a href="#">Deferral</a></li>
      <li><a href="<%= request.getContextPath() %>/module/displayModules">>Module</a></li>
 	</ul>     
  </div>
  
  	<div data-role="collapsible">
    <h1 data-icon="star">Modify</h1>
    <ul data-role="listview" data-inset="true">
      <li><a href="#">Lecturer</a></li>
      <li><a href="#">Student</a></li>
      <li><a href="#">Deferral</a></li>
      <li><a href="#">Module</a></li>
 	</ul>     
  </div>
  
  </div>  

<a href="#pageone" data-rel="close" class="ui-btn ui-btn-inline ui-shadow ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-left">Close Menu</a>
</div>
</body>  
</html>
