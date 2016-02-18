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

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by xiaobo.cao on 2016/2/18.
 */
@Controller
public class PostController {
    @Autowired
    private PostService postService;

    @RequestMapping(value = "/findAllPosts")
    public Result findAllPosts(HttpSession httpSession) {
        List<Post> posts = postService.findAllPosts();
        httpSession.setAttribute("posts",posts);
        return Result.build(200, posts);
    }

    @RequestMapping(value = "/addPost", method =RequestMethod.POST)
    public Result addPost(@RequestBody Post post,HttpSession httpSession) {
        post.setAddtime(new Date());
        post.setUpdatetime(new Date());
        post.setFollownum(0);
        User u = (User) httpSession.getAttribute("user");
        post.setUsername(u.getUsername());
        postService.addPost(post);
        List<Post> posts = postService.findAllPosts();
        return Result.build(200, posts);
    }

}
