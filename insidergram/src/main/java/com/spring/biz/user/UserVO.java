package com.spring.biz.user;

public class UserVO {
	private int uIdx;
	private String uId;
	private String password;
	private String phone;
	private String email;
	private String birth;
	private String name;
	private String bio;
	private String uPic;
	
	public UserVO() {
		super();
	}
	
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
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
	public String getuPic() {
		return uPic;
	}
	public void setuPic(String uPic) {
		this.uPic = uPic;
	}
	@Override
	public String toString() {
		return "UserVO [uIdx=" + uIdx + ", uId=" + uId + ", password=" + password + ", phone=" + phone + ", email="
				+ email + ", birth=" + birth + ", name=" + name + ", bio=" + bio + ", uPic=" + uPic + "]";
	}	
	
}
