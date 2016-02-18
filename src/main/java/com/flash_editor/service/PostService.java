package com.flash_editor.service;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.PostExample;
import com.flash_editor.mapper.PostMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
	private PostMapper postMapper;

    public PostMapper getPostMapper() {
        return postMapper;
    }

    public void setPostMapper(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

	public List<Post> findAllPosts() {
        PostExample example = new PostExample();
        example.createCriteria().andIdIsNotNull();
		return postMapper.selectByExample(example);
	}

    public void addPost(Post post) {
         postMapper.insert(post);
    }
}
