package com.citonline.domain;

import java.util.ArrayList;

public class Deferralwrapper {
	int id;
	String deferral_date;
	int id_student;
	ArrayList<Module> deferredModules;
	boolean programDeferred;
	int id_program;
	int id_deferral_status;
	String firstName, lastName;
	String studentNumber;
	int courseCode;
	
	public Deferralwrapper(){}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeferral_date() {
		return deferral_date;
	}
	public void setDeferral_date(String deferral_date) {
		this.deferral_date = deferral_date;
	}
	public int getId_student() {
		return id_student;
	}
	public void setId_student(int id_student) {
		this.id_student = id_student;
	}
	public ArrayList<Module> getDeferredModules() {
		return deferredModules;
	}
	public void setDeferredModules(ArrayList<Module> deferredModules) {
		this.deferredModules = deferredModules;
	}
	public boolean getProgramDeferred() {
		return programDeferred;
	}
	public void setProgramDeferred(boolean programDeferred) {
		this.programDeferred = programDeferred;
	}
	public int getId_program() {
		return id_program;
	}
	public void setId_program(int id_program) {
		this.id_program = id_program;
	}
	public int getId_deferral_status() {
		return id_deferral_status;
	}
	public void setId_deferral_status(int id_deferral_status) {
		this.id_deferral_status = id_deferral_status;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

}
