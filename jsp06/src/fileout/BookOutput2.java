package fileout;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class BookOutput2 {
	public static void main(String[] args) {
		Book b1 = new Book("이것이 자바다", "홍길동", 30000, "한빛");
		Book b2 = new Book("JSP 2.3", "임꺽정", 40000, "한메");
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("k5.txt"))) {
			List<Book> list = new ArrayList<Book>();
			list.add(b1);
			list.add(b2);

			oos.writeObject(list);
			oos.close();
			System.out.println("저장완료");
		} catch (Exception e) {
		}
	}
}