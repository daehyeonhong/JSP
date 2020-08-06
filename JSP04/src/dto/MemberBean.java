package dto;

import java.io.Serializable;

//JavaBean 생성
//1.Serializable_interface
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	// 2.private_field
	private int id;
	private String name;

	// 3.Default_Constructor
	public MemberBean() {
	}

	// 4.getters/setters_Method
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}