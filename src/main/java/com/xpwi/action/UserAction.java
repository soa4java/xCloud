package com.xpwi.action;

import com.alibaba.fastjson.JSON;
import com.xpwi.pojo.UserInfo;
import com.xpwi.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserAction {
    @Autowired
    IUserService userServiceImpl;

    //修改新注册用户的 status
    @RequestMapping(value = "/updateUserStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateOldUpwd(int user_id, int user_status) {

        int i = userServiceImpl.updateUserStatus(user_id, user_status);
        System.out.println("【修改用户状态】" + i);
        return i;

    }

    //调试成功分割线>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    //用户激活状态管理
    @RequestMapping(value = "newUserManger.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> findUserFile(int user_status, int page, int limit) {//根据用户信息查询
        Map map = new HashMap();
        map.put("user_status", user_status);
        map.put("page", page);
        map.put("limit", limit);

        System.out.println(map);
        List<Map<String, Object>> maps = userServiceImpl.newUserManger(map);
        System.out.println("【查询新用户】" + maps);
        Map map1 = new HashMap();
        map1.put("data", maps);
        if (maps != null)
            map1.put("msg", "查询成功");
        else
            map1.put("msg", "没有未处理用户");
        map1.put("code", 0);

        return map1;
    }

    //用户信息统计
    @RequestMapping(value = "/userAnalysis.do", method = RequestMethod.GET)
    @ResponseBody
    public Map userAnalysis() {
        List<Map> list = userServiceImpl.userAnalysis();
        List<String> statusList = new ArrayList<String>();
        List<Integer> countList = new ArrayList<Integer>();
        for (Map map : list) {
            //[{"aaa":32,'count':43},{"bb":43,'count':54}]
            statusList.add(map.get("status").toString());
            countList.add(Integer.parseInt(map.get("count").toString()));
        }
        Map map = new HashMap();
        map.put("status", statusList);
        map.put("count", countList);
        return map;
    }

    //更新用户信息
    @RequestMapping(value = "/updateInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateUserInfo(UserInfo userinfo) {
        int i = userServiceImpl.updateUserInfo(userinfo);
        System.out.println("【更新用户详细信息】" + i);
        return i;
    }

    //根据 Id 查询详细信息
    @RequestMapping(value = "/findUserInfoById.do", method = RequestMethod.GET)
    @ResponseBody
    public Map findUserInfoById(@RequestParam("userid") String user_id) {
        Map userInfo = userServiceImpl.findUserInfoById(user_id);
        System.out.println("【查找用户详细信息】" + userInfo);
        return userInfo;
    }

    //修改密码
    @RequestMapping(value = "/updateOldUpwd.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateOldUpwd(int userid, String oldpwd, String newpwd) {
        int validate = userServiceImpl.validateOldPwd(userid, oldpwd);
        if (validate == 0) {
            return -1;
        } else {
            int i = userServiceImpl.updateOldPwd(userid, newpwd);
            System.out.println("【修改用户密码】" + i);
            return i;
        }

    }

    //登录验证
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    @ResponseBody
    public Map login(String uname, String upwd, HttpSession session) {
        System.out.println("【登录】" + uname + "-" + upwd);
        Map<String, Object> login = userServiceImpl.login(uname, upwd);
//        System.out.println(uname+","+upwd+","+login);
        Map map = new HashMap();
        if (login == null) {
            System.out.println("login为空");
            map.put("loginmsg", 0);
            System.out.println(JSON.toJSONString(map));
            return map;
        } else {
            map.put("loginmsg", 1);
            map.put("userid", login.get("user_id").toString());
            map.put("user_type", login.get("user_type").toString());
            map.put("status", login.get("status").toString());
            //session 存一下 id
            session.setAttribute("userid", login.get("user_id").toString());
            //判断数据库返回的 login 中 head 不为空
            if (login.get("head") != null || login.get("head").toString() != "") {
                map.put("headPath", login.get("head").toString());
                System.out.println("【" + uname + " 登录成功】");
            } else {
                //判断数据库返回的 login 中 head 为空
                map.put("headPath", "myphoto/myphoto.jpg");
            }
//            System.out.println(JSON.toJSONString(map));
            return map;
        }
    }

    //注册用户
    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    @ResponseBody
    public int register(String uname, String upwd, String email) {
        Map map = new HashMap();
        map.put("uname", uname);
        map.put("upwd", upwd);
        map.put("email", email);
        System.out.println("【注册信息】" + map);
        int register = userServiceImpl.register(map);
        if (register == 0)
            return 0;
        else {
            System.out.println("【注册成功】" + uname + "-" + upwd);
            return 1;
        }
    }


}
