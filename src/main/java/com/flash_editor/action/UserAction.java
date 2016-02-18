package com.flash_editor.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.flash_editor.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	@Resource
	private UserService userService;

	private User model = new User();

    @Override
	public User getModel(){
		return model;
	}
	
	public String exists() throws Exception {
        User user = userService.exists(model.getUsername());
		model = user;
        return SUCCESS;
	}
	
	public String add() throws Exception{
		User user = new User();
		user.setUsername(model.getUsername());
		user.setPassword(model.getPassword());
		user.setEmail(model.getEmail());
		userService.add(user);
		return "registsuccess";
	}
	
	public String login() throws Exception{
		User user = new User();
		user.setUsername(model.getUsername());
		user.setPassword(model.getPassword());
		user.setEmail(model.getEmail());
		User u =  userService.login(user);
		if(u!=null){
			ActionContext.getContext().getSession().put("user", u);
            model = u;
		}
		else {
            model = u;
		}
		return SUCCESS;
	}

	public String logout() throws Exception {
		ActionContext.getContext().getSession().put("user", null);
		return "registsuccess";
	}
}
