package com.spring.biz.feed;

public class FeedVO {	
	private int fIdx;
	private String regdate;
	private String content;
	private String uId;
	private String fPic;
	
	
	public FeedVO() {
		super();
	}
	
	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	
	
	public String getfPic() {
		return fPic;
	}
	public void setfPic(String fPic) {
		this.fPic = fPic;
	}
	@Override
	public String toString() {
		return "FeedVO [fIdx=" + fIdx + ", regdate=" + regdate + ", content=" + content + ", uId=" + uId + ", fPic=" + fPic + "]";
	}

	
	
	
}
