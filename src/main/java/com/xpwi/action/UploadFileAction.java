package com.xpwi.action;

import com.xpwi.service.IUploadFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@Scope("prototype")
@RequestMapping("/file")
public class UploadFileAction {
    @Autowired
    IUploadFileService uploadFileService;

    //上传用户头像
    @RequestMapping(value = "/uploadPersonPhoto.do", method = RequestMethod.POST)
    @ResponseBody
    public Map uploadPersonPhoto(@RequestParam("file") MultipartFile file, HttpSession session) {
        String userid = session.getAttribute("userid").toString();

        Map map = new HashMap();
        System.out.println("---" + userid);
        try {
            if (file != null) {
                String fileName = file.getOriginalFilename();
                String extName = fileName.substring(fileName.lastIndexOf("."));
                List list = new ArrayList();
                list.add(".jpg");
                list.add(".png");
                list.add(".gif");
                list.add(".bmp");
                list.add(".jpeg");
                if (list.contains(extName.toLowerCase())) {
                    String realPath = session.getServletContext().getRealPath("myphoto");

                    String photoFileName = new Date().getTime() + extName;//使用时间戳进行文件命名
                    String descPath = realPath + "\\" + photoFileName;
//                    System.out.println(descPath);
                    file.transferTo(new File(realPath, photoFileName));

                    //图片路径和文件名称保存到数据库中   photoFileName()  1550543609976.jpg
                    //根据用户ID更新头像
                    System.out.println(descPath);
                    int i = uploadFileService.uploadPhoto(userid, "myphoto/" + photoFileName);
                    System.out.println("upload" + i);
                    if (i > 0) {
                        System.out.println("上传头像成功");
                        map.put("headPath", "myphoto/" + photoFileName);
                        map.put("code", 0);//上传头像成功，数据库存储路径成功
                        System.out.println("上传返回" + map);
                    } else
                        map.put("code", 3);//数据库存储路径不成功
                } else {
                    map.put("code", 2);//文件类型错误
                }
            } else {
                map.put("code", 4);//上传文件为空
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("code", 1);//上传异常
        }
        // System.out.println(JSON.toJSONString(map));
        return map;
    }


    //上传用户文件
    @RequestMapping(value = "/uploadUserFile.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadUserFile(@RequestParam("file") MultipartFile file,String user_id,
                                              String file_type, String dir_id,HttpSession session) {

        System.out.println("已触发");
        System.out.println("上传"+user_id+file_type+dir_id);
        Map<String,Object> filePath = uploadFileService.findFilePathById(dir_id);

        String realPath = session.getServletContext().getRealPath("myphoto/file_resources");
        System.out.println("session realpath"+realPath);
        File fileDir = new File(realPath+"/"+filePath.get("filePath"));
        if (!fileDir.exists()){
            fileDir.mkdirs();
        }

        String fileName = file.getOriginalFilename();
        //获取上传文件的名称
        System.out.println("【上传文件的路径+名称】"+filePath.get("filePath")+"/"+fileName);
        File newFile = new File(realPath+filePath.get("filePath").toString(),fileName);
        System.out.println("【文件存入的绝对路径】"+newFile.getAbsolutePath());
        Map map = new HashMap();
        try {
            //实现文件上传
            file.transferTo(newFile);
            //完成数据表信息添加
            Map fileInfomap=new HashMap();
            fileInfomap.put("file_name",file.getOriginalFilename());
            fileInfomap.put("file_size",file.getSize());
            fileInfomap.put("file_type",file_type);
            fileInfomap.put("file_dir_id",dir_id);
            fileInfomap.put("user_id",user_id);
            int i = uploadFileService.insertUploadFileInfo(fileInfomap);
            map.put("code",0);
            if(i>0)
                map.put("dt","1");
            else
                map.put("dt",0);//dt表示插入数据表状态
        }catch (Exception e){
            e.printStackTrace();
            map.put("code",1);
        }
        return map;
    }



}