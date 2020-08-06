package fileout;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class BookInfo2 extends GoodInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	/* String code, price, name; */
	String writer;
	int page;

	public BookInfo2(String code, int price, String name, String writer, int page) {
		super(code, price, name);
		this.writer = writer;
		this.page = page;
	}

	/* 파일저장시 자동 호출 */
	private void writeObject(ObjectOutputStream oos) throws IOException {
		oos.writeUTF(code);
		oos.writeInt(price);
		oos.writeUTF(name);
		/* 자식 클래스의 ObjectWrite() 메소드 호출 */
		oos.defaultWriteObject();
	}

	// 파일로부터 읽어들여서 객체로 생성시 자동호출
	private void readObject(ObjectInputStream ois) throws IOException, ClassNotFoundException {
		code = ois.readUTF();
		price = ois.readInt();
		name = ois.readUTF();
		/* 자식 클래스의 ObjectRead() 메소드 호출 */
		ois.defaultReadObject();
	}
}