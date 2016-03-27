package com.flash_editor.service;

import com.flash_editor.domain.Post;
import com.flash_editor.domain.PostExample;
import com.flash_editor.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    @Autowired
	private PostMapper postMapper;

	public List<Post> findAllEssencePosts() {
        PostExample example = new PostExample();
        example.createCriteria().andTypeEqualTo(1);
        example.setOrderByClause("update_time desc");
		return postMapper.selectByExample(example);
	}

    public List<Post> findAllNewestPosts() {
        PostExample example = new PostExample();
        example.createCriteria().andUidIsNotNull();
        example.setOrderByClause("update_time desc");
        return postMapper.selectByExample(example);
    }

    public List<Post> findAllMyPosts(int uid) {
        PostExample example = new PostExample();
        example.createCriteria().andUidEqualTo(uid);
        example.setOrderByClause("update_time desc");
        return postMapper.selectByExample(example);
    }

    public void addPost(Post post) {
         post.setType(0);
         post.setPraise(0);
         postMapper.insert(post);
    }

    public Post findPostById(int id) {
        return postMapper.selectByPrimaryKey(id);
    }

    public void updata(Post post) {
        postMapper.updateByPrimaryKeySelective(post);
    }
}
