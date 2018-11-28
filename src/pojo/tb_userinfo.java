package pojo;

import java.util.Date;

public class tb_userinfo {
	private int userid;
	private String userAccoun;
	private String password;
	private String email;
	private int deptid;
	private Date createDate;
	private String deifiag;
	private String photo;
	private tb_department department;

	public tb_department getDepartment() {
		return department;
	}

	public void setDepartment(tb_department department) {
		this.department = department;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUserAccoun() {
		return userAccoun;
	}

	public void setUserAccoun(String userAccoun) {
		this.userAccoun = userAccoun;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getDeptid() {
		return deptid;
	}

	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDeifiag() {
		return deifiag;
	}

	public void setDeifiag(String deifiag) {
		this.deifiag = deifiag;
	}
}
