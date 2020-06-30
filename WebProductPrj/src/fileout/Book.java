package fileout;

import java.io.Serializable;

public class Book implements Serializable {
	private static final long serialVersionUID = 1L;
	String subject, write;
	/* transient로 선언된 필드는 serialize에서 제외 */
	transient int price;
	/* static 선언된 필드는 serialize에서 제외 */
	static String publish;

	public Book() {
	}

	public Book(String subject, String write, int price, String publish) {
		this.subject = subject;
		this.write = write;
		this.price = price;
		Book.publish = publish;
	}
}