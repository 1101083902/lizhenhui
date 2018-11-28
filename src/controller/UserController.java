package controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pojo.tb_department;
import pojo.tb_userinfo;

import service.UserInfoService;

@Controller
public class UserController {

	@RequestMapping("/login.html")
	public String UserSele() {
		return "/login";
	}

	@Autowired
	private UserInfoService userinfoservice;

	@RequestMapping("/Verifying")
	@ResponseBody
	String dengLu(@RequestParam("userAccoun") String userAccoun, HttpServletResponse hs) {
		tb_userinfo user2 = userinfoservice.finduser(userAccoun);
		if (user2 != null) {
			String userFile = user2.getPhoto();
			return userFile;
		} else {
			return null;
		}
	}

	@RequestMapping(value = "login")
	public String login(@RequestParam(value = "userAccoun") String userAccoun,
			@RequestParam("password") String password, Model model) {
		tb_userinfo login = userinfoservice.login(userAccoun, password);
		System.out.println(userAccoun);
		if (login != null && !login.getDeifiag().equals("1")) {
			return "redirect:listUserInfo";
		} else {
			model.addAttribute("massage", "密码有误或账号已删除");
			return "login";
		}
	}

	@RequestMapping(value = "/listUserInfo")
	public String listUserInfo(@RequestParam(value = "userAccoun", required = false) String userAccoun,
			@RequestParam(value = "deptid", required = false, defaultValue = "0") String deptid,
			@RequestParam(value = "index", required = false) String index, Model model) {

		int pageNum = 1;
		int pageSize = 3;
		if (index != null) {
			pageNum = Integer.parseInt(index);
		}
		Integer pageNumSize = (pageNum - 1) * pageSize;

		List<tb_department> listDepartment = userinfoservice.listDepartment();
		List<tb_userinfo> listUserInfo = userinfoservice.listUserInfo(userAccoun, Integer.parseInt(deptid), pageNumSize,
				pageSize);

		int getTotal = userinfoservice.total(userAccoun, Integer.parseInt(deptid));// 查询总条数
		int count = getTotal % pageSize == 0 ? getTotal / pageSize : (getTotal / pageSize) + 1;

		if (listUserInfo != null) {
			model.addAttribute("listUserInfo", listUserInfo);
			model.addAttribute("count", count);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("userAccoun", userAccoun);
			model.addAttribute("deptid", deptid);
			model.addAttribute("listDepartment", listDepartment);
			return "index";
		}
		return "error";
	}

	@RequestMapping(value = "selUserInfo")
	public String selUserInfo(@RequestParam(value = "userid") int userid, Model model) {
		List<tb_department> listDepartment = userinfoservice.listDepartment();
		tb_userinfo selUserInfo = userinfoservice.selUserInfo(userid);
		if (selUserInfo != null) {
			model.addAttribute("selUserInfo", selUserInfo);
			model.addAttribute("listDepartment", listDepartment);
			return "modify";
		}
		return "error";
	}

	@RequestMapping("UserUpdate")
	public String UserUpdate(@RequestParam(value = "email") String email,
			@RequestParam(value = "password") String password, @RequestParam(value = "deptid") int deptid,
			@RequestParam(value = "userid") int userid) {
		int update = userinfoservice.userup(email, password, deptid, userid);
		return "redirect:listUserInfo";
	}

	@RequestMapping(value = "selDepartment")
	public String selDepartment(Model model) {
		List<tb_department> listDepartment = userinfoservice.listDepartment();
		if (listDepartment != null) {
			model.addAttribute("listDepartment", listDepartment);
			return "register";
		}
		return "login";
	}

	@RequestMapping(value = "insUserInfo")
	public String insUserInfo(tb_userinfo userInfo, @RequestParam(value = "files") MultipartFile photo,
			HttpSession session) {
		String path = session.getServletContext().getRealPath("upload/");

		String newFile = photo.getOriginalFilename();

		File file = new File(path, newFile);

		if (!file.exists()) {
			file.mkdir();
		}
		try {
			photo.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		userInfo.setPhoto(newFile);
		int count = userinfoservice.insert(userInfo);
		if (count > 0) {
			return "login";
		}
		return "register";
	}

	@RequestMapping("/Username")
	@ResponseBody
	public String userName(@RequestParam("userAccoun") String userAccoun, HttpSession session) {
		if (userinfoservice.find(userAccoun) > 0) {
			return "1";
		} else {
			return "0";
		}
	}

	@RequestMapping(value = "date")
	public String selDepar(@RequestParam("userid") int userid) {
		int updata = userinfoservice.updata(userid);
		return "redirect:listUserInfo";
	}

}
