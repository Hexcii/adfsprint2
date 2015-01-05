<%@ include file="/WEB-INF/jsp/include.jsp"%>

<form:form method="POST" enctype="multipart/form-data" data-ajax="false" action="addModule" modelAttribute="module">

<form:errors path="*" cssClass="errorblock" element="div" />

<%-- <form:errors path="firstname" class="notification error" style="display:block"></form:errors>
<form:errors path="lastname" class="notification error" style="display:block"></form:errors>
<form:errors path="age" class="notification error" style="display:block"></form:errors> --%>

 <div class="ui-field-contain">
 <form:label path="id_module">Module id</form:label>
 <form:input path="id_module" placeholder="id_module" value=""/>
 <form:errors path="id_module" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="semester_module">Module semester</form:label>
 <form:input path="semester_module" placeholder="semester_module"  value=""/>
 <form:errors path="semester_module" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="code_module">Module code</form:label>
 <form:input path="code_module" placeholder="code_module"  value=""/>
 <form:errors path="code_module" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="crn_module">Module crn</form:label>
 <form:input path="crn_module" placeholder="crn_module"  value=""/>
 <form:errors path="crn_module" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="name_module">Module name</form:label>
 <form:input path="name_module" placeholder="name_module"  value=""/>
 <form:errors path="name_module" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
  
 <input data-theme="b" type="submit" data-icon="check" value="Save" />
  </form:form> 
