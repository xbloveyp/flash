package com.flash_editor.service;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.User;

import java.util.List;

public interface PostService {
//	public User exists(String username);
	public void addPost(Post post);
//	public User login(User user);
	public List<Post> findAllPosts();
}
