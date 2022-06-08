package com.spring.biz.comment;

public class CommentVO {
	int co_idx;
	String regdate;
	String comm;
	int f_idx;
	String u_id;
	String u_pic;
	
	
	public String getU_pic() {
		return u_pic;
	}
	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public CommentVO() {
		super();
	}
	public int getCo_idx() {
		return co_idx;
	}
	public void setCo_idx(int co_idx) {
		this.co_idx = co_idx;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	@Override
	public String toString() {
		return "CommentVO [co_idx=" + co_idx + ", regdate=" + regdate + ", comm=" + comm + ", f_idx=" + f_idx
				+ ", u_id=" + u_id + ", u_pic=" + u_pic + "]";
	}
	
}
