<<<<<<< HEAD
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<form:form method="POST" enctype="multipart/form-data" data-ajax="false" action="addModule" modelAttribute="module">

<form:errors path="*" cssClass="errorblock" element="div" />

<%-- <form:errors path="firstname" class="notification error" style="display:block"></form:errors>
<form:errors path="lastname" class="notification error" style="display:block"></form:errors>
<form:errors path="age" class="notification error" style="display:block"></form:errors> --%>

 <div class="ui-field-contain">
 <form:label path="id">Module id</form:label>
 <form:input path="id" placeholder="id" value=""/>
 <form:errors path="id" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="semester">Module semester</form:label>
 <form:input path="semester" placeholder="semester"  value=""/>
 <form:errors path="semester" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="code">Module code</form:label>
 <form:input path="code" placeholder="code"  value=""/>
 <form:errors path="code" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="crn">Module crn</form:label>
 <form:input path="crn" placeholder="crn"  value=""/>
 <form:errors path="crn" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="name">Module name</form:label>
 <form:input path="name" placeholder="name"  value=""/>
 <form:errors path="name" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
  
 <input data-theme="b" type="submit" data-icon="check" value="Save" />
  </form:form> 
=======
<%@ include file="/WEB-INF/jsp/include.jsp"%>

<form:form method="POST" enctype="multipart/form-data" data-ajax="false" action="addModule" modelAttribute="module">

<form:errors path="*" cssClass="errorblock" element="div" />

<%-- <form:errors path="firstname" class="notification error" style="display:block"></form:errors>
<form:errors path="lastname" class="notification error" style="display:block"></form:errors>
<form:errors path="age" class="notification error" style="display:block"></form:errors> --%>

 <div class="ui-field-contain">
 <form:label path="id">Module id</form:label>
 <form:input path="id" placeholder="id" value=""/>
 <form:errors path="id" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="semester">Module semester</form:label>
 <form:input path="semester" placeholder="semester"  value=""/>
 <form:errors path="semester" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="code">Module code</form:label>
 <form:input path="code" placeholder="code"  value=""/>
 <form:errors path="code" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="crn">Module crn</form:label>
 <form:input path="crn" placeholder="crn"  value=""/>
 <form:errors path="crn" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
 
 <div class="ui-field-contain">
 <form:label path="name">Module name</form:label>
 <form:input path="name" placeholder="name"  value=""/>
 <form:errors path="name" cssClass="error" class="notification error" style="display:block"></form:errors>
 </div>
  
 <input data-theme="b" type="submit" data-icon="check" value="Save" />
  </form:form> 
>>>>>>> 7695961300b598ab5fa159877f9b3bc90a39b48a
