package com.flash_editor.controller;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.PostPraise;
import com.flash_editor.domain.User;
import com.flash_editor.dto.Page;
import com.flash_editor.dto.PostDto;
import com.flash_editor.dto.Result;
import com.flash_editor.service.PostPriaseService;
import com.flash_editor.service.PostService;
import com.flash_editor.util.Const;
import com.flash_editor.util.DateUtil;
import javafx.geometry.Pos;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    @Autowired
    private PostPriaseService postPriaseService;

    @RequestMapping(value = "/findAllEssencePosts/{pageNum}", method = RequestMethod.GET)
    public String findAllEssencePosts(HttpSession httpSession,@PathVariable("pageNum") int pageNum) {
        List<Post> posts = postService.findAllEssencePosts(pageNum);
        User user = (User)httpSession.getAttribute("user");
        Integer uid = null;
        if (user!=null){
            uid = user.getId();
        }
        List<PostDto> postDtos = toPostDto(posts,uid);
        if (CollectionUtils.isNotEmpty(postDtos)) {
            httpSession.setAttribute("posts", postDtos);
            httpSession.setAttribute("error", null);
            int count = postService.countEssencePost();
            int total = count/ Const.PAGEITEMNUM;
            if (count%Const.PAGEITEMNUM>0){
                total++;
            }
            Page page = new Page(pageNum,total,count);
            httpSession.setAttribute("page", page);
        }else {
            Page page = new Page(1,1,0);
            httpSession.setAttribute("page", page);
            httpSession.setAttribute("posts", null);
            httpSession.setAttribute("error", "noEssence");
        }
        httpSession.setAttribute("postType","essence");
        return "redirect:/discuss.jsp";
    }

    @RequestMapping(value = "/findAllNewestPosts/{pageNum}", method = RequestMethod.GET)
    public String findAllNewestPosts(HttpSession httpSession,@PathVariable("pageNum") int pageNum) {
        List<Post> posts = postService.findAllNewestPosts(pageNum);
        User user = (User)httpSession.getAttribute("user");
        Integer uid = null;
        if (user!=null){
            uid = user.getId();
        }
        List<PostDto> postDtos = toPostDto(posts,uid);
        if (CollectionUtils.isNotEmpty(postDtos)) {
            int count = postService.countNewestPost();
            int total = count/ Const.PAGEITEMNUM;
            if (count%Const.PAGEITEMNUM>0){
                total++;
            }
            Page page = new Page(pageNum,total,count);
            httpSession.setAttribute("page", page);
            httpSession.setAttribute("posts", postDtos);
        }else {
            Page page = new Page(1,1,0);
            httpSession.setAttribute("page", page);
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
            List<PostDto> postDtos = toPostDto(posts,user.getId());
            if (CollectionUtils.isNotEmpty(postDtos)) {
                int count = postService.countMyPost(user.getId());
                int total = count/ Const.PAGEITEMNUM;
                if (count%Const.PAGEITEMNUM>0){
                    total++;
                }
                Page page = new Page(pageNum,total,count);
                httpSession.setAttribute("page", page);
                httpSession.setAttribute("posts", postDtos);
                httpSession.setAttribute("error", null);
            }else {
                Page page = new Page(1,1,0);
                httpSession.setAttribute("page", page);
                httpSession.setAttribute("posts", null);
                httpSession.setAttribute("error", null);
            }
        }else {
            Page page = new Page(1,1,0);
            httpSession.setAttribute("page", page);
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

    @RequestMapping(value = "/praisePost/{postId}", method =RequestMethod.GET)
    @ResponseBody
    public Result praisePost(HttpSession httpSession,@PathVariable("postId") int postId) {
        User u = (User) httpSession.getAttribute("user");
        if (u==null){
            return Result.build(500,"登录后才能点赞");
        }
        postPriaseService.insert(postId,u.getId());
        List<PostDto> postDtos = (List<PostDto>) httpSession.getAttribute("posts");
        for (PostDto postDto:postDtos){
            if (postDto.getId().equals(postId)){
                postDto.setIsPraised("1");
                postDto.setPraise(postDto.getPraise()+1);
            }
        }
        httpSession.setAttribute("posts",postDtos);
        Post post = postService.findPostById(postId);
        if (!post.getType().equals(Const.TYPE_ESSENCE)) {
            List<PostPraise> postPraises = postPriaseService.selectByPostId(postId);
            if (postPraises.size() > Const.PRIASE_TO_ESSENCE_NUM) {
                post.setType(Const.TYPE_ESSENCE);
                postService.updata(post);
            }
        }
        return Result.build(200, "");
    }

    private List<PostDto> toPostDto(List<Post> posts,Integer uid){
        List<PostDto> postDtos = new ArrayList<PostDto>();
        for (Post post:posts){
            PostDto postDto = new PostDto();
            BeanUtils.copyProperties(post,postDto);
            postDto.setAddTime(DateUtil.formatShort(post.getAddTime()));
            postDto.setUpdateTime(DateUtil.formatShort(post.getUpdateTime()));
            List<PostPraise> postPraiseList =  postPriaseService.selectByPostId(post.getId());
            if (CollectionUtils.isEmpty(postPraiseList)){
                postDto.setPraise(0);
                postDto.setIsPraised("0");
            }else {
                postDto.setPraise(postPraiseList.size());
                postDto.setIsPraised("0");
                if (uid != null) {
                    for (PostPraise postPraise : postPraiseList) {
                        if (postPraise.getUserId().equals(uid)) {
                            postDto.setIsPraised("1");
                            break;
                        }
                    }
                }
            }
            postDtos.add(postDto);
        }
        return postDtos;
    }

}
