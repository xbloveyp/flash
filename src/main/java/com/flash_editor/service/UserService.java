package com.flash_editor.service;

import com.flash_editor.domain.User;
import com.flash_editor.domain.UserExample;
import com.flash_editor.mapper.UserMapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


	public void add(User user) {
			this.userMapper.insert(user);
	}


	public User login(User user) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(user.getUserName())
                    .andPasswordEqualTo(user.getPassword());
		List<User> users = userMapper.selectByExample(userExample);
        if (CollectionUtils.isEmpty(users)){
            return null;
        }else {
            return users.get(0);
        }
	}


	public User exists(String username) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(username);
		List<User> users = userMapper.selectByExample(userExample);
		if (CollectionUtils.isEmpty(users)){
			return null;
		}else {
			return users.get(0);
		}
	}

}
