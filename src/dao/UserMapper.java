package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.tb_department;
import pojo.tb_userinfo;

public interface UserMapper {
	tb_userinfo login(@Param("userAccoun") String userAccoun, @Param("password") String password);

	List<tb_department> listDepartment();// 查询下拉

	List<tb_userinfo> listUserInfo(@Param("userAccoun") String userAccoun, @Param("deptid") int deptid,
			@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

	int total(@Param("userAccoun") String userAccoun, @Param("deptid") int deptid); // 查询总条数

	tb_userinfo selUserInfo(@Param("userid") int userid);// 修改

	int userup(@Param("email") String email, @Param("password") String password, @Param("deptid") int deptid,
			@Param("userid") int userid);

	int insert(tb_userinfo userInfo);// 注册

	/* int data(); */
	tb_userinfo finduser(@Param("userAccoun") String userAccoun);

	int find(@Param("userAccoun") String userAccoun);

	int updata(@Param("userid") int userid);

}
