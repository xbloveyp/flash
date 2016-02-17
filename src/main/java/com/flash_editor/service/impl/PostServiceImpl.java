package com.flash_editor.service.impl;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.User;
import com.flash_editor.mapper.PostMapper;
import com.flash_editor.mapper.UserMapper;
import com.flash_editor.service.PostService;
import com.flash_editor.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PostServiceImpl implements PostService {
	private PostMapper postMapper;

    public PostMapper getPostMapper() {
        return postMapper;
    }

    public void setPostMapper(PostMapper postMapper) {
        this.postMapper = postMapper;
    }


	@Override
	public List<Post> findAllPosts() {
		return postMapper.findAllPosts();
	}

    public void addPost(Post post) {
         postMapper.addPost(post);
    }
}
