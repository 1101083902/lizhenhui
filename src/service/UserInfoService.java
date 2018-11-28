package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.tb_department;
import pojo.tb_userinfo;

public interface UserInfoService {

	tb_userinfo login(String userAccoun, String password);

	List<tb_department> listDepartment();// ��ѯ����

	List<tb_userinfo> listUserInfo(String userAccoun, int deptid, int pageNum, int pageSize);

	int total(String userAccoun, int deptid); // ��ѯ������

	tb_userinfo selUserInfo(int userid); // ��ѯ�޸�

	int userup(String email, String password, int deptid, int userid);// id�޸�

	int insert(tb_userinfo userInfo);// ע��

	tb_userinfo finduser(String userAccoun);

	int find(String userAccoun);

	int updata(int userid);

}
