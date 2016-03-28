package com.flash_editor.controller;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.User;
import com.flash_editor.dto.Page;
import com.flash_editor.dto.Result;
import com.flash_editor.service.PostService;
import com.flash_editor.util.Const;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(value = "/findAllEssencePosts/{pageNum}", method = RequestMethod.GET)
    public String findAllEssencePosts(HttpSession httpSession,@PathVariable("pageNum") int pageNum) {
        List<Post> posts = postService.findAllEssencePosts(pageNum);
        if (CollectionUtils.isNotEmpty(posts)) {
            httpSession.setAttribute("posts", posts);
            httpSession.setAttribute("error", null);
            int count = postService.countEssencePost();
            int total = count/ Const.PAGEITEMNUM;
            if (count%Const.PAGEITEMNUM>0){
                total++;
            }
            Page page = new Page(pageNum,total,count);
            httpSession.setAttribute("page", page);
        }else {
            httpSession.setAttribute("posts", null);
            httpSession.setAttribute("error", "noEssence");
        }
        httpSession.setAttribute("postType","essence");
        return "redirect:/discuss.jsp";
    }

    @RequestMapping(value = "/findAllNewestPosts/{pageNum}", method = RequestMethod.GET)
    public String findAllNewestPosts(HttpSession httpSession,@PathVariable("pageNum") int pageNum) {
        List<Post> posts = postService.findAllNewestPosts(pageNum);
        if (CollectionUtils.isNotEmpty(posts)) {
            int count = postService.countNewestPost();
            int total = count/ Const.PAGEITEMNUM;
            if (count%Const.PAGEITEMNUM>0){
                total++;
            }
            Page page = new Page(pageNum,total,count);
            httpSession.setAttribute("page", page);
            httpSession.setAttribute("posts", posts);
        }else {
            httpSession.setAttribute("posts", null);
        }
        httpSession.setAttribute("postType","newest");
        httpSession.setAttribute("error", null);
        return "redirect:/discuss.jsp";
    }

    @RequestMapping(value = "/findAllMyPosts/{pageNum}", method = RequestMethod.GET)
    public String findAllMyPosts(HttpSession httpSession, @PathVariable("pageNum") int pageNum) {
        User user = (User)httpSession.getAttribute("user");
        if (user!=null) {
            List<Post> posts = postService.findAllMyPosts(user.getId(),pageNum);
            if (CollectionUtils.isNotEmpty(posts)) {
                int count = postService.countMyPost(user.getId());
                int total = count/ Const.PAGEITEMNUM;
                if (count%Const.PAGEITEMNUM>0){
                    total++;
                }
                Page page = new Page(pageNum,total,count);
                httpSession.setAttribute("page", page);
                httpSession.setAttribute("posts", posts);
            }
        }else {
            httpSession.setAttribute("error", "noUser");
            httpSession.setAttribute("posts", null);
        }
        httpSession.setAttribute("postType", "my");
        return "redirect:/discuss.jsp";
    }

    @RequestMapping(value = "/addPost", method =RequestMethod.POST)
    @ResponseBody
    public Result addPost(@RequestBody Post post,HttpSession httpSession) {
        post.setAddTime(new Date());
        post.setUpdateTime(new Date());
        post.setFollowNum(0);
        post.setPraise(0);
        User u = (User) httpSession.getAttribute("user");
        post.setUserName(u.getUserName());
        post.setUid(u.getId());
        postService.addPost(post);
        String postType = (String) httpSession.getAttribute("postType");
        List<Post> posts = null;
        if ("essence".equals(postType)) {
           posts = postService.findAllEssencePosts(1);
        }
        if ("newest".equals(postType)) {
            posts = postService.findAllNewestPosts(1);
        }
        if ("my".equals(postType)) {
            posts = postService.findAllMyPosts(u.getId(),1);
        }
        httpSession.setAttribute("posts",posts);
        return Result.build(200, posts);
    }

}
