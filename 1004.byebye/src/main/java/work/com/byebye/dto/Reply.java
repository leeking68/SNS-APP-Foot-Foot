package work.com.byebye.dto;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Reply implements Serializable {
	private String reNum;
	private String reCon;
	private String docNum;
	private String userid;
	private String nickname;
	private String reDate;
	
	public Reply(){}
	
	
	
	

	public String getUserid() {
		return userid;
	}





	public void setUserid(String userid) {
		this.userid = userid;
	}





	public String getReDate() {
		return reDate;
	}





	public void setReDate(String reDate) {
		this.reDate = reDate;
	}





	public Reply(String reCon, String docNum, String userid, String nickname) {
		super();
		this.reCon = reCon;
		this.docNum = docNum;
		this.userid = userid;
		this.nickname = nickname;
	}





	public Reply(String reNum, String reCon, String docNum, String userid, String nickname) {
		super();
		this.reNum = reNum;
		this.reCon = reCon;
		this.docNum = docNum;
		this.userid = userid;
		this.nickname = nickname;
	}





	public String getReNum() {
		return reNum;
	}

	
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setReNum(String reNum) {
		this.reNum = reNum;
	}

	public String getReCon() {
		return reCon;
	}

	public void setReCon(String reCon) {
		this.reCon = reCon;
	}

	public String getDocNum() {
		return docNum;
	}

	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

//	public String getuserid() {
//		return userid;
//	}
//
//	public void setuserid(String userid) {
//		this.userid = userid;
//	}
	
	

	@Override
	public String toString() {
		return "Reply [reNum=" + reNum + ", reCon=" + reCon + ", docNum=" + docNum + ", userid=" + userid + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((docNum == null) ? 0 : docNum.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reply other = (Reply) obj;
		if (docNum == null) {
			if (other.docNum != null)
				return false;
		} else if (!docNum.equals(other.docNum))
			return false;
		return true;
	}
	
	
	
}