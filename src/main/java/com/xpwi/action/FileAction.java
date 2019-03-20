package com.xpwi.action;

import com.alibaba.fastjson.JSON;
import com.xpwi.service.IFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@Scope("prototype")
@RequestMapping("/file")
public class FileAction {
    @Autowired
    IFileService fileServiceImpl;

    @RequestMapping(value = "/findUserFile.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> findUserFile(int file_upload_user, String fileType, String isShare, int page, int limit) {//根据用户信息查询
        Map map = new HashMap();
        map.put("user_id", file_upload_user);
        map.put("fileType", fileType);
        map.put("isShare", isShare);
        map.put("page", (page - 1) * limit);
        map.put("limit", limit);

        List<Map<String, Object>> maps = fileServiceImpl.fileUserFile(map);
        maps.remove(maps.size() - 1);
        Map map1 = new HashMap();
        map1.put("count", maps.size());
        map1.put("data", maps);
        if (maps != null)
            map1.put("msg", "查询成功");
        else
            map1.put("msg", "还没有上传文件");
        map1.put("code", 0);

        return map1;
    }

    @RequestMapping(value = "/updateFileName.do", method = RequestMethod.GET)
    @ResponseBody
    public int updateFileName(String obj) {
        Map map = (Map) JSON.parse(obj);
        int i = fileServiceImpl.updateFileName(map);
        return i;
    }

    @RequestMapping(value = "/deleteFileById.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteFileById(String file_id) {
        String[] split = file_id.substring(1, file_id.length() - 1).split(",");
        List<String> strings = Arrays.asList(split);//把数组转化成List
        int i = fileServiceImpl.deleteFileById(strings);
        return i;
    }

    @RequestMapping(value = "/deleteOneFileById.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteOneFileById(String file_id) {
        List list = new ArrayList();
        list.add(file_id);
        int i = fileServiceImpl.deleteFileById(list);
        return i;
    }

    @RequestMapping(value = "/updateFileStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateFileStatus(String file_status, String file_id) {
        Map map = new HashMap();
        map.put("file_id", file_id);
        map.put("file_status", file_status);
        int i = fileServiceImpl.updateFileStatus(map);
        return i;
    }



}
