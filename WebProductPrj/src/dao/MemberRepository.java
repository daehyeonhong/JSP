package dao;

import java.util.LinkedList;
import java.util.List;

import dto.Member;

public class MemberRepository {
	static private MemberRepository instance = new MemberRepository();
	List<Member> memberList = new LinkedList<Member>();

	public MemberRepository() {
	}

	public static MemberRepository getInstance() {
		return instance;
	}

	/* 회원 리스트 출력 */
	public List<Member> getMemberList() {
		return memberList;
	}

	/* 회원 추가 */
	public void addMember(Member member) {
		memberList.add(member);
	}

	/* 아이디로 회원 정보 출력 */
	public Member getMember(String id) {
		for (int i = 0; i < memberList.size(); i++) {
			Member member = memberList.get(i);
			if (member.getIdname().equals(id)) {
				return member;
			}
		}
		return null;
	}
}