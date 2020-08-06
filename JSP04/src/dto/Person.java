package dto;

import java.io.Serializable;

public class Person implements Serializable {
	// 원본 객체 여부 확인 버전 번호
	private static final long serialVersionUID = 1L;

	// field
	private int id = 201804;
	private String name = "홍길동";

	// DefaultCounstructor
	public Person() {
	}

	// getter/setter_Method
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}