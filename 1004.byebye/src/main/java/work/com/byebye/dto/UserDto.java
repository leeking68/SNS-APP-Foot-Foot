package work.com.byebye.dto;

public class UserDto {
	/** 
	 * KAKAO : id, nickname, img 
	 * NAVER : email, nickname
	 */
	private String userid;
	private String nickname;
	private String userimg;
	
	/** DB : kakao, naver */
	private String grade;
	
	public UserDto() {}
	
	public UserDto(String userid, String nickname, String userimg, String grade) {
		this.userid = userid;
		this.nickname = nickname;
		this.userimg = userimg;
		this.grade = grade;
	}
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserimg() {
		return userimg;
	}

	public void setUserimg(String userimg) {
		this.userimg = userimg;
	}

	@Override
	public String toString() {
		return "UserDto [userid=" + userid + ", nickname=" + nickname + ", userimg=" + userimg + "]";
	}
	
}
