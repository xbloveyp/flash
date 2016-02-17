package com.flash_editor.action;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.User;
import com.flash_editor.service.PostService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Scope("prototype")
public class PostAction extends ActionSupport implements ModelDriven<Post>{
	
	@Resource
	private PostService postService;

	private Post model = new Post();

    public void setModel(Post model) {
        this.model = model;
    }

    @Override
	public Post getModel(){
		return model;
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public String excute() throws  Exception{
		List<Post> posts = postService.findAllPosts();
		ActionContext.getContext().getSession().put("posts", posts);
		return "success";
	}

	public String add() throws  Exception{
		model.setAddTime(sdf.format(new Date()));
		model.setUpdateTime(sdf.format(new Date()));
		model.setFollowNum(0);
		User u = (User) ActionContext.getContext().getSession().get("user");
		model.setUsername(u.getUsername());
		postService.addPost(model);
        excute();
		return "success";
	}

}
