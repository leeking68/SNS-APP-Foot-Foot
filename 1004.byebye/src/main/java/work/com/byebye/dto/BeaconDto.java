package work.com.byebye.dto;

public class BeaconDto {

	private int idx;
	private String bId;
	private String bSpotName;
	private String bLoaction;
	private String bPage;
	private String bImg;
	
	public BeaconDto(){}
	
	public BeaconDto(int idx, String bId, String bSpotName, String bLoaction, String bPage, String bImg) {
		this.idx = idx;
		this.bId = bId;
		this.bSpotName = bSpotName;
		this.bLoaction = bLoaction;
		this.bPage = bPage;
		this.bImg = bImg;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbSpotName() {
		return bSpotName;
	}

	public void setbSpotName(String bSpotName) {
		this.bSpotName = bSpotName;
	}

	public String getbLoaction() {
		return bLoaction;
	}

	public void setbLoaction(String bLoaction) {
		this.bLoaction = bLoaction;
	}

	public String getbPage() {
		return bPage;
	}

	public void setbPage(String bPage) {
		this.bPage = bPage;
	}

	public String getbImg() {
		return bImg;
	}

	public void setbImg(String bImg) {
		this.bImg = bImg;
	}

	@Override
	public String toString() {
		return "BeaconDto [idx=" + idx + ", bId=" + bId + ", bSpotName=" + bSpotName + ", bLoaction=" + bLoaction
				+ ", bPage=" + bPage + ", bImg=" + bImg + "]";
	}

	
}
