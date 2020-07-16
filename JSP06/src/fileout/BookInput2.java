package fileout;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.List;

public class BookInput2 {
	public static void main(String[] args) {
		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("k5.txt"))) {
			/* 역 직렬화 */

			List<Book> list = (List<Book>) ois.readObject();
			for (int i = 0; i < list.size(); i++) {
				Book book = list.get(i);
				/* Book b1 = (Book) ois.readObject(); */
				System.out.println(book.subject + ", " + book.price /* transient */ + ", " + book.write + ", "
						+ Book.publish /* static */);
				System.out.printf("제목: \"%s\", 가격: %d원, 저자: \"%s\", 출판사: \"%s\"\n", book.subject, book.price,
						book.write, Book.publish);
			}
		} catch (Exception e) {
		}
	}
}