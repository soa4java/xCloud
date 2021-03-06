package com.xpwi.service.impl;import com.xpwi.dao.IDirDAO;import com.xpwi.service.IDirService;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Service;import java.util.List;import java.util.Map;@Service("iDirService")public class DirServiceImpl implements IDirService {    @Autowired    IDirDAO iDirDAO;    @Override    public List<Map> findAllDirByUserId(String user_id) {        List<Map> allDirList = iDirDAO.findAllDirByUserId(user_id);        return allDirList;    }    @Override    public List<Map> dirAnalysis(String user_id) {        List<Map> allDirList = iDirDAO.dirAnalysis(user_id);        return allDirList;    }    @Override    public Map findFilePathByDirId(String dir_id) {        Map filePath = iDirDAO.findFilePathByDirId(dir_id);        return filePath;    }}