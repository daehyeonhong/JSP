package model;

public class Member {
	private String name;

	public Member() {
	}

	public String getName() {
		System.out.println("getName() 실행");
		return name;
	}

	public void setName(String name) {
		System.out.println("setName() 실행");
		this.name = name;
	}
}