package com.flash_editor.controller;

import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;


/**
 * Created by xiaobo.cao on 2016/2/18.
 */
@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/getUser", method = RequestMethod.POST)
    public Result getUser(@RequestBody String username) {
        User user = userService.exists(username);
        return Result.build(200, user);
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public Result addUser(@RequestBody User user) {
        userService.add(user);
        return Result.build(200, null);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Result login(@RequestBody User user,HttpSession httpSession) {
        User u =  userService.login(user);
        if(u!=null){
            httpSession.setAttribute("user", u);
            return Result.build(200, u);
        }
        else {
            return Result.build(500, null);
        }

    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public Result logout(HttpSession httpSession) {
        httpSession.setAttribute("user", null);
        return Result.build(200, null);
    }
}
