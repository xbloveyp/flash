package com.flash_editor.controller;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by xiaobo.cao on 2016/2/18.
 */
@RequestMapping("/flash")
@Controller
public class PostController {
    @Autowired
    private PostService postService;

    @RequestMapping(value = "/findAllPosts", method = RequestMethod.GET)
    public String findAllPosts(HttpSession httpSession) {
        List<Post> posts = postService.findAllPosts();
        httpSession.setAttribute("posts",posts);
        return "forward:/discuss.jsp";
    }

    @RequestMapping(value = "/addPost", method =RequestMethod.POST)
    @ResponseBody
    public Result addPost(@RequestBody Post post,HttpSession httpSession) {
        post.setAddTime(new Date());
        post.setUpdateTime(new Date());
        post.setFollowNum(0);
        User u = (User) httpSession.getAttribute("user");
        post.setUserName(u.getUserName());
        post.setUid(u.getId());
        postService.addPost(post);
        List<Post> posts = postService.findAllPosts();
        httpSession.setAttribute("posts",posts);
        return Result.build(200, posts);
    }

}
