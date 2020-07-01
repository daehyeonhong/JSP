package fileout;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class GoodOutput2 {
	public static void main(String[] args) throws FileNotFoundException, IOException {
		BookInfo2 b1 = new BookInfo2("111", 2000, "Java", "홍길동", 900);
		BookInfo2 b2 = new BookInfo2("222", 2500, "JSP", "임꺽정", 750);

		ObjectOutputStream ois = new ObjectOutputStream(new FileOutputStream("k4.txt"));
		ois.writeObject(b1);
		ois.writeObject(b2);
		ois.close();
		System.out.println("저장완료!");
	}
}