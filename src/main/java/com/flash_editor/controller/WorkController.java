package com.flash_editor.controller;

import com.flash_editor.domain.FlashProject;
import com.flash_editor.domain.Library;
import com.flash_editor.domain.LibraryWithBLOBs;
import com.flash_editor.domain.User;
import com.flash_editor.dto.ProjectDto;
import com.flash_editor.dto.Result;
import com.flash_editor.service.LibraryService;
import com.flash_editor.service.WorkService;
import com.flash_editor.util.DateUtil;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.BeanUtils;
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
    @Autowired
    private LibraryService libraryService;

    @RequestMapping(value = "/saveCanvas", method = RequestMethod.POST)
    @ResponseBody
    public Result save(String canvasJson, HttpSession httpSession) {
        FlashProject flashProject = new FlashProject();
        User user = (User)httpSession.getAttribute("user");
        flashProject.setUid(user.getId());
        flashProject.setContent(canvasJson);
        int id = Integer.valueOf(httpSession.getAttribute("projectId").toString());
        flashProject.setId(id);
        workService.saveContent(flashProject);
        return Result.build(200,null);
    }

    @RequestMapping(value = "/loadCanvas", method = RequestMethod.POST)
    @ResponseBody
    public Result load(HttpSession httpSession) {
        int id = Integer.valueOf(httpSession.getAttribute("projectId").toString());
        FlashProject flashProject = workService.findById(id);
        if (flashProject!=null && StringUtils.isNoneBlank(flashProject.getContent())){
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
            List<ProjectDto> projectDtos = new ArrayList<ProjectDto>();
            projectDtos = toTransformProject(flashProjects);
            if (CollectionUtils.isEmpty(flashProjects)){
                httpSession.setAttribute("projects", null);
            }else {
                httpSession.setAttribute("projects", projectDtos);
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
        List<ProjectDto> projectDtos = new ArrayList<ProjectDto>();
        projectDtos = toTransformProject(flashProjects);
        if (CollectionUtils.isEmpty(flashProjects)){
            httpSession.setAttribute("projects", null);
        }else {
            httpSession.setAttribute("projects", projectDtos);
        }
        return "forward:/workSpace.jsp";
    }

    @RequestMapping(value = "/setProjectId", method = RequestMethod.POST)
    @ResponseBody
    public Result setProjectId(int id, HttpSession httpSession) {
        httpSession.setAttribute("projectId",id);
        return Result.build(200,null);
    }

    @RequestMapping(value = "/deleteProjectId", method = RequestMethod.POST)
    @ResponseBody
    public Result deleteProjectId(int id, HttpSession httpSession) {
        workService.deleteProject(id);
        List<FlashProject> flashProjects = new ArrayList<FlashProject>();
        User user = (User) httpSession.getAttribute("user");
        flashProjects = workService.findByUid(user.getId());
        List<ProjectDto> projectDtos = new ArrayList<ProjectDto>();
        projectDtos = toTransformProject(flashProjects);
        if (CollectionUtils.isEmpty(flashProjects)){
            httpSession.setAttribute("projects", null);
        }else {
            httpSession.setAttribute("projects", projectDtos);
        }
        return Result.build(200,null);
    }

    @RequestMapping(value = "/getShape" ,method = RequestMethod.POST)
    @ResponseBody
    public Result getShape(String name){
        LibraryWithBLOBs library = libraryService.getByName(name);
        return Result.build(200,library.getContent());
    }

    private List<ProjectDto> toTransformProject(List<FlashProject> flashProjects){
        return  Lists.transform(flashProjects, new Function<FlashProject, ProjectDto>() {
            public ProjectDto apply(FlashProject flashProject) {
                ProjectDto projectDto = new ProjectDto();
                projectDto.setDescription("项目描述："+flashProject.getDescription());
                projectDto.setId(flashProject.getId());
                projectDto.setTitle("项目名称："+flashProject.getTitle());
                projectDto.setUpdateTime("更新时间："+DateFormatUtils.format(flashProject.getUpdateTime(),"yyyy-MM-dd HH:mm:ss"));
                return projectDto;
            }
        });
    }
}
