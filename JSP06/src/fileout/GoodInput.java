package fileout;

import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class GoodInput {
	public static void main(String[] args) {
		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("k3.txt"))) {
			while (true) {
				BookInfo b = (BookInfo) ois.readObject();
				System.out.println(b.code);
				System.out.println(b.name);
				System.out.println(b.price);
				System.out.println(b.writer);
				System.out.println(b.page);
				System.out.println("───────────────");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}