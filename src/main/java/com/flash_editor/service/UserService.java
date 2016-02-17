package com.flash_editor.service;

import com.flash_editor.domain.User;

public interface UserService {
	public User exists(String username);
	public void add(User user);
	public User login(User user);
}
