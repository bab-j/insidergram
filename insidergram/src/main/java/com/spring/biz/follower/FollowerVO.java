package com.spring.biz.follower;

public class FollowerVO {
	private int er_idx;
	private String to_id;
	private String from_id;
	
	public FollowerVO() {
		super();
	}
	
	public int getEr_idx() {
		return er_idx;
	}
	public void setEr_idx(int er_idx) {
		this.er_idx = er_idx;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}

	@Override
	public String toString() {
		return "FollowerVO [er_idx=" + er_idx + ", to_id=" + to_id + ", from_id=" + from_id + "]";
	}
	
}
