package com.xpwi.service.impl;

import com.xpwi.dao.IUserDAO;
import com.xpwi.pojo.UserInfo;
import com.xpwi.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    IUserDAO userDAO;
    @Override
    public Map<String, Object> login(String uname, String upwd) {
        Map<String, Object> login = userDAO.login(uname, upwd);
        return login;
    }

    @Override
    public Map<String, Object> findUserByEmail(String userEmail) {
        Map<String, Object> loginByEmail = userDAO.findUserByEmail(userEmail);
        return loginByEmail;
    }

    @Override
    public int register(Map<String, Object> obj) {
        int register = userDAO.register(obj);
        return register;
    }

    @Override
    public int validateOldPwd(int userid, String oldpwd) {
        int validate=userDAO.validateOldPwd(userid,oldpwd);
        return validate;
    }

    @Override
    public int updateOldPwd(int userid, String newpwd) {
        int i = userDAO.updateOldPwd(userid, newpwd);
        return i;
    }

    @Override
    public int updateUserStatus(int user_id, int user_status) {
        int i = userDAO.updateUserStatus(user_id, user_status);
        return i;
    }

    @Override
    public Map findUserInfoById(String userid) {
        Map userInfoById = userDAO.findUserInfoById(userid);
        return userInfoById;
    }

    @Override
    public int updateUserInfo(UserInfo userinfo) {
        int i = userDAO.updateUserInfo(userinfo);
        return i;
    }

    @Override
    public List<Map> userAnalysis() {
        List<Map> maps = userDAO.userAnalysis();
        return maps;
    }

    @Override
    public List<Map<String, Object>> newUserManger(Map map) {
        List<Map<String, Object>> maps = userDAO.newUserManger(map);
        return maps;
    }


}
