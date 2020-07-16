package fileout;

import java.io.Serializable;

public class GoodInfo {
	String code;
	int price;
	String name;

	public GoodInfo() {
	}

	public GoodInfo(String code, int price, String name) {
		this.code = code;
		this.price = price;
		this.name = name;
	}

}

class BookInfo extends GoodInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	String writer;
	int page;

	public BookInfo(String code, int price, String name, String writer, int page) {
		super(code, price, name);
		this.writer = writer;
		this.page = page;
	}
}