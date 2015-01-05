<%@ include file="/WEB-INF/jsp/include.jsp"%>

<form:form method="POST" enctype="multipart/form-data" data-ajax="false" action="addNewStudent" modelAttribute="student">

<form:errors path="*" cssClass="errorblock" element="div" />

 <div class="ui-field-contain">
 <form:label path="firstName">First Name</form:label>
 <form:input path="firstName" placeholder="firstName" value=""/>
 <form:errors path="firstName" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="lastName">Last Name</form:label>
 <form:input path="lastName" placeholder="lastName" value=""/>
 <form:errors path="lastName" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="studentNumber">Student Number</form:label>
 <form:input path="studentNumber" placeholder="studentNumber" value=""/>
 <form:errors path="studentNumber" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="email">Email</form:label>
 <form:input path="email" placeholder="email" value=""/>
 <form:errors path="email" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="phoneNumber">Phone Number</form:label>
 <form:input path="phoneNumber" placeholder="phoneNumber" value=""/>
 <form:errors path="phoneNumber" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="addressLine1">Address 1</form:label>
 <form:input path="addressLine1" placeholder="addressLine1" value=""/>
 <form:errors path="addressLine1" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 
  <div class="ui-field-contain">
 <form:label path="addressLine2">Address 2</form:label>
 <form:input path="addressLine2" placeholder="addressLine2" value=""/>
 <form:errors path="addressLine2" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 
 <input data-theme="b" type="submit" data-icon="check" value="Save" />
  </form:form> 