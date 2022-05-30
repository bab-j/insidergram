package com.spring.biz.feed;

import org.springframework.web.multipart.MultipartFile;

public class FeedVO {	
	private int f_idx;
	private String regdate;
	private String content;
	private String u_id;
	private String f_pic;
	private String u_pic;
	private MultipartFile uploadFile = null;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getU_pic() {
		return u_pic;
	}

	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}

	public FeedVO() {
		super();
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

	public String getF_pic() {
		return f_pic;
	}

	public void setF_pic(String f_pic) {
		this.f_pic = f_pic;
	}

	@Override
	public String toString() {
		return "FeedVO [f_idx=" + f_idx + ", regdate=" + regdate + ", content=" + content + ", u_id=" + u_id
				+ ", f_pic=" + f_pic + ", u_pic=" + u_pic + ", uploadFile=" + uploadFile + "]";
	}

	
	
	
	
	
	
	

	
	
	
}
