package com.flash_editor.mapper;

import com.flash_editor.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

	 public User findByName(@Param(value="username") String username );
	 public void save(User user);
//	 public User login(User user);
	 public User findById(@Param(value="uid") long uid );
	 public User findByUser(User user);
}
