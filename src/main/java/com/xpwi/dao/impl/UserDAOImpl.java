package com.xpwi.dao.impl;

import com.xpwi.dao.IUserDAO;
import com.xpwi.pojo.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("userDAO")
public class UserDAOImpl implements IUserDAO {
    @Autowired
    SqlSessionFactory sqlSessionFactoryBean;

    @Override
    public Map<String, Object> login(String uname, String upwd) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        String sql = "com.xpwi.mapping.User.login";
        Map map = new HashMap();
        map.put("uname", uname);
        map.put("upwd", upwd);
        Map<String, Object> o = sqlSession.selectOne(sql, map);
        return o;
    }

    @Override
    public Map<String, Object> findUserByEmail(String userEmail) {

        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        String sql = "com.xpwi.mapping.User.loginByEmail";
        Map map = new HashMap();
        map.put("user_email", userEmail);
        Map<String, Object> loginByEmail = sqlSession.selectOne(sql, map);

        return loginByEmail;
    }

    @Override
    public int register(Map<String, Object> obj) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        String sql = "com.xpwi.mapping.User.register";
        int insert = sqlSession.insert(sql, obj);
        return insert;
    }

    @Override
    public int validateOldPwd(int userid, String oldpwd) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        String sql = "com.xpwi.mapping.User.validateOldPwd";
        Map map = new HashMap();
        map.put("userid", userid);
        map.put("oldpwd", oldpwd);
        Map<String, Object> o = sqlSession.selectOne(sql, map);
        if (o == null)
            return 0;//旧密码不正确
        else
            return 1;//旧密码正确
    }

    @Override
    public int updateOldPwd(int userid, String newpwd) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        String sql = "com.xpwi.mapping.User.updateOldPwd";
        Map map = new HashMap();
        map.put("userid", userid);
        map.put("newpwd", newpwd);
        int update = sqlSession.update(sql, map);
        return update;
    }

    @Override
    public int updateUserStatus(int user_id, int user_status) {

        String sql="com.xpwi.mapping.User.updateUserStatus";
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        Map map = new HashMap();
        map.put("user_id",user_id);
        map.put("user_status",user_status);
        int update = sqlSession.update(sql, map);
        return update;
    }

    @Override
    public Map findUserInfoById(String userid) {

        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        try {
            String sql = "com.xpwi.mapping.User.findUserInfoById";
            Map<String, Object> o = sqlSession.selectOne(sql, userid);
            return o;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int updateUserInfo(UserInfo userinfo) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        try {
            String sql = "com.xpwi.mapping.User.updateUserInfo";
            int update = sqlSession.update(sql,userinfo);
            sqlSession.commit();
            return update;
        } catch (Exception e) {
            e.printStackTrace();
            sqlSession.rollback();
        }
        return 0;
    }

    @Override
    public List<Map> userAnalysis() {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        try {
            String sql = "com.xpwi.mapping.User.userStatusAnalysis";
            List<Map> objects = sqlSession.selectList(sql);
            return objects;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> newUserManger(Map map) {
        try {
            System.out.println("用户状态 DAO"+map);
            SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
            String sql = "com.xpwi.mapping.User.newUserManager";
            List<Map<String,Object>> objects = sqlSession.selectList(sql, map);
            return objects;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
