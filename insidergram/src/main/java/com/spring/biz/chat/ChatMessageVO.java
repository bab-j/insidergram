package com.spring.biz.chat;

public class ChatMessageVO {
	private int m_idx;
	private int h_idx;
	private String content;
	private String time;
	private boolean read;
	private String u_id;
	private String u_name;
	private String u_pic;
	public ChatMessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getH_idx() {
		return h_idx;
	}
	public void setH_idx(int h_idx) {
		this.h_idx = h_idx;
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pic() {
		return u_pic;
	}
	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}
	@Override
	public String toString() {
		return "ChatMessageVO [m_idx=" + m_idx + ", h_idx=" + h_idx + ", content=" + content + ", time=" + time
				+ ", read=" + read + ", u_id=" + u_id + ", u_name=" + u_name + ", u_pic=" + u_pic + "]";
	}
	
	
	
}
