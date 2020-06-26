package dto;

import java.io.Serializable;

//Bean 생성
public class Fruit implements Serializable {

	/*
	 * 클래스의 원본 여부 판단하는 번호
	 */
	private static final long serialVersionUID = 1L;

	// field
	private String kind;
	private int price;

	// defaultConstructor
	public Fruit() {
	}

	// Method
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
