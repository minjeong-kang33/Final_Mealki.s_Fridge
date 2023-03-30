package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class EmployeeDTO {
	private int emp_num;
	private String dept_num;
	private String emp_pass;
	private String emp_Kname;
	private String emp_Ename;
	private String emp_birth;
	private String emp_gender;
	private int emp_tel;
	private int emp_phone;
	private String emp_email;
	private String emp_addr;
	private String emp_addr2;
	private String emp_status;
	private int emp_classification;
	private Timestamp emp_joinDate;
	private Timestamp emp_leaveDate;
	private Timestamp emp_absenceDate;
	private String dept_position;
	private String dept_duty;
	private String emp_img;
	private int emp_numbering;
	
	
	
	public String getEmp_img() {
		return emp_img;
	}
	public void setEmp_img(String emp_img) {
		this.emp_img = emp_img;
	}
	public int getEmp_numbering() {
		return emp_numbering;
	}
	public void setEmp_numbering(int emp_numbering) {
		this.emp_numbering = emp_numbering;
	}
	public String getDept_position() {
		return dept_position;
	}
	public void setDept_position(String dept_position) {
		this.dept_position = dept_position;
	}
	public String getDept_duty() {
		return dept_duty;
	}
	public void setDept_duty(String dept_duty) {
		this.dept_duty = dept_duty;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public String getDept_num() {
		return dept_num;
	}
	public void setDept_num(String dept_num) {
		this.dept_num = dept_num;
	}
	public String getEmp_pass() {
		return emp_pass;
	}
	public void setEmp_pass(String emp_pass) {
		this.emp_pass = emp_pass;
	}
	public String getEmp_Kname() {
		return emp_Kname;
	}
	public void setEmp_Kname(String emp_Kname) {
		this.emp_Kname = emp_Kname;
	}
	public String getEmp_Ename() {
		return emp_Ename;
	}
	public void setEmp_Ename(String emp_Ename) {
		this.emp_Ename = emp_Ename;
	}
	public String getEmp_birth() {
		return emp_birth;
	}
	public void setEmp_birth(String emp_birth) {
		this.emp_birth = emp_birth;
	}
	public String getEmp_gender() {
		return emp_gender;
	}
	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}
	public int getEmp_tel() {
		return emp_tel;
	}
	public void setEmp_tel(int emp_tel) {
		this.emp_tel = emp_tel;
	}
	public int getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(int emp_phone) {
		this.emp_phone = emp_phone;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_addr() {
		return emp_addr;
	}
	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
	}
	public String getEmp_addr2() {
		return emp_addr2;
	}
	public void setEmp_addr2(String emp_addr2) {
		this.emp_addr2 = emp_addr2;
	}
	public String getEmp_status() {
		return emp_status;
	}
	public void setEmp_status(String emp_status) {
		this.emp_status = emp_status;
	}
	public int getEmp_classification() {
		return emp_classification;
	}
	public void setEmp_classification(int emp_classification) {
		this.emp_classification = emp_classification;
	}
	public Timestamp getEmp_joinDate() {
		return emp_joinDate;
	}
	public void setEmp_joinDate(Timestamp emp_joinDate) {
		this.emp_joinDate = emp_joinDate;
	}
	public Timestamp getEmp_leaveDate() {
		return emp_leaveDate;
	}
	public void setEmp_leaveDate(Timestamp emp_leaveDate) {
		this.emp_leaveDate = emp_leaveDate;
	}
	public Timestamp getEmp_absenceDate() {
		return emp_absenceDate;
	}
	public void setEmp_absenceDate(Timestamp emp_absenceDate) {
		this.emp_absenceDate = emp_absenceDate;
	}

	
}
