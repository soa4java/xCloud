package com.xpwi.dao;

import com.xpwi.pojo.UserInfo;

import java.util.List;
import java.util.Map;

public interface IUserDAO {
    Map<String, Object> login(String uname, String upwd);
    Map<String, Object> findUserByEmail(String userEmail);

    int register(Map<String, Object> obj);
    int validateOldPwd(int userid, String oldpwd);
    int updateOldPwd(int userid, String newpwd);
    int updateUserStatus(int user_id, int user_status);
    Map findUserInfoById(String userid);
    int updateUserInfo(UserInfo userinfo);
    List<Map> userAnalysis();
    List<Map<String, Object>> newUserManger(Map map);

}
