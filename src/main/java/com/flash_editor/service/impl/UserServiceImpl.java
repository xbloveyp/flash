package com.flash_editor.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flash_editor.mapper.UserMapper;
import com.flash_editor.domain.User;
import com.flash_editor.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
	public void add(User user) {
			this.userMapper.save(user);		
	}

	@Override
	public User login(User user) {
		User u = userMapper.findByUser(user);
		return u;
	}

	@Override
	public User exists(String username) {
		 User user = userMapper.findByName(username);
		 return user;
	}

}
