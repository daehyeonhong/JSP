package fileout;

import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class GoodInput2 {
	public static void main(String[] args) {
		ObjectInputStream ois = null;
		try {
			ois = new ObjectInputStream(new FileInputStream("k4.txt"));

			while (true) {
				BookInfo2 b = (BookInfo2) ois.readObject();
				System.out.println(b.code);
				System.out.println(b.name);
				System.out.println(b.price);
				System.out.println(b.writer);
				System.out.println(b.page);
				System.out.println("──────");
			}
		} catch (Exception e) {
		}
	}
}