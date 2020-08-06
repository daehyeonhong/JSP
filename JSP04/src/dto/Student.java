package dto;

import java.io.Serializable;

public class Student implements Serializable {
	private static final long serialVersionUID = 1L;
	// field
	private String sno, name, dept, age;

	// constructor
	public Student() {
	}

	// get/set_Method get + field, set + field
	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
}
