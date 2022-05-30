package com.spring.biz.chat;

public class ChatHeaderVO {
	private int h_idx;
	private String from_id;
	private String to_id;
	private String subject;
	private boolean from_status;
	private boolean to_status;
	private String time;
	
	
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
	public boolean isFrom_status() {
		return from_status;
	}
	public void setFrom_status(boolean from_status) {
		this.from_status = from_status;
	}
	
	public boolean isTo_status() {
		return to_status;
	}
	public void setTo_status(boolean to_status) {
		this.to_status = to_status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "ChatHeaderVO [h_idx=" + h_idx + ", from_id=" + from_id + ", to_id=" + to_id + ", subject=" + subject
				+ ", from_status=" + from_status + ", to_status=" + to_status + ", time=" + time + "]";
	}

	
}
