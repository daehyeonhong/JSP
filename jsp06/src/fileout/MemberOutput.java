package fileout;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class MemberOutput {
	public static void main(String[] args) {
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("member.txt"))) {
			Member m1 = new Member("hong", "1234", "홍길동");
			Member m2 = new Member("kim", "1234", "김길동");
			Member m3 = new Member("jang", "1234", "장길동");

			List<Member> list = new ArrayList<Member>();

			list.add(m1);
			list.add(m2);
			list.add(m3);

			for (int i = 0; i < list.size(); i++) {
				oos.writeObject(list.get(i));
			}

			oos.writeObject(m1);
			oos.writeObject(m2);
			oos.writeObject(m3);
			
			System.out.println("저장 완료!");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}