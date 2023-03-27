package pethaha.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MemberVO {
	@NotNull(message="아이디를 입력해주세요")
	@NotEmpty(message="아이디를 입력해주세요")
	private String ID;
	@NotNull(message="비밀번호를 입력해주세요")
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String PWD;
	@NotNull(message="닉네임을 입력해주세요")
	@NotEmpty(message="닉네임을 입력해주세요")
	private String NICK;
	@NotNull(message="전화번호를 입력해주세요")
	@NotEmpty(message="전화번호를 입력해주세요")
	private String PHONE;
	@NotNull(message="이름을 입력해주세요")
	@NotEmpty(message="이름을 입력해주세요")
	private String NAME;
	@NotNull(message="소개글을 입력해주세요")
	@NotEmpty(message="소개글을 입력해주세요")
	private String INTRO;
	@NotNull(message="사진을 넣어주세요")
	@NotEmpty(message="사진을 넣어주세요")
	private String MemIMG;
	private Number POINT;
	private Number KICK;
	
}
