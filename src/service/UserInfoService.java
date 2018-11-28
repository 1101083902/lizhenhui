package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.tb_department;
import pojo.tb_userinfo;

public interface UserInfoService {

	tb_userinfo login(String userAccoun, String password);

	List<tb_department> listDepartment();// 查询下拉

	List<tb_userinfo> listUserInfo(String userAccoun, int deptid, int pageNum, int pageSize);

	int total(String userAccoun, int deptid); // 查询总条数

	tb_userinfo selUserInfo(int userid); // 查询修改

	int userup(String email, String password, int deptid, int userid);// id修改

	int insert(tb_userinfo userInfo);// 注册

	tb_userinfo finduser(String userAccoun);

	int find(String userAccoun);

	int updata(int userid);

}
