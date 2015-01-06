<%@ include file="/WEB-INF/jsp/include.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {
$("#modify").click(function(){	
	var code=$("#code").val(); 	
	var crn=${module.crn}; 
	var name=$("#name").val(); 
	var semester=$("#semester").val();
	var url="/module/modifyModuleForm/code/"+code+"/crn/"+crn+"/name/"+name+"/semester/"+semester;
	location.href="<%= request.getContextPath() %>"+url;
});
});
</script>
</head>

<body>
	<form:form modelAttribute="module">
		<div class="ui-field-contain">
			<form:label path="code">Code</form:label>
			<form:input path="code" value="${module.code}"/>
		</div>
		<div class="ui-field-contain">
			<form:label path="crn">CRN</form:label>
			<form:input path="crn" value="${module.crn}"/>
		</div>
		<div class="ui-field-contain">
			<form:label path="name">Name</form:label>
			<form:input path="name" value="${module.name}"/>
		</div>	
		<div class="ui-field-contain">
			<form:label path="semester">Semester</form:label>
			<form:input path="semester" value="${module.semester}" />
		</div>
		
		<input type="button" class="ui-btn" data-theme="b" data-icon="check"
			value="Modify" id="modify" />
	</form:form>
</body>
</html>  