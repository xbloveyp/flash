package com.flash_editor.controller;

import com.flash_editor.domain.FollowPost;
import com.flash_editor.domain.Post;
import com.flash_editor.domain.User;
import com.flash_editor.dto.Result;
import com.flash_editor.service.FollowPostService;
import com.flash_editor.service.PostService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by xiaobo.cao on 2016/2/18.
 */
@RequestMapping("/flash")
@Controller
public class FollowPostController {

    @Autowired
    private FollowPostService followPostService;
    @Autowired
    private PostService postService;

    @RequestMapping(value = "/findFollowPost", method = RequestMethod.GET)
    public String findFollowPost(int id, HttpSession httpSession, HttpServletRequest request) {
        Post post = postService.findPostById(id);
        httpSession.setAttribute("post",post);
        List<FollowPost> followPosts = followPostService.findFollowPostsByPid(id);
        if (CollectionUtils.isNotEmpty(followPosts)) {
            httpSession.setAttribute("followPosts", followPosts);
        }
        return "redirect:/posts.jsp";
    }

    @RequestMapping(value = "/addFollowPost", method =RequestMethod.POST)
    @ResponseBody
    public Result addPost(@RequestBody FollowPost followPost, HttpSession httpSession) {
        followPost.setAddTime(new Date());
        User u = (User) httpSession.getAttribute("user");
        followPost.setUserName(u.getUserName());
        followPost.setUid(u.getId());
        followPostService.addFollowPost(followPost);
        List<FollowPost> followPosts = followPostService.findFollowPostsByPid(followPost.getPid());
        Post post = postService.findPostById(followPost.getPid());
        post.setUpdateTime(new Date());
        post.setFollowNum(post.getFollowNum()+1);
        postService.updata(post);
        httpSession.setAttribute("followPosts",followPosts);
        return Result.build(200, followPosts);
    }

}
