package com.flash_editor.controller;

import com.flash_editor.domain.FlashProject;
import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016/2/23.
 */
@Controller
public class WorkController {
    @Autowired
    private WorkService workService;

    @RequestMapping(value = "/work/save", method = RequestMethod.POST)
    @ResponseBody
    public Result logout(String canvasJson, HttpSession httpSession) {
        FlashProject flashProject = new FlashProject();
        User user = (User)httpSession.getAttribute("user");
        flashProject.setUid(user.getId());
        flashProject.setContent(canvasJson);
        workService.saveContent(flashProject);
        return Result.build(200,null);
    }

    @RequestMapping(value = "/work/load", method = RequestMethod.POST)
    @ResponseBody
    public Result logout( HttpSession httpSession) {
        User user = (User)httpSession.getAttribute("user");
        if (user==null){
            return Result.build(500,null);
        }
        FlashProject flashProject = workService.findByUid(user.getId());
        if (flashProject!=null){
            return Result.build(200,flashProject);
        }
        return Result.build(500,null);
    }
}
