package com.spring.biz.user;

public class UserVO {
	private String u_id;
	private String password;
	private String phone;
	private String email;
	private String birth;
	private String name;
	private String bio;
	private String u_pic;
	
	public UserVO() {
		super();
	}
	
	


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}


	public String getU_pic() {
		return u_pic;
	}


	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}


	@Override
	public String toString() {
		return "UserVO [ u_id=" + u_id + ", password=" + password + ", phone=" + phone + ", email="
				+ email + ", birth=" + birth + ", name=" + name + ", bio=" + bio + ", u_pic=" + u_pic + "]";
	}
	


	
	
	
}
