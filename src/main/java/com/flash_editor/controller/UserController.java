package com.flash_editor.controller;

import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.dto.UserRequest;
import com.flash_editor.service.UserService;
import com.flash_editor.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        UserRequest userRequest = new UserRequest();
        userRequest.setPassword(MD5Util.encode(user.getPassword()));
        userRequest.setUserName(user.getUserName());
        User u =  userService.login(userRequest);
        httpSession.setAttribute("user", u);
        return Result.build(200, null);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(@RequestBody UserRequest user, HttpSession httpSession, HttpServletResponse response) {
        if (user.getSave()) {
            String cookieString = user.getUserName() + "-" + user.getPassword();
            Cookie cookie = new Cookie("flashUser", cookieString);
            cookie.setMaxAge(3600*24*30);
            response.addCookie(cookie);
        }
        user.setPassword(MD5Util.encode(user.getPassword()));
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

    @RequestMapping(value = "/getCookie", method = RequestMethod.POST)
    @ResponseBody
    public Result getCookie(HttpServletRequest request) {
        Cookie flashCookie = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("flashUser")){
                flashCookie = cookie;
                break;
            }
        }
        UserRequest userRequest = null;
        if (flashCookie!=null) {
            String cookieValue = flashCookie.getValue();
            String[] values = cookieValue.split("-");
            String userName = values[0];
            String password = values[1];
            userRequest = new UserRequest();
            userRequest.setUserName(userName);
            userRequest.setPassword(password);
        }
        if (userRequest==null) {
            return Result.build(500,null);
        }else {
            return Result.build(200,userRequest);
        }
    }

    @RequestMapping(value = "/clearCookie", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity clearCookie(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("flashUser")){
                cookie.setValue(null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break;
            }
        }
        return new ResponseEntity(HttpStatus.OK);
    }
}
