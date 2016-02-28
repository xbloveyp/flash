package com.flash_editor.controller;

import com.flash_editor.domain.FlashProject;
import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.service.WorkService;
import com.flash_editor.util.DateUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/2/23.
 */
@Controller
public class WorkController {
    @Autowired
    private WorkService workService;

    @RequestMapping(value = "/canvas/save", method = RequestMethod.POST)
    @ResponseBody
    public Result save(String canvasJson, HttpSession httpSession) {
        FlashProject flashProject = new FlashProject();
        User user = (User)httpSession.getAttribute("user");
        flashProject.setUid(user.getId());
        flashProject.setContent(canvasJson);
        workService.saveContent(flashProject);
        return Result.build(200,null);
    }

    @RequestMapping(value = "/canvas/load", method = RequestMethod.POST)
    @ResponseBody
    public Result load(int id) {
        FlashProject flashProject = workService.findById(id);
        if (flashProject!=null){
            return Result.build(200,flashProject);
        }
        return Result.build(500,null);
    }

    @RequestMapping(value = "/loadProject", method = RequestMethod.GET)
    public String loadProject( HttpSession httpSession) {
        User user = (User)httpSession.getAttribute("user");
        List<FlashProject> flashProjects = new ArrayList<FlashProject>();
        if (user==null){
            httpSession.setAttribute("projects",null);
        }else {
            flashProjects = workService.findByUid(user.getId());
            for (FlashProject flashProject:flashProjects) {
                flashProject.setUpdateTime(DateUtil.format(flashProject.getUpdateTime()));
            }
            if (CollectionUtils.isEmpty(flashProjects)){
                httpSession.setAttribute("projects", null);
            }else {
                httpSession.setAttribute("projects", flashProjects);
            }
        }
        return "forward:/workSpace.jsp";
    }

    @RequestMapping(value = "/saveProject", method = RequestMethod.POST)
    public String saveProject(@RequestBody FlashProject flashProject, HttpSession httpSession) {
        User user = (User)httpSession.getAttribute("user");
        flashProject.setUid(user.getId());
        workService.addProject(flashProject);
        List<FlashProject> flashProjects = workService.findByUid(user.getId());
        httpSession.setAttribute("projects", flashProjects);
        return "forward:/workSpace.jsp";
    }
}
