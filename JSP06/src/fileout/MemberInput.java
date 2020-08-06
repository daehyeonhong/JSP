package fileout;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

public class MemberInput {
	public static void main(String[] args) {
		List<Member> list = new ArrayList<Member>();
		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("member.txt"))) {
			while (true) {
				Member member = (Member) ois.readObject();
				list.add(member);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		for (Member member : list) {
			System.out.println(member.getId() + ", " + member.getPwd() + ", " + member.getName());
		}
	}
}