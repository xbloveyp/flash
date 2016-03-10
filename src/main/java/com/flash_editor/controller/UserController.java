package com.flash_editor.controller;

import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by xiaobo.cao on 2016/2/18.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getUser", method = RequestMethod.POST)
    @ResponseBody
    public Result getUser(String username) {
        User user = userService.exists(username);
        if (user!=null){
            return Result.build(200, null);
        }else {
            return Result.build(500, null);
        }

    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public Result addUser(@RequestBody User user, HttpSession httpSession) {
        userService.add(user);
        User u =  userService.login(user);
        httpSession.setAttribute("user", u);
        return Result.build(200, null);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(@RequestBody User user, HttpSession httpSession) {
        User u =  userService.login(user);
        if(u!=null){
            Map<String,String> map = new HashMap<String, String>();
            String loginRefererUrl = (String)httpSession.getAttribute("loginRefererUrl");
            if (loginRefererUrl!=null){
                map.put("loginRefererUrl",loginRefererUrl);
            }
            httpSession.setAttribute("user", u);
            return Result.build(200, map);
        }
        else {
            return Result.build(500, null);
        }

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession httpSession) {
        httpSession.setAttribute("user", null);
        String logoutRefererUrl = (String)httpSession.getAttribute("logoutRefererUrl");
        if (logoutRefererUrl==null){
            return "index.jsp";
        }
        return logoutRefererUrl;
    }
}
