package com.spring.biz.chat;

public class ChatHeaderVO {
	private int h_idx;
	private String from_id;
	private String to_id;
	private String subject;
	private boolean status;
	
	
	public ChatHeaderVO() {
		super();
	}
	public int getH_idx() {
		return h_idx;
	}
	public void setH_idx(int hIdx) {
		this.h_idx = hIdx;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
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
		return "ChatHeaderVO [h_idx=" + h_idx + ", from_id=" + from_id + ", to_id=" + to_id + ", subject=" + subject
				+ ", status=" + status + "]";
	}

	
}
