package com.xpwi.dao.impl;

import com.xpwi.dao.IFileDAO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class FileDAOImpl implements IFileDAO {
    @Autowired
    SqlSessionFactory sqlSessionFactoryBean;

    @Override
    public List<Map<String, Object>> fileUserFile(Map map) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession();
        String sql = "com.xpwi.mapping.File.findUseFile";
        String sql_count = "com.xpwi.mapping.File.findRSCount";
        System.out.println("【查找所有文件】"+map);
        try{
        List<Map<String, Object>> objects = sqlSession.selectList(sql, map);
        Map<String, Object> rscount = sqlSession.selectOne(sql_count, map);
        objects.add(rscount);
        return objects;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int updateFileName(Map map) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        String sql = "com.xpwi.mapping.File.updateFileName";
        int i = sqlSession.update(sql, map);
        sqlSession.commit(true);
        return i;
    }

    @Override
    public int deleteFileById(List<String> list) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        String sql = "com.xpwi.mapping.File.deleteFileById";
        try {
         //   System.out.println(list);
            int delete = sqlSession.delete(sql, list);
           // System.out.println(delete + "条记录");
            sqlSession.commit(true);
            return delete;
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateFileStatus(Map map) {
        SqlSession sqlSession = sqlSessionFactoryBean.openSession(true);
        System.out.println(map);
        String sql = "com.xpwi.mapping.File.updateFileStatus";
        int update = sqlSession.update(sql, map);
        return update;
    }
}
