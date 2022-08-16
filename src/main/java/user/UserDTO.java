package user;

import java.sql.Date;

public class UserDTO {
	// 멤버변수
	private String userid; // 아이디
	private String passwd; // 패스워드
	private String name; // 이름
	private String email; // 이메일
	private String hp; // 핸드폰
	private String consent; // 개인정보동의
	private String privacy; // 개인정보동의
	private Date join_date;

	// 기본생성자
	public UserDTO() {
	}

	// 매개변수가 있는 생성자
	public UserDTO(String userid, String passwd, String name, String email, String hp, String consent, String privacy,
			Date join_date) {
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.hp = hp;
		this.consent = consent;
		this.privacy = privacy;
		this.join_date = join_date;
	}

	// getter, setter

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getConsent() {
		return consent;
	}

	public void setConsent(String consent) {
		this.consent = consent;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", hp=" + hp
				+ ", consent=" + consent + ", privacy=" + privacy + ", join_date=" + join_date + "]";
	}

}
