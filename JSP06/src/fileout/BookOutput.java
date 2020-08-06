package fileout;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

public class BookOutput {
	public static void main(String[] args) {
		Book b1 = new Book("죄와 벌", "도스토예프스키", 20000, "중앙"), b2 = new Book("나목", "박완서", 20000, "창밖"),
				b3 = new Book("하수와 고수", "강병호", 1000, "푸른 숲");
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("k2.txt"))) {
			oos.writeObject(b1);
			oos.writeObject(b2);
			oos.writeObject(b3);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}