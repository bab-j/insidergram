package com.spring.biz.chat;

public class ChatHeaderVO {
	private int hIdx;
	private String fromId;
	private String toId;
	private String subject;
	private boolean status;
	
	
	public ChatHeaderVO() {
		super();
	}
	public int gethIdx() {
		return hIdx;
	}
	public void sethIdx(int hIdx) {
		this.hIdx = hIdx;
	}
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "ChatHeaderVO [hIdx=" + hIdx + ", fromId=" + fromId + ", toId=" + toId + ", subject=" + subject
				+ ", status=" + status + "]";
	}

	
}
