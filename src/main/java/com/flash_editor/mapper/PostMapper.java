package com.flash_editor.mapper;

import com.flash_editor.domain.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostMapper {

//	 public User findByName(@Param(value = "username") String username);
//	 public void save(User user);
//	 public User findById(@Param(value = "uid") long uid);
//	 public User findByUser(User user);
	public List<Post> findAllPosts();
	public void addPost(Post post);

}
