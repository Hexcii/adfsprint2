<%@ include file="/WEB-INF/jsp/include.jsp"%>

<form:form method="POST" enctype="multipart/form-data" data-ajax="false" action="addNew" modelAttribute="lecturer">

<form:errors path="*" cssClass="errorblock" element="div" />

<%-- <form:errors path="firstname" class="notification error" style="display:block"></form:errors>
<form:errors path="lastname" class="notification error" style="display:block"></form:errors>
<form:errors path="age" class="notification error" style="display:block"></form:errors> --%>

 <div class="ui-field-contain">
 <form:label path="firstName">First name</form:label>
 <form:input path="firstName" placeholder="First name.." value=""/>
 <form:errors path="firstName" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="lastName">Last name</form:label>
 <form:input path="lastName" placeholder="Last name.."  value=""/>
 <form:errors path="lastName" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 <div class="ui-field-contain">
 <form:label path="age">Age</form:label>
 <form:input path="age" placeholder="Your age.."   value=""/>
 <form:errors path="age" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
<div class="ui-field-contain">
<form:label path="file">Profile Image</form:label>
<form:input path="file" type="file"/> 
</div>  
 
 <div data-role-="fieldcontain">
 <fieldset data-role="controlgroup">
 <form:checkbox path="newsletter"  label="Click if you want to subscribe to the newsletter"/>
 </fieldset>
 <form:errors path="newsletter" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div data-role-="fieldcontain">
 <fieldset data-role="controlgroup" data-type="horizontal">
 <legend>Select an interest</legend>
 <form:checkbox path="interests" value="interest1" label="Interest 1"/>
 <form:checkbox path="interests" value="interest2" label="Interest 2"/>
 <form:checkbox path="interests" value="interest3" label="Interest 3"/>
 </fieldset>
  <form:errors path="interests" cssClass="error" class="notification error" style="display:block"></form:errors>
 
 </div>
 
 
 <input data-theme="b" type="submit" data-icon="check" value="Save" />
  </form:form> 
