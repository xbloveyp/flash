package com.flash_editor.controller;

import com.flash_editor.domain.FlashContent;
import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2016/2/23.
 */
@Controller
public class WorkController {
    @Autowired
    private WorkService workService;

    @RequestMapping(value = "/work/save", method = RequestMethod.POST)
    public Result logout(String content, HttpSession httpSession) {
        FlashContent flashContent = new FlashContent();
        User user = (User)httpSession.getAttribute("user");
        flashContent.setUid(user.getId());
        flashContent.setContent(content);
        workService.addContent(flashContent);
        return Result.build(200,null);
    }

    @RequestMapping(value = "/work/load", method = RequestMethod.POST)
    public Result logout( HttpSession httpSession) {
        User user = (User)httpSession.getAttribute("user");
        FlashContent flashContent = workService.findByUid(user.getId());
        if (flashContent!=null){
            return Result.build(200,flashContent);
        }
        return Result.build(200,null);
    }
}
