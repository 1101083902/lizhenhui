package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserMapper;

import pojo.tb_department;
import pojo.tb_userinfo;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserMapper usermapper;

	@Override
	public tb_userinfo login(String userAccoun, String password) {
		return usermapper.login(userAccoun, password);
	}

	@Override
	public List<tb_department> listDepartment() {
		return usermapper.listDepartment();
	}

	@Override
	public List<tb_userinfo> listUserInfo(String userAccoun, int deptid, int pageNum, int pageSize) {
		return usermapper.listUserInfo(userAccoun, deptid, pageNum, pageSize);
	}

	@Override
	public int total(String userAccoun, int deptid) {
		return usermapper.total(userAccoun, deptid);
	}

	@Override
	public tb_userinfo selUserInfo(int userid) {
		return usermapper.selUserInfo(userid);
	}

	@Override
	public int userup(String email, String password, int deptid, int userid) {
		return usermapper.userup(email, password, deptid, userid);
	}

	@Override
	public int insert(tb_userinfo userInfo) {
		return usermapper.insert(userInfo);
	}
	/*
	 * @Override public int data() { return usermapper.data(); }
	 */

	@Override
	public tb_userinfo finduser(String userAccoun) {
		return usermapper.finduser(userAccoun);
	}

	@Override
	public int find(String userAccoun) {
		return usermapper.find(userAccoun);
	}

	@Override
	public int updata(int userid) {
		return usermapper.updata(userid);
	}

}
