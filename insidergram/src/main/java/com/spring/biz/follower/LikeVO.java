package com.spring.biz.follower;

public class LikeVO {
	private int l_idx;
	private int f_idx;
	private String u_id;
	
	
	public LikeVO() {
		super();
	}
	public int getL_idx() {
		return l_idx;
	}
	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	@Override
	public String toString() {
		return "LikeVO [l_idx=" + l_idx + ", f_idx=" + f_idx + ", u_id=" + u_id + "]";
	}

}

