<%@ include file="/WEB-INF/jsp/include.jsp"%>

<form:form method="POST" enctype="multipart/form-data" data-ajax="false" action="addNewDeferral" modelAttribute="deferralwrapper">

<form:errors path="*" cssClass="errorblock" element="div" />

<%-- <form:errors path="firstname" class="notification error" style="display:block"></form:errors>
<form:errors path="lastname" class="notification error" style="display:block"></form:errors>
<form:errors path="age" class="notification error" style="display:block"></form:errors> --%>
	<div class="ui-field-contain">
			<form:label path="firstName">FirstName</form:label>
			<form:input path="firstName" value="${deferralwrapper.firstName}"/>
		</div>
		<div class="ui-field-contain">
			<form:label path="lastName">LastName</form:label>
			<form:input path="lastName" value="${deferralwrapper.lastName}"/>
		</div>
		<div class="ui-field-contain">
			<form:label path="studentNumber">student number</form:label>
			<form:input path="studentNumber" value="${deferralwrapper.studentNumber}"/>
		</div>
			<div class="ui-field-contain">
			<form:select path="id_program">
			 <form:option value="1" label="DCOM 4"/>
			 <form:option value="2" label="BEST 1"/>
			</form:select>
		</div>
 <!-- 
 <div class="ui-field-contain">
 <form:label path="id_student">Student id</form:label>
 <form:input path="id_student" placeholder="id_student" value=""/>
 <form:errors path="id_student" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="id_program">program id</form:label>
 <form:input path="id_program" placeholder="id_program"  value=""/>
 <form:errors path="id_program" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 -->
 <div data-role-="fieldcontain">
 <fieldset data-role="controlgroup">
 <form:checkbox path="programDeferred"  label="Deferring whole program"/>
 </fieldset>
 <form:errors path="programDeferred" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <input data-theme="b" type="submit" data-icon="check" value="Save" />
  </form:form> 
