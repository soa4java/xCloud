package com.xpwi.service.impl;

import com.xpwi.dao.IFileDAO;
import com.xpwi.service.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class FileServiceImpl implements IFileService {
    @Autowired
    IFileDAO fileDAOImpl;
    @Override
    public List<Map<String, Object>> fileUserFile(Map map) {
        return fileDAOImpl.fileUserFile(map);
    }

    @Override
    public int updateFileName(Map map) {
        return fileDAOImpl.updateFileName(map);
    }

    @Override
    public int deleteFileById(List<String> list) {
        return fileDAOImpl.deleteFileById(list);
    }

    @Override
    public int updateFileStatus(Map map) {
        return fileDAOImpl.updateFileStatus(map);
    }
}
