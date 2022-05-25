package com.spring.biz.chat;

public class ChatMessageVO {
	private int mIdx;
	private int hIdx;
	private String content;
	private String time;
	private boolean read;
	private String uId;
	private String uName;
	private String uPic;
	public ChatMessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public int gethIdx() {
		return hIdx;
	}
	public void sethIdx(int hIdx) {
		this.hIdx = hIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public boolean isRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPic() {
		return uPic;
	}
	public void setuPic(String uPic) {
		this.uPic = uPic;
	}
	@Override
	public String toString() {
		return "ChatMessageVO [mIdx=" + mIdx + ", hIdx=" + hIdx + ", content=" + content + ", time=" + time + ", read="
				+ read + "]";
	}
	
	
}
