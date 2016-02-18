package com.flash_editor.service;

import com.flash_editor.domain.User;
import com.flash_editor.mapper.UserMapper;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl {
	private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


	public void add(User user) {
			this.userMapper.save(user);		
	}


	public User login(User user) {
		User u = userMapper.findByUser(user);
		return u;
	}


	public User exists(String username) {
		 User user = userMapper.findByName(username);
		 return user;
	}

}
